From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 09 Jan 2014 20:22:16 +0000
Subject: Re: [mlmmj] TUNEABLES relayhost and smtpport
Message-Id: <52CF04F8.10401@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
In-Reply-To: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 9/01/14 8:29 AM, Andreas Schulze wrote:
> could it be that both TUNEABLES are only used to forward valid messages.
> What about rejects for example if a nonmember send to a list where
> control/subonlypost exist?
> To mee it looks like this type of messages is not injected via relayhost/smtpport but
> /usr/sbin/sendmail. Do I somthing wrong?

Everything should use relayhost/smtpport. All mail Mlmmj sends is sent
by mlmmj-send, and it always does it by SMTP to relayhost on smtpport.

What makes you think it isn't?

Ben.




