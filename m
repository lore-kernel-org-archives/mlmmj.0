From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Fri, 16 Mar 2012 12:07:21 +0000
Subject: Re: [mlmmj] How to disable bounce probes
Message-Id: <4F632CF9.1010306@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4F625B33.4000802@pub.positon.org>
In-Reply-To: <4F625B33.4000802@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 16/03/12 13.05, Ben Schmidt wrote:
>> Another option is to not run mlmmj-maintd.
>
> Off the top of my head I can't remember exactly what mlmmj-maintd does,
> but doesn't it do other things that shouldn't be disabled, like
> requeuing mail on temporary SMTP failures and sending digests and stuff?

Absolutely. But in the use cases that I know of, where bounces are 
uninteresting due to spam, public lists, etc. people have realized that 
all the mlmmj-maintd functionality is something that is good to disable.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.

