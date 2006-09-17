From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 17 Sep 2006 21:05:16 +0000
Subject: Re: [Fwd: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]]
Message-Id: <20060917210516.GF20790@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <450C3D28.8080907@darkman.de>
In-Reply-To: <450C3D28.8080907@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Sven 'Darkman' Michels <sven@darkman.de> [Sep 17. 2006 22:55]:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> shame on me... maybe we could force reply-to? (i know, bad
> thing etc..)

Maybe the following in your .procmailrc (untested):

:0 fhw

* Retun-Path: mlmmj+bounces-

| formail -i "Reply-To: mlmmj@mmj.dk"

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
