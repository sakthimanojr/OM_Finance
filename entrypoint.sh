#!/bin/sh
set -e

echo "Running Prisma migrations..."
npx prisma migrate deploy

echo "Seeding database (idempotent)..."
node prisma/seed.js

echo "Starting server..."
exec node src/server.js
