-- CreateEnum
CREATE TYPE "SystemType" AS ENUM ('default', 'pos', 'reserve');

-- CreateTable
CREATE TABLE "System" (
    "systemId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "systemName" VARCHAR(50) NOT NULL DEFAULT 'Nun System',
    "systemType" VARCHAR(20) NOT NULL DEFAULT 'default',
    "ownerName" VARCHAR(100),
    "ownerEmail" VARCHAR(100),
    "ownerPhone" VARCHAR(20),
    "apiKey" VARCHAR(255) NOT NULL,
    "apiSecret" VARCHAR(255) NOT NULL,
    "apiUrl" VARCHAR(255) NOT NULL,
    "apiVersion" VARCHAR(10) NOT NULL DEFAULT 'v1',
    "description" TEXT,
    "status" "Status" NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "System_pkey" PRIMARY KEY ("systemId")
);

-- CreateIndex
CREATE UNIQUE INDEX "System_systemName_key" ON "System"("systemName");

-- CreateIndex
CREATE UNIQUE INDEX "System_apiKey_key" ON "System"("apiKey");

-- CreateIndex
CREATE UNIQUE INDEX "System_apiSecret_key" ON "System"("apiSecret");

-- CreateIndex
CREATE UNIQUE INDEX "System_apiUrl_key" ON "System"("apiUrl");
