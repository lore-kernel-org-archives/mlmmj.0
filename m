From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 20 Jan 2006 01:23:37 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone
Message-Id: <20060120022337.ggc9ad2gowck8kgg@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

(now also sent to the list)

Quoting Thomas Goirand <thomas@goirand.fr>:
> Delivered-To: xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
[snip]
> Would it be possible that mlmmj discrads the message because of the 
> Delivered-To:?

Yes.

Most likely because of this (mlmmj-process.c):

   519         if(whichto && whichto->emaillist && whichto->emaillist[0]){
   520                 recipextra = strstr(whichto->emaillist[0], listdelim);
   521                 if (recipextra)
   522                         recipextra += strlen(listdelim);
   523         } else
   524                 recipextra = NULL;
   525         myfree(listdelim);

It will find the delimiter "-" and try to use the rest 
("gplhost-com-test-subscribe") as a command, where it should only have 
used "subscribe". I cannot see how we can change this in mlmmj. You 
should change your mail server configuration.

Morten
