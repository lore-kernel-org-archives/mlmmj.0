From: Martin Koch Andersen <martin@925.dk>
Date: Wed, 10 Nov 2010 09:46:09 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <3241B811-15E7-4D3E-9940-1A2EF336E99F@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 09/11/2010 14.01, Ben Schmidt wrote:
> Hmmm.
> 
> /requeue/ will be used whenever delivery fails. I think what will happen
> is that if delivery to any recipient fails, it and all remaining
> recipients will be requeued. So if you are getting a lot of requeues, it
> may well be that there is a bad address on the list that is failing
> every time and causing all later recipients to be requeued. Maybe check
> your mail logs and see if there is any error, or at least have a look at
> what the last address delivered in the first 'batch' for a post is, then
> see in the mlmmj subscribers file what address comes next. Or perhaps
> the first address in the /requeue/x/subscribers file is the one causing
> the problem. Is there anything suspicious about it?

The last address in the requeue/subscribers file did look a bit weird.
And maillog had this:

Nov 10 09:34:30 goulding postfix/smtpd[57926]: warning: Illegal address syntax from localhost[127.0.0.1] in RCPT command: <xxx@hotmail.cp?>
Nov 10 09:34:30 goulding /usr/local/bin/mlmmj-send[58016]: mlmmj-send.c:289: Error in RCPT TO. Reply = [501 5.1.3 Bad recipient address syntax^M ]: No such file or directory

I've unsubscribed this address, and other syntax error ones, from the list now.

> There should always be a /requeue/x/mailfile, though. If that doesn't
> exist, perhaps mlmmj is even crashing.

Could this be a bug in mlmmj? The mailfile was not created today either for the list in question.
I'll perhaps see tomorrow, with the invalid addresses removed, if it is.

> What OS are you using, and what filesystem is your mlmmj listdir on?
> Maybe something system-dependent is coming up if rename() is failing.

FreeBSD and UFS.

-- 
Martin Koch Andersen
http://925.dk

