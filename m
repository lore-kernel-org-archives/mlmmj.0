From: Filippo Fadda <fifadd@tin.it>
Date: Fri, 27 May 2005 00:51:09 +0000
Subject: qmail mlmmj Return-Path issue
Message-Id: <6.2.1.2.2.20050527024022.029fc6b0@postino.programmazione.it>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I have a problem with qmail + mlmmj that seems like that verified with 
postfix. Look here:

http://mlmmj.mmj.dk/archive/0154.html

qmail-local delete the Return-Path header before calling qmail-command, so 
into the mail passed to mlmmj-recieve (the english word is "receive" not 
"recieve", I think that it can create a bit of confusion) the header does 
not appear.
I don't know how to change this qmail default behaviour and all the emails 
that I'm sending to my test list are discarded.
Have you tried mlmmj with qmail? Is there some solution to this issue? I 
have searched with Google, but I have not found anything about this 
problem. Maybe I'm wrong something.

Bye

-Filippo Fadda

