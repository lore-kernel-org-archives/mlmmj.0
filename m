From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 18 Jun 2006 09:24:27 +0000
Subject: Re: Mail sent to mlmmj-recieve but MLMMJ don't send subscribe confirmation
Message-Id: <20060618092427.GE36678@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <44916980.7060706@goirand.fr>
In-Reply-To: <44916980.7060706@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Jun 18. 2006 08:42]:
> > Did you change your command delimeter to a '-' (minus sign)?
> > If not, this might be the problem and the address should read:
> > testzigo+subscribe@stoppnazistene.no
>
> Yes, my control panel does that setup as default. This might change in
> the future, as I've noticed that using the '-' delimiter prevent from
> using "my-address@my-domain.com". Anyway, this is NOT the problem.
> 
> I'll try to use the extensive logs from Martin next week, when I have
> finished the migration of my ns2 (which is giving me headaches).

Then be aware that if there's more than 1 recipient delimiter in the
address, postfix cannot deliver it. I consider it a postfix bug, but
Vietse thinks otherwise.

Just try and deliver to:

testuser-onedelimiter@some.domain

and

testuser-two-delimiters@some.domain

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
