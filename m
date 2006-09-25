From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Mon, 25 Sep 2006 16:30:26 +0000
Subject: Re: Moderator subscription
Message-Id: <45180422.4090004@kite.se>
List-Id: <mlmmj.mlmmj.org>
References: <4517E645.7090904@kite.se>
In-Reply-To: <4517E645.7090904@kite.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

--- forgot reply-to-all ---

Mads Martin Joergensen wrote:
 > * Magnus Naeslund(k) <mag@kite.se> [Sep 25. 2006 16:23]:
 >> How can a moderator subscribe a person to the list via the email 
interface? The ezmlm way doesn't work, if i send a mail to 
list-subscribe-email=host.com@listhost.com (yep - is the delimiter) it 
doesn't seem to work...
 >
 > Nope, that feature is not implemented in mlmmj.
 >

Will patches added feature be accepted?
This is not only a moderator question, since the syntax is useful for 
normal users aswell.

 >
 > Change the From: header. mlmmj uses the From: header and not the
 > envelope from to determine who requests subscription.
 >

Yes this works, and our power-user customers can use that.
But it's not a easy interface for more normal-like users to use.
Let's see if I can come up with an acceptable patch...

Mvh,
Magnus
