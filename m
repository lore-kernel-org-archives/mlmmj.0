From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 18 Feb 2007 11:53:44 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <20070218115344.GD81298@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christoph Wilke <chris@filmkreis.tu-darmstadt.de> [Feb 16. 2007 20:21]:
> In my understanding prepstdreply() creates a real file and
> return its descriptor. Mlmmjsend() only operates on this
> existing fd (queuefilename) and shouldn't care about
> donemailname and mailfile.

It doesn't return a fd, but a char* with the filename for sending. Just
returning the fd, would leave the caller without knowing what the
filename is, and in many cases the user of prepstdreply() don't have to
open the file again--just pass the filename on to mlmmj-send.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
