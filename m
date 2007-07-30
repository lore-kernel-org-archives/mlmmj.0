From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 30 Jul 2007 21:04:33 +0000
Subject: Re: question about tunable option
Message-Id: <684efbbc486a57cda2049f1ad20a98b1@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Charlie Brady <charlieb@budge.apana.org.au> wrote:
>>> mlmmj should never see a message with a line in the
>>> message header starting 'From '.

Yes it will. Sendmail adds that line before piping the message
to an external program, such as mlmmj.

>> Point taken. But in case there is one--I want to delete it.
>> I've seen mails to lists with From in it.
> 
> Really? Really truly? If you see it, it almost certainly didn't
> arrive via SMTP.

It could have. See above.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

