From: Jakob Hirsch <jh@plonk.de>
Date: Wed, 16 Mar 2005 11:42:21 +0000
Subject: Re: exim4
Message-Id: <42381B9D.2000607@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>>>>runs into the same problems as me: return_path_add is needed in the 
>>>>transport calling mlmmj-recieve. I had a hard time finding that out, 
>>>Could you maybe write it into README.exim and send it to me, then I'll
>>>include it.

I put that in http://plonk.de/sw/mlmmj/README.exim4

>>btw, after I had it running, I saw a post in the archive about just this 
>>subject (http://mlmmj.mmj.dk/archive/0154.html). Should have checked the 
>>archives a little more thoroughly...
> The README also has this: "Also make sure that exim will add the
> envelope from in the Return-Path: header."

errr... ok, will go and hit myself with my LART...
