From: Baptiste Daroussin <bapt@nours.eu>
Date: Sat, 14 Oct 2023 21:40:38 +0000
Subject: Re: [mlmmj] Release 1.4.0 rc1
Message-Id: <nn6ewkmklnwtbqfdwsnebkiggpifcwba3fo3n3ge4r6urnui2n@rogyxkzsqrwi>
List-Id: <mlmmj.mlmmj.org>
References: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
In-Reply-To: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Oct 13, 2023 at 10:44:16PM +0200, Baptiste Daroussin wrote:
> On Fri, Oct 13, 2023 at 04:39:33PM -0400, Konstantin Ryabitsev wrote:
> > On Fri, Oct 13, 2023 at 06:05:24PM +0200, Baptiste Daroussin wrote:
> > > I needs a lot of testing, I do plan to switch the entire FreeBSD mailing list to
> > > this rc1 version to battle test it, if you can also test it on your side that
> > > would be helpful, it would be nice if we can get a 1.4.0 release as solid as the
> > > one you have been used to with previous releases.
> > 
> > I think I found a bad problem with postfix+verp. The first batch of mail goes
> > out correctly, but when the maxverprecips number is hit, what goes out to the
> > next batch of recipients is just blank messages with no headers.
> > 
> > I was able to replicate this with:
> > 
> > control/verp = postfix
> > control/maxverprecips = 2 (or some number lower than the number of subscribers)
> > 
> > I'm happy to help test this further.
> > 
> > -K
> 
> Thank you for this report, I will try to reproduce!
> 
> Best regards,
> Bapt
> 
> 

Fixed:
https://codeberg.org/mlmmj/mlmmj/commit/8184971b809e3f261a8cb338322cf2fef65c6908

I added a unit test for this case, so at least this one should not break again.

I will let people test a bit more and will issue a rc2 early next week!

Thanks again for the report.

Best regards,
Bapt

