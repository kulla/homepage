# Record Target Astro Project Structure For Localized Routes And Shared Files

## Goal

Document the target `src/` and root-level Astro project structure before moving any
template files so the migration has a stable file map.

## Why This Step Exists

The main migration plan already fixes the route shape and colocation rules. This
step turns those decisions into a concrete structure that later migration steps
can follow without re-deciding file locations.

## Inputs

- `plan/transition-to-astro.md`
- current root project structure
- `astro-scholar-main/` template structure

## Decisions To Record

- localized pages live under `src/pages/en/`
- `/` remains a separate root route that redirects to `/en/`
- shared shell files live in:
  - `src/layouts/`
  - `src/components/`
  - `src/styles/global.css`
- blog post pages live under `src/pages/en/blog/`
- shared site data lives in `src/constants.ts`
- component-specific CSS and JS stay colocated with the owning `.astro` file
- subdirectories are introduced only when a page or component becomes too large
  or needs companion assets

## Target Structure To Record

```text
src/
  components/
    Footer.astro
    Header.astro
    Hero.astro
    Menu.astro
    Navigation.astro
    ThemeToggle.astro
  layouts/
    BlogPost.astro
    Layout.astro
  pages/
    index.astro
    en/
      index.astro
      cv.astro
      blog/
        index.astro
        [slug or individual post files later]
  styles/
    global.css
  constants.ts
```

## Notes To Capture

- `src/index.html` is temporary legacy entrypoint content and will be retired as
  Astro routes replace it.
- The localized route tree should start with English only, but directory layout
  must leave room for future `/de/` routes.
- Template-only files for publications and presentations are intentionally out of
  scope for the target structure.
- Keep the structure document focused on destination paths, not implementation
  details of each file.

## Done When

- the main plan references a concrete target structure instead of only general
  routing rules
- destination paths for routes, layouts, components, and global styles are
  explicit
- future migration steps can reference this structure without ambiguity

## Commit Message

```text
docs: record target astro project structure
```
