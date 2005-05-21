From: Filippo Fadda <fifadd@tin.it>
Date: Sat, 21 May 2005 13:55:59 +0000
Subject: Automatic mailing list creation, something like Google Groups
Message-Id: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I'm creating something like Google Groups and I need two important features:

1) Each group is associated to a specific mailing list with the same group 
alias. For example peaceandlove@example.com is the mailing list related to 
the group identified as peaceandlove.
I need that any "valid" mail sent to peaceandlove mailing list launch a PHP 
script that insert into the related group database the mail itself, like 
Google Groups works.

2) I need also to create a new mailing list each time that a new group is 
created and naturally to delete it when a group itself is deleted. The 
group is created via a web page. Is some way to do this? The mail server 
and the web server are not on the same PC, they are running on two 
different machines. I need to create some NFS link and run a script that 
create the directory and files needed by mlmmj? Can you suggest to me some 
way to do this? Have you an idea?
I'm running qmail on the mail server and Apache+PHP on the web server.

Best regards.

-Filippo Fadda

