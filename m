From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 30 Mar 2005 22:17:03 +0000
Subject: Re: How to change directory?
Message-Id: <20050330221703.GF38757@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1112219335.8456.5.camel@zion>
In-Reply-To: <1112219335.8456.5.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* lupin3rd <lupin3rd@gmx.it> [Mar 30. 2005 23:49]:
> I want that my mlmmj maling lists stay in my /var/www directory and not
> in /var/spool/mail, can i set this?
> 
> ....because my GPL control panel take all files of a domain.tld
> in /var/www/domain.tld...
> Can i tell to mlmmj when i create a new maling list when store the
> directory?

In your /etc/aliases equivalent:

 mylist:         "|/usr/bin/mlmmj-receive -L /var/www/domain.tld"

And then having the listdir in /var/www/domain.tld. That can be specied
with mlmmj-make-ml.sh, or you simply do a mv later on.

It doesn't matter where it resides--why do you think you always have to
specify -L to the binaries?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
