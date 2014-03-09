From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Sun, 09 Mar 2014 19:51:23 +0000
Subject: Re: [mlmmj] initial setup/exim sender verification
Message-Id: <1901072.vaPz6lcv9u@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <87vbvn8hf0.fsf@zancas.localnet>
In-Reply-To: <87vbvn8hf0.fsf@zancas.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sunday, March 09, 2014 13:29:07 David Bremner wrote:
[...]

Just noticed this part of your message:

> If I try
> 
> % /usr/sbin/exim4 -bt mlmmj-test+bounces-help@yantan.tethera.net
> 
> I get
> 
> R: system_aliases for mlmmj-test@yantan.tethera.net
> mlmmj-test+bounces-help@yantan.tethera.net is undeliverable

That's the wrong router.  I ran into something similar when setting up lurker, 
and I ended up needing to do this:


  system_aliases:
    debug_print = "R: system_aliases for $local_part@$domain"
    driver = redirect
    domains = +local_domains : !+lurker_domains
    ...

you could try the same thing with !+mlmmj_domains and see if it helps.

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

