From: Morten Kirkegaard <morten+mlmmj.org@afdelingp.dk>
Date: Thu, 03 Oct 2019 17:58:30 +0000
Subject: Re: [mlmmj] List server DKIM
Message-Id: <20191003175830.jrokipcycftukvth@europa.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
In-Reply-To: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Martin,

On 2019-10-03, at 18:04:48 +0100, Martin Brampton wrote:
> My list server is sending out mail, and I have configured to add a
> footer, a prefix and mailing list headers.
> 
> I don't know if it is those additions, but the messages received by
> list subscribers are failing DKIM checks with wrong body hash.
> 
> Is there a way to fix this please?

If that signature needs to match the mail body, and you want to alter
the body, perhaps you should remove the signature?

I guess you could put "DKIM-Signature:" in the "delheaders" file.

// Moki

