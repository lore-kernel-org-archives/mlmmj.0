From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 26 Mar 2012 13:53:20 +0000
Subject: Re: [mlmmj] How to disable bounce probes
Message-Id: <4F7074D0.1060700@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F625B33.4000802@pub.positon.org>
In-Reply-To: <4F625B33.4000802@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 27/03/12 12:29 AM, Marc MAURICE wrote:
> Hello,
>
> Thanks for your response.
>> One way to do it is to set 'staticbounceaddr' (see TUNABLES) to send the
>> bounces to a black-hole, rather than having Mlmmj process them. Mlmmj
>> will then think nothing is bouncing, so will not try to probe.
> But if I do that it will disable all bounces. I want to get bounces, but I don't
> want mlmmj to check for bounces.
> I want to do it manually.

Well, you could always send them to a mailbox instead of back to Mlmmj,
if you wanted to.

>> I think removing the text/probe or text/bounce-probe list text would
>> also turn off the messages, but log an error to syslog when Mlmmj tries
>> to send one. You'd have a record of which address are bouncing that way,
>> though, which may or may not be a benefit.
> In mlmmj 1.2.17 (debian stable version) it is not sufficient because mlmmj will
> fallback on /usr/share/mlmmj/text.skel/en/.
> I had to remove read access to it too :
>
> rm -vf /var/spool/mlmmj/*/text/bounce-probe
> chmod o-r /usr/share/mlmmj/text.skel/*/bounce-probe
>
> and to prevent package upgrades to reset it (ext fs only) :
> chattr +i /usr/share/mlmmj/text.skel/*/bounce-probe

Ah, yes. I forgot about that. I wonder if that's properly documented. I
perhaps need to fix it.

> Is it different in mlmmj 1.2.18 ??

No, it is the same.

>> Beware, though, that if a lot of spam emails are being sent from your
>> mail server, you may end up with your IP blacklisted or something like
>> that. It's probably more worth your while to try to filter out the spam
>> and avoid it going out at all. Ignoring the problem by turning the
>> bounces off will just let the problem grow, unnoticed and unrestrained.
> You're right. I will install a spamassassin if I find the time one day.

Smiles,

Ben.




