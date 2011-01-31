From: Florian Effenberger <floeff@gmail.com>
Date: Mon, 31 Jan 2011 12:05:56 +0000
Subject: Re: [mlmmj] mlmmj and GMANE posting
Message-Id: <AANLkTinVkEWUDk7DO8BOxC6VO1_4tc-E6SQ7BC8W2D=F@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTik-oBQtEUfMXR3LxYRrrDz4ay_9uvF+gwrPujx9@mail.gmail.com>
In-Reply-To: <AANLkTik-oBQtEUfMXR3LxYRrrDz4ay_9uvF+gwrPujx9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi Ben,

2011/1/27 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:

> On 21/01/11 9:38 PM, Florian Effenberger wrote:
>> I looked in the file, but it didn't solve my problem. What exactly
>> should be in the access file, to allow messages with a GMANE header
>> (like X-Gmane-...) pass through without moderation, even if the sender
>> is not a subscriber?
>
> Something like
>
> =A0 send ^X-Gmane-

maybe this should be documented in
http://mlmmj.org/hg/mlmmj/file/tip/README.access as well? At least
from reading the file, I didn't even understand "send" was an allowed
action. :)

> On inspection, though, this will only work if modnonsubposts is on. If
> non-subscriber posts are not moderated, but are denied, this won't work
> (which is a bug, really; I'll whack it in the tracker as something to be
> fixed later...).

Thanks!

Florian


