From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 16 Aug 2016 21:24:39 +0000
Subject: [mlmmj] Exposing the message IDX number better & large archives
Message-Id: <robbat2-20160816T211352-899998092Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

mlmmj archives mails by an index number, which is a file sequentially
created in the archive directory.

The only places the IDX number gets exposed presently are:
- return-path / MAIL FROM of mail
- bounce probe listing

In some cases, Return-Path can be mangled by later mail servers (and
remailers), so the IDX gets lost.

Can we add a substitution or dynamic header code to inject the number
into a real header for regular list mail?

-- 
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Trustee & Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

