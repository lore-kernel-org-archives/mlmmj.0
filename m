From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sun, 14 Dec 2008 17:25:24 +0000
Subject: Re: [PATCH] add MIME-aware footers
Message-Id: <20081214182524.30f964a1@franky>
List-Id: <mlmmj.mlmmj.org>
References: <200812140123.13634.lists@egidy.de>
In-Reply-To: <200812140123.13634.lists@egidy.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 14 Dec 2008 01:23:12 +0100
"Gerd v. Egidy" <lists@egidy.de> wrote:

> Hi,
> 
> I've been bitten by the footer-function not being MIME-aware. I've
> read up the topic on the list-archive and found out that I'm not the
> only one and that a solution has to be separatable from the core
> mlmmj.
> 
> I found the altermime program (http://www.pldaniels.com/altermime/)
> which seems to be a perfect match for the MIME-munging required. So I
> wrote a small shell script to integrate altermime and mlmmj.
> 
> How to use it:
> 
> - install altermime to /usr/bin/altermime
> - copy the attached mlmmj-amime-receive into /usr/bin
> - put the footer-text for the different MIME-types into 
> control/amime-footer-text
> control/amime-footer-html
> control/amime-footer-base64
> - replace mlmmj-recieve with mlmmj-amime-receive in /etc/aliases, e.g.
> myml:   "|/usr/bin/mlmmj-amime-receive -L /var/spool/mlmmj/myml/"
> watch out for recieve vs. receive...
> - newaliases
> 
> Morten, I hope this solution is acceptable for inclusion into mlmmj.
> I attached mlmmj-amime.patch too, this is intended for you and adds
> mlmmj-amime- receive into contrib.
> 
> Kind regards,
> 
> Gerd
> 

Nice! This seems totally non-intrusive and changes nothing for existing
users, so I vote for this inclusion into contrib (together with a
readme). A small remark: since the paths for /usr/bin/altermime and
mlmmj-amime-receive can be different than the ones mentioned above, you
should probably say :
"- install altermime to /usr/bin/altermime or change the path in the
file contrib/mlmmj-amime-receive"
"- check the path of mlmmj-recieve at the top of the file
contrib/mlmmj-amime-receive"

(since the shell script already has these as parameters, you might as
well advertise it :-) )

Franky
