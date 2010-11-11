From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 11 Nov 2010 04:55:06 +0000
Subject: Re: [mlmmj] Potential mail loss in postfix?
Message-Id: <4CDB772A.9000201@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 11/11/10 2:58 PM, Ben Schmidt wrote:
> I might have found this bug.
>
> If init_sockfd() fails (e.g. because Postfix has shut down so there is no smtpd
> listening) it calls exit(). Mail would then fail to be archived or requeued. It
> will be in a queue file only until mlmmj-maintd cleans it up (which it will do as
> soon as it finds it, as it won't have accompanying .mailfrom etc. files).
>
> Do you have logs from when this happened? Do you see "Could not get socket" or
> "Could not connect to %s, exiting..." (%s probably is 127.0.0.1) in them?

"Could not connect to %s, exiting ..."

Omitted a space before. Correcting myself, just in case you search for
that part of the string and don't find it because of my error. :-)

> Ben.
>
>
>
> On 29/09/10 9:21 AM, Robin H. Johnson wrote:
>> Hi
>>
>> Noticed something, and I don't have a testcase for it yet unfortunately
>> or a suitable setup to re-test on. Instead I've got my analysis of the
>> problem how it's occurred twice now.
>>
>> - Using verp and postfix together first of all (string 'postfix' in the
>> verp file, '100' in maxverprecips).
>> - Pick a list with a lot of subscribers.
>> - This leads to a case where the mlmmj-send invocation takes several
>> minutes to complete for a normal list mail.
>> - (optional) set postfix to hold incoming mail, and you can release it
>> just at the right moment to see it be mlmmj-recieve.
>> - The postfix log will show delivery to mlmmj-recieve.
>> - mlmmj.operation.log will contain a line from mlmmj-process stating
>> that the message was allowed (by your access rules).
>> - Now, while mlmmj-send is running, you're going to execute a normal
>> shutdown of postfix: 'postfix stop' [1]
>> - The mail will be lost completely now. There is no record of it in
>> archive, or any of the queues :-(.
>>
>> [1] The description for 'postfix stop': Stop the Postfix mail system in
>> an orderly fashion. If possible, running processes are allowed to
>> terminate at their earliest convenience.
>>
>
>
>

