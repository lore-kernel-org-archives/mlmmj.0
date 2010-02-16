From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Tue, 16 Feb 2010 22:03:53 +0000
Subject: Re: PATCH: Access priority
Message-Id: <20100216230353.39bbda4f@telenet.be>
List-Id: <mlmmj.mlmmj.org>
References: <4B5D7A55.4090302@yahoo.com.au>
In-Reply-To: <4B5D7A55.4090302@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 16 Feb 2010 17:52:51 +0100
Morten Shearman Kirkegaard <moki@fabletech.com> wrote:

> On Mon, 2010-01-25 at 22:02 +1100, Ben Schmidt wrote: 
> > The problem is that if you have a list that is 'moderated' or
> > 'modnonsubposts', the 'allow' access keyword is ineffective, but
> > behaves like 'moderate'. This patch fixes that so that access rules
> > have priority, and do what they say.
> > 
> > I think this is more intuitive.
> 
> Since we now have the "moderate" keyword, then maybe you are right. It
> made more sense when it was just "allow" or "deny." Maybe "moderate"
> should have been "hold" or something like that.
> 
> > Do others agree? Or could this change cause problems?
> 
> It would break backwards compatibility on a major feature, so I don't
> want to include it in the 1.2-series.
> 
> I also think change this needs a bit more thought. I've tried to graph
> the flow as it is in mlmmj now, and what I think you are proposing.
> Please correct me, if I misinterpreted your text - I did not look into
> the code patch.
> 
> The "moderation" boxes represent the "moderated" and "modnonsubposts"
> tunables.
> 
> 
> In mlmmj now:
> 
>    +--------+ deny   +--------+
>    | access |------->| reject |
>    +--------+        +--------+
> allow |  | moderate
>       |  +-----------+
>       v              v
> +------------+    +------+
> | moderation |--->| hold |
> +------------+    +------+
>       |              |
>       v              |
>    +------+          |
>    | send |<---------+
>    +------+
> 
> 
> Proposed flow:
> 
> allow +--------+ deny   +--------+
> +-----| access |------->| reject |
> |     +--------+        +--------+
> |         | moderate
> |         v
> |   +------------+    +------+
> |   | moderation |--->| hold |
> |   +------------+    +------+
> |         |              |
> |         v              |
> |      +------+          |
> +----->| send |<---------+
>        +------+
> 
> 
> Pros: With the proposed flow, it is possible to force a mail through
> via an access rule. The keywords might also make more sense to the
> administrators.
> 
> 
> Cons: With the proposed flow, it is impossible to force a mail to be
> held for moderation. If a list is modnonsubposts, but the
> administrators would like a chance to examine multipart mails, before
> they are sent to the list, it can be done like this today:
> 
> moderate ^Content-Type: multipart/
> allow
> 
> 
> One possible solution - at least to the bypass moderation problem -
> might be to add another keyword. We could add "send" to force the mail
> past normal moderation procedures.
> 
> A possible new flow:
> 
>  send +--------+ deny   +--------+
> +-----| access |------->| reject |
> |     +--------+        +--------+
> |  allow |  | moderate
> |        |  +-----------+
> |        v              v
> |  +------------+    +------+
> |  | moderation |--->| hold |
> |  +------------+    +------+
> |        |              |
> |        v              |
> |     +------+          |
> +---->| send |<---------+
>       +------+
> 
> send ^X-Password: 90e85684b1285a9f$
> moderate ^Content-Type: multipart/
> allow
> 
> I know it does not fix the meaning of "allow" vs. "moderate" on lists
> which are also subject to regular moderation, but I don't see a way to
> do that without breaking backwards compatibility.
> 
> Any thoughts on this?
> 
> Morten
> 

Hmmm ... my 2 cents:
- I always though of allow/reject as being on the IN-side: allow a mail
  to be send to the list and go on with the next steps (or reject), so
  personally I prefer the third flow. But functionally the second and
  third flow are almost alike, with the advantage of the third flow
  that you can force certain mails to be moderated
- if the third flow is choosen, don't call the new keyword plain
  "send", call it eg. "force-send" or "bypass-mod" or so. People tend
  to like descriptive keywords :-)
- whatever flow is choosen, I find it very nicely explained and want
  this ASCII art in a README :-)

Franky

