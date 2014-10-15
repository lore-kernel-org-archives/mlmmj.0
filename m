From: G Stansfield <gstansfield@isat.co.za>
Date: Wed, 15 Oct 2014 09:32:38 +0000
Subject: [mlmmj] Sendmail and mlmmj
Message-Id: <543E3F36.6060704@isat.co.za>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi there!
This is a fork of the '[mlmmj] initial setup/exim sender verification' 
thread, as this may be a red herring.

Is anyone on the list using mlmmj/Sendmail and having no problems?

Philip communicated with me off list and said : "This indicates to me 
that mlmmj isn't actually engaging the sendmail MTA, ...." and "This 
points to something wrong with my aliases configuration, but I've 
doubled-checked it and it seems correct.... :(  ". That was my 
experience, too.

I am wondering if address masquerading in the header / envelope could be 
causing the problem.

My setup is opeSUSE12.3 sitting between the LAN users and the ISP. Users 
on the LAN are in the private domain 'stansfield' and bind on Suse sorts 
out the local naming / connections. [IP masquerading is up and running 
for comms with the ISP]

Clearly machine1.stansfield can't exist in the real world, so sendmail 
is set to masquerade the domain in the 'From' header, has localhost and 
stansfield as domains for local delivery, and masquerades local domains.

Could this be why ' mlmmj isn't actually engaging the sendmail MTA,'? 
Perhaps it is, but they are not talking nicely and sendmail is doing a 
return to sender type of thing.

Red herring, or getting closer to the mark? I don't have a test machine 
at present to work on - and clearly can't mess with the sendmail config 
on the operational server!

Regards,
Geoff

