From: =?UTF-8?B?RGFuaWVsIEvDvGhuaQ==?= <daniel.kuehni@indato.ch>
Date: Mon, 03 Mar 2008 21:52:10 +0000
Subject: Problems with modnonsubposts
Message-Id: <47CC730A.7070407@indato.ch>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi friends of mlmmj

Apparently I have a strange wish for some special list I want to create.

I want:
- no option for subscription or unsubscription to the list - a closed list
- a message from a subscriber should be delivered to the list 
subscribers without any intervention
- a message from a non-subscriber should be moderated by a moderator

With this in mind, I have done the following:

-rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:41 closedlist
-rw-r--r-- 1 nobody mlmmj  22 Feb 22 16:41 delheaders
-rw------- 1 nobody mlmmj 129 Feb 22 16:42 footer
-rw-r--r-- 1 nobody mlmmj  40 Feb 22 16:42 listaddress
-rw-r--r-- 1 nobody mlmmj  24 Feb 22 16:55 moderators
-rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:55 modnonsubposts
-rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:41 noaccessdenymails
-rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:41 notoccdenymails
-rw-r--r-- 1 nobody mlmmj  24 Feb 22 16:41 owner
-rw-r--r-- 1 nobody mlmmj  16 Feb 22 16:43 prefix
-rw-r--r-- 1 nobody mlmmj  14 Feb 22 16:41 relayhost
-rw-r--r-- 1 nobody mlmmj   0 Feb 22 17:00 subonlyget
-rw-r--r-- 1 nobody mlmmj   0 Mar  3 22:29 subonlypost

But this does not work as I wanted to. Now non-subscribers get a message 
back telling them that they are not subscribed and its a closed list.

When I'm adding the "moderated" flag, every message gets moderated, even 
the ones from the subscribers.

When I delete the "subonlypost" everyone can send a message regardless 
of their subscription status.

Is there any running configration around that would meet my requirements?

Any help appreciated.

Regards,
Dani

