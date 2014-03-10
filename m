From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Mon, 10 Mar 2014 03:25:23 +0000
Subject: Re: [mlmmj] initial setup/exim sender verification
Message-Id: <49824642.loLjIdCvgx@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <87vbvn8hf0.fsf@zancas.localnet>
In-Reply-To: <87vbvn8hf0.fsf@zancas.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sunday, March 09, 2014 23:50:46 David Bremner wrote:
> Chris Knadle <Chris.Knadle@coredump.us> writes:
> > And I'm assuming you have an "mlmmj-test" alias in /etc/aliases that looks
> > like this?
> > 
> > mlmmj-test:    "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"
> 
> It seems that the problem was that the listaddress was set to
> point mlmmj-test@yantan.tethera.net and not
> mlmmj-test@lists.tethera.net.  Once I fixed that, the correct router is
> invoked, without needing an alias in /etc/aliases (as far as I
> understand, that's the point of defining the router).

Oh.  Yeah, you've probably set relay_domains = +mlmmj_domains.  This means 
that Exim is accepting any mail to lists.tethera.net, /without/ checking the 
local_part of destination addresses.  That's not exactly a good thing; it can 
cause backscatter.  All one needs to do is send an email with the sending 
email address faked to nonexistent@lists.tethera.net, then the mail will be 
accepted based on the domain alone but then bounced back to the false sender.

Instead I've set +mlmmj_domains to the list of local_domains so that the 
local_part of the address is always checked.  So when I tested and when I 
remove the mailing list alias from /etc/aliases, the result is an 
"Unroutable address" error, as I think it should.

> I'm not sure how mlmmj-make-ml would know what the list domain is; this
> seems to require postprocessing currently.

AFAIK for MLMMJ the full address of the mailing list is specified in 
/var/spool/mlmmj/<list>/control/listaddress.  In your case you'll probably 
find that /var/spool/mlmmj/mlmmj-test/control/listaddress contains
"mlmmj-test@lists.tethera.net".

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

