From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 20 Jan 2006 23:54:06 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone
Message-Id: <20060121005406.7gb1nmmpwgo4ooog@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Charlie Brady <charlieb@budge.apana.org.au>:
> BTW, why don't you return an error status? Isn't that what an LDA should do?

I think we return EXIT_SUCCESS here for one of the following reasons:

- The mail is a bounce sent to the list from a broken mail server, and 
we do not want to create mail loops by bouncing it.

- The mail was not accepted for delivery to the list (because of a 
rule, because of missing list address in To:, ...), and some setting 
explicitly stated that no deny mail was to be sent.

When the mail is "malformed" - e.g. no Return-Path: - we should return 
EXIT_FAILURE. The problem here is that we fork() to make sure that we 
are not killed by the mail daemon who spawned us.

We should probably log more. We intended to not fill the system log 
files with warnings about broken mails to a list. I am not saying it 
was the best idea ever.

The log functions are not very good. There is only one log level, and 
we always log the error string matching errno, which make info messages 
difficult to read.

Morten
