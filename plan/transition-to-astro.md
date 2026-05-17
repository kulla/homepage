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

- Use `astro-scholar-main/` as the source template, but migrate it progressively
  route by route and file by file instead of copying everything at once.
- Final navigation should focus on `Home`, `Blog`, and `CV`.
- The initial visual direction should start from the template look.
- `Publications` and `Presentations` should be ommited.
- The CV should live on a dedicated route.
- `/` should redirect to `/en/`.
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

- [x] Create the commit workflow scaffolding.
- [ ] Record the target Astro project structure for localized routes and shared
      files.
- [ ] Align the root project tooling with Astro by introducing the required root
      config and scripts.
- [ ] Migrate the shared shell files from the template:
      `src/layouts/Layout.astro`, `src/components/Header.astro`,
      `src/components/Navigation.astro`, `src/components/Menu.astro`,
      `src/components/ThemeToggle.astro`, `src/components/Footer.astro`,
      `src/scripts/menu.js`, and `src/styles/global.css`.
- [ ] Replace template-wide site configuration with project-specific data in
      `src/constants.ts` and shared assets.
- [ ] Introduce the English localized route structure under `src/pages/en/`.
- [ ] Add the root route so `/` redirects to `/en/`.
- [ ] Migrate the landing page route by adapting:
      `astro-scholar-main/src/pages/index.astro`,
      `astro-scholar-main/src/components/Hero.astro`, and
      `astro-scholar-main/src/styles/home.css` into `/en/`.
- [ ] Migrate the CV route by adapting:
      `astro-scholar-main/src/pages/about.astro` and
      `astro-scholar-main/src/styles/about.css` into `/en/cv/`.
- [ ] Migrate the blog index route by adapting:
      `astro-scholar-main/src/pages/blog/index.astro` and
      `astro-scholar-main/src/styles/blog.css` into `/en/blog/`.
- [ ] Migrate the blog post layout from
      `astro-scholar-main/src/layouts/BlogPost.astro`.
- [ ] Replace the template sample blog posts with real blog content one file at
      a time.
- [ ] Remove template-only routes and data that are outside the target site:
      `src/pages/publications.astro`, `src/pages/presentations.astro`,
      `src/data/publications.json`, and presentation-specific public assets.
- [ ] Move the handwritten site into a separate reference location.
- [ ] Migrate legacy homepage and CV content into the new Astro routes page by
      page.
- [ ] Migrate metadata, favicons, images, and deployment settings for
      `https://kulla.dev/`.
- [ ] Remove unused template artifacts and verify the build and checks.
