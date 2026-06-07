---
layout: post
title: "IAM for the Agentic Era — Series 2"
date: 2026-06-01
category: iam
categories: [iam]
tags: [iam, agentic-ai, ai-agents, identity, access-management, nhi, oauth, delegation, series]
excerpt: "AI agents are reshaping every assumption IAM was built on. This series picks up where First Principles left off — covering what agentic identity actually is, why existing tools were not built for it, and how to architect identity governance for systems that think and act on their own."
mermaid: true
pinned: true
series: "iam-agentic-era"
series_title: "IAM for the Agentic Era"
series_part: 0
---

The [IAM from First Principles series]({% post_url /2026/05/2026-05-01-blog-series-1 %}){:target="_blank"} covered the complete foundational landscape — from authentication protocols and governance workflows to non-human identities and deployment models.

It ended with a deliberate open question.

[Non-Human Identities]({% post_url /2026/05/2026-05-27-non-human-identities-hidden-attack-surface %}){:target="_blank"} are already a governance problem at 90:1 scale. But AI agents are something qualitatively different — they are not just another credential to vault or another service account to review. They are autonomous actors that request permissions at runtime, delegate authority to other agents, and operate across trust boundaries that no existing IAM standard was designed to span.

This series addresses that directly.

---

## Part 1: Foundations — What Is Agentic Identity and Why Does It Matter?

1. ✅ [Agentic Identity — The Next Frontier]({% post_url /2026/06/2026-06-02-agentic-identity-new-frontier %}){:target="_blank"}
2. ✅ [Three Generations of IAM Tools — and Why None of Them Were Built for the Agentic Era]({% post_url /2026/06/2026-06-02-iam-vendor-generations-agentic-identity %}){:target="_blank"}
3. ✅ [The Legacy Backend Problem — LDAP, SQL, and Why Your IAM Foundation Is Holding Back Agentic Identity]({% post_url /2026/06/2026-06-03-iam-legacy-backend-ldap-sql-agentic-problem %}){:target="_blank"}

## Part 2: Consumer Agents — Governance Beyond the Enterprise

4. ✅ [Consumer Agents and the Consent Problem — When AI Acts on Behalf of Your Customers]({% post_url /2026/06/2026-06-04-consumer-agents-consent-problem %}){:target="_blank"}

## Part 3: The Agentic Era — IAM for AI Agents

5. ✅ [Agentic Identity Protocols — OAuth 2.1, CIBA, OIDC-A, and the Delegation Chain Problem]({% post_url /2026/06/2026-06-05-agentic-identity-protocols %}){:target="_blank"}
6. ✅ [Building Secure AI Agent Systems — A Practical Architecture Guide]({% post_url /2026/06/2026-06-06-building-secure-ai-agent-systems %}){:target="_blank"}
7. ✅ [NHI Governance at Scale — Discovery, Ownership, and Policy for the 90:1 World]({% post_url /2026/06/2026-06-07-nhi-governance-at-scale %}){:target="_blank"}

---

## Who This Series is For

This series assumes you have read or are familiar with the [First Principles series]({% post_url /2026/05/2026-05-01-blog-series-1 %}){:target="_blank"}. Specifically, you should be comfortable with:

- What [OAuth 2.0 and OpenID Connect]({% post_url /2026/05/2026-05-14-oauth2-openid-connect-protocols-explained %}){:target="_blank"} do and how token issuance works
- What [Non-Human Identities]({% post_url /2026/05/2026-05-27-non-human-identities-hidden-attack-surface %}){:target="_blank"} are and why they differ from human identities
- What [IGA and PAM]({% post_url /2026/05/2026-05-17-iga-deep-dive-provisioning-role-engineering-sod %}){:target="_blank"} tools do at an architectural level

If you are new to IAM entirely, start with the [First Principles series]({% post_url /2026/05/2026-05-01-blog-series-1 %}){:target="_blank"} first.

---

*Have a question or a topic you want covered? Leave a note below. The RSS feed will alert you when new posts are published.*
