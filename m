From: Christian Laursen <xi@borderworlds.dk>
Date: Sat, 07 Feb 2009 13:43:23 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <498D8FFB.6020806@borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

> ... and when the webinterface clicks moderate you do the same as if the
> moderator replied to the mail. Just send a mail to the reply-to address
> from your webserver. You know how to construct the correct reply-to when
> you have access to the moderation/ directory.
> 
> And if you send the mail, then you don't have to do anything else, since
> that's not needed with mail moderation either.

I would recommend this approach too. From an administration point of 
view, the only thing neccesary would then be for the web server user to 
have read access to the moderation directory.

-- 
Christian Laursen
