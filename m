From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 14 Sep 2006 09:20:37 +0000
Subject: Re: submod tunable not working for me.. ?
Message-Id: <20060914092037.GA2175@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
In-Reply-To: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Nate Beaty <natebeaty@gmail.com> [Sep 14. 2006 08:45]:
> Perfect timing -- I just started a discussion list which needed  
> subscription moderation! However, I cannot get it to work for the  
> life of me.
> 
> I compiled the latest mlmmj and added a file "submod" with a single  
> email to my control/ directory, and when I attempt to subscribe  
> myself to the list, I first get the confirmation request via email,  
> which I respond to, and then I get a Mail Delivery failure:
> 
> >  comix+confsub-2234c52a6b0c615d-natebeaty=gmail.com@lists.clixel.com
> >    local delivery failed


This has nothing to do with subscriber moderation, since it's a
confirmation of subscription issue.

Subscriber moderation code doesn't kick in before after the subscriber
have acknowledged it's his/hers emailaddress.

What mailserver etc.? Did previous mlmmj versions work?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
