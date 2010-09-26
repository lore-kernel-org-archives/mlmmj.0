From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Sun, 26 Sep 2010 16:40:23 +0000
Subject: Re: [mlmmj] undesired help emails
Message-Id: <20100926164023.GA2579@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <4C960847.7000102@yahoo.com.au>
In-Reply-To: <4C960847.7000102@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

(Sorry if Ben gets a dupe, I had to fix header as my MUA defaulted to
the old list address)

On Sun, Sep 19, 2010 at 10:55:35PM +1000, Ben Schmidt wrote:
> > Maybe a custom control/commandcustomheaders, control/commanddelheaders?
> I have implemented a feature which hasn't made it into hg yet as I
> haven't documented it properly, to allow arbitrary headers to be added
> to listtexts, so this would allow you to add the relevant headers. In a
> future Mlmmj release, I'll probably try to include more sane and
> standards-compliant/best-practice defaults for these, too. See
> http://mlmmj.org/archive/mlmmj/2010-02/1666.html
The downside of that solution is that I would need to build something to
allow easily updating listtexts for each list, with the per-list
headers (presently, since all the texts are identical, we have them
symlinked)

Ideal if we could combine both solutions maybe?
Worst case, I could build the listtexts w/ Make, per list.

> Would this really help, though?
> 
> I don't think I understand sufficiently what is going on to properly
> consider how to solve it yet. Is a spammer forging your address and
> sending a message to listname+help@wherever.tld? This seems unlikely. Or
> is Mlmmj responding to
> listname+anything-it-doesnt-recognise@wherever.tld with the help email,
> and we should have an option to turn that off and ignore such mails? Or
> is a spammer forging the list address and sending to
> listname+something@wherever.tld and thereby having a help email sent
> back to you as owner somehow? In short, are we able to track down more
> precisely what's going on?
Here's a capture of two variants:
1.
SMTP envelope:
MAIL FROM interposec0@rodarmer.com
RCPT TO gentoo-dev+owner@lists.gentoo.org
RCPT TO gentoo-java@lists.gentoo.org
RCPT TO gentoo-laptop+unsubscribe@lists.gentoo.org
RCPT TO gentoo-ppc-dev@lists.gentoo.org
RCPT TO gentoo-security@lists.gentoo.org
RCPT TO gentoo-user-ru+unsubscribe@lists.gentoo.org

Actual mail:
From: Mel Peterson <interposec0@rodarmer.com>
To: gentoo-laptop+unsubscribe@lists.gentoo.org

Effects:
- Two unsub failure messages to to interposec0@rodarmer.com, as the
  address is not subscribed to gentoo-laptop or gentoo-user-ru.
  If the from address was an autoresponder, I get a response because
  those mails do not have anything identifying them as listmail.
- The original spam was forwarded to owner of gentoo-dev (eg me).

2.
SMTP envelope:
MAIL FROM insultedj81@rjfruth.com
RCPT TO gentoo-desktop@lists.gentoo.org
RCPT TO gentoo-desktop-research@lists.gentoo.org
RCPT TO gentoo-desktop+subscribe@lists.gentoo.org
RCPT TO gentoo-dev@lists.gentoo.org
RCPT TO gentoo-devrel@lists.gentoo.org
RCPT TO gentoo-dev+subscribe@lists.gentoo.org
RCPT TO gentoo-doc-cvs@lists.gentoo.org
RCPT TO gentoo-doc-de+subscribe@lists.gentoo.org

Actual mail:
From: gentoo-desktop+owner@lists.gentoo.org
To: (all of the addresses in the envelope)

Effects:
- listowner gets confsub emails from 3 lists (gentoo-desktop, gentoo-doc-de,
  gentoo-dev)
  
> And is this perhaps something that really should be solved at the MTA
> level by doing more to ensure emails with forged addresses don't make it
> to Mlmmj at all?

> 
> Anyone know if other MLMs suffer from this problem and/or what they do
> to attempt to solve it?
mailman does from a brief check, and is mitigated by better headers on
the subconf/unsubconf/help.

mailman subconf:
========
Precedence: bulk
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.9
List-Id: "Alsa-devel mailing list for ALSA developers - http://www.alsa-project.org" <alsa-devel.alsa-project.org>
X-List-Administrivia: yes
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org

mailman listhelp:
========Precedence: bulk
X-BeenThere: coreutils-announce@gnu.org
X-Mailman-Version: 2.1.5
List-Id: announcements about the GNU coreutils <coreutils-announce.gnu.org>
X-List-Administrivia: yes
Sender: coreutils-announce-bounces+base-system=gentoo.org@gnu.org
Errors-To: coreutils-announce-bounces+base-system=gentoo.org@gnu.org

Interesting use of VERP in the last headers there.

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

