From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Wed, 10 Feb 2021 15:15:28 +0000
Subject: [mlmmj] Selective 'notmetoo' - how to do in mlmmj or outside?
Message-Id: <20210210151528.GA5946@bonclok.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi all,

Just a poll for ideas for solving a little bugger.

I have UNSET notmetoo on all lists as I (and probably most listmembers)
think it is useful to get a copy of own posts. However, one subscriber's
mail server is rejecting these copies as forgeries based on From: header
(not the envelope from). The result is as follows:

1. A message number N arrives from subscriber A and is processed by mlmmj
2. mlmmj sends a copy also to subscriber A which gets rejected by his MTA
3. mlmmj records a bounce for subscriber A as it could not know better
4. A message N+1 arrives for the list from some other subscriber B
5. Message N+1 gets delivered to subscriber A successfully
6. mlmmj concludes that subscriber A's address is no longer bouncing,
   removes the record from the 'bounce' subdirectory and send the 'probe'
   listtext to subscriber A saying it's ok now, but he missed message N
   (from himself)
7. Subscriber A gets somewhat annoyed :-(

I know I could just set notmetoo and forget about it, but other people
may be unhappy not getting copies.

I am contemplating a patch to make notmetoo a tunable of type list, which
would tell what subscribers do not want copies. But before I get to it
(if ever) maybe there's some workaround possible in mlmmj itself or
outside of it.

I already use some trickery in the 'access' tunable to get rid of some
problems with strange subscribers' MTAs (like autoresponse for EVERY
message!), but I guess it is consulted only on inbound messages and not
on outbound - am I right?

If I cannot stop it inside mlmmj maybe some clever trick in relaying
MTA (postfix)? Just an idea...

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

