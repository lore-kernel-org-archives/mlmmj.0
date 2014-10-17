From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 17 Oct 2014 04:39:27 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54409D7F.60208@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 17/10/14 6:02 AM, webmaster@vlsc.org wrote:
> Oct 16 18:30:00 cloud /etc/smrsh/mlmmj-process[5506]: mlmmj-process.c:811: Discarding /var/spool/mlmmj/listname/incoming/6386743745f1a098 due to missing envelope from address: Success
>
> I understand the "due to missing envelope from address" error is a reference to an
> (empty) envelope from address, but I'm not sure why this is being triggered.

The envelope from isn't empty, it's just not passing from Sendmail to
Mlmmj properly.

Strangely, Mlmmj doesn't look for a Unix/mbox "From " line to extract an
envelope from address. I actually think this is an Mlmmj shortcoming,
and I will attempt to address it in a future release.

However, Mlmmj does look for a Return-Path header, and that is
conspicuously missing from the headers you posted. Did you include

define(`LOCAL_SHELL_FLAGS', `eu9P')dnl

in your Sendmail config as per <http://mlmmj.org/docs/readme-sendmail/>?

It's the capital P that is necessary to include the Return-Path header.

Best regards,

Ben.




