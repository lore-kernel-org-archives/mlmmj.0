From: Martin Koch Andersen <martin@925.dk>
Date: Sun, 08 May 2011 17:44:17 +0000
Subject: Re: [mlmmj] How to recover subscribers?
Message-Id: <5AA2B0AE-F94E-4E0D-92A2-575D96B1969D@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <3FC8EB83-700A-42CE-9D89-2968ACAE158B@davetaylor.name>
In-Reply-To: <3FC8EB83-700A-42CE-9D89-2968ACAE158B@davetaylor.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 08/05/2011 19.00, Dave Taylor wrote:
> Unfortunately, last week, my server got listed on the Spamhaus PBL, and it went unnoticed for too long.  As a result, mlmmj decided to unsubscribe 250 users because of excessive bounces.
> 
> Is there any way to recover the email addresses were removed from the subscriber list?

Besides from the obvious, restoring from backup, mlmmj writes to a operation.log file in the list directory the addresses that were "unsubscribed due to bouncing". So you can scan this log file, and resubscribe the addresses that were automatically removed.

Kind regards,

-- 
Martin Koch Andersen
http://925.dk

