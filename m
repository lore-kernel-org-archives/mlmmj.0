From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Thu, 18 Sep 2008 18:06:56 +0000
Subject: Re: Discarding valid mails?
Message-Id: <1221761216.6895.11.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <70E5D1092BCB6440A517A778C1D6E5B437F158@aathal01.aathal.itsolution.local>
In-Reply-To: <70E5D1092BCB6440A517A778C1D6E5B437F158@aathal01.aathal.itsolution.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Rocco,

On Thu, 2008-09-18 at 00:05 +0200, Rocco Siegrist wrote:
> I have a problem. mljmm is discarding all mails complaining that the
> FROM: is missing in the mail header. But the there is a FROM: Field.
> What is going wrong?
...
> /usr/bin/mlmmj-process[26679]: mlmmj-process.c:710:
> Discarding /var/spool/mlmmj/devel/incoming/63bd52cc7df57266 due to
> missing envelope from address: Success

No, it is complaining about a missing SMTP envelope from (MAIL
FROM:<user@example.org>), *not* a missing From: header.

The only case where the SMTP envelope from is allowed to be empty is in
case of bounces (and vacation notices, which are technically also
bounces), but then the SMTP envelope to (RCPT TO:<user@example.org>)
must contain a valid bounce address.

Was it a mail you sent, or perhaps some spammer? They are known for
sending mails which do not comply with the RFCs ;-)

Best regards,
Morten

