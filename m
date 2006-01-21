From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 19:03:12 +0000
Subject: Re: Treatment of Return-Path: headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601211356370.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Michael Fleming wrote:

> On Fri, 20 Jan 2006 22:23:15 -0500 (EST). Charlie Brady waffled thusly:
>
>> On Sat, 21 Jan 2006, Morten K. Poulsen wrote:
>>
>>> When the mail is "malformed" - e.g. no Return-Path: - we should return
>>> EXIT_FAILURE.
>>
>> Do you have a reference to an RFC which says that Return-Path: is a
>> required header? I don't believe that it is required. It's used by
>> sendmail (and other MTAs which follow the pattern of sendmail) to record
>> the envelope sender, but can't be expected to be provided by all MTAs
>> unless it is mandated by an RFC.
>
> RFC 2822 Section 3.6.7. (Trace fields)
>
> ...and
>
> RFC 822 Section 4.1 (Syntax)

Yes, those RFCs do mention an *optional* Return-Path header. Optional is 
mutually exclusive with "mandatory'.

> I've never seen a modern MTA that doesn't implement and use it, it's not
> specific to Sendmail.

Well qmail does implement it but doesn't use it, so there's one counter 
example. But since the header isn't mandated, it's not safe to assume that
will exist for every MTA. One of the stated goals of mlmmj is mail server 
independence, so it should be very careful about strict RFC compliance.

Mail messages lacking a Return-Path header are still in strict compliance 
with RFC2822.

---
Charlie
