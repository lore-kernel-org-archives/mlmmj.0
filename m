From: Geert Stappers <stappers@stappers.nl>
Date: Thu, 03 Oct 2019 19:57:11 +0000
Subject: Re: [mlmmj] List server DKIM
Message-Id: <20191003195711.zgksnhjqeipcv5wq@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
In-Reply-To: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Oct 03, 2019 at 09:32:27PM +0200, Morten Kirkegaard wrote:
> On 2019-10-03, at 19:39:21 +0100, jf-mlmmj@bookofsand.co.uk wrote:
> > On Thu, 3 Oct 2019 19:58:30 +0200 you wrote:
> > > I guess you could put "DKIM-Signature:" in the "delheaders" file.
> > 
> > That helps with some ISPs, but the strict ones (eg gmail) will reject
> > anything that claims to be ???From:??? an address in their domain but
> > lacks a DKIM signature. So if you have more than one gmail subscriber,
> > mail from one via your list will be rejected when you try to deliver
> > it to the other(s).
> 
> Okay, if they require their own signature, then I guess he can't add
> content to the mail.


Alice -->  MLMMJ -->  Bob

is realy

Alice -> MTA Alicie -> MTA MLMMJ -> MLMMJ -> MTA MLMMJ -> MTA Bob -> Bob


The MTA, Mail Transfer Agents (e.g. Postfix) do  "DKIM".
MLMMJ does NOT do "DKIM"

MTA MLMMJ (or MLMMJ itself) should remove incoming DKIM headers,
and add outgoing DKIM headers  to make MTA Bob happy.



Groeten
Geert Stappers
-- 
Leven en laten leven

