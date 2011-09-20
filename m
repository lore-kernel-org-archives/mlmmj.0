From: "Yuri D'Elia" <wavexx@thregr.org>
Date: Tue, 20 Sep 2011 22:06:09 +0000
Subject: Re: [mlmmj] subonlypost, mlmmj-process and Envelope-from.
Message-Id: <c9867303771473c55b7d3df3e7b63fb2@thregr.org>
List-Id: <mlmmj.mlmmj.org>
References: <b378a388cb0bd163819e87fb371a22eb@thregr.org>
In-Reply-To: <b378a388cb0bd163819e87fb371a22eb@thregr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

 On Mon, 12 Sep 2011 14:33:51 +0200, Yuri D'Elia wrote:
> I patched mlmmj so that Envelope-from: is used for
> processing/subonlypost and access control. From: is used only when
> generating the body of help messages.
>
> This fixed gmane for me.
>
> I also shuffled mlmmj-process.c so that address validation checks are
> performed before using the addresses themselves. listprocess.c could
> also use some extra-cleanup (efrom is validated in 10 different
> places, but could probably be done just once in mlmmj-process.c when
> efrom is extracted).

 Was anyone able to look at this? I've been using this patch on 
 production since then without [noticing] problems.

 Thanks.


