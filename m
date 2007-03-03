From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Sat, 03 Mar 2007 17:57:21 +0000
Subject: Re: [PATCH] mimestrip / mimereject
Message-Id: <eb58d3ede91c774b230559a3eba18404@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200702261335.13954.ssommer@suse.de>
In-Reply-To: <200702261335.13954.ssommer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Sascha,

Welcome to this project!

Sascha Sommer <ssommer@suse.de> wrote:
> this is a first attempt to implement stripping and rejecting of
> multipart/mime messages for mlmmj.

As Jakob Hirsch replied, I'm not very fond of adding mime handling
in mlmmj itself.

I believe a better way of doing this would be for a seperate program
to strip unwanted mime parts and/or add a header like
X-ThisMailContainsEvilMimeParts (and later check for it in the mlmmj
access rules) before handing the mail to mlmmj.

If you move this code into a seperate program, I will be happy to
include it in the contrib/ directory of the mlmmj tarballs.


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

