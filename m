From: Blu <blu@daga.cl>
Date: Thu, 08 Nov 2007 18:43:47 +0000
Subject: Re: Autoresponders vs. reply-to list
Message-Id: <20071108184347.GI5231@daga.cl>
List-Id: <mlmmj.mlmmj.org>
References: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
In-Reply-To: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On Thu, Nov 08, 2007 at 07:14:17PM +0100, Christian Laursen wrote:
> Neale Pickett <neale@woozle.org> writes:
> 
> > "Kovács István" <kovacs.it@gmail.com> writes:
> >
> >> I'd like to make my list's reply-to the mailing list address, not the
> >> sender address.
> >
> > Please don't do this.  It is in violation of RFC 2822 and will surprise
> > people, perhaps embarassingly.  Have a google search for "reply-to still
> > harmful" if you need further convincing.
> 
> Also read http://www.metasystema.net/essays/reply-to.mhtml which is in
> favour of setting Reply-To on mailing lists.
> 
> While it is a noble idea that everyone should just use the "reply to
> list" function in their MUA, more often than not people will just
> learn to use "reply to all" instead, causing a lot of mail in your
> inbox if you participated in some thread that grew longer afterwards.

The problem that, in my view, outweights anything good that setting the
Reply-To header could have is the danger of list subscribers sending
private email to the list by accident. It is very easy for someone
accustomed to the usual semantics of _replay_ as in "replay to author" to
just hit replay to send a private answer, answer that is sent to the whole
list if the list sets Replay-To to points to itself. 

I just had to revert this setting on one of my lists due to an embarrasing
incident of this kind. Funny thing is that the affected subscriber was one
of the more vocal ones in favor of setting Reply-To when I was forced to
make the change due to overwhelming subscribers requests. 

-- 
Blu.
