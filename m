From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 24 Jul 2007 22:09:04 +0000
Subject: Re: question about tunable option
Message-Id: <20070724220904.GC2073@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Franky Van Liedekerke <liedekef@telenet.be> [Jul 24. 2007 23:06]:
> I see this a bit different: sometimes you want people to be able to
> send to a list, let others moderate it and then it gets send. But for
> eg. a company newsletter, you want it always to appear to be coming
> from a specific address. More general: you don't always want all
> subscribers to know your addresses on the list when a mail gets send.

Then use "From:" in delheaders, and add "From: listname@" in
customheaders. It's very possible :)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
