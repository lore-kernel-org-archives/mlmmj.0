From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 01 Feb 2005 10:31:02 +0000
Subject: Re: mlmmj-1.2.2 released. Upgrade recommended.
Message-Id: <20050201103102.GA88505@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050201093217.GK64378@mmj.dk>
In-Reply-To: <20050201093217.GK64378@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Feb 01. 2005 10:32]:
> 1.2.2
>  o Make mlmmj-send work allthough no subscribers exist

Forgot to mention;

This bug made the mlmmj-maintd process hang in the case where no people
were subscribed to digests. No mail got lost or anything, since noone
were expected to get any mail, but you might want to check if there's
some hanging mlmmj-maintd or send processes on the system.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
