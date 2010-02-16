From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 16 Feb 2010 21:40:39 +0000
Subject: Re: PATCH: Access priority
Message-Id: <4B7B10D7.10303@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B5D7A55.4090302@yahoo.com.au>
In-Reply-To: <4B5D7A55.4090302@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> One possible solution - at least to the bypass moderation problem -
> might be to add another keyword. We could add "send" to force the mail
> past normal moderation procedures.

Exactly what I was thinking after reading the issues you raised above.

> I know it does not fix the meaning of "allow" vs. "moderate" on lists
> which are also subject to regular moderation, but I don't see a way to
> do that without breaking backwards compatibility.

It wouldn't be too big a problem--if it were documented. But it isn't,
so the current behaviour is just unexpected, and I would say wrong. At
least if it's documented, it's unexpected if you don't read the docs,
but right.

Shall I put together a new patch?

Ben.





