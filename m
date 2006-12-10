From: Raymond den Ouden <raymond@den-ouden.info>
Date: Sun, 10 Dec 2006 16:31:11 +0000
Subject: Re: mlmmj-1.2.13-RC1 released
Message-Id: <457C364F.5030009@den-ouden.info>
List-Id: <mlmmj.mlmmj.org>
References: <XFMail.20061210171838.morten@afdelingp.dk>
In-Reply-To: <XFMail.20061210171838.morten@afdelingp.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ah, I have an addition for the next release.

Here are the dutch translations, including listfaq, sub-deny-digest and 
sub-deny-nomail
http://www.psychotek.com/downloads/mlmmj/nl-translations-1.2.12.tar.gz


Morten K. Poulsen wrote:

>Hi list!
>
>
>mlmmj-1.2.13-RC1 is available for download at:
>
>f7e001fbaf9e00e533fe38b41b90e5a3
>http://mlmmj.mmj.dk/files/mlmmj-1.2.13-RC1.tar.bz2
>
>a714d227dad496d1471161a883a568bb
>http://mlmmj.mmj.dk/files/mlmmj-1.2.13-RC1.tar.gz
>
>
>The release contains a few bug fixes and some new features:
>
>1.2.13-RC1
> o Added 'nonomailsub' tunable which will disable nomail subscriptions
>   to a list (Henne Vogelsang)
> o Added 'nodigestsub' tunable which will disable subscription to the
>   digest version of a list (Henne Vogelsang)
> o Added list FAQ feature (Henne Vogelsang)
> o Added support for default list text directory (Henne Vogelsang)
> o Fixed a Bourne Shell issue in mlmmj-make-ml.sh (Magnus Naeslund)
> o Fixed hostnamestr() for hosts that can't find themselves using
>   gethostbyname() (Benoit Dolez)
> o Add 'modnonsubposts' tunable that when set will moderate all posts
>   from non subscribers
> o Fixed requeue for lists with noarchive enabled
>
>
>Please test it!
>
>
>Have fun,
> Morten
>
>  
>

