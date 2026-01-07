# Agent Guidelines for Kulla's Homepage

This document provides guidelines for AI coding agents working on this personal
homepage project.

## Project Overview

This is a personal homepage built with handwritten HTML and CSS. The project
uses Bun as the runtime and build tool, with TypeScript support and Prettier for
formatting.

**Tech Stack:**

- Bun (runtime and build tool)
- HTML5 with semantic markup and Schema.org metadata
- CSS3 with modern features (CSS custom properties, color-mix, oklab)
- TypeScript configuration (though currently only HTML/CSS files)
- Prettier for code formatting

## Build & Development Commands

### Setup

```bash
bun install
```

### Development

```bash
bun dev
# Starts hot-reload dev server at http://localhost:3000
```

### Build

```bash
bun run build
# Outputs to dist/ directory with minification
```

### Formatting

```bash
# Check formatting
bun run check:format

# Fix formatting
bun run format
```

### CI Checks

The CI runs two jobs on pull requests and main branch pushes:

1. `bun run build` - Build verification
2. `bun run check:format` - Prettier format check

## Code Style Guidelines

### General Principles

- Keep it simple: This is a static personal homepage with handwritten HTML/CSS
- Semantic HTML: Use appropriate HTML5 semantic elements
- Accessibility: Include proper ARIA labels, alt text, and semantic structure
- Performance: Optimize assets, use preloading for fonts, minimize HTTP requests

### HTML Style

**Structure:**

- Use semantic HTML5 elements (`<main>`, `<section>`, `<article>`, `<header>`,
  `<footer>`, `<nav>`, `<hgroup>`)
- Include Schema.org microdata with itemscope/itemtype/itemprop attributes
- Add comprehensive meta tags (Open Graph, Twitter Cards, SEO)
- Use meaningful IDs and classes with kebab-case

**Attributes:**

- Always include alt text for images
- Use proper title attributes for links
- Include crossorigin="anonymous" for font preloading
- Set proper charset, viewport, and language attributes

**Formatting (Prettier):**

- No semicolons
- Single quotes for strings
- Always wrap prose (proseWrap: "always")
- Indentation: 2 spaces

### CSS Style

**Architecture:**

- CSS custom properties (CSS variables) for theming and design tokens
- Mobile-first approach with media queries for larger screens
- Use modern CSS features (color-mix, oklab color space)
- Import normalize CSS from npm package

**Naming:**

- Use kebab-case for class names
- Use descriptive, semantic class names
- Avoid overly specific selectors

**Custom Properties:**

- Define all colors, spacing, and sizing in `:root`
- Use `--color-*` prefix for colors
- Use `--spacing` as the base unit with multipliers
- Use `color-mix()` for color variations

**Units:**

- Use `rem` for font sizes
- Use `calc()` with CSS variables for spacing
- Use relative units for responsive design

**Example:**

```css
:root {
  --color-primary: #179299;
  --spacing: 0.25rem;
  --normal-length: calc(var(--spacing) * 4);
}
```

### TypeScript Configuration

**Compiler Options:**

- Strict mode enabled
- Target: ESNext
- Module: Preserve (bundler mode)
- No unused locals or parameters
- No unchecked indexed access
- No implicit override
- No fallthrough cases in switch
- No property access from index signature

**Best Practices:**

- Always enable strict type checking
- Use explicit return types for public functions
- Prefer type inference for local variables
- Use TypeScript for build scripts if needed

### Import Style

- Use ES6 imports
- Import CSS from node_modules using relative paths
- Group imports logically
- No unused imports

### Formatting

**Prettier Configuration:**

```json
{
  "semi": false,
  "singleQuote": true,
  "proseWrap": "always"
}
```

**Rules:**

- No semicolons in JS/TS
- Single quotes for strings
- Wrap prose at print width
- Let Prettier handle all formatting decisions

### File Organization

```
homepage/
├── src/
│   ├── index.html      # Main HTML file
│   ├── styles.css      # Main stylesheet
│   └── assets/         # Images, fonts, icons
├── dist/               # Build output (gitignored)
├── .github/
│   ├── workflows/      # CI/CD workflows
│   └── actions/        # Custom GitHub Actions
├── package.json
├── tsconfig.json
├── .prettierrc.json
└── README.md
```

### Naming Conventions

**Files:**

- Use kebab-case for file names
- Use descriptive names (e.g., `index.html`, `styles.css`)

**HTML:**

- Classes: kebab-case (e.g., `skill-box`, `color-primary`)
- IDs: kebab-case
- Data attributes: kebab-case

**CSS:**

- Classes: kebab-case
- Custom properties: kebab-case with prefixes (e.g., `--color-text`,
  `--spacing`)

**TypeScript (if used):**

- Variables and functions: camelCase
- Classes and types: PascalCase
- Constants: UPPER_SNAKE_CASE
- Private members: prefix with underscore if needed

### Error Handling

**Build Errors:**

- Always fix format errors before committing
- Ensure build passes locally before pushing
- Check browser console for runtime errors

**Development:**

- Use browser DevTools for debugging
- Validate HTML and CSS with appropriate tools
- Test accessibility with screen readers and lighthouse

## Accessibility Standards

- Use semantic HTML elements
- Include ARIA labels where needed
- Ensure proper heading hierarchy
- Provide alt text for all images
- Maintain sufficient color contrast
- Support keyboard navigation
- Test with screen readers

## Performance Guidelines

- Preload critical fonts
- Optimize images (use modern formats like WebP if possible)
- Minify assets in production build
- Use font-display: swap for web fonts
- Minimize CSS and HTML in production

## Git Workflow

- Main branch: `main`
- CI runs on all pull requests and pushes to main
- Dependabot is enabled for dependency updates
- Repository syncs to GitLab automatically

## Testing

Currently no automated tests. Manual testing checklist:

- [ ] Build succeeds with `bun run build`
- [ ] Formatting passes with `bun run check:format`

No other tests needed due to static nature of site.

## Making Changes

1. Read relevant files first
2. Make changes following the style guidelines
3. Run `bun run format` to fix formatting
4. Run `bun run build` to verify build

## Notes

- This is a personal portfolio site - changes should align with the owner's
  professional image
- The site emphasizes simplicity, clarity, and accessibility
- All content is static HTML/CSS - no JavaScript framework needed
- Focus on web fundamentals and progressive enhancement
