---
title: "NEXT-019: Settings UI rework with tabs and runtime ENV coverage"
sidebar:
  hidden: true
---

Use this page as the canonical template for documenting any new fix.

## Feature / Problem Description

The settings screen had become a large single-page form that was hard to navigate and error-prone for operators.

Several runtime-relevant Docker environment values were missing from the UI, and handling of secret fields could lead to confusion during partial updates.

This fix improves usability, completeness, and operational safety when maintaining configuration.

## Implementation

- Reworked the settings UI into grouped tabs: `System`, `AI`, `OCR`, `Troubleshooting`.
- Added explicit ENV hints per field (mapping + restart expectations).
- Added missing runtime-relevant fields in UI and persistence flow (OCR, RAG, rate limits, proxy, content threshold, app port, external API private IP toggle).
- Improved secret handling so configured secret values are not prefilled and are preserved when inputs are left empty.
- Hardened client-side settings initialization and provider toggle behavior to avoid unnecessary required-field blocking.

## Testing

Manual verification performed:

- Open settings page and verify tab switching and grouped sections.
- Verify provider-specific settings blocks toggle correctly.
- Save with empty secret fields and confirm existing secrets stay unchanged.
- Save newly exposed runtime fields and confirm persistence via settings reload.

```bash
node --check routes/setup.js
node --check public/js/settings.js
```

## Impact

- Functionality / UX: Faster and clearer settings maintenance through tab grouping and field context.
- Security: Safer handling of secret values in rendered forms and partial updates.
- Operability: Broader runtime ENV coverage directly in UI reduces manual `.env` edits.

## Further Links

| Type | Link |
| --- | --- |
| Pull Request | Internal/local change set on main branch |
| Related issue | N/A |
| Upstream reference (optional) | N/A |

## Implementation Record

| Field | Value |
| --- | --- |
| ID | NEXT-019 |
| Author | admonstrator |
| Date | 2026-03-01 |
