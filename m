From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 03 Feb 2005 16:03:24 +0000
Subject: Re: Corrections to mlmmj-1.2.2
Message-Id: <20050203160324.GQ7982@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4202359E.7030404@uffe.org>
In-Reply-To: <4202359E.7030404@uffe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Uffe Jakobsen <uffe@uffe.org> [Feb 03. 2005 16:26]:
> WRONG:
> mlmmj-test:     "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test"
> 
> RIGHT:
> mlmmj-test:     |"/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test"

I know of Postfix, Sendmail and Exim working with the first syntax
specified here.

What do you base the assumption that it's wrong on?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
