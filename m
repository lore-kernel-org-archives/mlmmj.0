From: Bertrand Jacquin <beber@meleeweb.net>
Date: Thu, 26 Sep 2013 22:56:42 +0000
Subject: [mlmmj] Duplicates emails
Message-Id: <20130926225642.GF21048@lemonhead.scabb>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I'm using mlmmj since a long time and didn't get duplicate issue for
now. I'm using mlmmj 1.2.18.0 with exim 4.80.1 and see that I get twice
a mail with the same Message-ID :

#1

Return-path: <git+bounces-1000151-beber=meleeweb.net@lists.enlightenment.org>
Envelope-to: beber@meleeweb.net
Delivery-date: Tue, 24 Sep 2013 16:23:28 +0200
Received: from e5v1.enlightenment.org ([140.211.167.135]:46087 helo=smtp.enlightenment.org)
	by toothrot.meleeweb.net with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
	id 1VOTWS-0003Ha-E2
	for beber@meleeweb.net; Tue, 24 Sep 2013 16:23:28 +0200
Message-Id: <E1VOTW9-0002Bz-NM@e5-phabricator1.enlightenment.org>
Date: Tue, 24 Sep 2013 07:23:09 -0700

#2

Return-path: <git+bounces-1000151-beber=meleeweb.net@lists.enlightenment.org>
Envelope-to: beber@meleeweb.net
Delivery-date: Tue, 24 Sep 2013 16:23:34 +0200
Received: from e5v1.enlightenment.org ([140.211.167.135]:46240 helo=smtp.enlightenment.org)
	by toothrot.meleeweb.net with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
	id 1VOTWX-0003Hl-Vu
	for beber@meleeweb.net; Tue, 24 Sep 2013 16:23:34 +0200
Message-Id: <E1VOTW9-0002Bz-NM@e5-phabricator1.enlightenment.org>
Date: Tue, 24 Sep 2013 07:23:09 -0700

What you see from thoses two mail is that Date, Message-Id, Envelope-to
and Return-path are the very same, except Delivery-date which is added
by my MTA.

Looking on logs from the source, what I can see is that mlmmj send 10
bunch of mails from git+bounces-1000151@lists.enlightenment.org so to
the every subscriber.

Now queue ID :

$ zfgrep 'git+bounces-1000151@lists.enlightenment.org' mail.log-20130925.gz \
    | grep -Fw '<=' | awk '{print $6,$7,$8}'
2013-09-24 07:23:10 1VOTWA-00042u-28
2013-09-24 07:23:10 1VOTWA-000438-56
2013-09-24 07:23:10 1VOTWA-00043J-8E
2013-09-24 07:23:10 1VOTWA-00043S-B3
2013-09-24 07:23:10 1VOTWA-00043f-Et
2013-09-24 07:23:10 1VOTWA-00043r-Kf
2013-09-24 07:23:10 1VOTWA-000445-PC
2013-09-24 07:23:11 1VOTWA-00044I-W1
2013-09-24 07:23:11 1VOTWB-00044S-54
2013-09-24 07:23:11 1VOTWB-00044d-Au

Then, I can see in relevant logs that my address is used as a destination
twice :

$ zfgrep 'git+bounces-1000151@lists.enlightenment.org' mail.log-20130925.gz \
    | grep -Fw '<=' | awk '{print $8}' \
    | xargs -I {} -- zfgrep "{}" mail.log-20130925.gz \
    | grep -Fw beber@meleeweb.net
Sep 24 07:23:33 e5-mail1 exim[15614]: 2013-09-24 07:23:33 1VOTWA-00043f-Et => beber@meleeweb.net R=verp T=verp_smtp SA80 H=mx1.meleeweb.net [88.190.23.70]:25 X=TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256 CV=yes DN="/CN=ssl.as29.net" C="250 OK id=1VOTWX-0003Hl-Vu" QT#s DTs
Sep 24 07:23:28 e5-mail1 exim[15628]: 2013-09-24 07:23:28 1VOTWA-00043r-Kf => beber@meleeweb.net R=verp T=verp_smtp SA80 H=mx1.meleeweb.net [88.190.23.70]:25 X=TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256 CV=yes DN="/CN=ssl.as29.net" C="250 OK id=1VOTWS-0003Ha-E2" QTs DTs

I can found that the queue ID given by remote MTA (1VOTWX-0003Hl-Vu,
1VOTWS-0003Ha-E2) match the queue ID show above in Received.

How can this append ?

control/maxverprecips is defined to '10' so may this impact for mlmmj ?

In advance, thanks

-- 
Beber

