/*
  Warnings:

  - The primary key for the `Customerinfo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `customerinfoId` on the `Customerinfo` table. All the data in the column will be lost.
  - The primary key for the `Employeeinfo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `employeeinfoId` on the `Employeeinfo` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Customerinfo" DROP CONSTRAINT "Customerinfo_pkey",
DROP COLUMN "customerinfoId";

-- AlterTable
ALTER TABLE "Employeeinfo" DROP CONSTRAINT "Employeeinfo_pkey",
DROP COLUMN "employeeinfoId";
