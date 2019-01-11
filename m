From: Zhang Huangbin <zhb@iredmail.org>
Date: Fri, 11 Jan 2019 03:05:07 +0000
Subject: Re: [mlmmj] Is this list active?
Message-Id: <CCE2CB6C-0D4F-4DD7-AC4B-C7AAF00B2984@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
References: <A6C742C7-7F4C-4636-89AC-F96488FD8C97@iredmail.org>
In-Reply-To: <A6C742C7-7F4C-4636-89AC-F96488FD8C97@iredmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


> On Jan 11, 2019, at 12:28 AM, Fabian Aldo Santiago <fsantiago@gardenlan.com> wrote:
> 
> Zhang, in iredmail, why not use MM instead? or rather, how/why did you choose mlmmj?

iRedMail supports storing mail accounts in OpenLDAP, MySQL/MariaDB or PostgreSQL, so we need the mailing list manager to be able to work with them all.
We wrote mlmmjadmin[1] (a simple RESTful API server) to update SQL/LDAP server while creating/updating/deleting mlmmj mailing lists, so it’s seamlessly integrated. I don’t think we can easily achieve this with Mailman.

It’s easy to write your own plugin for mlmmjadmin to integrate mlmmj with your mail server and update the SQL/LDAP db which stores mail accounts.

[1] mlmmjadmin: https://github.com/iredmail/mlmmjadmin/

----
Zhang Huangbin, founder of iRedMail project: https://www.iredmail.org/
Time zone: GMT+8 (China/Beijing).
Available on Telegram: https://t.me/iredmail


