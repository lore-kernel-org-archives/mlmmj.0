From: Uffe Jakobsen <uffe@uffe.org>
Date: Thu, 03 Feb 2005 16:58:58 +0000
Subject: Re: Corrections to mlmmj-1.2.2
Message-Id: <42025852.9010104@uffe.org>
List-Id: <mlmmj.mlmmj.org>
References: <4202359E.7030404@uffe.org>
In-Reply-To: <4202359E.7030404@uffe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Martin,

Mads Martin Joergensen wrote:
> 
> I know of Postfix, Sendmail and Exim working with the first syntax
> specified here.
> 
> What do you base the assumption that it's wrong on?
> 

Sorry my mistake just testeted the /etc/aliases "thing" and I found out that I had some kind of "invisible" control/escape char in the string -  sorry about that.

The current description in your README is working fine.

I was blinded by my invisible "bug"-char and due to the fact that man pages on both FC2 and Solaris that '|' should be the first char - only the HPUX man page specifies that "|/som/binary" is legal for aliases file.

Kind regards Uffe Jakobsen

