From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 10 Oct 2010 22:31:01 +0000
Subject: Re: [mlmmj] text template bug in Ubuntu package
Message-Id: <4CB23EA5.7000907@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTikk5ZKs3C=y2GOabbeRf2=WTApsNdauTaxHPYR-@mail.gmail.com>
In-Reply-To: <AANLkTikk5ZKs3C=y2GOabbeRf2=WTApsNdauTaxHPYR-@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thanks for the report, Florian,

I found the bug in the German list text. I presume that was the language you were 
referring to?

I have fixed it locally and will push the change out to version control shortly.

It is up to Debian/Ubuntu/Thomas, I think, when/how to get the change into the 
distro's package.

Ben.



On 11/10/10 3:12 AM, Florian Effenberger wrote:
> Hi,
>
> I found out about a text template bug in the Ubuntu (10.04) package.
> It says "$orignalmail" instead of "$originalmail", which renders
> moderation message quite useless. Anyone working that?
>
> Florian





