From: Helge Milde <helge@monsternett.no>
Date: Thu, 03 Jul 2008 10:59:28 +0000
Subject: bounce-probe text being sent to non-owners
Message-Id: <486CB110.9080206@monsternett.no>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi.
I'm using mlmmj to run a newsletter to 500ish destinations, and 
everything has been working great so far, except one odd problem; the 
message contained in text/bounce-probe is sometimes (well.. once) sent 
to arbitrary subscribers (non-owners).
I'm sure this has to do with me not configuring it properly, but anyone 
know what could cause this?
In my controls/owner file I have one line containing 'info@xxxx.org'.

One thing to note could be that I added the subscribers manually by 
pasting into the subscribers.d/ directory.

This is the message (with emails censored out). The To-field contains 
the non-owner's email-address.

From:xxxxxx+owner@xxxxxx.net
> Date: 3 July 2008 11:00:05 BDT
> To: xxxxx@xxxx.uk
> Subject: Messages from listxxxx@xxxxx.net to you have been
> bouncing
>
> Hi, this is the mlmmj program managing the mailinglist
>
> xxxxx@xxxxx.net
>
> Some messages to you could not be delivered. If you're seeing this
> message it means things are back to normal, and it's merely for your
> information.
>
> Here is the list of the bounced messages:
>
>         19
>


-- 
Helge Milde

