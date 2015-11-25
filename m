From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 25 Nov 2015 23:52:18 +0000
Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <565649B2.5050003@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <2814c8bd343523366b23a6289b918a5f@swn.nu>
In-Reply-To: <2814c8bd343523366b23a6289b918a5f@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ideas:

See if you can submit a mail using /usr/sbin/sendmail which is delivered to Mlmmj 
or not. If that doesn't work, something is wrong with the Postfix configuration.

Then check further outwards. Are you firewalled? Is Postfix listening on external 
interfaces, or loopback only? Can you connect to port 25 of the server with telnet 
externally?

Ben



On 25/11/2015 9:04 pm, Christian Gleerup wrote:
> Hi again list,
>
> There still seems to be a problem,
> Now I have a doubt if the server receives the mail at all and the errors was all from old mailqueue that I copied from the old server?
>
> any hint on what I should look at besided DNS/MX-records?
>
>
> -----Original Message-----
>> From: "Christian Gleerup" <cromozon@swn.nu>
>> To: mlmmj@mlmmj.org, "Morten Shearman Kirkegaard" <moki@fabletech.com>
>> Date: 24/11/2015 14:48
>> Subject: Re[2]: [mlmmj] Configuration problems using mlmmj+postfix
>>
>> Morten and Piotr
>>
>> I have updated and deleted the emails, now the 'editor' just need to write a new newsletter and see if it is send out.
>>
>> thank you both for you help.
>>
>> Kind Regards
>> Christian Gleerup
>>
>>
>> -----Original Message-----
>>> From: "Morten Shearman Kirkegaard" <moki@fabletech.com>
>>> To: mlmmj@mlmmj.org
>>> Date: 24/11/2015 13:48
>>> Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix
>>>
>>> On 2015-11-24 at 08:45:07 +0100, Christian Gleerup wrote:
>>>> you are right, the port is overridden in
>>>>
>>>> /etc/mlmmj/nyhedsbrev/control/smtpport
>>>>
>>>> the old server must have listened to port 10025.
>>>> would you recomend me just changing it to 25?
>>>
>>> Yes, and you can do that by just removing the "smtpport" file.
>>>
>>>> should I just empty the /var/spool/mlmmj/nyhedsbrev/queue using the
>>>> commandline or should i use some mlmmj command?
>>>
>>> The command line is fine.
>>>
>>> Kind regards,
>>> Morten
>>>
>>>
>>>
>>>
>
>
>
>

