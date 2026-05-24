import { expect, test } from '@playwright/test'

const themes = [
  { start: 'light', next: 'dark' },
  { start: 'dark', next: 'light' },
] as const

for (const { start, next } of themes) {
  test(`toggles theme from ${start} to ${next}`, async ({ page }) => {
    await page.emulateMedia({ colorScheme: start })
    await page.goto('/')

    await expect(page.locator('html')).toHaveAttribute('data-theme', start)

    await page.getByRole('button', { name: /toggle light\/dark mode/i }).click()

    await expect(page.locator('html')).toHaveAttribute('data-theme', next)
    expect(await page.evaluate(() => localStorage.getItem('theme'))).toBe(next)
  })
}
