From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Fri, 13 Oct 2023 20:39:33 +0000
Subject: Re: [mlmmj] Release 1.4.0 rc1
Message-Id: <20231013-unsmooth-enforcer-796b24@meerkat>
List-Id: <mlmmj.mlmmj.org>
References: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
In-Reply-To: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Oct 13, 2023 at 06:05:24PM +0200, Baptiste Daroussin wrote:
> I needs a lot of testing, I do plan to switch the entire FreeBSD mailing list to
> this rc1 version to battle test it, if you can also test it on your side that
> would be helpful, it would be nice if we can get a 1.4.0 release as solid as the
> one you have been used to with previous releases.

I think I found a bad problem with postfix+verp. The first batch of mail goes
out correctly, but when the maxverprecips number is hit, what goes out to the
next batch of recipients is just blank messages with no headers.

I was able to replicate this with:

control/verp = postfix
control/maxverprecips = 2 (or some number lower than the number of subscribers)

I'm happy to help test this further.

-K

