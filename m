From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 06 Oct 2010 13:47:42 +0000
Subject: Re: [mlmmj] undesired help emails
Message-Id: <4CAC7DFE.8050408@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4C960847.7000102@yahoo.com.au>
In-Reply-To: <4C960847.7000102@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Perhaps a variation where a postheaders tunable contained headers to be
> added to list posts would be sensible. Then customheaders would be added
> to all mails, but listtexts and postheaders would define headers at a
> finer grain. The override order and behaviour would still have to be
> carefully considered.
>
> Any of these changes would be a behaviour disruption, and potentially
> break compatibility, so would wait until a fairly major release to come
> through.

I have filed this as a feature request to remind myself of it, for
consideration later as part of a more major update.

> I guess adding a listid tunable isn't out of the question, though if we
> went down that road I'd want to carefully consider how to best structure
> it for possible future use by mlmmj itself.

Ditto.

> Another thought...What about a generic $tunableX$ substitution that
> pulls the text out of the given tunable X? That would enable you to do
> as much list-specific stuff as you wanted, and although it seems pretty
> powerful and a candidate for exploitation, I don't think it would open
> any security holes.

Since this is a compatible change that shouldn't cause disruption, I
have implemented it, as a $controlN$ substitution. I have given it a
quick test and it seems to work.

Robin, might you be able to pull the current sources from hg and give it
a test? I believe the code there is fairly stable, though there are a
number of changes awaiting review, so I'm not yet wholly confident and
wouldn't recommend it for production use just yet.

Perhaps this is wishful thinking, but is there any chance you'd be able
to code-review the change, too? Are you a C-programmer? It is here:

http://mlmmj.org/hg/mlmmj/rev/ecb991e41a4c

>>> I'll look at your specific examples in more detail later. Thanks for
>>> forwarding them.
>> The bulk header should cut a lot of them.

I think let's focus on getting the relevant changes into production so
that you can test this, and report back if the problem still exists and
needs work.

Cheers,

Ben.





