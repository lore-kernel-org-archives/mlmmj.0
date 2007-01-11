From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 11 Jan 2007 07:16:51 +0000
Subject: Re: Round robin relayhost
Message-Id: <20070111071651.GC82161@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jesper Lund <jesper@ballbreaker.dk> [Jan 10. 2007 21:54]:
> Maybe I could do some voodoo with a local postfix, to make it do the
> round robin for mlmmj, which just relay to "localhost".
> 
> What would you do, if your smtp server was "too slow" to relay the
> mails fast enough ?

Even with 25k mails, one single Postfix with VERP should do the job
quickly. But if you cannot use VERP ...

How long does it take to deliver them with the current setup?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
