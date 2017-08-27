From: Zhang Huangbin <zhb@iredmail.org>
Date: Sun, 27 Aug 2017 14:43:00 +0000
Subject: Re: [mlmmj] Patch: Add new option '-d' for mlmmj-make-ml to specify FQDN domain name
Message-Id: <DAE546DF-263D-4B3A-97D7-14568320E007@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
References: <1C002620-E45A-48BB-B7D5-2D510B33A230@iredmail.org>
In-Reply-To: <1C002620-E45A-48BB-B7D5-2D510B33A230@iredmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


> On Aug 27, 2017, at 9:33 PM, A. Schulze <sca@andreasschulze.de> wrote:
> 
>> I’d like to add one more patch to add 3 more options, your opinion?
>> 
>> -C: user to chown the spool directory to without confirm
>> -o: email address of the list owner (defaults to 'postmaster')
>> -l: language of this mailing list (defaults to 'en’)
> 
> if it replace something interactive ask by "make-ml" than it makes sense

If user doesn’t use these options on command line, mlmmj-make-ml will prompt user to input required data.
With above 3 new options, we can remove the line in mlmmj-make-ml man page:

"BUGS

It's not possible to create a list entirely on the command line.”

If it’s ok to go, i will generate patch tomorrow and submit to bug tracker.

----
Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
Time zone: GMT+8 (China/Beijing).
Available on Telegram: https://t.me/iredmail


