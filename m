From: Geert Stappers <stappers@stappers.nl>
Date: Thu, 11 May 2017 17:15:36 +0000
Subject: Re: [mlmmj] [PATCH 2/2] src/mlmmj-make-ml.in: use the YES from -a
Message-Id: <20170511171536.GO19322@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <1494519763-1307-2-git-send-email-stappers@stappers.nl>
In-Reply-To: <1494519763-1307-2-git-send-email-stappers@stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, May 11, 2017 at 05:12:32PM +0000, Eric Wong wrote:
> Geert Stappers <stappers@stappers.nl> wrote:
> > -if [ -n "$A_CREATE" ]; then
> > +if [ "$A_CREATE" = "YES" ]; then
> >  	echo "I want to add the following to your $ALIASFILE file:"
> >  	echo "$ALIAS"
> 
> "=" is not portable, I suggest "=" for scripts run by /bin/sh
> (which may not be bash, Debian-based systems tend to use dash,
> there)

yes


(our mails did cross each other)


Groeten
Geert Stappers
-- 
Leven en laten leven

