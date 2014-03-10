From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Mon, 10 Mar 2014 03:50:23 +0000
Subject: Re: [mlmmj] initial setup/exim sender verification
Message-Id: <4053985.5cUk1xF9hJ@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <87vbvn8hf0.fsf@zancas.localnet>
In-Reply-To: <87vbvn8hf0.fsf@zancas.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sunday, March 09, 2014 23:25:23 Chris Knadle wrote:
> On Sunday, March 09, 2014 23:50:46 David Bremner wrote:
> > Chris Knadle <Chris.Knadle@coredump.us> writes:
> > > And I'm assuming you have an "mlmmj-test" alias in /etc/aliases that
> > > looks
> > > like this?
> > > 
> > > mlmmj-test:    "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"
> > 
> > It seems that the problem was that the listaddress was set to
> > point mlmmj-test@yantan.tethera.net and not
> > mlmmj-test@lists.tethera.net.  Once I fixed that, the correct router is
> > invoked, without needing an alias in /etc/aliases (as far as I
> > understand, that's the point of defining the router).
> 
> Oh.  Yeah, you've probably set relay_domains = +mlmmj_domains.  This means
> that Exim is accepting any mail to lists.tethera.net, /without/ checking the
> local_part of destination addresses.  That's not exactly a good thing; it
> can cause backscatter.  All one needs to do is send an email with the
> sending email address faked to nonexistent@lists.tethera.net, then the mail
> will be accepted based on the domain alone but then bounced back to the
> false sender.

Actually I think the above isn't true; Exim would normally accept the mail, 
but due to the routing I believe MLMMJ ends up checking if the address matches 
one of the addresses of its mailing lists, and the mail gets rejected 
otherwise.

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

