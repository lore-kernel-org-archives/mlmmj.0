From: Christian Gleerup <christian.gleerup@swn.nu>
Date: Sat, 02 Oct 2010 08:14:54 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <1286007294.1785.1.camel@cg-desktop>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I just checked the file, and it indeed contained a whitespace character
(\r)

this must have been an error when I made the mass subscribe system, I
will look out for this, but it would be nice if the system was a bit
more robust, and automatically removed trailing whitespaces :)

I wasn't able to remove the adress by sending a mail either, it said
that I was not a member.

after removing the \r, i was able to unsubscribe

many thanks

Christian.


> Also, have you tried unsubscribing through the mail system (assuming
> it's not a closed list), i.e. by sending mail to
> nyhedsbrev+unsubscribe@... from the problematic address?
> 
> Finally...I should say if it's just this one address, not a recurring
> problem that you need to fix, it wouldn't hurt to find the line in the
> subscribers.d/c file and just remove it with a text editor.
> 
> It would be good to know if that illusive extra whitespace is there
> though, regardless, particularly if you know how the address was
> subscribed, because there may be a bug in Mlmmj we can track down, or
an
> improvement we can make to avoid it happening again.
> 
> Smiles,
> 
> Ben.



