From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 11 Apr 2007 12:08:24 +0000
Subject: Re: lists.gentoo.org powered by mlmmj - bugs and a feature request
Message-Id: <20070411120824.GC69191@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070411095339.GE4502@curie-int.orbis-terrarum.net>
In-Reply-To: <20070411095339.GE4502@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Robin H. Johnson <robbat2@gentoo.org> [Apr 11. 2007 11:53]:
> Hi,
> 
> I've taken over maintenance of lists.gentoo.org (all powered by mlmmj
> :-), some 32k unique recipients!) from the previous maintainer, and
> there's a few things we're working at. First of all, two bug reports,
> then a feature request.
> 
> 1.
> There is occasionally some mail loss that we haven't gotten to
> the bottom of. I can confirm 100% that Sendmail (not my choice, trust
> me) definitely piped the email to mlmmj-recieve. There should have been
> some 1900 emails that went out from the input, but a lot less than that
> did go out.
> 
> The splitting in the sendmail logs appear that it only got some 800
> recipients from mlmmj-send, but I cannot confirm that.
> 
> All suggestions on tracing this are welcome, losing mail sucks.

If sendmail is not your choice, why not switch to Postfix which performs
wonderfully. SuSE is running lists.opensuse.org without a hitch with
mlmmj + postfix.

> 2.
> This was reported by one of our users:
> https://bugs.gentoo.org/show_bug.cgi?id3159
> 
> mlmmj appends the footer, without being aware of the encoding of the
> email. It is not safe to just directly append the footer if the mail has
> Content-Transfer-Encoding: base64!

There's a patch from Jakob Hirsch for handling this.

> 3.
> Now the feature request.
> 
> Without going into all of the details, I need a sane way to have
> mlmmj-process to call a different application (procmail for the moment)
> where it would call mlmmj-send to send out the mass email to all list
> recipients (so mlmmj-process has already completed all of it's
> processing at this point).
> Then I also need a way to call mlmmj-send in the same way later on. 
> 
> We're working on some asynchronous processing stuff, so breaking the
> chain between mlmmj-process and mlmmj-send is the only sane way of
> handling large quantities of messages.

You can always just replace any mlmmj binary with one of your choice.

For instance mlmmj-process (yours) doing stuff and finally invokes the
mlmmj binaries the same way as the original one would.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
