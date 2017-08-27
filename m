From: Zhang Huangbin <zhb@iredmail.org>
Date: Sun, 27 Aug 2017 12:34:29 +0000
Subject: Re: [mlmmj] Patch: Add new option '-d' for mlmmj-make-ml to specify FQDN domain name
Message-Id: <75E34789-289D-41A8-8A6E-208596B9C606@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
References: <1C002620-E45A-48BB-B7D5-2D510B33A230@iredmail.org>
In-Reply-To: <1C002620-E45A-48BB-B7D5-2D510B33A230@iredmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


> On Aug 27, 2017, at 7:08 PM, A. Schulze <sca@andreasschulze.de> wrote:
> 
> I reviewed to understand the problem.
> yes, it make sense to add such options.
> 
> Could you please include updated manpages file in the patches, too?

I’d like to add one more patch to add 3 more options, your opinion?

-C: user to chown the spool directory to without confirm
-o: email address of the list owner (defaults to 'postmaster')
-l: language of this mailing list (defaults to 'en’)

----
Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
Time zone: GMT+8 (China/Beijing).
Available on Telegram: https://t.me/iredmail


