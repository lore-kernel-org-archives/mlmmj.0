From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Sun, 06 Aug 2006 01:33:06 +0000
Subject: closedlistsub not working
Message-Id: <44D546D2.3060702@kite.se>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,
I'm a qmail defector that is evaluating mlmmj to be used with a postfix
installation instead of ezmlm + qmail. We might be moving quite a number
of lists over to mlmmj if the evaluation is positive.

When i tried to enable "closedlistsub" it still enables me to subscribe,
has anyone seen this before?

Also I would be very happy if someone could help me with this:

I'm trying to map the different types of ezmlm lists we provide over to
the mlmmj options. These are the types of ezmlm list we have now:

announcelist_modsub:
	A list that is moderated in two ways,
	subscription requests are sent to moderator(s),
	posts are also sent to moderators for approval.

announcelist:
	Anyone can subscribe, but posts go to moderators.

priv_privpost:
	Private list that only moderators can approve on
	subscription requests.
	Only subscribers can post.

priv_pubpost:
	Private list that only moderators can approve on
	subscription requests, but anyone can post to the list.
	
pubsub: the normal kind of public list, anyone can post to it

I know that most of these should be easy with mlmmj, but some of them I
can't really map. Any pointers are appreciated.

Regards,
Magnus Naeslund
