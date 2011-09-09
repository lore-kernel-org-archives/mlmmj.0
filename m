From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 09 Sep 2011 22:29:08 +0000
Subject: Re: [mlmmj] Moderated subscription and list-owner approval
Message-Id: <4E6A9334.8080806@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20110909203118.GV22957@barfooze.de>
In-Reply-To: <20110909203118.GV22957@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

The mlmmj-sub currently in version control has an -f switch for this purpose.

http://mlmmj.org/hg/mlmmj/rev/e5286b45f9ca

Ben.



On 10/09/11 6:31 AM, Moritz Wilhelmy wrote:
> Hello,
>
> If subscription is moderated, and users are being subscribed via
> mlmmj-sub, a subscription is sent to the owner/moderators. Given that
> root can do anything to the files subscribers.d, it is not reasonable to
> also require a confirmation mail in this case. Would you mind changing
> mlmmj to not send a confirmation-request mail to the list
> owner/moderators in case someone is subscribed to list where
> control/submod is set, but rather silently subscribe the particular
> users, the way it does it when the flag is not set?
>
> Best regards,
>
> Moritz
>
>
>

