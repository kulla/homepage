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
- Component-specific CSS and JS should be colocated with the component or page.
- Prefer keeping markup, scoped CSS, and processed client-side scripts in the
  same `.astro` file.
- `src/styles/global.css` should be reserved for global styles such as tokens,
  reset, typography, and app-wide layout primitives.
- A component or page subdirectory should be introduced only when a single
  `.astro` file becomes too large or needs companion assets.
- Blog posts should move to an Astro content collection so each post can live in
  its own folder with colocated assets, for example
  `src/content/blog/my-post/index.md` plus sibling images referenced with
  relative paths such as `./cover.jpg`.
- Blog post frontmatter images such as covers should be validated through the
  content collection schema with Astro's `image()` helper.
- Deployment should target a custom root domain `https://kulla.dev/`.
- Commit messages should use conventional commits.
- The current handwritten site should later be moved to a separate reference
  folder.
- Old website is under `old-website/`

## Target Project Structure

```text
public/
  favicon.svg
  robots.txt
  images/
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

`src/pages/` defines the route tree, while shared shell files stay in
`src/layouts/`, `src/components/`, and `src/styles/global.css`.

## Internationalization

- The route structure should be prepared for internationalization from the
  beginning.
- The initial implementation should ship English content only.
- The initial active routes should be:
  - `/`
  - `/blog/`
  - `/cv/`
- German support is planned for a later step.

## Workflow Rules

- Keep the migration incremental.
- Do not pre-generate step files.
- Create a step file named `plan/NN-todo-name.md` only when that specific step
  starts.
- Update this main plan whenever implementation changes the planned sequence,
  scope, or assumptions.
- When running the site locally, start the dev server in the background so it
  keeps serving while you inspect the result.
- Use `webfetch` against the local URL to verify what the browser-facing page is
  returning.
- After any code change, write `plan/current_commit_message` with the commit
  message for the current change.
- When a commit was prepared with help from a coding agent, include a
  `Co-authored-by` trailer in `plan/current_commit_message` so the resulting
  commit clearly records that assistance.

## Ordered Todo List

- [x] Create the commit workflow scaffolding.
- [x] Record the target Astro project structure for shared routes and files.
- [x] Align the root project tooling with Astro by introducing the required root
      config and scripts.
- [x] Migrate the shared shell files from the template by merging:
      `astro-scholar-main/src/layouts/Layout.astro` into
      `src/layouts/Layout.astro`,
      `astro-scholar-main/src/components/Header.astro` into
      `src/components/Header.astro`,
      `astro-scholar-main/src/components/Navigation.astro` into
      `src/components/Navigation.astro`,
      `astro-scholar-main/src/components/Menu.astro` into
      `src/components/Menu.astro`,
      `astro-scholar-main/src/components/ThemeToggle.astro` into
      `src/components/ThemeToggle.astro`,
      `astro-scholar-main/src/components/Footer.astro` into
      `src/components/Footer.astro`, and
      `astro-scholar-main/src/styles/global.css` into `src/styles/global.css`.
- [x] Investigate `src/layouts/Layout.astro` manually and with help from a
      coding agent.
- [x] Investigate constants file.
- [ ] Investigate `src/components/Header.astro` manually and with help from a
      coding agent.
- [ ] Investigate `src/components/Navigation.astro` manually and with help from
      a coding agent.
- [ ] Investigate `src/components/Menu.astro` manually and with help from a
      coding agent.
- [x] Investigate `src/components/ThemeToggle.astro` manually and with help from
      a coding agent.
- [ ] Investigate `src/components/Footer.astro` manually and with help from a
      coding agent.
- [ ] Investigate `src/styles/global.css` manually and with help from a coding
      agent.
- [x] Copy inter font into public directory.
- [ ] Integrate `astro-scholar-main/src/scripts/menu.js` into the owning Astro
      component files, primarily `src/components/Menu.astro` and
      `src/components/Navigation.astro`, instead of keeping a separate
      `src/scripts/menu.js` file.
- [ ] Replace template-wide site configuration with project-specific data in
      `src/constants.ts` and shared assets.
- [ ] Introduce the initial English route structure directly under `src/pages/`.
- [ ] Migrate the landing page route by merging
      `astro-scholar-main/src/pages/index.astro` into `src/pages/index.astro`
      and `astro-scholar-main/src/components/Hero.astro` into
      `src/components/Hero.astro`, while merging landing-page CSS from
      `astro-scholar-main/src/styles/home.css` into `src/pages/index.astro` or a
      local landing-page subdirectory.
- [ ] Investigate `src/pages/index.astro` manually and with help from a coding
      agent.
- [ ] Investigate `src/components/Hero.astro` manually and with help from a
      coding agent.
- [ ] Migrate the CV route by merging `astro-scholar-main/src/pages/about.astro`
      into `src/pages/cv.astro`, while merging CV-specific CSS from
      `astro-scholar-main/src/styles/about.css` into `src/pages/cv.astro` or a
      local CV-page subdirectory.
- [ ] Investigate `src/pages/cv.astro` manually and with help from a coding
      agent.
- [ ] Migrate the blog index route by merging
      `astro-scholar-main/src/pages/blog/index.astro` into
      `src/pages/blog/index.astro`, while merging blog-index CSS from
      `astro-scholar-main/src/styles/blog.css` into `src/pages/blog/index.astro`
      or a local blog-index subdirectory.
- [ ] Investigate `src/pages/blog/index.astro` manually and with help from a
      coding agent.
- [ ] Migrate the blog post layout by merging
      `astro-scholar-main/src/layouts/BlogPost.astro` into
      `src/layouts/BlogPost.astro`.
- [ ] Investigate `src/layouts/BlogPost.astro` manually and with help from a
      coding agent.
- [ ] Introduce the blog content collection structure under `src/content/blog/`
      so each post can use a dedicated folder with colocated images and other
      companion assets.
- [ ] Replace the template sample blog posts with real blog content one file at
      a time, keeping each post's images next to the post entry instead of in a
      shared global image folder.
- [ ] Remove template-only routes and data that are outside the target site:
      `src/pages/publications.astro`, `src/pages/presentations.astro`,
      `src/data/publications.json`, and presentation-specific public assets.
- [ ] Move the handwritten site into a separate reference location.
- [ ] Migrate legacy homepage and CV content into the new Astro routes page by
      page.
- [ ] Migrate metadata, favicons, images, and deployment settings for
      `https://kulla.dev/`.
- [ ] Remove unused template artifacts and verify the build and checks.
