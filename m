From: Andrea Barisani <lcars@gentoo.org>
Date: Wed, 11 Apr 2007 12:12:51 +0000
Subject: Re: lists.gentoo.org powered by mlmmj - bugs and a feature request
Message-Id: <20070411121251.GF20801@fuse.inversepath.com>
List-Id: <mlmmj.mlmmj.org>
References: <20070411095339.GE4502@curie-int.orbis-terrarum.net>
In-Reply-To: <20070411095339.GE4502@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Apr 11, 2007 at 02:08:24PM +0200, Mads Martin Joergensen wrote:
> * Robin H. Johnson <robbat2@gentoo.org> [Apr 11. 2007 11:53]:
> > Hi,
> > 
> > I've taken over maintenance of lists.gentoo.org (all powered by mlmmj
> > :-), some 32k unique recipients!) from the previous maintainer, and
> > there's a few things we're working at. First of all, two bug reports,
> > then a feature request.
> > 
> > 1.
> > There is occasionally some mail loss that we haven't gotten to
> > the bottom of. I can confirm 100% that Sendmail (not my choice, trust
> > me) definitely piped the email to mlmmj-recieve. There should have been
> > some 1900 emails that went out from the input, but a lot less than that
> > did go out.
> > 
> > The splitting in the sendmail logs appear that it only got some 800
> > recipients from mlmmj-send, but I cannot confirm that.
> > 
> > All suggestions on tracing this are welcome, losing mail sucks.
> 
> If sendmail is not your choice, why not switch to Postfix which performs
> wonderfully. SuSE is running lists.opensuse.org without a hitch with
> mlmmj + postfix.
>

For the record Sendmail has been gentoo infrastructure team choice and
there's nothing wrong with it. There's no evidence that the issues we are
getting are related to the MTA which is working just fine.

</end_mta_flamewar> ;-P

Cheers

-- 
Andrea Barisani <lcars@gentoo.org>                            .*.
Gentoo Linux Infrastructure Developer                          V
                                                             (   )
PGP-Key 0x864C9B9E http://dev.gentoo.org/~lcars/pubkey.asc   (   )
    0A76 074A 02CD E989 CE7F AC3F DA47 578E 864C 9B9E        ^^_^^
      "Pluralitas non est ponenda sine necessitate"
