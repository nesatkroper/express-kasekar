/*
  Warnings:

  - You are about to drop the column `country` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `location` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `address` on the `Customerinfo` table. All the data in the column will be lost.
  - You are about to drop the column `country` on the `Customerinfo` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Address" DROP CONSTRAINT "Address_cityId_fkey";

-- DropForeignKey
ALTER TABLE "Address" DROP CONSTRAINT "Address_stateId_fkey";

-- AlterTable
ALTER TABLE "Address" DROP COLUMN "country",
DROP COLUMN "location",
ALTER COLUMN "cityId" DROP NOT NULL,
ALTER COLUMN "stateId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Customerinfo" DROP COLUMN "address",
DROP COLUMN "country",
ADD COLUMN     "govExpire" TIMESTAMP(3),
ADD COLUMN     "govId" TEXT,
ADD COLUMN     "govPicture" TEXT;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("cityId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "State"("stateId") ON DELETE SET NULL ON UPDATE CASCADE;
