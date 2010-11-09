From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 09 Nov 2010 13:01:24 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <4CD94624.4010406@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hmmm.

/requeue/ will be used whenever delivery fails. I think what will happen
is that if delivery to any recipient fails, it and all remaining
recipients will be requeued. So if you are getting a lot of requeues, it
may well be that there is a bad address on the list that is failing
every time and causing all later recipients to be requeued. Maybe check
your mail logs and see if there is any error, or at least have a look at
what the last address delivered in the first 'batch' for a post is, then
see in the mlmmj subscribers file what address comes next. Or perhaps
the first address in the /requeue/x/subscribers file is the one causing
the problem. Is there anything suspicious about it?

There should always be a /requeue/x/mailfile, though. If that doesn't
exist, perhaps mlmmj is even crashing.

What OS are you using, and what filesystem is your mlmmj listdir on?
Maybe something system-dependent is coming up if rename() is failing.

Cheers,

Ben.



On 9/11/10 9:59 PM, Martin Koch Andersen wrote:
>
> On 09/11/2010 11.34, Martin Koch Andersen wrote:
>>
>> One more information. I have "noarchive" enabled for all lists. So what happens to the subscribers ending up in requeue? How can mails be re-sent, when the original mail is not stored anywhere? So how can requeue be processed when noarchive is enabled?
>
> Sorry about the spamming. But I just looked through the mlmmj src/, and apparently with "noarchive", there is supposed to be a mailfile in "%s/requeue/%d/mailfile".
>
> For this list, there is no much mailfile (for any index)! For the other lists we have, the mailfile is there. All the lists are configured exactly the same way, and permissions are the same etc. So it's a bit weird why "%s/requeue/%d/mailfile"'s are missing for the list in question.
>


