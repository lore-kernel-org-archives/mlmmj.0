From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 03 Apr 2014 20:30:38 +0000
Subject: Re: [mlmmj] problems with many mails to a subscriber
Message-Id: <533DC4EE.90401@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <33e6f5e35cab1310d0c06eeae4106d27@swn.nu>
In-Reply-To: <33e6f5e35cab1310d0c06eeae4106d27@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Yeah, I agree, it doesn't seem like there's anything truly worth pursuing h=
ere.

Thanks for the brainstorming, though, Christian.

Ben.



On 20/03/14 6:26 AM, Christian Gleerup wrote:
>
> Hi Ben and Piotr.
>
> thanks for the respons,
>
> First, to answer Ben.
>
> I did already yesterday unsubscribe and remove the recipent from the boun=
ce queue
>
> but to answer your question with some technical details that i think coul=
d be used to...
> I don't really know if I would call it an improvement, but a change to ml=
mmj to cope with this...
>
> In the bounce message, there is a link to of the form;
> http://www.openspf.org/Why?id=3DLISTNAME%2Bbounces-973**RECIPENT**%40list=
s.OURDOMAIN&ip=3DTHEIRIP&receiver=3Dmx-g.one.com
> I think the part 973**RECIPENT** matches the filename in the bounce folde=
r (*).
> when you follow the link, the part of interrest is this.
> ***
> mx-g.one.com rejected a message that claimed an envelope sender address o=
f LISTNAME+bounces-973-**RECIPENT**@lists.**OURDOMAIN**.
> mx-g.one.com received a message from smtp2.cybercity.dk (212.242.43.252) =
that claimed an envelope sender address of LISTNAME+bounces-973-**RECIPENT*=
*@lists.**OURDOMAIN**.
> However, the domain lists.**OURDOMAIN** has declared using SPF that it do=
es not send mail through OTHERDOAMIN. That is why the message was rejected.
> ***
> now, from the part 973**RECIPENT**  I think we can deduce that this email=
 probably really originated from us, and that it really isn't spam. (I'm th=
inking that without verification, with the changes im >proposing<, someone =
could try to to change the subscription of someone to someone else)
>
> I guess it would be possible to parse this, and then update the subscript=
ion...
> sadly, I don't have a copy of the bounce mail anymore, which, as I rememb=
er it, included the new email adress.
>
> I really don't know about this, it seems like a lot of Work due to a shit=
ty SPF system...
> but I guess it would be possible, until openSPF changes their format.
>
> if anyone is interested, I can flesh out the details about what I am thin=
king about,
> but once Again, I am not really that keen to this change.
>
> and now Piotr
> we do indeed have the SPF with hard fail.
> I actually hadn't imagine this kind of problem when I changed the spf rec=
ord to -all
> the reason I did this, was because we was blacklisted from Hotmail, wich =
is a very big chunk of our recipent
>
> fun fact; Microsoft do have a Tool,
> http://www.microsoft.com/mscorp/safety/content/technologies/senderid/wiza=
rd/
> where it can suggest the piece of text to write in the SPF record based o=
n some radiobuttons and form fields.
> reagardign the softfail ~all option, they are writting
> "Discouraged; mail may legitimately originate
> from IP addresses not identified above, however,
> use of such IP addresses is discouraged and may
> not be permitted in the future."
>
> now, try to check, the SPF record for Hotmail, guess what, they are using=
 the ~all themself.
> hmm perhaps I am just misreading the 'Discouraged' Word, it's not the sof=
tfail option that is 'discouraged' but simply Microsoft Word for 'softfail'
>
> ohh well,
> This is what I am going to do.
>
> 1) change our SPF to softfail ~all
> 2) change mlmmj-maind to run every 8 hour instead of every 2 hour
> 3) change the bounce life to 5 days instead of 15
>
> thanks Again for the respons, I am really learning all I know about this =
email stuff from these problem we are discussing here.
>
> kind regards.
> Christian
> -----Original Message-----
>> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au>
>> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj <mlmmj@mlmmj.o=
rg>
>> Date: 19/03/2014 07:19
>> Subject: Re: [mlmmj] problems with many mails to a subscriber
>>
>> Hi, Christian,
>>
>> I think you have analysed the situation well.
>>
>> At the end of the day, Mlmmj will keep sending probes as long as those
>> probes keep bouncing (the probe is the "back to normal" message). This
>> is precisely what happened. A mailing list post bounced, so Mlmmj
>> assumed it wasn't delivered (which is perfectly reasonable) and sent a
>> probe to see if things had improved or not; the probe bounced, so Mlmmj
>> sent another probe; this kept happening. Maybe it hasn't even stopped
>> yet.
>>
>> Usually only one probe is received by a user: the final one that didn't
>> bounce.
>>
>> Do check the bounce message carefully. Is there any hint in it that the
>> message actually was delivered? If so, it's possible there is some kind
>> of improvement that can be made. But I doubt that this is the case.
>>
>> IMHO, the most likely cause of the problem is that
>> REAL_NAME@SUR_NAME.COM just turned up their spam filtering by
>> implementing hard fails for invalid SPF.
>>
>> I don't believe we have any way to turn off probes for a single user, so
>> I don't think there's really anything you can do about it from your end.
>> (You can end the current cycle by removing the bounce so the next probe
>> isn't sent, but the next mailing list post will start a new cycle....)
>>
>> Cheers,
>>
>> Ben.
>>
>>
>>
>> On 19/03/14 5:51 AM, Christian Gleerup wrote:
>>> Dear List
>>>
>>> I now again have a recipent from my newsletter complaining about a larg=
e amount of emails stating that 'things are back to normal' from here persp=
ective there never was a problem and se thinks we are spamming her...
>>> The question is, why does she receive more than one email stating that =
things are back to normal.
>>>
>>> In the period, we have sent one newsletter on the following days
>>> 11, 13, 14, 15, 16, 18of March
>>>
>>> I have grepped my log/mail* files, and the following tables shows the n=
umber of occorunces of the recipent.
>>>
>>> #hits for complaining recipent.
>>> mail.info    18
>>> mail.info.1    36
>>> mail.info.2    41
>>> mail.info.3    39
>>> mail.info.4    40
>>> mail.info.5    39
>>> mail.info.6    0
>>> mail.info.7    1
>>> mail.info.8    0
>>>
>>> The customer complained to us on the 16'th, and states that she has rec=
ieved 'spam' from us (since the 13'th)
>>> as you will see from the logs, it is on the 13'th of March that the sys=
tem goes haywire.
>>> the customer complains that she receives this email every 2 hours.
>>>
>>> ** (An interesting side note, is that mlmmj-maind runs every 2 hour)
>>> perhaps I should decrase this to every 4 hour, or perhaps, every 6 hour=
s. what would that mean?
>>>
>>> A normal delivery, from mail.info.7 look like this:
>>> Mar 11 10:05:05 lists postfix/smtp[5956]: 6931746B41: to=3D<**RECIPENT*=
*>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, conn_use4, delay=3D5.=
6, delays=3D0.17/5.4/0.01/0.03, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: q=
ueued as 15A8A10888E)
>>>
>>> I have looked in mlmmj.operation, and it does not contain anything with=
 **RECIPENT** (timespan is from 1'th of March until now (18'th of March))
>>>
>>> I have looked in the bounce.lastmessage mail.
>>> And there there is a reason from openspf.org, as to why it is rejected,
>>> apparantly. <**RECIPENT**> is forwarding the email to <**RECIPENT_REAL_=
NAME@SUR_NAME.COM**> and it is then rejected due to our SPF stating the IP =
we have allowed sending from.
>>> the not so funny thing is, that <**RECIPENT**> writes to us from the em=
ail that is forwarding...
>>>
>>> so I guess the scenario is,
>>> we send to <**RECIPENT**>
>>> <**RECIPENT**> forwards a copy to <**RECIPENT_REAL_NAME@SUR_NAME.COM**>
>>> <**RECIPENT_REAL_NAME@SUR_NAME.COM**> complains that the mail comes fro=
m a wrong IP according to our SPF record.
>>> the person the checks probably both <**RECIPENT**> and <**RECIPENT_REAL=
_NAME@SUR_NAME.COM**>, and since the behaviour above,
>>>
>>> so I guess, that ultimately, the problems seems also to be related to h=
er setup, but why would se recieve the 'things are back to normal' mail?
>>>
>>> Any input would be greatly appreciated
>>> King Regards
>>> Christian
>>>
>>> In mail.info.5, I then have this:
>>> D:\log\mail.info.5
>>> 15152: Mar 13 09:07:25 lists postfix/smtp[17905]: 1181E46B00: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, conn_use9, del=
ay=3D5.1, delays=3D0.2/4.8/0.01/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0=
 Ok: queued as 2831C1088D5)
>>> 15296: Mar 13 09:07:25 lists postfix/pipe[17657]: 64BC246B20: to=3D<**l=
istname**+bounces-969-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.16, delays=3D0.01/0.13/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered v=
ia mlmmj service)
>>> 15331: Mar 13 09:07:25 lists postfix/pipe[17880]: 7BF6D46B24: to=3D<**l=
istname**+bounces-969-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.22, delays=3D0.1/0.1/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 32370: Mar 13 10:00:20 lists postfix/qmgr[11168]: E67C446C83: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=972, nrcpt=
=3D1 (queue active)
>>> 32535: Mar 13 10:00:22 lists postfix/smtp[18834]: E67C446C83: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.2, d=
elays=3D0.05/1/0.04/0.09, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued =
as 21FC0108881)
>>> 32588: Mar 13 10:00:22 lists postfix/pipe[18750]: 5CF4E46C7C: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.02, delays=3D0.02/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 32633: Mar 13 10:00:22 lists postfix/pipe[18750]: 9EA1A46C92: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.07/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 46612: Mar 13 12:00:22 lists postfix/qmgr[11168]: 5C42646C2C: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=972, nrcpt=
=3D1 (queue active)
>>> 46852: Mar 13 12:00:24 lists postfix/smtp[21555]: 5C42646C2C: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.9, d=
elays=3D0.22/1.4/0.04/0.21, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 41B8F10891A)
>>> 46897: Mar 13 12:00:24 lists postfix/pipe[21711]: 8791D46C4B: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.12, delays=3D0.07/0/0/0.05, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 58565: Mar 13 14:00:20 lists postfix/qmgr[11168]: 62BF246BF8: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=972, nrcpt=
=3D1 (queue active)
>>> 58824: Mar 13 14:00:22 lists postfix/smtp[12272]: 62BF246BF8: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.7, de=
lays=3D0.04/1.6/0.03/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 2870C1088E1)
>>> 58886: Mar 13 14:00:22 lists postfix/pipe[12373]: 684F846C0E: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.08, delays=3D0.07/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 71426: Mar 13 16:00:22 lists postfix/qmgr[11168]: 225614690B: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=972, nrcpt=
=3D1 (queue active)
>>> 71602: Mar 13 16:00:23 lists postfix/smtp[15411]: 225614690B: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.1, d=
elays=3D0.05/0.87/0.03/0.16, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 3DC7A10892C)
>>> 71671: Mar 13 16:00:23 lists postfix/pipe[15229]: 86E6C46BD1: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.16, delays=3D0.07/0/0/0.08, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 84091: Mar 13 18:00:22 lists postfix/qmgr[11168]: 7A76E46B02: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=971, nrcpt=
=3D1 (queue active)
>>> 84314: Mar 13 18:00:24 lists postfix/smtp[6502]: 7A76E46B02: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.6, de=
lays=3D0.05/1.5/0.03/0.03, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 1957210882B)
>>> 84368: Mar 13 18:00:24 lists postfix/pipe[6804]: 59C8D46B16: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 93718: Mar 13 20:00:21 lists postfix/qmgr[11168]: 8FB5646AC7: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=972, nrcpt=
=3D1 (queue active)
>>> 93975: Mar 13 20:00:23 lists postfix/smtp[30638]: 8FB5646AC7: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.7, de=
lays=3D0.05/1.4/0.04/0.18, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 45E6910888E)
>>> 94021: Mar 13 20:00:23 lists postfix/pipe[30677]: 8706146AF2: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.07/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 102070: Mar 13 22:00:26 lists postfix/qmgr[11168]: AF25B46AC5: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=970, nrcpt=
=3D1 (queue active)
>>> 102210: Mar 13 22:00:28 lists postfix/smtp[376]: AF25B46AC5: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.4, del=
ays=3D0.05/1.3/0.04/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued =
as 1EC8F108874)
>>> 102287: Mar 13 22:00:28 lists postfix/pipe[395]: 8558346AD5: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.12, delays=3D0.09/0/0/0.03, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 109380: Mar 14 00:00:20 lists postfix/qmgr[11168]: 6AB7446AB7: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=971, nrcpt=
=3D1 (queue active)
>>> 109620: Mar 14 00:00:22 lists postfix/smtp[2578]: 6AB7446AB7: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.8, d=
elays=3D0.06/1.6/0.04/0.16, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 423D51088C8)
>>> 109666: Mar 14 00:00:22 lists postfix/pipe[2660]: 8FA4B46AE7: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.08/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 116855: Mar 14 02:00:19 lists postfix/qmgr[11168]: CE32A46AD8: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=971, nrcpt=
=3D1 (queue active)
>>> 117051: Mar 14 02:00:21 lists postfix/smtp[4475]: CE32A46AD8: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.3, d=
elays=3D0.05/1.1/0.03/0.11, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 2FFBC108903)
>>> 117129: Mar 14 02:00:21 lists postfix/pipe[4440]: 8BF1C46ADD: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.08/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 124124: Mar 14 04:00:23 lists postfix/qmgr[11168]: 4C79146AC4: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=971, nrcpt=
=3D1 (queue active)
>>> 124302: Mar 14 04:00:25 lists postfix/smtp[6552]: 4C79146AC4: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.8, =
delays=3D0.05/1.7/0.04/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 1FDCC108915)
>>> 124358: Mar 14 04:00:25 lists postfix/pipe[6361]: 6585546ABB: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.11, delays=3D0.04/0.01/0/0.06, dsn=3D2.0.0, status=3Dsent (delivered =
via mlmmj service)
>>> 124364: Mar 14 04:00:25 lists postfix/pipe[6527]: 72D3B46ABF: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.07/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 131500: Mar 14 06:00:20 lists postfix/qmgr[11168]: 84097468BC: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=971, nrcpt=
=3D1 (queue active)
>>> 131861: Mar 14 06:00:23 lists postfix/smtp[8441]: 84097468BC: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D2.5, d=
elays=3D0.04/1.4/0.03/1, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued a=
s 106FD1088E7)
>>> 131952: Mar 14 06:00:23 lists postfix/pipe[8519]: 7522F46ADA: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.05, delays=3D0.04/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 131974: Mar 14 06:00:23 lists postfix/pipe[8452]: 8784B46AE3: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.14, delays=3D0.09/0/0/0.05, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>>
>>> mail.info.4
>>> D:\log\mail.info.4
>>> 03880: Mar 14 08:00:20 lists postfix/qmgr[11168]: 6FCA246ACC: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=972, nrcpt=
=3D1 (queue active)
>>> 04111: Mar 14 08:00:22 lists postfix/smtp[16586]: 6FCA246ACC: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.8, d=
elays=3D0.05/1.6/0.03/0.11, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 388FD108956)
>>> 04169: Mar 14 08:00:22 lists postfix/pipe[16702]: 864AC46AC0: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 04177: Mar 14 08:00:22 lists postfix/pipe[16706]: 8EA5546ADC: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.06/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 14331: Mar 14 08:48:37 lists postfix/smtp[18296]: 7D86946B02: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, conn_useA, de=
lay=3D5.6, delays=3D0.11/5.4/0.01/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0=
.0 Ok: queued as 2402310892A)
>>> 14468: Mar 14 08:48:37 lists postfix/pipe[18218]: 7BDD046B2D: to=3D<**l=
istname**+bounces-970-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.08, delays=3D0.06/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 14476: Mar 14 08:48:37 lists postfix/pipe[18628]: 63EEB46B2C: to=3D<**l=
istname**+bounces-970-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.25, delays=3D0.16/0.09/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered v=
ia mlmmj service)
>>> 48857: Mar 14 10:00:20 lists postfix/qmgr[11168]: 7258546C75: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 49063: Mar 14 10:00:22 lists postfix/smtp[20180]: 7258546C75: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.7, =
delays=3D0.05/1.5/0.03/0.08, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 21E46108852)
>>> 49126: Mar 14 10:00:22 lists postfix/pipe[20426]: 6B03046C8B: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.08, delays=3D0.07/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 65383: Mar 14 12:00:21 lists postfix/qmgr[11168]: 43C9546C23: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 65647: Mar 14 12:00:23 lists postfix/smtp[23910]: 43C9546C23: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D2, del=
ays=3D0.05/1.7/0.04/0.19, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued =
as 44D221088C4)
>>> 65728: Mar 14 12:00:23 lists postfix/pipe[24123]: A48A246C3C: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.08, delays=3D0.06/0.01/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered =
via mlmmj service)
>>> 76690: Mar 14 14:00:19 lists postfix/qmgr[11168]: B2CDC46BF8: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=981, nrcpt=
=3D1 (queue active)
>>> 76894: Mar 14 14:00:21 lists postfix/smtp[5116]: B2CDC46BF8: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.4, de=
lays=3D0.05/1.3/0.03/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 22143108898)
>>> 76974: Mar 14 14:00:21 lists postfix/pipe[5053]: 6A47446C01: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.1, delays=3D0.09/0.01/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 88769: Mar 14 16:00:20 lists postfix/qmgr[11168]: 6D93346B04: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=981, nrcpt=
=3D1 (queue active)
>>> 88979: Mar 14 16:00:22 lists postfix/smtp[8140]: 6D93346B04: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.6, de=
lays=3D0.05/1.5/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 16CC11088BA)
>>> 89297: Mar 14 16:00:24 lists postfix/pipe[8292]: 1E13146BC5: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.08, delays=3D0.06/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 100415: Mar 14 18:00:19 lists postfix/qmgr[11168]: DADA446ACC: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 100623: Mar 14 18:00:21 lists postfix/smtp[11963]: DADA446ACC: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.3, =
delays=3D0.05/1.1/0.02/0.17, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 3875C1088CE)
>>> 100747: Mar 14 18:00:21 lists postfix/pipe[12057]: DAE3146AFE: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.06, delays=3D0.06/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via m=
lmmj service)
>>> 109545: Mar 14 20:00:23 lists postfix/qmgr[11168]: 8B8BC46AA3: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 109702: Mar 14 20:00:25 lists postfix/smtp[14480]: 8B8BC46AA3: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.7, d=
elays=3D0.07/1.5/0.02/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 3F29210889B)
>>> 109769: Mar 14 20:00:25 lists postfix/pipe[14386]: 8708546AC3: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.08, delays=3D0.06/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 117039: Mar 14 22:00:21 lists postfix/qmgr[11168]: 11DA646A5C: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 117188: Mar 14 22:00:22 lists postfix/smtp[16409]: 11DA646A5C: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.1,=
 delays=3D0.04/0.97/0.02/0.1, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: que=
ued as 39EAA108860)
>>> 117284: Mar 14 22:00:22 lists postfix/pipe[16657]: B869F46AB3: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via m=
lmmj service)
>>> 124153: Mar 15 00:00:19 lists postfix/qmgr[11168]: 9199246ABA: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 124375: Mar 15 00:00:21 lists postfix/smtp[18467]: 9199246ABA: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.5, =
delays=3D0.05/1.4/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 0BB6710886B)
>>> 124443: Mar 15 00:00:21 lists postfix/pipe[18694]: 5B21446AD4: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via m=
lmmj service)
>>> 131330: Mar 15 02:00:18 lists postfix/qmgr[11168]: BCA9146AC4: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 131520: Mar 15 02:00:20 lists postfix/smtp[20369]: BCA9146AC4: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.4,=
 delays=3D0.05/1.2/0.03/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: que=
ued as 2891710893C)
>>> 131617: Mar 15 02:00:20 lists postfix/pipe[20333]: 84E3946AC2: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.07, delays=3D0.05/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 137989: Mar 15 04:00:18 lists postfix/qmgr[11168]: A312A46ABC: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 138362: Mar 15 04:00:21 lists postfix/smtp[22097]: A312A46ABC: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D2.5, d=
elays=3D0.05/1.3/0.02/1.1, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 3402E108892)
>>> 138632: Mar 15 04:00:23 lists postfix/pipe[22164]: 31884468C9: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.09, delays=3D0.07/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 144682: Mar 15 06:00:18 lists postfix/qmgr[11168]: 35DAF46990: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 144784: Mar 15 06:00:19 lists postfix/smtp[23892]: 35DAF46990: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.88,=
 delays=3D0.05/0.75/0.02/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: qu=
eued as 216A3108900)
>>> 145198: Mar 15 06:00:21 lists postfix/pipe[23908]: CA89646ACD: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.06, delays=3D0.06/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via m=
lmmj service)
>>>
>>> mail.info.3
>>> 03401: Mar 15 08:00:17 lists postfix/qmgr[11168]: 64AB346A96: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 03668: Mar 15 08:00:19 lists postfix/smtp[25739]: 64AB346A96: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.8, de=
lays=3D0.05/1.6/0.03/0.13, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 35B49108987)
>>> 03734: Mar 15 08:00:19 lists postfix/pipe[25795]: 8573D46AB9: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.05, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 09903: Mar 15 10:00:16 lists postfix/qmgr[11168]: 8E81E46A9F: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=982, nrcpt=
=3D1 (queue active)
>>> 10128: Mar 15 10:00:18 lists postfix/smtp[27786]: 8E81E46A9F: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.6, =
delays=3D0.05/1.4/0.02/0.11, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 32E61108833)
>>> 10234: Mar 15 10:00:18 lists postfix/pipe[27773]: A190E46AC6: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.08/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 19593: Mar 15 10:16:06 lists postfix/smtp[29134]: BAD7F46AF5: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, conn_use=3D7, d=
elay=3D6.3, delays=3D0.15/6.1/0.01/0.06, dsn=3D2.0.0, status=3Dsent (250 2.=
0.0 Ok: queued as 1CB071088B8)
>>> 19698: Mar 15 10:16:06 lists postfix/pipe[29310]: 5C9CA46B1C: to=3D<**l=
istname**+bounces-971-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.22, delays=3D0.04/0/0/0.18, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 19709: Mar 15 10:16:06 lists postfix/pipe[29006]: 7520C46B1D: to=3D<**l=
istname**+bounces-971-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.24, delays=3D0.22/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 41175: Mar 15 12:00:17 lists postfix/qmgr[11168]: 1F7C512D69A: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=993, nrcpt=
=3D1 (queue active)
>>> 41304: Mar 15 12:00:18 lists postfix/smtp[31079]: 1F7C512D69A: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.98,=
 delays=3D0.05/0.84/0.02/0.07, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: qu=
eued as 10FFA1088ED)
>>> 41603: Mar 15 12:00:20 lists postfix/pipe[31407]: F106B12D6DA: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.07, delays=3D0.05/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 52573: Mar 15 14:00:18 lists postfix/qmgr[11168]: 11C9546BF5: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 52706: Mar 15 14:00:19 lists postfix/smtp[25012]: 11C9546BF5: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1, del=
ays=3D0.06/0.91/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 20ABC1088C4)
>>> 52828: Mar 15 14:00:19 lists postfix/pipe[25181]: 9332546BFF: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 64543: Mar 15 16:00:16 lists postfix/qmgr[11168]: DF41946A8F: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=991, nrcpt=
=3D1 (queue active)
>>> 64734: Mar 15 16:00:18 lists postfix/smtp[5667]: DF41946A8F: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.3, d=
elays=3D0.05/1/0.02/0.17, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued =
as 2E82A108924)
>>> 64779: Mar 15 16:00:18 lists postfix/pipe[5622]: 7B3BA46BBE: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 76833: Mar 15 18:00:17 lists postfix/qmgr[11168]: 2E07446AC4: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 76967: Mar 15 18:00:18 lists postfix/smtp[20011]: 2E07446AC4: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1, del=
ays=3D0.05/0.8/0.02/0.17, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued =
as 3D0F0108820)
>>> 77202: Mar 15 18:00:19 lists postfix/pipe[20417]: C756846AD8: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 87232: Mar 15 20:00:18 lists postfix/qmgr[11168]: 9F0114695B: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 87451: Mar 15 20:00:20 lists postfix/smtp[13039]: 9F0114695B: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.4, =
delays=3D0.06/1.3/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 10FD410893E)
>>> 87558: Mar 15 20:00:20 lists postfix/pipe[13323]: 9225F46AC4: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.05/0.01/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered =
via mlmmj service)
>>> 96260: Mar 15 22:00:17 lists postfix/qmgr[11168]: 7A3CB46937: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 96329: Mar 15 22:00:18 lists postfix/smtp[16065]: 7A3CB46937: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.6, d=
elays=3D0.05/0.46/0.02/0.07, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 1B7121088C2)
>>> 96420: Mar 15 22:00:18 lists postfix/pipe[16214]: 711D64691E: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 101770: Mar 16 00:00:16 lists postfix/qmgr[11168]: 5DDB046923: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 102033: Mar 16 00:00:18 lists postfix/smtp[18509]: 5DDB046923: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.8,=
 delays=3D0.05/1.6/0.02/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: que=
ued as 1F4691088DF)
>>> 102102: Mar 16 00:00:19 lists postfix/pipe[18566]: 74EDA46952: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.81, delays=3D0.79/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 107170: Mar 16 02:00:17 lists postfix/qmgr[11168]: 67C1E46923: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 107254: Mar 16 02:00:18 lists postfix/smtp[21605]: 67C1E46923: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D0.71, =
delays=3D0.05/0.56/0.02/0.09, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: que=
ued as 2037710886F)
>>> 107318: Mar 16 02:00:18 lists postfix/pipe[21248]: 6C29246944: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.09, delays=3D0.08/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 112380: Mar 16 04:00:16 lists postfix/qmgr[11168]: D756A46914: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 112554: Mar 16 04:00:18 lists postfix/smtp[23915]: D756A46914: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.2, d=
elays=3D0.05/1.1/0.02/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 1D72510884E)
>>> 112623: Mar 16 04:00:18 lists postfix/pipe[24086]: 6CA8346952: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 117533: Mar 16 06:00:16 lists postfix/qmgr[11168]: 08ED646946: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 117718: Mar 16 06:00:17 lists postfix/smtp[26400]: 08ED646946: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.2, =
delays=3D0.05/0.94/0.01/0.17, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: que=
ued as 38BA510889C)
>>> 117783: Mar 16 06:00:17 lists postfix/pipe[26394]: 8901D4695B: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.06, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>>
>>> mail.info.2
>>> 02397: Mar 16 08:00:15 lists postfix/qmgr[11168]: DC232468CC: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 02573: Mar 16 08:00:17 lists postfix/smtp[29084]: DC232468CC: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.2, d=
elays=3D0.05/1.1/0.02/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 1261310881E)
>>> 02636: Mar 16 08:00:17 lists postfix/pipe[29251]: 539B346920: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 07620: Mar 16 10:00:16 lists postfix/qmgr[11168]: E0D3F4694B: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=992, nrcpt=
=3D1 (queue active)
>>> 07787: Mar 16 10:00:18 lists postfix/smtp[31679]: E0D3F4694B: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.2, de=
lays=3D0.04/1/0.02/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued a=
s 18DB31088F6)
>>> 07854: Mar 16 10:00:18 lists postfix/pipe[31860]: 64F434695E: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 17160: Mar 16 10:24:57 lists postfix/smtp[949]: E477446988: to=3D<**REC=
IPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, conn_use0, delay=
=3D5.2, delays=3D0.35/4.8/0.01/0.03, dsn=3D2.0.0, status=3Dsent (250 2.0.0 =
Ok: queued as 1947E1088B8)
>>> 17276: Mar 16 10:24:57 lists postfix/pipe[671]: 5D6E1469A8: to=3D<**lis=
tname**+bounces-972-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=3D=
0.14, delays=3D0.13/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 17309: Mar 16 10:24:57 lists postfix/pipe[671]: 82DA8469A8: to=3D<**lis=
tname**+bounces-972-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=3D=
0.17, delays=3D0.14/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 37868: Mar 16 12:00:17 lists postfix/qmgr[11168]: D714746AAB: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 37985: Mar 16 12:00:19 lists postfix/smtp[2060]: D714746AAB: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.2, de=
lays=3D0.05/1.1/0.02/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 177FF1088AB)
>>> 38031: Mar 16 12:00:19 lists postfix/pipe[2105]: 4C3E046ADF: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.59, delays=3D0.56/0/0/0.03, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 38032: Mar 16 12:00:19 lists postfix/pipe[2235]: 6C20446A4C: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.46, delays=3D0.43/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 48536: Mar 16 14:00:17 lists postfix/qmgr[11168]: C8CF946990: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 48714: Mar 16 14:00:19 lists postfix/smtp[27117]: C8CF946990: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.2, =
delays=3D0.05/1.1/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 13D931088B7)
>>> 48785: Mar 16 14:00:19 lists postfix/pipe[27046]: 6D84846A95: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.08, delays=3D0.05/0.01/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered =
via mlmmj service)
>>> 56294: Mar 16 15:38:31 lists postfix/smtp[28935]: 78DE9467D4: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.26, =
delays=3D0.01/0/0.04/0.21, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as BA26B108843)
>>> 59579: Mar 16 16:00:20 lists postfix/qmgr[11168]: 62F1B46969: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 59820: Mar 16 16:00:22 lists postfix/smtp[29375]: 62F1B46969: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.7, =
delays=3D0.05/1.6/0.02/0.06, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 24984108857)
>>> 59886: Mar 16 16:00:22 lists postfix/pipe[29602]: 62BA246A53: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.06/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 71078: Mar 16 18:00:16 lists postfix/qmgr[11168]: D708F468C8: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 71282: Mar 16 18:00:18 lists postfix/smtp[32038]: D708F468C8: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.2, =
delays=3D0.05/1.1/0.02/0.08, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 20A43108895)
>>> 71352: Mar 16 18:00:18 lists postfix/pipe[32189]: 7A9AB469AC: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 80239: Mar 16 20:00:16 lists postfix/qmgr[11168]: 4E6E64697B: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 80353: Mar 16 20:00:17 lists postfix/smtp[22095]: 4E6E64697B: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D0.83,=
 delays=3D0.05/0.65/0.03/0.1, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: que=
ued as 274AB108853)
>>> 80430: Mar 16 20:00:17 lists postfix/pipe[22334]: 64F9B46969: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.05/0.01/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered =
via mlmmj service)
>>> 86263: Mar 16 22:00:16 lists postfix/qmgr[11168]: 4663D468D1: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 86355: Mar 16 22:00:17 lists postfix/smtp[24160]: 4663D468D1: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D0.82, d=
elays=3D0.05/0.72/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 1EB7D108881)
>>> 86442: Mar 16 22:00:17 lists postfix/pipe[24202]: 6E9574695F: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 92161: Mar 17 00:00:17 lists postfix/qmgr[11168]: 7F1AF46979: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 92360: Mar 17 00:00:19 lists postfix/smtp[26035]: 7F1AF46979: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.6, =
delays=3D0.05/1.5/0.02/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 1ED4810888E)
>>> 92419: Mar 17 00:00:19 lists postfix/pipe[25919]: 69C3D4696D: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 97794: Mar 17 02:00:18 lists postfix/qmgr[11168]: 65E514696A: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 97872: Mar 17 02:00:19 lists postfix/smtp[27938]: 65E514696A: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D0.68,=
 delays=3D0.05/0.57/0.01/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: qu=
eued as 2061E108873)
>>> 97969: Mar 17 02:00:19 lists postfix/pipe[28245]: 7758146968: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.09, delays=3D0.07/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 102530: Mar 17 04:00:15 lists postfix/qmgr[11168]: 557A546953: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 102673: Mar 17 04:00:16 lists postfix/smtp[29906]: 557A546953: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.93,=
 delays=3D0.05/0.65/0.02/0.21, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: qu=
eued as 47DC110888D)
>>> 102739: Mar 17 04:00:16 lists postfix/pipe[29980]: 9FCED4695C: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.07, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered vi=
a mlmmj service)
>>> 106957: Mar 17 06:00:15 lists postfix/qmgr[11168]: 0BE8646947: from=3D<=
**listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 107101: Mar 17 06:00:16 lists postfix/smtp[31229]: 0BE8646947: to=3D<**=
RECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1, d=
elays=3D0.05/0.92/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 14F871088A0)
>>> 107194: Mar 17 06:00:16 lists postfix/pipe[31294]: 6537C4693D: to=3D<**=
listname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, del=
ay=3D0.07, delays=3D0.05/0.01/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered=
 via mlmmj service)
>>>
>>> mail.info.1
>>> 02019: Mar 17 08:00:11 lists postfix/qmgr[11168]: 8BC104691A: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1000, nrcpt=
=3D1 (queue active)
>>> 02243: Mar 17 08:00:13 lists postfix/smtp[32466]: 8BC104691A: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.5, d=
elays=3D0.05/1.4/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 190AE1088D5)
>>> 02310: Mar 17 08:00:13 lists postfix/pipe[32659]: 6C5CE468E8: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.07, delays=3D0.05/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 05010: Mar 17 10:00:08 lists postfix/qmgr[11168]: 5DF3D468D9: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 05288: Mar 17 10:00:10 lists postfix/smtp[1333]: 5DF3D468D9: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.8, d=
elays=3D0.07/1.6/0.02/0.21, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 428661088A5)
>>> 05340: Mar 17 10:00:10 lists postfix/pipe[1360]: 7B284468E8: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 07927: Mar 17 12:00:09 lists postfix/qmgr[11168]: 10442468EE: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 08066: Mar 17 12:00:10 lists postfix/smtp[2432]: 10442468EE: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1, del=
ays=3D0.05/0.94/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 1A3F4108894)
>>> 08133: Mar 17 12:00:10 lists postfix/pipe[2448]: 5CF93468DB: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.06/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 10707: Mar 17 14:00:09 lists postfix/qmgr[11168]: 2B546468D7: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 10842: Mar 17 14:00:10 lists postfix/smtp[21388]: 2B546468D7: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D0.93,=
 delays=3D0.05/0.81/0.02/0.05, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: qu=
eued as 1BA1A108852)
>>> 10907: Mar 17 14:00:10 lists postfix/pipe[21282]: 66882468F1: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 12916: Mar 17 16:00:06 lists postfix/qmgr[11168]: C07D8468F8: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 13131: Mar 17 16:00:08 lists postfix/smtp[4933]: C07D8468F8: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, conn_use=3D3, d=
elay=3D1.3, delays=3D0.05/1.2/0.01/0.02, dsn=3D2.0.0, status=3Dsent (250 2.=
0.0 Ok: queued as 11A7D10889E)
>>> 13268: Mar 17 16:00:08 lists postfix/pipe[4824]: BC8674690E: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.08, delays=3D0.07/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 15575: Mar 17 18:00:07 lists postfix/qmgr[11168]: A7F28468F0: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 15793: Mar 17 18:00:09 lists postfix/smtp[5825]: A7F28468F0: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.5, de=
lays=3D0.04/1.3/0.02/0.09, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 2D42D1088DA)
>>> 15860: Mar 17 18:00:09 lists postfix/pipe[5870]: 72FB3468FC: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.06/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 18356: Mar 17 20:00:07 lists postfix/qmgr[11168]: 795844687C: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 18704: Mar 17 20:00:10 lists postfix/smtp[6806]: 795844687C: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, conn_use=3D2, d=
elay=3D2.5, delays=3D0.05/2.5/0.01/0.02, dsn=3D2.0.0, status=3Dsent (250 2.=
0.0 Ok: queued as 1485C108889)
>>> 18761: Mar 17 20:00:10 lists postfix/pipe[6893]: 6254046901: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.07, delays=3D0.05/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 21132: Mar 17 22:00:08 lists postfix/qmgr[11168]: 61780468E0: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 21310: Mar 17 22:00:10 lists postfix/smtp[8925]: 61780468E0: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.7, d=
elays=3D0.08/1.5/0.02/0.1, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 2134F1088B2)
>>> 21349: Mar 17 22:00:10 lists postfix/pipe[8831]: 80077468B3: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.07, delays=3D0.06/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>> 23755: Mar 18 00:00:09 lists postfix/qmgr[11168]: A7120468F7: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1001, nrcpt=
=3D1 (queue active)
>>> 23982: Mar 18 00:00:11 lists postfix/smtp[9708]: A7120468F7: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.5, del=
ays=3D0.05/1.3/0.02/0.12, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued =
as 30C2510888D)
>>> 24059: Mar 18 00:00:11 lists postfix/pipe[9816]: 9E79C4690C: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 26329: Mar 18 02:00:08 lists postfix/qmgr[11168]: 4E565468BE: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 26564: Mar 18 02:00:10 lists postfix/smtp[11106]: 4E565468BE: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D1.8, d=
elays=3D0.05/1.7/0.02/0.07, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queue=
d as 268541088D7)
>>> 26653: Mar 18 02:00:10 lists postfix/pipe[11052]: 9BCEB46900: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.15, delays=3D0.12/0.01/0/0.03, dsn=3D2.0.0, status=3Dsent (delivered =
via mlmmj service)
>>> 28641: Mar 18 04:00:07 lists postfix/qmgr[11168]: 73B3B468C7: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 28907: Mar 18 04:00:09 lists postfix/smtp[12008]: 73B3B468C7: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, delay=3D1.8, =
delays=3D0.05/1.5/0.02/0.19, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 397F710881E)
>>> 28965: Mar 18 04:00:09 lists postfix/pipe[11872]: 8DFBF468FA: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.08, delays=3D0.06/0/0/0.02, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>> 30598: Mar 18 06:00:06 lists postfix/qmgr[11168]: 0A73B46909: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 30737: Mar 18 06:00:07 lists postfix/smtp[31623]: 0A73B46909: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, conn_use=3D4, =
delay=3D1, delays=3D0.07/0.9/0.01/0.02, dsn=3D2.0.0, status=3Dsent (250 2.0=
.0 Ok: queued as 0FFBD108866)
>>> 30849: Mar 18 06:00:07 lists postfix/pipe[31724]: 68FB146909: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.13, delays=3D0.12/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via=
 mlmmj service)
>>>
>>> mail.info
>>> 00952: Mar 18 08:00:06 lists postfix/qmgr[11168]: 9F48D468DD: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1002, nrcpt=
=3D1 (queue active)
>>> 01172: Mar 18 08:00:08 lists postfix/smtp[32469]: 9F48D468DD: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, delay=3D1.5, de=
lays=3D0.04/1.3/0.02/0.07, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queued=
 as 27AE01088EA)
>>> 01237: Mar 18 08:00:08 lists postfix/pipe[32453]: 61DBC468E9: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via ml=
mmj service)
>>> 08940: Mar 18 08:47:39 lists postfix/smtp[782]: 53DDE4698A: to=3D<**REC=
IPENT**>, relay=3Dmailgate.cybercity.dk[212.242.43.248]:25, conn_use9, dela=
y=3D6.7, delays=3D0.18/6.5/0.01/0.02, dsn=3D2.0.0, status=3Dsent (250 2.0.0=
 Ok: queued as 14414108843)
>>> 09041: Mar 18 08:47:39 lists postfix/pipe[585]: 40803469B3: to=3D<**lis=
tname**+bounces-973-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=3D=
0.15, delays=3D0.14/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 09086: Mar 18 08:47:39 lists postfix/pipe[585]: 7AE49469B5: to=3D<**lis=
tname**+bounces-973-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=3D=
0.13, delays=3D0.11/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 25850: Mar 18 10:00:07 lists postfix/qmgr[11168]: 5554046A63: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1011, nrcpt=
=3D1 (queue active)
>>> 26089: Mar 18 10:00:09 lists postfix/smtp[1706]: 5554046A63: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, conn_use=3D7, d=
elay=3D1.7, delays=3D0.05/1.6/0.01/0.02, dsn=3D2.0.0, status=3Dsent (250 2.=
0.0 Ok: queued as 136A010881C)
>>> 26151: Mar 18 10:00:09 lists postfix/pipe[1551]: 6520746A7C: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 34313: Mar 18 12:00:06 lists postfix/qmgr[11168]: 9B8814691E: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1011, nrcpt=
=3D1 (queue active)
>>> 34522: Mar 18 12:00:08 lists postfix/smtp[3337]: 9B8814691E: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.4]:25, conn_use=3D4, de=
lay=3D1.5, delays=3D0.04/1.4/0.01/0.03, dsn=3D2.0.0, status=3Dsent (250 2.0=
.0 Ok: queued as 192A5108875)
>>> 34646: Mar 18 12:00:08 lists postfix/pipe[3312]: D581946A3F: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.06, delays=3D0.05/0/0/0, dsn=3D2.0.0, status=3Dsent (delivered via mlm=
mj service)
>>> 42042: Mar 18 14:00:06 lists postfix/qmgr[11168]: 511B9468F1: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1011, nrcpt=
=3D1 (queue active)
>>> 42152: Mar 18 14:00:07 lists postfix/smtp[5050]: 511B9468F1: to=3D<**RE=
CIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.75, d=
elays=3D0.05/0.65/0.02/0.04, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 1D0EB108828)
>>> 42229: Mar 18 14:00:07 lists postfix/pipe[4993]: 56C89468F4: to=3D<**li=
stname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, delay=
=3D0.11, delays=3D0.1/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via m=
lmmj service)
>>> 50499: Mar 18 16:00:07 lists postfix/qmgr[11168]: 48D21468DD: from=3D<*=
*listname**+bounces-probe-**RECIPENT**@lists.**domain**>, size=1012, nrcpt=
=3D1 (queue active)
>>> 50582: Mar 18 16:00:08 lists postfix/smtp[27257]: 48D21468DD: to=3D<**R=
ECIPENT**>, relay=3Dmailgate.cybercity.dk[212.242.40.53]:25, delay=3D0.78, =
delays=3D0.05/0.7/0.02/0.02, dsn=3D2.0.0, status=3Dsent (250 2.0.0 Ok: queu=
ed as 17A531088EA)
>>> 50663: Mar 18 16:00:08 lists postfix/pipe[27413]: 7604A468FA: to=3D<**l=
istname**+bounces-probe-**RECIPENT**@lists.**domain**>, relay=3Dmlmmj, dela=
y=3D0.1, delays=3D0.08/0/0/0.01, dsn=3D2.0.0, status=3Dsent (delivered via =
mlmmj service)
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>
>
>
>
>
>

