From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 04 Nov 2004 18:27:46 +0000
Subject: Re: bug report: don't force your /etc/aliases on me! :)
Message-Id: <20041104182746.GE23670@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20041104174318.GN10927@mail.lieber.org>
In-Reply-To: <20041104174318.GN10927@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Kurt Lieber <klieber@gentoo.org> [Nov 04. 2004 18:43]:
> I was just perusing mlmmj-make-ml.sh and realized it expects the alias file
> to be at /etc/aliases.  By default, Gentoo places this file in
> /etc/mail/aliases and I imagine other distros may place it elsewhere.  I've
> attached a patch that *should* handle this more gracefully -- I've tested
> it on our system, but additional testing (and feedback) is welcome.

Thnks, applied.

> If I can find some time in the next week or so, I'll take a crack at
> re-writing mlmmj-make-ml.sh to add in the /etc/skel features I asked
> about previously.

Would be nice indeed!

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
