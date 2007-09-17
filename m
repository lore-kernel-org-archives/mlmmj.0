From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 17 Sep 2007 19:18:42 +0000
Subject: Re: theoretical automated attack against mlmmj
Message-Id: <20070917191842.GA42438@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <w537imqugxq.fsf@fozzie.woozle.org>
In-Reply-To: <w537imqugxq.fsf@fozzie.woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christian Laursen <xi@borderworlds.dk> [Sep 17. 2007 19:13]:
> > AFAIK this problem exists with ezmlm as well, which uses the same
> > technique as mlmmj (oddly enough :-).
> 
> Perhaps adding "Precedence: bulk" to the confirmation mails would take
> care of this problem. My guess would be, that the paypal
> auto-responder will then ignore the mails.
> 
> Adding "Precedence: list" to regular mails sent to the list could also
> be a good idea.

Very good idea. This is for mlmmj-send.c IIRC. Care to cook up a patch?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
