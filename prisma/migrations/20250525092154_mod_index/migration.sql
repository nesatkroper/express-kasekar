/*
  Warnings:

  - You are about to drop the column `reservationId` on the `Payment` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Payment" DROP COLUMN "reservationId";

-- CreateIndex
CREATE INDEX "Address_cityId_idx" ON "Address"("cityId");

-- CreateIndex
CREATE INDEX "Address_stateId_idx" ON "Address"("stateId");

-- CreateIndex
CREATE INDEX "Address_customerId_idx" ON "Address"("customerId");

-- CreateIndex
CREATE INDEX "Address_employeeId_idx" ON "Address"("employeeId");

-- CreateIndex
CREATE INDEX "Address_eventId_idx" ON "Address"("eventId");

-- CreateIndex
CREATE INDEX "Attendance_employeeId_idx" ON "Attendance"("employeeId");

-- CreateIndex
CREATE INDEX "Attendance_eventId_idx" ON "Attendance"("eventId");

-- CreateIndex
CREATE INDEX "AuthLog_authId_idx" ON "AuthLog"("authId");

-- CreateIndex
CREATE INDEX "Cartnote_cartId_idx" ON "Cartnote"("cartId");

-- CreateIndex
CREATE INDEX "Customer_employeeId_idx" ON "Customer"("employeeId");

-- CreateIndex
CREATE INDEX "Employee_employeeCode_idx" ON "Employee"("employeeCode");

-- CreateIndex
CREATE INDEX "Employee_departmentId_idx" ON "Employee"("departmentId");

-- CreateIndex
CREATE INDEX "Employee_positionId_idx" ON "Employee"("positionId");

-- CreateIndex
CREATE INDEX "Imageaddress_addressId_idx" ON "Imageaddress"("addressId");

-- CreateIndex
CREATE INDEX "Notification_authId_idx" ON "Notification"("authId");

-- CreateIndex
CREATE INDEX "Notification_userId_idx" ON "Notification"("userId");

-- CreateIndex
CREATE INDEX "Payment_employeeId_idx" ON "Payment"("employeeId");

-- CreateIndex
CREATE INDEX "Payment_saleId_idx" ON "Payment"("saleId");

-- CreateIndex
CREATE INDEX "Payment_fromAccountId_idx" ON "Payment"("fromAccountId");

-- CreateIndex
CREATE INDEX "Payment_toAccountId_idx" ON "Payment"("toAccountId");

-- CreateIndex
CREATE INDEX "Position_departmentId_idx" ON "Position"("departmentId");

-- CreateIndex
CREATE INDEX "Product_categoryId_idx" ON "Product"("categoryId");

-- CreateIndex
CREATE INDEX "Stock_createdAt_idx" ON "Stock"("createdAt");
