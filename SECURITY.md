# Security

Security is of the highest importance to IN-CORE. 

If you believe you have found a security vulnerability in any of our projects, please report it to us as described below.

## Reporting a Vulnerability - Private Disclosure Process

**Please do not report security vulnerabilities through public GitHub issues.**

All security vulnerabilities or suspected security vulnerabilities should be reported to IN-CORE privately to minimize attacks against current users of IN-CORE before they are fixed. Vulnerabilities will be investigated and patched on the next patch (or minor) release as soon as possible.

We prefer that you use the GitHub mechanism for privately reporting a vulnerability. Under the main repository’s Security tab, in the left sidebar, under “Reporting”, click Advisories, then click “Report a vulnerability” to open the advisory form. 

If you can't do that, please send an email to IN-CORE dev mailing list: [incore-dev@lists.illinois.edu][1] that you have such information, and we'll tell you the next steps. 

If you report via email, please use an email system (like Gmail) that supports hop-to-hop (transport) encryption. The preferred approach is an email system that uses Mail Transfer Agent Strict Transport Security (MTA-STS), as this always uses TLS to authenticate destinations and encrypts contents. If you can't do that, use STARTTLS. Your email client should use encryption to communicate with your email system (i.e., if you use a web-based email client then use HTTPS, and if you use email client software then configure it to use encryption). Hop-to-hop encryption isn't as strong as end-to-end encryption, but we've decided that it's strong enough for this purpose and it's much easier to get everyone to use it.

We will gladly give credit to anyone who reports a vulnerability so that we can fix it. If you want to remain anonymous or pseudonymous instead, please let us know that and we will gladly respect your wishes.

We gladly welcome patches to fix such vulnerabilities! See CONTRIBUTING.md for information about contributions.

[1]: mailto:incore-dev@lists.illinois.edu
