From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 12 Mar 2005 20:04:18 +0000
Subject: Re: exim4
Message-Id: <20050312200418.GT12734@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Drake Wyrm <wyrm@haell.com> [Mar 12. 2005 15:36]:
> > > btw, why is it needed to run the mlmmj-tools always with full path? It's 
> > > a little annoying.
> > 
> > It's needed to figure out where the other mlmmj binaries are located.
> 
> I've wondered about that myself. If the binaries are installed somewhere
> in $PATH, wouldn't that provide sufficient method for finding them?

I would prefer for security reasons not to start parsing environment
variables. Besides, with this method, you can have many mlmmj
installations in parallel.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
