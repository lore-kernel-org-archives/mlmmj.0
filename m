From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sat, 21 Jan 2006 11:55:04 +0000
Subject: Re: Treatment of Delivered-To headers (Re: mlmmj-recieve silently
Message-Id: <20060121125504.cy1dacq3kggcso8w@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Mads Martin Joergensen <mmj@mmj.dk>:
>> Unless you tell me I'm way off track, I'll try to get a patch together. It
>> should be safe to assume that $RECIPIENT won't be set under other MTAs. If
>> you think it's not, then we could use a command line flag to only activate
>> the environment check under qmail.
>
> I would love a patch doing this, with a a commandline option to
> configure it. No need to read environment variables anywhere else than
> qmail AFAIK.

Do we need a commandline switch? If qmail puts the values (which other 
MTAs put in headers) in environment variables, the code could be 
changed to something like the following pseudo code:

envelope_to = getenv("RECIPIENT");

if (!envelope_to)
    envelope_to = getheader("Delivered-To");

if (!envelope_to)
    envelope_to = getheader("To");

if (!envelope_to)
    abort();

... and likewise for sender.

Having an extra commandline switch just makes it a tiny bit more 
difficult to set up.

Morten
