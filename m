From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 16 Oct 2004 16:34:09 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <20041016163409.GG48081@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Andrew Kohlsmith <akohlsmith-mmj@benshaw.com> [Oct 16. 2004 16:43]:
> > What's the To: header, Delivered-To: header and contents of
> > listdir/control/listaddress?
> 
> The To: and Delivered-To: headers were in the original emal, but I think I see 
> the problem now; To: is to mixdown.ca, Delivered-To: is to gromit.mixdown.ca 
> and listaddress is mixdown.ca.
> 
> I'll play with this a little more.  :-)

Does it work if you touch listdir/control/tocc ?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
