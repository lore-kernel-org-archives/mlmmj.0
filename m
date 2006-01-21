From: Michael Fleming <mfleming@enlartenment.com>
Date: Sat, 21 Jan 2006 07:20:32 +0000
Subject: Re: Treatment of Return-Path: headers (Re: mlmmj-recieve silently
Message-Id: <20060121172032.143bb8d4.mfleming@enlartenment.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, 20 Jan 2006 22:23:15 -0500 (EST). Charlie Brady waffled thusly:

> 
> On Sat, 21 Jan 2006, Morten K. Poulsen wrote:
> 
> > When the mail is "malformed" - e.g. no Return-Path: - we should return 
> > EXIT_FAILURE.
> 
> Do you have a reference to an RFC which says that Return-Path: is a 
> required header? I don't believe that it is required. It's used by 
> sendmail (and other MTAs which follow the pattern of sendmail) to record 
> the envelope sender, but can't be expected to be provided by all MTAs 
> unless it is mandated by an RFC.

RFC 2822 Section 3.6.7. (Trace fields)

...and

RFC 822 Section 4.1 (Syntax)

I've never seen a modern MTA that doesn't implement and use it, it's not
specific to Sendmail.

Michael.

-- 
Michael Fleming <mfleming@enlartenment.com>
"Bother" said the Borg, "We've assimilated Pooh!"
