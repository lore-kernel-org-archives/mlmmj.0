From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Fri, 20 May 2016 06:50:58 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <robbat2-20160520T064326-619812984Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, May 20, 2016 at 01:30:56AM +0000, Eric Wong wrote:
> "Robin H. Johnson" <robbat2@gentoo.org> wrote:
> > Not handled by the above is including HTTP-based sub/unsub links, as required
> > by SORBS, but this should be big help to everybody.
> Yikes, SORBS requires HTTP links?  (I assume HTTPS is fine, too?)
> Anyways, I'll see what I can cook up with Sendmail::Pmilter
> and a PSGI app...
Here's what I got as a response from SORBS regarding the first incident (for
which I started this thread) when talking to them.

It's part of a template response, but still telling.
| Additionally, we recommend implementing a one-click unsubscribe via the
| List-Unsubscribe header as defined in RFC 2369 (http://tools.ietf.org/html/rfc2369).
| Note that if following this link automatically unsubscribes the user, our spam
| traps will unsubscribe themselves upon receiving these messages. At this time,
| we only provide this functionality for HTTP links in the List-Unsubscribe
| header.

As a recap of the incidents:
1. Presumably compromised system send an email:
   - From spamtrap@randomdomain.com
   - To listname+subscribe@lists.gentoo.org
2. The envelope sender & From header email were the same, and that domain
   didn't have any SPF or DKIM to consider the email as spammy, so we accepted
   it.
3. mlmmj sent a subconf request to spamtrap@randomdomain.com.
4. SORBS blacklists the lists.gentoo.org mailserver.

We stopped running the mlmmj CGIs many years ago because of abusive traffic,
but now looks like we'll need to possibly bring back at least some of them :-(.

-- 
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Trustee & Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

