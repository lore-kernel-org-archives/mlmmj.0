From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Mon, 16 Oct 2023 13:21:22 +0000
Subject: Re: [mlmmj] Release 1.4.0 rc1
Message-Id: <20231016-cleft-gumdrop-8e5225@meerkat>
List-Id: <mlmmj.mlmmj.org>
References: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
In-Reply-To: <rxctul3imfit4sazeyjfqdyjcbbmc6lwbjpfzmenqcxteprejn@ovaxslejroq7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, Oct 14, 2023 at 11:40:38PM +0200, Baptiste Daroussin wrote:
> > > I think I found a bad problem with postfix+verp. The first batch of mail goes
> > > out correctly, but when the maxverprecips number is hit, what goes out to the
> > > next batch of recipients is just blank messages with no headers.
> 
> Fixed:
> https://codeberg.org/mlmmj/mlmmj/commit/8184971b809e3f261a8cb338322cf2fef65c6908

Confirmed, thank you!

-K

