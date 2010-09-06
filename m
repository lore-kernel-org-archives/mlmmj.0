From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Mon, 06 Sep 2010 14:33:48 +0000
Subject: Re: [mlmmj] Processing Bounces
Message-Id: <1283783628.25309.35.camel@atlantic>
List-Id: <mlmmj.mlmmj.org>
References: <5CD3CC2F-4F5B-409C-8B02-0BD3F0B2CA98@gmail.com>
In-Reply-To: <5CD3CC2F-4F5B-409C-8B02-0BD3F0B2CA98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Devin,

On Fri, 2010-09-03 at 11:51 -0400, Devin Ceartas wrote:
> I presume mlmmj has some code to process bounced emails and sort  
> "soft" bounces from "hard" bounces. I'd like to look at how this is  
> done and see if I can understand it. 

It is not possible to tell so-called "hard" and "soft" bounces apart,
without doing MTA-specific parsing of the bounce message body, so mlmmj
does not try. There is no reason to try.

> Can someone familiar with the code point me to the part of the code
> where this is done?

The bounce handling code can be found in src/mlmmj-bounce.c.


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>


