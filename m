From: David Demelier <demelier.david@gmail.com>
Date: Thu, 22 Dec 2016 12:24:10 +0000
Subject: [mlmmj] Allowing specific addresses with subonlypost
Message-Id: <13b7eecf-62da-b77b-4685-ddae6cc0ee39@gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello all,

I've installed mlmmj with my postfix and it works fine.

However to stop spam I've enabled the subonlypost option to only allow 
subscribers to post mails. The problem is that I also would like to add 
specific addresses so my own mail server can also send mails to people 
subscribed.

I've tried using this in the control/access file:

     send ^From: .*@mydomain.tld

If I send a mail to the list using foo@mydomain.tld, mlmmj seems to do 
something with it but is not forwarded to the subscribers. And 
obviously, if I don't have that access file at all and send a mail, the 
administrator receives a mail saying that someone wanted to send a mail 
and was denied because it is not subscribed.

So what I'm missing to allow this? If it's possible of course. Because I 
would like to avoid creating fake mail users just for sending mails from 
the server itself.

Regards,

-- 

David


