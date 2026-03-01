---
title: "NEXT-020: Paperless public URL discovery with manual override"
sidebar:
  hidden: true
---

Use this page as the canonical template for documenting any new fix.

## Feature / Problem Description

External document links were previously generated from `PAPERLESS_API_URL` by stripping `/api`.

In reverse proxy or containerized deployments, this often resolves to an internal hostname (for example a Docker service name) instead of the real public Paperless-ngx URL. End users could therefore receive links that are not reachable from their network.

## Implementation

- Added centralized public URL resolution in `paperlessService`.
- Added resolution details endpoint for settings UI diagnostics (`publicUrl` + `source`).
- Introduced explicit manual override via `PAPERLESS_PUBLIC_URL`.
- Updated link-producing paths to use centralized public URL resolution (dashboard redirect, OCR queue links, failed queue links, playground metadata URL usage).

Resolution order:

1. `PAPERLESS_PUBLIC_URL` (manual override)
2. Paperless API discovery (`/ui_settings/`, `/config/`)
3. Fallback derived from `PAPERLESS_API_URL` without `/api`

## Testing

```bash
node --check services/paperlessService.js
node --check services/documentsService.js
node --check routes/setup.js
node --check public/js/settings.js
```

Manual verification:

1. Open settings and verify detected public URL plus source.
2. Configure `PAPERLESS_PUBLIC_URL` with reverse proxy URL and save.
3. Confirm document links in dashboard/OCR/failed queues open the public Paperless instance.
4. Remove override and verify API discovery/fallback behavior.

## Impact

- Functionality / UX: External document links now resolve reliably in proxied/containerized environments.
- Operability: Operators can enforce a stable public URL without changing API endpoint wiring.
- Transparency: Settings UI shows detection source (`manual_override`, `paperless_api`, `api_url_fallback`).

## Further Links

| Type | Link |
| --- | --- |
| Pull Request | Internal/local change set on main branch |
| Related issue | N/A |
| Upstream reference (optional) | N/A |

## Implementation Record

| Field | Value |
| --- | --- |
| ID | NEXT-020 |
| Author | admonstrator |
| Date | 2026-03-01 |
