# SEO, GEO, and Traffic Analytics Notes

## SEO / GEO Direction

The site is English-first for search discovery. The visible Chinese company name is kept only as part of the brand mark and is not used as an SEO keyword target.

Primary search themes:

- phosphate chemicals supplier
- China phosphate chemicals export company
- technical grade phosphate chemicals
- food grade phosphate chemicals
- STPP supplier
- SHMP supplier
- TSP supplier
- phosphoric acid 85% food grade supplier
- DSP food grade supplier
- SAPP food grade supplier

Primary conversion action:

- Send inquiry through the Contact page or direct email, phone, and WhatsApp links.

## GEO Support

The site includes machine-readable context for AI search and answer engines:

- `llms.txt`
- canonical URLs
- Organization schema
- Product schema for product pages
- Article schema for resource pages
- Breadcrumb schema for crawl path clarity
- consistent company, contact, and location information

## Traffic Analytics

Recommended analytics provider: Cloudflare Web Analytics.

Cloudflare Pages can enable Web Analytics directly from the Pages project. After the site is deployed:

1. Open Cloudflare Dashboard.
2. Go to Workers & Pages.
3. Select the Pages project.
4. Open Metrics.
5. Enable Web Analytics.
6. Redeploy the site if Cloudflare asks for a fresh deployment.

Cloudflare will then show visitor and page-view data in the Web Analytics dashboard.

## Manual Beacon Option

If automatic injection is not available, create a Web Analytics site in Cloudflare and paste the provided beacon snippet before `</body>` on each HTML page.

Example format:

```html
<!-- Cloudflare Web Analytics -->
<script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"token":"YOUR_CLOUDFLARE_WEB_ANALYTICS_TOKEN"}'></script>
<!-- End Cloudflare Web Analytics -->
```

Do not commit a fake token. Add the real token only after Cloudflare provides it.

## IndexNow Setup

IndexNow is now configured in this project.

- Key file (public root path):
  `https://theonephos.com/7239f4ce5a4c4c7db4acbfd79d7ac268.txt`
- Local key file:
  `7239f4ce5a4c4c7db4acbfd79d7ac268.txt`
- Submit script:
  `scripts/indexnow-submit.ps1`

Run from project root:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\indexnow-submit.ps1
```

Dry run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\indexnow-submit.ps1 -DryRun
```
