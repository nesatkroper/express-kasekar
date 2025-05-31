/*
  Warnings:

  - The `method` column on the `Attendance` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to alter the column `email` on the `Auth` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(50)`.
  - You are about to alter the column `method` on the `AuthLog` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `ip` on the `AuthLog` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `userAgent` on the `AuthLog` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `picture` on the `Category` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `categoryName` on the `Category` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `categoryCode` on the `Category` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `firstName` on the `Customer` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `lastName` on the `Customer` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `phone` on the `Customer` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `picture` on the `Customerinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `region` on the `Customerinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `govId` on the `Customerinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `govPicture` on the `Customerinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `departmentName` on the `Department` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `departmentCode` on the `Department` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `employeeCode` on the `Employee` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `firstName` on the `Employee` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `lastName` on the `Employee` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `phone` on the `Employee` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `picture` on the `Employeeinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `region` on the `Employeeinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `email` on the `Employeeinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `govId` on the `Employeeinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `govPicture` on the `Employeeinfo` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `eventName` on the `Event` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to drop the column `imageType` on the `Imageaddress` table. All the data in the column will be lost.
  - You are about to alter the column `imageUrl` on the `Imageaddress` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `account` on the `Khqr` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `name` on the `Khqr` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `city` on the `Khqr` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `currency` on the `Khqr` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(10)`.
  - You are about to alter the column `method` on the `Log` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `ip` on the `Log` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `title` on the `Notification` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `content` on the `Notification` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `invoice` on the `Payment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `hash` on the `Payment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `fromAccountId` on the `Payment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `toAccountId` on the `Payment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `currency` on the `Payment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(10)`.
  - You are about to alter the column `externalRef` on the `Payment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `positionName` on the `Position` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `positionCode` on the `Position` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `productName` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `productCode` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `picture` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `unit` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(10)`.
  - You are about to alter the column `capacity` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `name` on the `Role` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `invoice` on the `Sale` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `name` on the `State` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `invoice` on the `Stockentry` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to drop the column `address` on the `Supplier` table. All the data in the column will be lost.
  - You are about to alter the column `supplierName` on the `Supplier` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `companyName` on the `Supplier` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `phone` on the `Supplier` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - You are about to alter the column `email` on the `Supplier` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `deviceInfo` on the `Token` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `ipAddress` on the `Token` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.

*/
-- CreateEnum
CREATE TYPE "ScanMethod" AS ENUM ('phone', 'biometric');

-- AlterTable
ALTER TABLE "Attendance" DROP COLUMN "method",
ADD COLUMN     "method" "ScanMethod" DEFAULT 'phone';

-- AlterTable
ALTER TABLE "Auth" ALTER COLUMN "email" SET DATA TYPE VARCHAR(50);

-- AlterTable
ALTER TABLE "AuthLog" ALTER COLUMN "method" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "ip" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "userAgent" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Category" ALTER COLUMN "picture" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "categoryName" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "categoryCode" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Customer" ALTER COLUMN "firstName" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "lastName" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "phone" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Customerinfo" ALTER COLUMN "picture" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "region" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "govId" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "govPicture" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Department" ALTER COLUMN "departmentName" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "departmentCode" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Employee" ALTER COLUMN "employeeCode" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "firstName" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "lastName" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "phone" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Employeeinfo" ALTER COLUMN "picture" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "region" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "email" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "govId" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "govPicture" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "eventName" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Imageaddress" DROP COLUMN "imageType",
ALTER COLUMN "imageUrl" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Khqr" ALTER COLUMN "account" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "name" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "city" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "currency" SET DATA TYPE VARCHAR(10);

-- AlterTable
ALTER TABLE "Log" ALTER COLUMN "method" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "ip" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Notification" ALTER COLUMN "title" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "content" SET DATA TYPE VARCHAR(200);

-- AlterTable
ALTER TABLE "Payment" ALTER COLUMN "invoice" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "hash" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "fromAccountId" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "toAccountId" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "currency" SET DATA TYPE VARCHAR(10),
ALTER COLUMN "externalRef" SET DATA TYPE VARCHAR(50);

-- AlterTable
ALTER TABLE "Position" ALTER COLUMN "positionName" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "positionCode" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Product" ALTER COLUMN "productName" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "productCode" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "picture" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "unit" SET DATA TYPE VARCHAR(10),
ALTER COLUMN "capacity" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Role" ALTER COLUMN "name" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Sale" ALTER COLUMN "invoice" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "State" ALTER COLUMN "name" SET DATA TYPE VARCHAR(50);

-- AlterTable
ALTER TABLE "Stockentry" ALTER COLUMN "invoice" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Supplier" DROP COLUMN "address",
ADD COLUMN     "addressId" UUID,
ADD COLUMN     "memo" TEXT,
ALTER COLUMN "supplierName" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "companyName" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "phone" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "email" SET DATA TYPE VARCHAR(50);

-- AlterTable
ALTER TABLE "System" ALTER COLUMN "systemType" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "ownerName" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "ownerEmail" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "apiKey" SET DATA TYPE TEXT,
ALTER COLUMN "apiSecret" SET DATA TYPE TEXT,
ALTER COLUMN "apiUrl" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Token" ALTER COLUMN "deviceInfo" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "ipAddress" SET DATA TYPE VARCHAR(200);

-- CreateIndex
CREATE INDEX "Cart_authId_idx" ON "Cart"("authId");

-- CreateIndex
CREATE INDEX "Cart_userId_idx" ON "Cart"("userId");

-- CreateIndex
CREATE INDEX "Cart_productId_idx" ON "Cart"("productId");

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("addressId") ON DELETE SET NULL ON UPDATE CASCADE;
