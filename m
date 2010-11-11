From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 11 Nov 2010 00:41:23 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <4CDB3BB3.6050303@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Also, can you confirm which mlmmj version you are using? Thanks.
Ben.



On 11/11/10 11:36 AM, Ben Schmidt wrote:
>> The last address in the requeue/subscribers file did look a bit weird.
>> And maillog had this:
>>
>> Nov 10 09:34:30 goulding postfix/smtpd[57926]: warning: Illegal address syntax
>> from localhost[127.0.0.1] in RCPT command:<xxx@hotmail.cp?>
>> Nov 10 09:34:30 goulding /usr/local/bin/mlmmj-send[58016]: mlmmj-send.c:289:
>> Error in RCPT TO. Reply = [501 5.1.3 Bad recipient address syntax^M ]: No such
>> file or directory
>
> Thank you. The "No such file or directory" message is bogus; fixing this
> is on the to do list; the rest is relevant.
>
> Any idea how the address got there? I suspect it's come through
> mlmmj-sub via a web interface or something? I know mlmmj-sub doesn't
> have particularly adequate validation at present.
>
>> I've unsubscribed this address, and other syntax error ones, from the list now.
>>
>>> There should always be a /requeue/x/mailfile, though. If that doesn't
>>> exist, perhaps mlmmj is even crashing.
>>
>> Could this be a bug in mlmmj? The mailfile was not created today either for the
>> list in question.
>> I'll perhaps see tomorrow, with the invalid addresses removed, if it is.
>
> It most certainly could be. I've had a look at the relevant code and
> can't quickly spot a bug, though.
>
> There isn't a followup error message after the Error in RCPT TO, is there? I don't
> expect one, but it's worth checking!
>
> The person is a regular subscriber, not digest, right?
>
>>> What OS are you using, and what filesystem is your mlmmj listdir on?
>>> Maybe something system-dependent is coming up if rename() is failing.
>>
>> FreeBSD and UFS.
>
> OK. Good to know. Once we're closer to finding what's going on, this
> might make a difference.
>
> Ben.
>
>
>
>
>
>

