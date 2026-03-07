---
title: "Security Policy"
---


## Reporting a vulnerability

Please **do not** open a public issue for security vulnerabilities.

Instead, use [GitHub Security Advisories](https://github.com/admonstrator/paperless-ai-next/security/advisories/new) to report a vulnerability privately. We'll respond as quickly as possible.

---

## Security notes

- Paperless-AI next requires access to your Paperless-ngx API. Use a dedicated API token with the minimum required permissions.
- If you use an external AI provider (OpenAI, Azure, Mistral), your document text is sent to that provider. Review their privacy and data retention policies.
- Using Ollama keeps all data on your own network.
- The web UI should not be exposed to the public internet without additional authentication (reverse proxy with auth, VPN, etc.).
