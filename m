From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 17 Oct 2014 20:41:17 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54417EED.2090004@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Have been away for a while. The following are some facts about my
> system setup :
>
> openSUSE 12.3 : Sendmail 8.14.5-85.1.2
>
> The config files are located /usr/share/sendmail, so cd to there
>
> README has the following :
> LOCAL_SHELL_FLAGS       [eu9] The flags used by the shell mailer.  The
>                          flags lsDFMoq are always included.

The Mlmmj reference for this is <http://mlmmj.org/docs/readme-sendmail/>
which suggests setting LOCAL_SHELL_FLAGS to 'eu9P' (i.e. the default,
plus 'P').

A Sendmail reference for what the flags mean is
<http://www.sendmail.org/~ca/email/doc8.8/op-sh-5.html#sh-5.4>

> cd feature/; grep LOCAL_SHELL_FLAGS * shows :
> msp.m4:define(`LOCAL_SHELL_FLAGS', `lmDFMuXk5')dnl
>
> Note the absence of a 'P' in the README reference - and the disconcerting use of
> flags in file msp.m4 that are not noted in the README.

Googling suggests the 'msp' feature is the 'mail submission program'. I
have no idea why it's defining LOCAL_SHELL_FLAGS, but I also know next
to nothing about m4 or Sendmail (and have no real inclination to learn
more), so for all I know, it could be a different scope.

> So where is the all important Return-Path documented and set? I have 'grep -i
> return-path *' till I am blue in the face and have not found anything that helps
> me. <sigh>

It took me quite a while to find the references above, too....
Sendmail's documentation is pretty esoteric. I feel like unless you
already know what you're looking for, you don't know where to even look
for it.... I vastly prefer Postfix and Exim, both of which I have set up
in very little time, including with Mlmmj. In my experience, Qmail and
Sendmail are both significantly harder to get working, and if there's
any real benefit once they're up and running, it's lost on me!

Smiles,

Ben.




