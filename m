From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 20 Mar 2016 22:52:12 +0000
Subject: Re: [mlmmj] Diagnostic-Code: x-unix; internal software error / Command time limit exceeded: "/usr/lo
Message-Id: <56EF299C.5020009@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
In-Reply-To: <266C729B-6A87-42DA-A5F3-AAB5827EE39E@wolfgarten.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi, Sebastian,

Yes, your config looks OK.

I think your answer might be here:

http://www.postfix.org/postconf.5.html#command_time_limit

A default of 1000 seconds would correspond roughly to Christian's report of "20 
minutes later" as 1000 seconds is 16m40s.

Perhaps have a look with `postconf' to see if that value is still in place.

It can be overridden in a transport-specific way, too:

http://www.postfix.org/postconf.5.html#transport_time_limit

(I guess this means the directive would be mlmmj_time_limit in your case.)

Again, perhaps check with postconf.

I would expect you to see *something* in your mail.log about this. Perhaps grep it 
for "time limit exceeded" because I believe it might be just hidden at the end of 
a line about an attempted delivery, e.g. I found a similar report at 
<http://www-01.ibm.com/support/docview.wss?uid=swg21503353> where the log line in 
question was

Jun 20 09:39:18 postfix/pipe[11451]: 6ED022391325: to=<recipient@example.com>, 
relay=filter, delay02, status=bounced (Command time limit exceeded: 
"/tmp/etc/postfix/wvpostqfilter")

It would probably be worth having a bit of a fish around to see if you can find 
those messages, though I doubt they give all that much additional information 
above what you already know.

Perhaps a next step would be to see if (in a dummy list and/or with a dummy 
transport) you can make it worse and get the same result if you decrease the 
configuration.

You may also want to ask the question as to whether your list is large enough and 
your system loaded enough that it warrants such a large delivery time. Perhaps 
something unrelated is going on on the server that is causing it to be slower than 
it should be and some general monitoring is in order.

Does that help?

Ben



On 17/03/2016 7:22 am, Sebastian Wolfgarten wrote:
> Dear Ben,
>
> thanks for listening and following up! I am happy to contribute to finding the root cause of this (potential) issue.
>
> Here is a quick overview of what I have:
>
> FreeBSD 10.1 (AMD64)
> Postfix 3.1.0
> mlmmj 1.2.17.1
>
> So overall, pretty standard and nothing extraordinary I would say. Here is an overview of my config (basically taken from http://mlmmj.org/docs/readme-postfix/):
>
> —
>
> 1) Create mlmmi user
> # id mlmmj
> uid21(mlmmj) gid21(mlmmj) groups21(mlmmi)
>
> 2) Create home dir and give it to mlmmi user
>
> # ls -la /var/spool
> (…)
> drwxr-xr-x  33 mlmmj  mlmmj   45 21 Okt 22:38 mlmmj
>
> 3) Amend configuration of Postfix's master.cf
>
> # grep mlmmj /etc/postfix/master.cf
> # mlmmj mailing lists
> mlmmj   unix  -       n       n       -       -       pipe
>     flags=DORhu user=mlmmj argv=/usr/local/bin/mlmmj-recieve -F -L /var/spool/mlmmj/$nexthop
>
> 4) Amend main.cf of Postfix
>
> # grep mlmmj /etc/postfix/main.cf
> virtual_alias_maps = hash:/etc/postfix/virtual,hash:/var/spool/mlmmj/virtual,mysql:/etc/postfix/mysql_virtual_alias_maps.cf
> transport_maps = regexp:/etc/postfix/transport,hash:/var/spool/mlmmj/transport
> mlmmj_destination_recipient_limit = 1
> recipient_delimiter = +
>
> 5) Create file system structure for mailing list (flat file structure):
>
> # ls -la /var/spool/mlmmj/newsletter
> total 77
> drwxr-xr-x  15 mlmmj  mlmmj    17  8 Nov 15:14 .
> drwxr-xr-x  33 mlmmj  mlmmj    45 21 Okt 22:38 ..
> drwxr-xr-x   2 mlmmj  mlmmj    14 11 Jan 18:06 archive
> drwxr-xr-x   2 mlmmj  mlmmj   140  4 Mär 22:04 bounce
> drwxr-xr-x   2 mlmmj  mlmmj     7 28 Sep 22:39 control
> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 digesters.d
> drwxr-xr-x   2 mlmmj  mlmmj     2 10 Mär 21:26 incoming
> -rw-r--r--   1 mlmmj  mlmmj     2  4 Mär 21:33 index
> -rw-------   1 mlmmj  mlmmj  1234  4 Mär 21:33 mlmmj.operation.log
> drwxr-xr-x   2 mlmmj  mlmmj    12 10 Mär 21:26 moderation
> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 nomailsubs.d
> drwxr-xr-x   3 mlmmj  mlmmj     3 10 Mär 21:26 queue
> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 requeue
> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 subconf
> drwxr-xr-x   2 mlmmj  mlmmj    27  7 Mär 06:13 subscribers.d
> drwxr-xr-x   2 mlmmj  mlmmj    36  7 Sep  2015 text
> drwxr-xr-x   2 mlmmj  mlmmj     2  7 Sep  2015 unsubconf
>
> Note: In the operation.log there is nothing to suggest why the mailing list is malfunctioning sometimes.
>
> 6) Creation/amendment of transport and virtual file for mlmmj and Postfix integration:
>
> # grep newsletter /var/spool/mlmmj/transport
> elsaalumni.de--newsletter@localhost.mlmmj   mlmmj:newsletter
>
> # grep newsletter /var/spool/mlmmj/virtual
> newsletter@elsaalumni.de    elsaalumni.de--newsletter@localhost.mlmmj
>
> 7) Postmapping and then postfix restart
>
> # postmap /var/spool/mlmmj/virtual
> # postmap /var/spool/mlmmj/transport
> # postfix reload
>
> --
>
> First question: I assume the config is correct, right?
>
> Secondly, yes I checked all file permissions and they should be fine too.
>
> Now the question is: How can I best troubleshoot the issue? Any further suggestions on where to look for a root cause? My mail logs did not really contain any further information.
>
> Many thanks.
>
> Best regards
> Sebastian
>
>> Am 14.03.2016 um 03:35 schrieb Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:
>>
>> I'm listening, I'm just a bit stumped.
>>
>> I feel like if this was an Mlmmj bug, it would've manifested long ago. Nothing I know of has changed Mlmmj-wise, but this problem has just appeared in the last three months or so.
>>
>> I wonder if something has changed recently in a relevant platform or MTA.
>>
>> Could you confirm your Mlmmj, OS and MTA versions, and anything else you feel might be relevant about your environment?
>>
>> It seems that something is enforcing a command time limit. Not sure if it's via the kernel or not, but I guess it's initiated if not enforced by the shell or MTA.
>>
>> Ben
>>
>>
>>
>> On 14/03/2016 6:45 am, sebastian@wolfgarten.com wrote:
>>> (Resending message to see whether there is anyone who has seen this issue before
>>> or can tell me how to troubleshoot this - thanks. And sorry for the double-posting.)
>>>
>>> Hi,
>>>
>>> I am running mlmmi 1.2.17.1 on FreeBSD 10 and I have come across a very strange
>>> issue similar to the one described by a guy in December last year (see
>>> http://mlmmj.org/archive/mlmmj/2015-12/0000000.html).
>>> Basically I have a mailing list (besides many others that are working fine!) for
>>> which some people receive emails, others are not getting any messages. The
>>> moderators are sometimes also getting no messages to approve or they do receive
>>> the following error:
>>> —
>>> This is the mail system at host waldfest.wolfgarten.com
>>> <http://waldfest.wolfgarten.com>.
>>>
>>> I'm sorry to have to inform you that your message could not
>>> be delivered to one or more recipients. It's attached below.
>>>
>>> For further assistance, please send mail to postmaster.
>>>
>>> If you do so, please include this problem report. You can
>>> delete your own text from the attached returned message.
>>>
>>>                     The mail system
>>>
>>> <elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmmj
>>> <mailto:elsaalumni.de--newsletter+moderate-7d4f69f9439871f4@localhost.mlmmj>>: Command
>>>      time limit exceeded: "/usr/local/bin/mlmmj-recieve"
>>>
>>> --
>>> Alternatively I have had situations, in which I am getting the „x-unix; internal
>>> software error" message - anyone seen the same?
>>> In the logs I cannot find anything which looks like an error - any ideas on how to
>>> best troubleshoot this?
>>> Thanks.
>>> Best regards
>>> Sebastian
>

