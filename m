From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sat, 29 Dec 2007 19:20:15 +0000
Subject: Re: delimiter problem
Message-Id: <47769DEF.1040506@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20071221161243.8DC4F10AC1A4@canopus.gading.de>
In-Reply-To: <20071221161243.8DC4F10AC1A4@canopus.gading.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Oliver,

Sorry about the delay - I've been snow boarding.

Oliver Gading wrote:
> I wrote a small shell script which executes "env"
...
> USER=list-mylist
> LOCAL=list-mylist_subscribe
> EXTENSION=subscribe

Ok. Then mlmmj will (or at least should) use the EXTENSION variable.

> When changing postfix's recipient_delimiter to "-" and also the mlmmj lists
> delimiter to "-" then following line appears in the mail.log file:
> 
>  ---------------------------------------------------------
>  <DATE> <HOST> /usr/local/bin/mlmmj-process[13838]: listcontrol.c:740:
>  Unknown command "mylist". Ignoring mail: Success

This means that mlmmj is using a part of the list name as the command. 
It could be because there was no EXTENSION variable and mlmmj used the 
fall-back (parsing the Delivered-To header).

Could you test this (delimiter in the name and no extension) with your 
env-script? If Postfix does not export the EXTENSION variable if there 
is no extension, then you need to patch out the fall-back code.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
