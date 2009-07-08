From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 08 Jul 2009 05:06:13 +0000
Subject: Re: moderation only by sender
Message-Id: <20090708050613.GA730@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Jul 08. 2009 06:53]:
> Morten K. Poulsen wrote:
> > You probably don't send automated newsletters from your phone.
> 
> I do, when doing server maintenance with putty, I might need to warn all
> customers of this server, which I do using an MLMMJ moderated list.
> 
> To me, if you guys want to add such flag, this would be to keep
> compatibility with the old behavior where MLMMJ is sending the
> moderation to all moderators. The default should be to bounce ONLY to
> the moderator sending to the list. IMHO mlmmj-make-ml should create new
> list with the tunable in by default.

I really wouldn't like changing default behaviour, ever. It's not like
they make "-s" the default for "ln" even though that's what most people
use all the time.

> Another thing, when I add myself as moderator, then use the "subscriber
> only post" flag, I can't send to the list unless I also subscribe. This
> doesn't make sense. All moderator should be considered as able to write
> to the list, even if they are not subscribed and the flag "subscriber
> only post" is set. Can this behavior be changed as well???

Should be, I agree. Owners as well.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.

