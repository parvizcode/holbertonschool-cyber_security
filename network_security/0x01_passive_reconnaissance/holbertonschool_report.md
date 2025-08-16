# 🛡️ Holberton School Domain Reconnaissance Report

**Domain:** `holbertonschool.com`  
**Report Date:** 2025-08-16  

---

## 1️⃣ Overview
The domain **holbertonschool.com** is hosted primarily on **Amazon Web Services** (AWS) across multiple regions, including **France** and **United States**.  

Key observations:  
- **SSL Certificates:** Issued by **Let's Encrypt**, supporting **TLSv1.2** and **TLSv1.3**  
- **Web Servers:** Nginx (v1.18.0 & v1.21.6)  
- **Frameworks:** Discourse, Ruby on Rails  
- **Subdomains:** Multiple, covering production, staging, and blog services  

---

## 2️⃣ Subdomains & IP Addresses

| Subdomain | IP Address | ASN | ASN Name | Country | Technologies |
|-----------|------------|-----|----------|---------|--------------|
| `yriry2.holbertonschool.com` | 52.47.143.83 | 16509 | AMAZON-02 | France | Nginx, Discourse, Ruby on Rails |
| `staging-apply-forum.holbertonschool.com` | 13.38.122.220 | 16509 | AMAZON-02 | France | Nginx, Discourse, Ruby on Rails |
| `lvl2-discourse-staging.holbertonschool.com` | 13.38.216.13 | 16509 | AMAZON-02 | France | Nginx, Discourse, Ruby on Rails |
| `v1.holbertonschool.com` | 54.86.136.129 | 14618 | AMAZON-AES | US | Nginx |
| `v2.holbertonschool.com` | 34.203.198.145 | 14618 | AMAZON-AES | US | Nginx |
| `blog.holbertonschool.com` | 192.0.78.230 | 2635 | AUTOMATTIC | US | WordPress |
| `www.holbertonschool.com` | 63.35.51.142 | 16509 | AMAZON-02 | US | Nginx, Discourse |
| ... | ... | ... | ... | ... | ... |

> 🔹 Full subdomain list is available from DNS data scans.

---

## 3️⃣ MX Records (Mail Servers)

| Priority | Mail Server | IP Address | ASN | ASN Name | Country |
|----------|------------|------------|-----|----------|---------|
| 1 | `aspmx.l.google.com` | 172.253.115.27 | 15169 | GOOGLE | US |
| 5 | `alt1.aspmx.l.google.com` | 172.253.116.27 | 15169 | GOOGLE | US |
| 5 | `alt2.aspmx.l.google.com` | 173.194.76.26 | 15169 | GOOGLE | US |
| 10 | `alt3.aspmx.l.google.com` | 142.250.102.27 | 15169 | GOOGLE | US |
| 10 | `alt4.aspmx.l.google.com` | 192.178.156.27 | 15169 | GOOGLE | US |

---

## 4️⃣ NS Records (Nameservers)

| Nameserver | IP Address | ASN | ASN Name | Country |
|------------|------------|-----|----------|---------|
| `ns-1991.awsdns-56.co.uk` | 205.251.199.199 | 16509 | AMAZON-02 | US |
| `ns-957.awsdns-55.net` | 205.251.195.189 | 16509 | AMAZON-02 | US |
| `ns-343.awsdns-42.com` | 205.251.193.87 | 16509 | AMAZON-02 | US |
| `ns-1244.awsdns-27.org` | 205.251.196.220 | 16509 | AMAZON-02 | US |

---

## 5️⃣ TXT Records (Verification & SPF)

- `"v=spf1 include:mailgun.org include:_spf.google.com -all"`  
- `"loaderio=67a0fbf5fb42755902d5415639d826a6"`  
- `"MS=BB8A869E4E8A47D208F560DE7D83F199D1BB8F4F"`  
- `"stripe-verification=e0f957fde60d97f6fd922d8599916a296577b25f28fa1e4caa0730a6b2832eed"`  
- `"1C8BC5F558"`  
- `"brevo-code:32c00935278b2f59e44fec877e96af37"`  
- `"intacct-esk=A3E9DCEA8FB6B747E0539A220D0A9719"`  
- `"zapier-domain-verification-challenge=20fd6ef9-5b6e-48c8-bb95-a24a7fb61ec4"`  
- `"google-site-verification=lnffgexG_GGal6Fa53z0Ve4dJY4z4GXAmy1I2_ldotk"`

---

## 6️⃣ Technologies & Frameworks

- **Web Servers:** Nginx (versions 1.18.0, 1.21.6)  
- **Frameworks:** Discourse, Ruby on Rails, WordPress  
- **SSL/TLS:** Let's Encrypt (TLSv1.2, TLSv1.3)  
- **Hosting Providers:** Amazon AWS (France & US), Automattic (for blog)  
- **Geolocation:** France (eu-west-3), United States (multiple regions)  

---

## 7️⃣ Notes & Observations

- Many subdomains implement **301 redirects**, indicating structured staging & production environment.  
- SPF and verification TXT records indicate use of **Google Workspace**, **Mailgun**, **Stripe**, **Brevo**, and **Zapier** integrations.  
- Security headers observed: `X-Frame-Options: SAMEORIGIN`, `X-XSS-Protection: 0`, `X-Content-Type-Options: nosniff`, `X-Download-Options: noopen`.  

> ⚠️ This report was compiled using **Shodan.io** and **DNSDumpster.com** scans. All information reflects the state at the time of scanning.
