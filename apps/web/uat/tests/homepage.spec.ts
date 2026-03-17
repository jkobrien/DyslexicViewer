import { test, expect } from "@playwright/test";

test("homepage renders DyslexicViewer heading", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { name: "DyslexicViewer" })).toBeVisible();
});

test("homepage shows Open Camera View button", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("button", { name: "Open Camera View" })).toBeVisible();
});

test("homepage shows Select Dyslexia Level button", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("button", { name: "Select Dyslexia Level" })).toBeVisible();
});
