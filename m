From: "Ryein C. Goddard" <ryein@goddardlabs.com>
Date: Thu, 09 Jan 2014 20:33:56 +0000
Subject: RE: [mlmmj] TUNEABLES relayhost and smtpport
Message-Id: <004c01cf0d7a$1ee132c0$5ca39840$@goddardlabs.com>
List-Id: <mlmmj.mlmmj.org>
References: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
In-Reply-To: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Is there a demo of this software some where, or at least screenshots?  I am thinking about testing it out, but want to compare it with other solutions I have been exploring.

-----Original Message-----
From: mlmmj@mlmmj.org [mailto:mlmmj@mlmmj.org] On Behalf Of Ben Schmidt
Sent: Thursday, January 9, 2014 12:22 PM
To: Andreas Schulze; mlmmj
Subject: Re: [mlmmj] TUNEABLES relayhost and smtpport

On 9/01/14 8:29 AM, Andreas Schulze wrote:
> could it be that both TUNEABLES are only used to forward valid messages.
> What about rejects for example if a nonmember send to a list where 
> control/subonlypost exist?
> To mee it looks like this type of messages is not injected via 
> relayhost/smtpport but /usr/sbin/sendmail. Do I somthing wrong?

Everything should use relayhost/smtpport. All mail Mlmmj sends is sent by mlmmj-send, and it always does it by SMTP to relayhost on smtpport.

What makes you think it isn't?

Ben.








