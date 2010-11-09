From: Martin Koch Andersen <martin@925.dk>
Date: Tue, 09 Nov 2010 10:59:18 +0000
Subject: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <57F9CAD7-18A3-463F-B314-53CB209B6A5F@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 09/11/2010 11.34, Martin Koch Andersen wrote:
> 
> One more information. I have "noarchive" enabled for all lists. So what happens to the subscribers ending up in requeue? How can mails be re-sent, when the original mail is not stored anywhere? So how can requeue be processed when noarchive is enabled?

Sorry about the spamming. But I just looked through the mlmmj src/, and apparently with "noarchive", there is supposed to be a mailfile in "%s/requeue/%d/mailfile".

For this list, there is no much mailfile (for any index)! For the other lists we have, the mailfile is there. All the lists are configured exactly the same way, and permissions are the same etc. So it's a bit weird why "%s/requeue/%d/mailfile"'s are missing for the list in question. 

-- 
Martin Koch Andersen
http://925.dk

