From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 13:21:15 +0000
Subject: Web-based membership management
Message-Id: <4B5EEC4B.20404@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, once again!

The final two things on my wish list for now are to do with membership management. 
This is the first.

I'd like a web interface to allow membership management. I can easily write 
something in PHP to do this and have it join the other web interfaces in contrib.

However, it is a bit more involved than the other interfaces. Control files are 
easy to fiddle with as they can be changed to have permissions writable by the 
webserver. Moderation is bearable, as emails can be sent that just do the job. For 
subscription and unsubscription, though, more care is needed. Permissions can't 
just be changed, as subscription/unsubscription by email would be affected. Mail 
can't simply be sent to do the job, as confirmation requests and so on would be 
generated undesirably.

So...I'd like to propose an extension to subscription handling, where the subject 
line of mails to +subscribe or +unsubscribe can contain the commandline options of 
mlmmj-sub or mlmmj-unsub (as appropriate), excluding -L. The argument for -L would 
be implied by the address the mail was sent to, of course. Different addresses to 
the address the mail came from could easily be (un)subscribed by using the -a 
argument: in fact, it would be required to be the beginning of the subject line in 
order for the mechanism to be activated. To be secure, it would require the email 
to come from the list owner or someone listed in submod.

A web interface could easily generate such emails to do required list admin.

Perhaps for added security it could be required to be turned on with a tunable.

How does this sound?

Ben.




