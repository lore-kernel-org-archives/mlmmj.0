From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 17 May 2016 01:37:02 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <robbat2-20160517T012539-942852131Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, May 05, 2016 at 09:30:22AM +1000, Ben Schmidt wrote:
> Hi, Robin,
> 
> customheaders and footer are omitted from list control messages by
> design. If you wish to include these, simply edit your listtexts,
> putting the headers at the top and the footer at the bottom. :-)
> 
> You will find the texts in $listdir/text, and they may have been copied
> from a systemwide location such as /usr/share/mlmmj/text.skel/en or the
> directory symlinked. You may find the $text T$ and %text T% directives
> useful for including common content (see README.listtexts).
> 
> Doing a better job of headers shared between posts and control messages
> is the subject of bug 9:
> 
> http://mlmmj.org/bugs/bug.php?id=9
> 
> And having more sane defaults is the subject or bug 10:
> 
> http://mlmmj.org/bugs/bug.php?id
> 
> So the plan is to improve this, but for now, the mechanisms I mentioned
> above are the way to go.
Ok, as a fast start to getting everybody to a better state, here's a
rough patch to add to all of the listtext files.
--- ./listtexts/en/confirm 2012-11-30 17:34:26.000000000 +0000
+++ ./listtexts/en/confirm	2016-05-17 01:29:20.000000000 +0000
@@ -1,5 +1,16 @@
 %ifaction sub%Subject: Confirm subscription to $list$@$domain$%endif%
 %ifaction unsub%Subject: Confirm unsubscribe from $list$@$domain$%endif%
+Precedence: bulk
+List-Post: <mailto:$listaddr$>
+List-Help: <mailto:$list+$help@$domain$>
+List-FAQ: <mailto:$list+$faq@$domain$>
+List-Owner: <mailto:$list+$owner@$domain$>
+%iftype normal%List-Subscribe: <mailto:$list+$subscribe@$domain$>%endif%
+%iftype normal%List-Unsubscribe: <mailto:$list+$unsubscribe@$domain$>%endif%
+%iftype digest%List-Subscribe: <mailto:$list+$subscribe-digest@$domain$>%endif%
+%iftype digest%List-Unsubscribe: <mailto:$list+$unsubscribe-digest@$domain$>%endif%
+%iftype nomail%List-Subscribe: <mailto:$list+$subscribe-nomail@$domain$>%endif%
+%iftype nomail%List-Unsubscribe: <mailto:$list+$unsubscribe-nomail@$domain$>%endif%
 
 %text prologue%

I'm wondering if we can get listtext expansion on customheaders as well,
because it would make keeping consistent headers a LOT easier.

Not handled by the above is including HTTP-based sub/unsub links, as required
by SORBS, but this should be big help to everybody.

-- 
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Trustee & Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

