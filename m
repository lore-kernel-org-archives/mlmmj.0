From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 27 Sep 2010 01:59:17 +0000
Subject: Re: [mlmmj] undesired help emails
Message-Id: <4C9FFA75.1060703@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4C960847.7000102@yahoo.com.au>
In-Reply-To: <4C960847.7000102@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 27/09/10 11:36 AM, Robin H. Johnson wrote:
> On Mon, Sep 27, 2010 at 11:19:30AM +1000, Ben Schmidt wrote:
>> http://mlmmj.org/hg/mlmmj/file/32d3f7e3b523/README.listtexts
>>
>> Note that $whatever$ substitutions are supported in the headers. I think
>> this means you should be able to code pretty much whatever you want in a
>> list-independent way and continue to use shared listtexts.
> I'm wondering if we added existing customheaders to administrative mails maybe,
> since we can have the other per-listtext headers.
>
> However, it would require an override order of:
> mlmmj default
> customheader
> listtext
>
> Which might introduce other bugs.

Yeah, I think it probably would cause hassles, and it's particularly
awkward as there are occasionally supposed to be multiple headers of a
single type.

Don't throw the idea away, though.

Perhaps a variation where a postheaders tunable contained headers to be
added to list posts would be sensible. Then customheaders would be added
to all mails, but listtexts and postheaders would define headers at a
finer grain. The override order and behaviour would still have to be
carefully considered.

Any of these changes would be a behaviour disruption, and potentially
break compatibility, so would wait until a fairly major release to come
through.

>> Is there something I'm missing?
> Reviewing that README.listtexts, the only header not covered by the above is
> List-Id. All the rest are covered nicely by the new header functionality.
>
> Examples from the Gentoo lists:
> List-Id: Gentoo development announcement list<gentoo-dev-announce.gentoo.org>

Hmm. Yeah, OK.

I guess adding a listid tunable isn't out of the question, though if we
went down that road I'd want to carefully consider how to best structure
it for possible future use by mlmmj itself.

Another thought...What about a generic $tunableX$ substitution that
pulls the text out of the given tunable X? That would enable you to do
as much list-specific stuff as you wanted, and although it seems pretty
powerful and a candidate for exploitation, I don't think it would open
any security holes.

>> I'll look at your specific examples in more detail later. Thanks for
>> forwarding them.
> The bulk header should cut a lot of them.

Cool.

Ben.





