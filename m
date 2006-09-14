From: Nate Beaty <natebeaty@gmail.com>
Date: Thu, 14 Sep 2006 06:45:49 +0000
Subject: submod tunable not working for me.. ?
Message-Id: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Perfect timing -- I just started a discussion list which needed  
subscription moderation! However, I cannot get it to work for the  
life of me.

I compiled the latest mlmmj and added a file "submod" with a single  
email to my control/ directory, and when I attempt to subscribe  
myself to the list, I first get the confirmation request via email,  
which I respond to, and then I get a Mail Delivery failure:

>   comix+confsub-2234c52a6b0c615d-natebeaty=gmail.com@lists.clixel.com
>     local delivery failed

However, a file (subscribe1a39a8b053aabcec) is added to the  
moderation/ directory, and the temp file is removed from the subconf/  
directory.. yet the moderator email listed in "submod" never receives  
an email.

I tried having a blank file for "submod" and seeing if it would send  
a confirmation email to the "owner" email. I also tried adding a file  
"moderators" in the control/ directory with the single email I listed  
in "submod". Neither worked.

If I remove the "submod" file in control/, the confirmation email  
(like the one that gives the error above) works fine and the user is  
subscribed.

What am I doing wrong here? It looks like it's *almost* working.. but  
I get no emails to the email listed in "submod" to confirm.

Nate.

--
Clixel Design & Coding ~ http://clixel.com/

