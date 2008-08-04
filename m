From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 04 Aug 2008 11:51:35 +0000
Subject: Re: Problem with submod tunable
Message-Id: <1217850695.7016.18.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <D6D17A6ADBC9114CBCCF2F3EE4859AC905D2DCFA@bbcxue218.national.core.bbc.co.uk>
In-Reply-To: <D6D17A6ADBC9114CBCCF2F3EE4859AC905D2DCFA@bbcxue218.national.core.bbc.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Piers,

Wow, does the BBC use mlmmj? :-)

On Mon, 2008-08-04 at 12:24 +0100, Piers Beckley wrote:
> I'm trying to set up a mailing list at the moment, and would like to
> moderate subscription. Unfortunately putting submod into the control
> directory doesn't work, either as a blank file or with a moderator's
> email address inside.

This is not part of the code that I've personally written, and I find
the code quite... strange...

The following is from mlmmj-1.2.15/src/mlmmj-sub.c

670  subbed = is_subbed_in(subddirname, address);
...
675  if(subbed) {
676      if(subconfirm) {
...
681          generate_subconfirm(listdir, listaddr, listdelim,
682                      address, mlmmjsend, typesub);
683      } else {
684          if(submod) {
...
689              moderate_sub(listdir, listaddr, listdelim,
690                  address, mlmmjsend, typesub);
691          }  

As far as I can see, the moderation is only done if the address is
already subscribed to the list, which makes no sense.

Has submod ever worked for anybody? Is someone here using it?

Morten

