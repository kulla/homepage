# Align Root Project Tooling With Astro

## Goal

Replace the remaining handwritten-site root tooling assumptions with Astro root
tooling so local development, CI, and publishing run against Astro instead of
`src/index.html`.

## Why This Step Exists

The repository already depends on `astro`, but the root scripts and TypeScript
configuration still target the Bun HTML entrypoint. The migration needs the root
tooling aligned before shared Astro files and routes are introduced.

## Inputs

- `package.json`
- `tsconfig.json`
- `astro-scholar-main/package.json`
- `astro-scholar-main/astro.config.mjs`
- `.github/workflows/checks.yml`
- `.github/workflows/publish.yml`

## Planned Changes

- add root `astro.config.mjs`
- update `package.json` scripts from Bun HTML commands to Astro commands:
  - `dev`
  - `build`
  - `preview`
  - optional passthrough `astro`
- keep existing formatting script names unless there is a concrete reason to
  rename them
- replace Bun-specific TypeScript config inheritance with Astro TypeScript
  config
- make sure CI continues to work with `bun run build`
- keep output targeting `dist` so existing publish workflow artifact paths
  remain valid

## Astro Config Expectations

- set `site` to `https://kulla.dev/`
- do not set a GitHub Pages `base` path because deployment target is the custom
  root domain
- keep config minimal until later steps require more options

## Package And TypeScript Expectations

- `package.json` should describe Astro-driven local development
- `tsconfig.json` should extend Astro's strict config or the project's chosen
  Astro base config
- remove Bun-specific `types` unless still needed by remaining project scripts

## Risks To Check During Implementation

- whether any non-Astro scripts still rely on Bun-specific TypeScript settings
- whether CI or publish workflows assume the old HTML build behavior
- whether the existing `README.md` should be updated now or in a later cleanup
  step

## Done When

- `bun run dev` starts Astro
- `bun run build` builds Astro output into `dist`
- root TypeScript config matches Astro expectations
- root Astro config exists with the correct production site URL
- CI script names remain compatible with existing workflows

## Commit Message

```text
build: align root tooling with astro
```
