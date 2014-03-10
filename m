From: David Bremner <david@tethera.net>
Date: Mon, 10 Mar 2014 02:50:46 +0000
Subject: Re: [mlmmj] initial setup/exim sender verification
Message-Id: <87eh2a937d.fsf@zancas.localnet>
List-Id: <mlmmj.mlmmj.org>
References: <87vbvn8hf0.fsf@zancas.localnet>
In-Reply-To: <87vbvn8hf0.fsf@zancas.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Chris Knadle <Chris.Knadle@coredump.us> writes:

> And I'm assuming you have an "mlmmj-test" alias in /etc/aliases that looks 
> like this?
>
> mlmmj-test:    "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"

It seems that the problem was that the listaddress was set to 
point mlmmj-test@yantan.tethera.net and not
mlmmj-test@lists.tethera.net.  Once I fixed that, the correct router is
invoked, without needing an alias in /etc/aliases (as far as I
understand, that's the point of defining the router).

I'm not sure how mlmmj-make-ml would know what the list domain is; this
seems to require postprocessing currently.


