From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 20:03:43 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using
Message-Id: <Pine.LNX.4.61.0601211503000.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Thu, 19 Jan 2006, Morten K. Poulsen wrote:

> Quoting Charlie Brady <charlieb@budge.apana.org.au>:
>> Without any log file information at all, and with a "success"
>> status, it's difficult to know what is wrong.
>
> True.
>
>> IMO this silent (non-)success is a significant design flaw.
>
> I don't think it is a *significant* design flaw, but what do I know.
>
> The attached patch adds log messages at all points where a mail is discarded. 
> Could you please try it, and see if it helps you?

It doesn't - we must still be hitting some other "unlink and exit" 
condition.
