# Finance App — Backend

Node.js + Express + Prisma + PostgreSQL backend for a loan management platform
(weekly loans, monthly EMI loans, high-value interest-only loans, UPI/cash
collection, receipts, notifications, reporting, and audit logging).

## Quick start (local, without Docker)

```bash
cd backend
cp .env.example .env
# Edit .env: set DATABASE_URL, JWT secrets, SMTP creds, etc.

npm install
npx prisma migrate dev --name init   # creates tables in your Postgres DB
npx prisma db seed                    # creates the SUPER_ADMIN account
npm run dev                           # starts on http://localhost:4000
```

Requires a running PostgreSQL instance. If you don't have one locally:

```bash
docker run --name finance-app-db -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=finance_app -p 5432:5432 -d postgres:16-alpine
```

## Quick start (Docker, backend + Postgres together)

```bash
cd backend
cp .env.example .env   # edit values as needed
docker compose up --build
# in another terminal, run migrations once the containers are up:
docker compose exec backend npx prisma migrate deploy
docker compose exec backend npx prisma db seed
```

API will be live at `http://localhost:4000`, Swagger docs at
`http://localhost:4000/api-docs`.

## First login

After seeding, log in as the super admin using the phone/password from your
`.env` (`SUPER_ADMIN_PHONE` / `SUPER_ADMIN_PASSWORD`):

```
POST /api/v1/auth/login
{ "phone": "9999999999", "password": "ChangeMe123!" }
```

**Change this password immediately in a real deployment.**

## Project structure

```
src/
  config/        env, database (Prisma client), firebase, multer, swagger
  middlewares/    auth, role guard, validation, audit logger, error handler, rate limiter
  modules/
    auth/         login, OTP, password reset, JWT refresh
    admin/        manage VIEW_ADMIN users, system config (UPI/SMS/SMTP)
    customer/     KYC, profile, documents
    loan/         loan creation + the 3 calculators (weekly, monthly EMI, high-value)
    due/          due schedule queries, overdue marking
    payment/      UPI intent generation, initiate/confirm payment
    receipt/      PDF receipt generation with QR code
    notification/ SMS / email / push channels + templates
    report/       Excel exports (collections, portfolio, overdue)
    document/     KYC document storage/retrieval
    dashboard/    admin + customer summary stats
    audit/        audit log query endpoint
  jobs/           cron jobs: due reminders, overdue checker, DB backup
  routes/         route aggregator
tests/
  unit/           calculator logic tests (no DB required)
prisma/
  schema.prisma   full data model
  seed.js         creates the super admin on first run
```

## Important implementation notes

- **UPI payments**: two paths are supported.
  - **Default (no setup required)**: a static UPI-intent QR code is generated
    and an admin manually confirms receipt via `POST /payments/confirm` after
    checking their bank/UPI app.
  - **Optional — real gateway via Razorpay**: set `RAZORPAY_KEY_ID`,
    `RAZORPAY_KEY_SECRET`, and `RAZORPAY_WEBHOOK_SECRET` in `.env` and the
    backend automatically switches to creating a real Razorpay order on
    `POST /payments/initiate`. Confirmation then happens automatically via
    `POST /api/v1/payments/webhook/razorpay`, verified with the webhook
    secret (HMAC-SHA256 over the raw body) — see
    `src/modules/payment/razorpay.adapter.js`. In the Razorpay dashboard,
    point your webhook at `https://<your-domain>/api/v1/payments/webhook/razorpay`
    and subscribe to the `payment.captured` event. You'll need
    `npx prisma migrate dev` again after pulling this change, since it adds
    `gatewayOrderId`/`gatewaySignature` columns to the `payments` table.
- **File storage (Cloudinary)**: KYC documents (Aadhaar, PAN, agreements)
  and generated receipt PDFs are stored on **Cloudinary** — not on local disk.
  This is essential for platforms with ephemeral filesystems (e.g. Render free
  tier, Heroku) where local files are wiped on every restart/redeploy. Set the
  three `CLOUDINARY_*` env vars (see below) before uploading any documents or
  generating receipts.
- **Aadhaar numbers are encrypted at rest** (AES-256-CBC via `ENCRYPTION_KEY`);
  only the last 4 digits are stored in plaintext for display. PAN is encrypted
  the same way. Rotate `ENCRYPTION_KEY` carefully — changing it invalidates
  previously encrypted data.
- **SMS/SMTP are stubbed by default** (just logged) so you can run the app
  without paid accounts. Set `SMS_PROVIDER` and SMTP env vars to enable real
  sending — see `notification/channels/`.
- **OTP storage is in-memory** (a `Map`) for simplicity. Swap for Redis before
  running multiple server instances or in production.
- Run `npm test` to run the full test suite: calculator unit tests (no DB
  needed) plus integration tests that boot the real Express app (real routes,
  real middleware, real RBAC) against a mocked Prisma client — see
  `tests/mocks/prismaMock.js`. These catch route/middleware wiring bugs
  without needing a live database. They are not a substitute for testing
  against a real Postgres instance before going live — see `DEPLOYMENT.md`
  in the project root for a full pre-launch checklist.

## Cloudinary setup (file storage)

KYC document uploads and receipt PDFs are stored on [Cloudinary](https://cloudinary.com)
instead of local disk, so files persist across deploys on ephemeral platforms.

1. Create a **free** Cloudinary account at <https://cloudinary.com/users/register_free>.
2. In the Cloudinary Dashboard, go to **Programmable Media → Dashboard** (or **API Keys**).
3. Copy the three credentials and add them to your `.env`:

```env
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=123456789012345
CLOUDINARY_API_SECRET=abcdefghijklmnopqrstuvwx
```

Without these, document upload and receipt generation will fail at runtime (the
app still starts, but the relevant endpoints return 500 errors).

## Environment variables

See `.env.example` for the full list with comments.

## Wiping Customer Data (Cleanup Script)

A standalone script is provided to completely clean up the database of all customer-related test data before going live.

### Usage

```bash
node scripts/wipeAllCustomerData.js --confirm
```

### What it does

In a single, atomic Prisma database transaction (all-or-nothing), the script:
1. Deletes all `Receipt`, `Payment`, `Due`, `Document`, `Notification`, `Loan`, `ClosedLoan`, and `Customer` records in foreign-key-safe order.
2. Deletes all `User` records with the role `CUSTOMER`.
3. Leaves all admin configurations, non-customer user accounts (`SUPER_ADMIN`, `VIEW_ADMIN`), and audit logs intact.
4. Logs an entry to the `AuditLog` database table record detailing this wipe itself (for system security tracking).

### Safety Features & Warnings

> [!WARNING]  
> This script is strictly for developer use/pre-launch test cleanup. Running this script against a production database will result in permanent, unrecoverable data loss.
>
> **Safety Guards**:
> - The script will query the database, print a summary counts of all records to be deleted, and immediately refuse to run/exit if the `--confirm` CLI flag is missing.


