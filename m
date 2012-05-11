From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Fri, 11 May 2012 13:42:55 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <a926eda1c4b526f3b11c144d39f537c5@imap.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 2012-05-11 15:20, Ben Schmidt wrote:
> I second what Christian says. It sounds like the SPF checking is
> broken. It should be against the envelope-from. Checking against the
> "From:" header is wrong and bad for a number of reasons.

yes, I forgot that mlmmj already implements verp for the envelope from 
(or "mail from" as I simplisticly called it) :-)
So I agree here as well.

Franky

