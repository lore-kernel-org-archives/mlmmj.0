From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 20 Oct 2008 11:51:13 +0000
Subject: Re: Problem with loop subject prefix and receiver list
Message-Id: <1224503473.7214.3.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <8084eb8e7d34559538831d3ebbaa84cb.squirrel@mail.newbread.tj.cn>
In-Reply-To: <8084eb8e7d34559538831d3ebbaa84cb.squirrel@mail.newbread.tj.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi 魏,

On Mon, 2008-10-20 at 19:35 +0900, 魏亮 wrote:
> I checked the title and I am sure my "prefix" word is not encoded,just
> went somebody of the list replied my subject "[OurList] Hi everybody",I
> received the title "[OurList] Re:[OurList] Hi everybody".

But perhaps the "Re:[Ourlist]" part is encoded in a way mlmmj does not
(yet) know about. Could you copy the full Subject: header from the mail
with two "[Ourlist]"s and post it here?

I suspect that the subject is encoded in gb2312, or something similar,
which we don't handle today.

Best regards,
Morten

