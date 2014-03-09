From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Sun, 09 Mar 2014 19:21:56 +0000
Subject: Re: [mlmmj] initial setup/exim sender verification
Message-Id: <3813641.YUPTu3fvVs@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <87vbvn8hf0.fsf@zancas.localnet>
In-Reply-To: <87vbvn8hf0.fsf@zancas.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sunday, March 09, 2014 13:29:07 David Bremner wrote:
> Hi All;
> 
> I've just (attempted) to configure 1.2.18.0 (the latest package on
> Debian) with exim.  I think I followed
> 
>         http://mlmmj.org/docs/readme-exim4/

I'm guessing you chose to add both routers and transports, but I can't tell 
which of them you're actually using.  Did you create a "verp" file for this 
mailing list such that you'd be using the verp_router and verp_smtp transport?

I used the same file above (which identical to the file in the Debian package) 
but I chose to remove the "-F" from the "mlmmj_transport" section (but that 
shouldn't be related to the problem you're having).  The configuration worked 
fine for me (on Debian Wheezy) and I believe (at least at one time) that I 
also tried VERP.

> However, either I made a mistake, or the rest of my configuration
> interacts badly with mlmmj envelope senders. As the following slightly
> log shows, the sender address mlmmj-test+bounces-help@fqdn is
> being rejected as unroutable.

And I'm assuming you have an "mlmmj-test" alias in /etc/aliases that looks 
like this?

mlmmj-test:    "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"


> 2014-03-09 13:05:30 1WMgEE-0005IV-JE <= bremner@tethera.net U=remotemail
> P=local SF5 id94381127.112497.24715.nullmailer@tethera.net 2014-03-09
> 13:05:30 H=localhost (yantan.tethera.net) [127.0.0.1] sender verify fail
> for <mlmmj-test+bounces-help@yantan.tethera.net>: Unrouteable address
> 2014-03-09 13:05:30 H=localhost (yantan.tethera.net) [127.0.0.1]
> F=<mlmmj-test+bounces-help@yantan.tethera.net> rejected RCPT
> <bremner@tethera.net>: Sender verify failed 2014-03-09 13:05:30
> 1WMgEE-0005IV-JE => mlmmj-test <mlmmj-test@lists.tethera.net>
> R=mlmmj_router T=mlmmj_transport
> 
> If I try
> 
> % /usr/sbin/exim4 -bt mlmmj-test+bounces-help@yantan.tethera.net
> 
> I get
> 
> R: system_aliases for mlmmj-test@yantan.tethera.net
> mlmmj-test+bounces-help@yantan.tethera.net is undeliverable
> 
> I don't think it's a suffix issue, since i get the same results with
> mlmmj-test@yantan.tethera.net
> 
> Any clues would be welcome.  I guess I could turn off sender
> verification for those *bounces addresses; but I'm not really clear on
> how the listname@hostfqdn (as opposed to listname@listdomain) mail is
> supposed to be routed. Am I supposed to manually add aliases to
> /etc/aliases even if exim routers and transports are defined?

You need just the one alias entry I mentioned above, none others.  The others 
should be covered by these options in the mlmmj_router:

   local_part_suffix = +*
   local_part_suffix_optional


However if you understand Exim4 well, you'll notice that the entry in 
/etc/aliases isn't actually being used for the routing and the command is 
instead being overridden by the "command" entry in the mlmmj_transport 
section.  This is being done because the instructions for the mlmmj_router 
uses the "accept" driver rather than the "redirect" driver and a 
"pipe_transport" which is how Exim upstream suggests doing this. [1]

If you want to see an example of what the difference would look like for the 
"redirect" router, have a look at Debian #739230 [2] for the lurker package in 
which I wrote some README.exim4 instructions.





[1]: http://exim.org/exim-html-4.80/doc/html/spec_html/ch-the_redirect_router.html


[2]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bugs9230
   
  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

