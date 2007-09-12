From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 12 Sep 2007 17:49:02 +0000
Subject: Re: Tune Return-Path
Message-Id: <ygfy7fblqpd.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070912164251.GM5312@otis.meleeweb.net>
In-Reply-To: <20070912164251.GM5312@otis.meleeweb.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Beber <beber@meleeweb.net> writes:

> Is there a way to avoid strindex in Return-Path ?

The index is important for proper bounce handling.

> It make greylisting a bit hungry. Like in gentoo mailing lists where
> every mail have a different Return-Path so greylisted each times.

Your greylisting implementation should handle this as it is quite
common and not at all hard to do.

-- 
Christian Laursen
