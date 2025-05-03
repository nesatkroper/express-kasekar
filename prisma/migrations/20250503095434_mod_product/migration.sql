/*
  Warnings:

  - You are about to drop the column `price` on the `Product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Product" DROP COLUMN "price",
ADD COLUMN     "capacity" DECIMAL(10,2) NOT NULL DEFAULT 0.00,
ADD COLUMN     "costPrice" DECIMAL(10,2) NOT NULL DEFAULT 0.00,
ADD COLUMN     "sellPrice" DECIMAL(10,2) NOT NULL DEFAULT 0.00,
ADD COLUMN     "unit" TEXT;
