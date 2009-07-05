From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 05 Jul 2009 06:46:58 +0000
Subject: Re: Subscribing a big amount of users (and moderation only by sender flag)
Message-Id: <9494311B-7B2D-4FAC-BD2A-E66F33AF869D@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4A501264.4060106@goirand.fr>
In-Reply-To: <4A501264.4060106@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 05/07/2009, at 4.39, Thomas Goirand wrote:

> Also, just a quick question. When we have thousands of customers,  
> using
> mlmmj-subscribe thousands of times just doesn't make sense and is too
> slow (maybe just because of the process forks)... Because I wanted to
> avoid doing so many fork, I do rebuild the subscribers.d content  
> myself,
> using our internal data in MySQL, and writing the folder content  
> myself
> with PHP. Is that an issue?


No, it's not an issue. Any emailaddress (one per line) in any file in  
subscribers.d/ is being used. So you can do whatever you want, only  
rule for mlmmj is what I just wrote :)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.


