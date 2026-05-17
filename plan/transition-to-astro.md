# Transition To Astro

## Goal

Migrate the current handwritten HTML/CSS homepage to an Astro-based site using
the `astro-scholar-main/` template as the starting point.

The target site should provide:

- a landing page
- a blog
- a dedicated CV page

The migration should happen in small, understandable, progressive steps so each
commit stays easy to review and the new codebase remains approachable.

## Current Decisions

- Use `astro-scholar-main/` as the source template (copy files from there and
  then change them).
- Final navigation should focus on `Home`, `Blog`, and `CV`.
- The initial visual direction should start from the template look.
- `Publications` and `Presentations` should be ommited.
- The CV should live on a dedicated route.
- Deployment should target a custom root domain `https://kulla.dev/`.
- Commit messages should use conventional commits.
- The current handwritten site should later be moved to a separate reference
  folder.

## Internationalization

- The route structure should be prepared for internationalization from the
  beginning.
- The initial implementation should ship English content only.
- Localized routes should use `/<lang>/...` paths.
- The initial active routes should be:
  - `/en/`
  - `/en/blog/`
  - `/en/cv/`
- German support is planned for a later step.

## Workflow Rules

- Keep the migration incremental.
- Do not pre-generate step files.
- Create a step file named `plan/NN-todo-name.md` only when that specific step
  starts.
- Update this main plan whenever implementation changes the planned sequence,
  scope, or assumptions.
- After any code change, write `plan/current_commit_message` with the commit
  message for the current change.
- When a commit was prepared with help from a coding agent, include a
  `Co-authored-by` trailer in `plan/current_commit_message` so the resulting
  commit clearly records that assistance.

## Ordered Todo List

1. Create the commit workflow scaffolding.
2. Record architecture and i18n decisions in the project structure.
3. Adopt the Astro template into the main project with minimal setup.
4. Configure the site for localized `/<lang>/...` routes.
5. Remove template sections that are not part of the target site.
6. Move the legacy handwritten site into a separate reference location.
7. Build the English landing page shell at `/en/`.
8. Build the English CV page shell at `/en/cv/`.
9. Adapt the blog to the new structure at `/en/blog/`.
10. Migrate content progressively from the legacy site.
11. Migrate metadata, assets, and deployment settings.
12. Clean up unused files and verify the build.

## Open Questions

- Whether `/` should later redirect to `/en/` or whether only localized routes
  should exist.

## Current Status

- Main plan created.
- No step-specific todo files generated yet.
- No Astro migration code implemented yet.
