# Migrate Shared Shell Files

## Goal

Merge the Astro template's shared shell into the local app shell so the project
has its own `Layout`, header/navigation, menu toggle, footer, and global CSS.

## Scope

- `astro-scholar-main/src/layouts/Layout.astro` -> `src/layouts/Layout.astro`
- `astro-scholar-main/src/components/Header.astro` -> `src/components/Header.astro`
- `astro-scholar-main/src/components/Navigation.astro` -> `src/components/Navigation.astro`
- `astro-scholar-main/src/components/Menu.astro` -> `src/components/Menu.astro`
- `astro-scholar-main/src/components/ThemeToggle.astro` -> `src/components/ThemeToggle.astro`
- `astro-scholar-main/src/components/Footer.astro` -> `src/components/Footer.astro`
- `astro-scholar-main/src/styles/global.css` -> `src/styles/global.css`
- `astro-scholar-main/src/scripts/menu.js` should be folded into the owning
  component files instead of staying as a standalone script file.

## Approach

1. Read the template and local shell files side by side.
2. Merge structure first, then styles, then any client-side behavior.
3. Keep component-specific CSS and JS colocated with the component where
   practical.
4. Preserve the current route set and project-specific data wiring.

## Checks

- Confirm the local shell renders with the expected layout and navigation.
- Confirm the menu toggle still works after inlining the script.
- Keep the changes small enough to review as a single focused commit.
