From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 10 Aug 2008 16:10:09 +0000
Subject: Re: plain text filter?
Message-Id: <1218384609.13117.7.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <23FCE469-408F-4929-BE24-B71318DD5CA7@davetaylor.name>
In-Reply-To: <23FCE469-408F-4929-BE24-B71318DD5CA7@davetaylor.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Dave,

On Thu, 2008-08-07 at 19:03 -0700, Dave Taylor wrote:
> I need to filter out all MIME components except for the text/plain  
> component of emails that are outbound to the mailing list, so that  
> it's just a text/plain email (no multipart/alternative content either).
> 
> Is there a good way to do this that happens after mlmmj has already  
> filtered for spam and confirmed that the email is from a valid user,  
> but before it goes to the moderation queue?

I think a solution which does "MIME stuff -> mlmmj subonly -> mlmmj
moderation -> mlmmj send" is as good as "mlmmj subonly -> MIME stuff ->
mlmmj moderation -> mlmmj send"?

That way you can just pipe the mail through a program which converts the
mail to plain text (there has got to be a lot programs which does that),
and then pipes the result through mlmmj-recieve [sic]. Wouldn't that
solution work for you?

Morten

