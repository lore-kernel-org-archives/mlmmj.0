From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 27 Jan 2005 09:32:13 +0000
Subject: Re: Moderation
Message-Id: <20050127093212.GN58897@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200501271058.59072.wolf+mlmmj@bergenheim.net>
In-Reply-To: <200501271058.59072.wolf+mlmmj@bergenheim.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Wolf Bergenheim <wolf+mlmmj@bergenheim.net> [Jan 27. 2005 09:59]:
> Hi!
> 
> Is it possible to make moderated lists auto accept posts from certain people? 
> If yes, then how? If not, then consider this a feature request (;

Make access rules like this:

accept From:.*<wolf@bergenheim.net>
accept From:.*<joe@foo.bar>
moderate

Or if you want to use a simple password mechanism:

accept My-Secret-Pass: blabl8p
moderate

In the latter case, don't forget to add My-Secret-Pass: to delheaders.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
