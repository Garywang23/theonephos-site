# theonephos-site

Static website for Theone Chemical / TheonePhos, focused on overseas B2B buyers of phosphate chemicals.

## Contents

- `index.html`: home page.
- `about/`, `applications/`, `products/`, `resources/`, `contact/`: main site pages.
- `assets/`: shared CSS, JavaScript, images, logo and favicon.
- `wrangler.jsonc`: Cloudflare Workers static assets deployment config.
- `.assetsignore`: files and folders excluded from Cloudflare asset upload.
- `sitemap.xml` and `robots.txt`: search crawler entry points.
- `llms.txt` and `ai-content.json`: AI-search-readable site and product facts.
- `SEO_GEO_AND_ANALYTICS.md`: notes for SEO, AI-search content and analytics.

## Deployment

The Cloudflare project name is `theonephos-site`. Static assets are served from the project root, while `.assetsignore` excludes local backups, Git metadata, scripts and documentation from upload.

Before publishing, confirm that the production domain points to this directory and that the Cloudflare account has the correct project binding.

## Notes

The `web备份/` folder is a local backup archive. It should not be published as part of the live website.
