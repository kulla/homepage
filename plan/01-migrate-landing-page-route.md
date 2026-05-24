# Step 01 - Migrate Landing Page Route

## Scope

Implement the next todo from `plan/transition-to-astro.md`:

- Migrate the landing page route by merging:
  - `astro-scholar-main/src/pages/index.astro` -> `src/pages/index.astro`
  - `astro-scholar-main/src/components/Hero.astro` ->
    `src/components/Hero.astro`
  - `astro-scholar-main/src/styles/home.css` -> scoped styles in
    `src/pages/index.astro` and/or `src/components/Hero.astro`

## Constraints

- Keep migration incremental and easy to review.
- Preserve project conventions: colocate markup, scoped CSS, and component logic
  in `.astro` files.
- Remove template navigation/content references outside target site scope
  (`Publications`, `Presentations`).
- Keep active landing content in English only.

## Implementation Plan

1. Inspect template and target files side-by-side:
   - `astro-scholar-main/src/pages/index.astro`
   - `astro-scholar-main/src/components/Hero.astro`
   - `astro-scholar-main/src/styles/home.css`
   - `src/pages/index.astro`
   - `src/components/Hero.astro` (create if missing)
2. Merge/create `src/components/Hero.astro` from template structure.
3. Merge landing route structure into `src/pages/index.astro`.
4. Move landing-specific styles from template `home.css` into local scoped
   `<style>` blocks in the owning page/component.
5. Update copy/links to match project targets (`Home`, `Blog`, `CV`) and remove
   excluded sections.
6. Verify route rendering for `/` locally.

## Verification

Run after code changes:

- `bun run check`
- `bun run test`

## Completion Criteria

- `src/pages/index.astro` reflects Astro template landing structure adapted to
  project scope.
- `src/components/Hero.astro` is present and integrated.
- Landing page styles are locally scoped (not added to global stylesheet unless
  truly global).
- No `Publications`/`Presentations` references on landing page.
- Check/test commands pass.
- `plan/current_commit_message` is written with a conventional commit message
  (include `Co-authored-by` trailer when required).
