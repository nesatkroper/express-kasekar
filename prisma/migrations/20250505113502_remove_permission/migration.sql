/*
  Warnings:

  - You are about to drop the `ImageAddress` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ImageAddress" DROP CONSTRAINT "ImageAddress_addressId_fkey";

-- DropTable
DROP TABLE "ImageAddress";

-- CreateTable
CREATE TABLE "Imageaddress" (
    "imageId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "imageUrl" TEXT NOT NULL,
    "imageType" TEXT,
    "addressId" UUID NOT NULL,
    "status" "Status" NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Imageaddress_pkey" PRIMARY KEY ("imageId")
);

-- AddForeignKey
ALTER TABLE "Imageaddress" ADD CONSTRAINT "Imageaddress_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("addressId") ON DELETE RESTRICT ON UPDATE CASCADE;
