From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 17 May 2016 16:16:32 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <robbat2-20160517T160730-518021302Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, May 17, 2016 at 08:57:10AM +0100, Gavin Henry wrote:
> >> So the plan is to improve this, but for now, the mechanisms I mentioned
> >> above are the way to go.
> > Ok, as a fast start to getting everybody to a better state, here's a
> > rough patch to add to all of the listtext files.
> > --- ./listtexts/en/confirm 2012-11-30 17:34:26.000000000 +0000
> > +++ ./listtexts/en/confirm      2016-05-17 01:29:20.000000000 +0000
> > @@ -1,5 +1,16 @@
> >  %ifaction sub%Subject: Confirm subscription to $list$@$domain$%endif%
> >  %ifaction unsub%Subject: Confirm unsubscribe from $list$@$domain$%endif%
> > +Precedence: bulk
> > +List-Post: <mailto:$listaddr$>
> > +List-Help: <mailto:$list+$help@$domain$>
> > +List-FAQ: <mailto:$list+$faq@$domain$>
> > +List-Owner: <mailto:$list+$owner@$domain$>
> > +%iftype normal%List-Subscribe: <mailto:$list+$subscribe@$domain$>%endif%
> > +%iftype normal%List-Unsubscribe: <mailto:$list+$unsubscribe@$domain$>%endif%
> > +%iftype digest%List-Subscribe: <mailto:$list+$subscribe-digest@$domain$>%endif%
> > +%iftype digest%List-Unsubscribe: <mailto:$list+$unsubscribe-digest@$domain$>%endif%
> > +%iftype nomail%List-Subscribe: <mailto:$list+$subscribe-nomail@$domain$>%endif%
> > +%iftype nomail%List-Unsubscribe: <mailto:$list+$unsubscribe-nomail@$domain$>%endif%
> >
> >  %text prologue%
> We use the following in customheaders. Let me know if it's wrong, as
> it's been collected over a while:
If you read further back in the thread, the list administrativa emails
don't use customheaders at all, which means adding the listtext macros
benefits all of those mails.

By way of macros, it would be really helpful if we could get per-header
reading from a custom file in control.

==
%ifhasheader CONTROLFILE HEADER%
%getheader CONTROLFILE HEADER%
%else%
HEADER: DEFAULTVALUE
%endif
==
This would check in control/CONTROLFILE for one or more header lines
starting with "HEADER:", and copy them in if they exist.
If they do NOT exist, it would emit "HEADER: DEFAULTVALUE".

This could be used for still being able to override single headers,
while keeping macro-based listtexts.

Would be really useful in customheaders as well, for those of us that
run many lists.

In the Gentoo case, I'd want to override List-Archive, List-Subscribe,
List-Unsubscribe, List-Id (I omitted it in the patch above, as for
legacy threading, our list-id no longer matches the $list$.$domain$,
domain has changed slightly).

-- 
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Trustee & Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

