From: Morten Kirkegaard <morten+mlmmj.org@afdelingp.dk>
Date: Thu, 03 Oct 2019 19:32:27 +0000
Subject: Re: [mlmmj] List server DKIM
Message-Id: <20191003193227.ofejzaseu3c5uizn@europa.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
In-Reply-To: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 2019-10-03, at 19:39:21 +0100, jf-mlmmj@bookofsand.co.uk wrote:
> On Thu, 3 Oct 2019 19:58:30 +0200 you wrote:
> > I guess you could put "DKIM-Signature:" in the "delheaders" file.
> 
> That helps with some ISPs, but the strict ones (eg gmail) will reject
> anything that claims to be “From:” an address in their domain but
> lacks a DKIM signature. So if you have more than one gmail subscriber,
> mail from one via your list will be rejected when you try to deliver
> it to the other(s).

Okay, if they require their own signature, then I guess he can't add
content to the mail.

// Moki

