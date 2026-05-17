# Record Target Astro Project Structure For Shared Routes And Files

## Goal

Document the target `src/` and root-level Astro project structure before moving
any template files so the migration has a stable file map.

## Why This Step Exists

The main migration plan already fixes the route shape and colocation rules. This
step turns those decisions into a concrete structure that later migration steps
can follow without re-deciding file locations.

## Inputs

- `plan/transition-to-astro.md`
- current root project structure
- `astro-scholar-main/` template structure
- current Astro docs:
  - `https://docs.astro.build/en/basics/project-structure/`
  - `https://docs.astro.build/en/guides/routing/`

## Decisions To Record

- `src/pages/` is the only required Astro source directory and route URLs come
  directly from file paths inside it
- shared shell files live in:
  - `src/layouts/`
  - `src/components/`
  - `src/styles/global.css`
- blog post pages live under `src/pages/blog/`
- shared site data lives in `src/constants.ts`
- component-specific CSS and JS stay colocated with the owning `.astro` file
- subdirectories are introduced only when a page or component becomes too large
  or needs companion assets
- root-level Astro project files should include `astro.config.mjs`,
  `package.json`, and `tsconfig.json`
- unprocessed assets that should bypass Astro bundling belong in `public/`

## Target Structure To Record

```text
public/
  favicon.svg
  robots.txt
  images/
  [future static assets copied without processing]
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
    cv.astro
    blog/
      index.astro
      [slug].astro or individual post files later
  styles/
    global.css
  constants.ts
astro.config.mjs
package.json
tsconfig.json
```

## Notes To Capture

- `src/index.html` is temporary legacy entrypoint content and will be retired as
  Astro routes replace it.
- Files or directories under `src/pages/` can be prefixed with `_` later if a
  colocated helper, test file, or temporary disabled page should stay out of the
  generated route tree.
- Template-only files for publications and presentations are intentionally out
  of scope for the target structure.
- The initial target does not reserve a destination for template-only files such
  as `src/components/SocialIcons.astro`, `src/data/`, `src/scripts/`, or
  `src/styles/publications.css`; any needed behavior should be merged into the
  kept files instead of copying those directories wholesale.
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
