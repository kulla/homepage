import { expect, test } from '@playwright/test'

test.describe('Navigation', () => {
  test('shows the full navigation on large screens', async ({ page }) => {
    await page.setViewportSize({ width: 1280, height: 900 })
    await page.goto('/')

    await expect(page.getByRole('button', { name: /open menu/i })).toBeHidden()
    await expect(page.getByRole('link', { name: 'Home' })).toBeVisible()
    await expect(page.getByRole('link', { name: 'Blog' })).toBeVisible()
    await expect(page.getByRole('link', { name: 'CV' })).toBeVisible()
  })

  test('opens and closes the mobile menu', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 844 })
    await page.goto('/')

    const burgerMenu = page.getByRole('button', { name: /open menu/i })
    const closeMenu = page.getByRole('button', { name: /close menu/i })
    const menu = page.locator('#main-menu')

    await expect(burgerMenu).toBeVisible()
    await expect(menu).toHaveAttribute('data-open', 'false')

    await burgerMenu.click()

    await expect(burgerMenu).toHaveAttribute('aria-expanded', 'true')
    await expect(menu).toHaveAttribute('data-open', 'true')
    await expect(closeMenu).toBeVisible()
    await expect(page.getByRole('link', { name: 'Home' })).toBeVisible()

    await closeMenu.click()

    await expect(burgerMenu).toHaveAttribute('aria-expanded', 'false')
    await expect(menu).toHaveAttribute('data-open', 'false')
  })
})
