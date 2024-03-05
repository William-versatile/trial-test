/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `name` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `email` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_createdById_fkey";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "name" SET NOT NULL,
ALTER COLUMN "email" SET NOT NULL;

-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "Layouts" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "Layouts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Widgets" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Widgets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Layout_Widgets" (
    "layoutId" TEXT NOT NULL,
    "widgetId" TEXT NOT NULL,
    "widgetConfig" TEXT,

    CONSTRAINT "Layout_Widgets_pkey" PRIMARY KEY ("layoutId","widgetId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Layouts_name_key" ON "Layouts"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Widgets_name_key" ON "Widgets"("name");

-- CreateIndex
CREATE INDEX "User_email_idx" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Layouts" ADD CONSTRAINT "Layouts_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Layout_Widgets" ADD CONSTRAINT "Layout_Widgets_layoutId_fkey" FOREIGN KEY ("layoutId") REFERENCES "Layouts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Layout_Widgets" ADD CONSTRAINT "Layout_Widgets_widgetId_fkey" FOREIGN KEY ("widgetId") REFERENCES "Widgets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
