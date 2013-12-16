From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 16 Dec 2013 22:48:39 +0000
Subject: Re: [mlmmj] Problems with microsoft
Message-Id: <52AF8347.5040407@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
In-Reply-To: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, Christian,

Mlmmj-maintd should clean it; it will send a probe, wait a while in case
a bounce comes back, and if it doesn't, it will remove the bounce. If
everything is working properly....

Ben.



On 14/12/13 5:11 AM, Christian Gleerup wrote:
> iw_mail p{margin:0;padding:0;}
> Hello list
>
> I can gladly inform you that my server has finally been allowed to send to Microsoft Again.
>
> Yesterday i manually removed a bunch of email addresses where Microsoft servers had responded 550.
> I removed via command line.
>
> but now when i look in the '.../list/bounce' folder, all the addresses are still there.
> is mlmmj going to clean up here or should I remove them manually?
>
> I can see postfix is still trying to deliver the mails
>
> kind regards
> Christian
>
> -----Original Message-----
>> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au>
>> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj@mlmmj.org
>> Date: 03/12/2013 22:19
>> Subject: Re: [mlmmj] Problems with microsoft
>>
>> On 4/12/13 6:35 AM, Christian Gleerup wrote:
>>> I have now updated to 1.2.18, and id did take some time to get the
>>> list texts right, but it seems to be worken fine now. (I did a make
>>> install, and then moved the installed binaries since the old binaries
>>> was installed in a different location)
>>
>> Perhaps you wanted to give the --prefix argument to configure or
>> something. Nevertheless, I'm sure what you did will have worked fine.
>>
>>> But obviously I still have the problem with sending to hotmail
>>> accounts since that is a different problem... but as i noted in
>>> another mail, hotmail did, when they accepted mails from me, tell me
>>> to take it easy with sending that many mails in a little period of
>>> time.
>>>
>>> so the question is, how can i tell mlmmj+postfix to only deliver x
>>> mails pr. hour to the hotmail domain?
>>
>> I think this is something that should be done at the MTA level, not via
>> Mlmmj. Multiple mailing lists and any other mail routed through the
>> server will all contribute to Hotmail's limit, so only Postfix as the
>> central point of control has enough information to enforce rate
>> limiting. A quick Google turns up this, which should give you a starting
>> point for investigation:
>>
>> http://steam.io/2013/04/01/postfix-rate-limiting/
>>
>>> Also, It will be interesting to see if mlmmj unsubscribes those
>>> subscribers after bouncelife ( days)  with the accounts from the
>>> domain that was taken down 2009.
>>
>> Indeed, it will. If not, something is broken somewhere, and we will have
>> to investigate further....
>>
>> Smiles,
>>
>> Ben.
>
>
>
>
>
>

