From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sat, 23 Oct 2010 09:41:47 +0000
Subject: Re: [mlmmj] reply-to and reply-to-sender
Message-Id: <20101023114147.4385d67f@franky>
List-Id: <mlmmj.mlmmj.org>
References: <1287748105.2377.24.camel@mbs-laptop>
In-Reply-To: <1287748105.2377.24.camel@mbs-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, 23 Oct 2010 01:44:42 +1100
Ben Schmidt <mail_ben_schmidt@yahoo.com.au> wrote:

> On 23/10/10 12:50 AM, Thomas Goirand wrote:
> > On 10/22/2010 09:23 PM, Ben Schmidt wrote:
> >> To get a reply-to-list behaviour, you should include a List-Post
> >> header (and other List-* headers are also recommended).
> >>
> >> RFC2369, RFC2919.
> >>
> >> Ben.
> >
> > Can you elaborate? If my list is list@example.org, what should I
> > set as header in MLMMJ, so that people don't reply to me by default?
> >
> > Thomas
> 
> When I say 'get a reply-to-list behaviour' I mean 'have that kind of
> reply made available as an option', not that it will be the default.
> 
> And I believe if you actually follow the standards, that's all you can
> do.
> 
<snip>
> (Disclaimer: I'm far from an expert!)
> 
> Smiles,
> 
> Ben.

What you can try: set the "Sender" mailheader to you personally, and the
reply-to to the list. In your case the Sender header was also set to
the list. That should work ...

Franky

