From: Nico Meijer <lists@familiemeijer.org>
Date: Wed, 11 Oct 2006 08:58:38 +0000
Subject: Re: mlmmj-1.2.12-RC4 released
Message-Id: <20061011105838.edcb44a8.lists@familiemeijer.org>
List-Id: <mlmmj.mlmmj.org>
References: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
In-Reply-To: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Morten,

I'm sorry I wasn't able to test earlier. My apologies to Mads aswell, I'll
be in touch soon.

> I honestly believe this is ready for release. But please install it at
> test it anyway.

I have installed it on an OpenBSD 3.8 box with postfix. First testruns
seem to go 100% correctly. Mind you, I am a *very* new user of mlmmj.

One wee tiny thing with moderated subscription:

--- submod-requester    Thu Feb  9 08:06:12 2006
+++ submod-requester.new        Wed Oct 11 10:52:42 2006
@@ -4,6 +4,6 @@
 
 $listaddr$
 
-This list is configured to have moderated subscription, the request have
+This list is configured to have moderated subscription. The request has
 been queued for approval.

Thank you so much!... Nico
