From: =?UTF-8?B?TWFkcyBNYXJ0aW4gSsO4cmdlbnNlbg==?= <mmj@mmj.dk>
Date: Wed, 30 May 2012 14:17:20 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18.0 released
Message-Id: <4FC62BF0.9090600@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4FC4D9CE.3010906@yahoo.com.au>
In-Reply-To: <4FC4D9CE.3010906@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 30/05/12 16.00, Ben Schmidt wrote:
> One day we might even fix things so you don't need to use the full path
> to invoke the binaries. I certainly find it really annoying, and I don't
> know any other application that requires it. You'd think we could figure
> out what's going on from argv[0] or something.

It's totally possible to just use path - but it's a security question. 
The less you need to parse things from the environment, the better.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.

