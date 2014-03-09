From: David Bremner <david@tethera.net>
Date: Sun, 09 Mar 2014 16:29:07 +0000
Subject: [mlmmj] initial setup/exim sender verification
Message-Id: <87vbvn8hf0.fsf@zancas.localnet>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi All;

I've just (attempted) to configure 1.2.18.0 (the latest package on
Debian) with exim.  I think I followed 

        http://mlmmj.org/docs/readme-exim4/

However, either I made a mistake, or the rest of my configuration
interacts badly with mlmmj envelope senders. As the following slightly
log shows, the sender address mlmmj-test+bounces-help@fqdn is
being rejected as unroutable.

2014-03-09 13:05:30 1WMgEE-0005IV-JE <= bremner@tethera.net U=remotemail P=local SF5 id94381127.112497.24715.nullmailer@tethera.net
2014-03-09 13:05:30 H=localhost (yantan.tethera.net) [127.0.0.1] sender verify fail for <mlmmj-test+bounces-help@yantan.tethera.net>: Unrouteable address
2014-03-09 13:05:30 H=localhost (yantan.tethera.net) [127.0.0.1] F=<mlmmj-test+bounces-help@yantan.tethera.net> rejected RCPT <bremner@tethera.net>: Sender verify failed
2014-03-09 13:05:30 1WMgEE-0005IV-JE => mlmmj-test <mlmmj-test@lists.tethera.net> R=mlmmj_router T=mlmmj_transport

If I try

% /usr/sbin/exim4 -bt mlmmj-test+bounces-help@yantan.tethera.net

I get 

R: system_aliases for mlmmj-test@yantan.tethera.net
mlmmj-test+bounces-help@yantan.tethera.net is undeliverable

I don't think it's a suffix issue, since i get the same results with 
mlmmj-test@yantan.tethera.net

Any clues would be welcome.  I guess I could turn off sender
verification for those *bounces addresses; but I'm not really clear on
how the listname@hostfqdn (as opposed to listname@listdomain) mail is
supposed to be routed. Am I supposed to manually add aliases to
/etc/aliases even if exim routers and transports are defined?

d

