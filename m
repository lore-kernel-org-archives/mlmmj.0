From: Geert Stappers <stappers@stappers.nl>
Date: Sun, 06 Oct 2019 19:47:00 +0000
Subject: Re: [mlmmj] List server DKIM
Message-Id: <20191006194700.ni2smwznu7ahqg7a@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
In-Reply-To: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Oct 04, 2019 at 10:39:59AM +0100, Martin Brampton wrote:
> On 03/10/2019 22:32, A. Schulze wrote:
> > Am 03.10.19 um 21:57 schrieb Geert Stappers:
> } On Thu, Oct 03, 2019 at 09:57:11PM +0200, Geert Stappers wrote:
> } > On Thu, Oct 03, 2019 at 09:32:27PM +0200, Morten Kirkegaard wrote:
> } > > On 2019-10-03, at 19:39:21 +0100, jf-mlmmj@bookofsand.co.uk wrote:
> } > > > On Thu, 3 Oct 2019 19:58:30 +0200 you wrote:
> } > > > > I guess you could put "DKIM-Signature:" in the "delheaders" file.
> } > > > 
> } > > > That helps with some ISPs, but the strict ones (eg gmail) will reject
> } > > > anything that claims to be ???From:??? an address in their domain but
> } > > > lacks a DKIM signature. So if you have more than one gmail subscriber,
> } > > > mail from one via your list will be rejected when you try to deliver
> } > > > it to the other(s).
> } > > 
> } > > Okay, if they require their own signature, then I guess he can't add
> } > > content to the mail.
> } > 
> } > 
> } > Alice -->  MLMMJ -->  Bob
> } > 
> } > is realy
> } > 
> } > Alice -> MTA Alicie -> MTA MLMMJ -> MLMMJ -> MTA MLMMJ -> MTA Bob -> Bob
> } > 
> } > 
> } > The MTA, Mail Transfer Agents (e.g. Postfix) do  "DKIM".
> } > MLMMJ does NOT do "DKIM"
> } > 
> > > MTA MLMMJ (or MLMMJ itself) should remove incoming DKIM headers,
> > > and add outgoing DKIM headers  to make MTA Bob happy.
> > 
> > Sorry, but this seem not be the correct solution.
> > 
> > The simple solution to "make Bob happy" is to configure MLMML to not modify message content.
> > 
> > -> no ~list/control/prefix
> > -> no ~list/control/footer
> > 
> > The complex solution is ARC
> > - do DKIM validation
> > - modify a message
> > - DKIM sign the message as MLMMJ entity
> > - ARC seal these data
> > - hope, Bob trust your ARC seal
> > 
> > Andreas
> 
> Not sure about a solution that relies on hope :)
 
:)


> Prefix is clearly valuable (this list uses it) but it breaks DKIM for the
> first message of a thread). The prefix is often used to filter messages into
> a folder, or such like.
> 
> A footer is also valuable as without it lists often contain messages asking
> how to unsubscribe.
> 
> Maybe that was just stating the obvious, but it is a pity if these useful
> features have to be abandoned.
> 
> Not easy to configure DKIM signing when from address is not a managed domain
> (for me anyway). This looks helpful: https://serverfault.com/questions/52830/dkim-sign-outgoing-mail-from-any-domain-with-postfix-and-ubuntu
> 
> I wonder if deliverability would be helped if all mail had a DKIM header for
> the list server domain, irrespective of use of prefix and footer?

Yes, sending out DKIM header helps acceptence where DKIM headers are checked.
And having proper SPF-records helps acceptence where SPF checks are done.

It is no garantee.  It is up to MTA Bob what it will accept.


Groeten
Geert Stappers
-- 
Leven en laten leven

