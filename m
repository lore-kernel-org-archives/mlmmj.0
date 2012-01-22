From: Mark Alan <varia@e-healthexpert.org>
Date: Sun, 22 Jan 2012 12:45:26 +0000
Subject: Re: [mlmmj] decoding base64 moderation messages
Message-Id: <20120122124526.7197b85c@e-healthexpert.org>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTikyTra-+1+sEFp4mw1i51rb02PgK5A_kWc=nqw8@mail.gmail.com>
In-Reply-To: <AANLkTikyTra-+1+sEFp4mw1i51rb02PgK5A_kWc=nqw8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, 19 Jan 2011 12:44:11 +0100, Florian Effenberger
<floeff@gmail.com> wrote:

> last weeks. :-) One questions: Do newer mlmmj versions support
> decoding base64 moderation messages? I often receive messages like
> Content-Transfer-Encoding: base64

Hello Florian,

Were you ever able to solve this issue?
It is very annoying to have to manually decode those messages:

1. Search for the message number (lets assume that its base64 starts
with TXVpdG and ends with 0KDQo=):
grep -r 'TXVpdG' /path/to/Mail/Local/*

2. and then decode it
sed -n '/TXVpdG/,/0KDQo=/p;s/^[ ]*//' /path/to/Mail/Local/mail-list-path/436
| openssl enc -d -base64

It would be nice to have it properly done by mlmmj.


M.

