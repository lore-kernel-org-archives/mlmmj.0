From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Tue, 07 Jul 2009 19:17:43 +0000
Subject: Re: moderation only by sender
Message-Id: <DC9B3B49-8C56-4806-9BC7-E683590DF31B@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 07/07/2009, at 20.50, Morten K. Poulsen wrote:

>> From the patch:
> +	tmp = concatstr(2, efromsender, "\n");
> +	if(ifmodsendonlymodmoderate && strcasestr(moderators, tmp)) {
>
> This substring matching will fail in some corner cases, like me  
> being a
> moderator with mortenp+mlmmj@mmj.dk and you sending a mail from
> mmj@mmj.dk.


Originally I had:

tmp = concatstr(3, "\n", efromsender, "\n");

Others, you're right. New patch coming up.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.


