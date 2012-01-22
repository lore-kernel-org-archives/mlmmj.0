From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 22 Jan 2012 13:05:48 +0000
Subject: Re: [mlmmj] decoding base64 moderation messages
Message-Id: <4F1C09AC.9070207@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTikyTra-+1+sEFp4mw1i51rb02PgK5A_kWc=nqw8@mail.gmail.com>
In-Reply-To: <AANLkTikyTra-+1+sEFp4mw1i51rb02PgK5A_kWc=nqw8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> last weeks. :-) One questions: Do newer mlmmj versions support
>> decoding base64 moderation messages? I often receive messages like
>> Content-Transfer-Encoding: base64
>
> Hello Florian,
>
> Were you ever able to solve this issue?

Mlmmj doesn't decode them, but the new list texts for moderation are
MIME messages which properly include the original message as an
attachment so your mailer should view it. Necessary supporting features
are in version control, and mailing list thread "richer listtext"
details it, I think.

Ben.




