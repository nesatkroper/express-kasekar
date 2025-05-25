-- CreateTable
CREATE TABLE "Khqr" (
    "khqrId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "account" TEXT NOT NULL DEFAULT 'suon_phanun@aclb',
    "name" TEXT NOT NULL DEFAULT 'PHANUN SUON',
    "city" TEXT NOT NULL DEFAULT 'Siem Reap',
    "amount" DECIMAL(12,2) DEFAULT 0.00,
    "currency" TEXT DEFAULT 'usd',
    "token" TEXT NOT NULL DEFAULT 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNDdjMGY2MzY4ZTFmNGFjYSJ9LCJpYXQiOjE3NDgxNDA0MzgsImV4cCI6MTc1NTkxNjQzOH0.CSNbF2clfRi2f8ROhyOGF8Nxyz5lqet0Nb1iWEvwaDU',
    "status" "Status" NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Khqr_pkey" PRIMARY KEY ("khqrId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Khqr_account_key" ON "Khqr"("account");

-- CreateIndex
CREATE UNIQUE INDEX "Khqr_name_key" ON "Khqr"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Khqr_token_key" ON "Khqr"("token");
