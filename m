From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Thu, 15 Mar 2012 21:49:44 +0000
Subject: Re: [mlmmj] How to disable bounce probes
Message-Id: <894753461327278040@unknownmsgid>
List-Id: <mlmmj.mlmmj.org>
References: <4F625B33.4000802@pub.positon.org>
In-Reply-To: <4F625B33.4000802@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Another option is to not run mlmmj-maintd.

--=20
Mads Martin J=F8rgensen

On 15/03/2012, at 22.47, Ben Schmidt <mail_ben_schmidt@yahoo.com.au> wrote:

> One way to do it is to set 'staticbounceaddr' (see TUNABLES) to send the
> bounces to a black-hole, rather than having Mlmmj process them. Mlmmj
> will then think nothing is bouncing, so will not try to probe.
>
> I think removing the text/probe or text/bounce-probe list text would
> also turn off the messages, but log an error to syslog when Mlmmj tries
> to send one. You'd have a record of which address are bouncing that way,
> though, which may or may not be a benefit.
>
> Beware, though, that if a lot of spam emails are being sent from your
> mail server, you may end up with your IP blacklisted or something like
> that. It's probably more worth your while to try to filter out the spam
> and avoid it going out at all. Ignoring the problem by turning the
> bounces off will just let the problem grow, unnoticed and unrestrained.
>
> That's my opinion, anyway.
>
> Cheers,
>
> Ben.
>
>
>
> On 16/03/12 8:12 AM, Marc MAURICE wrote:
>> Hello,
>>
>> Is it possible to disable mlmmj bounce probe feature ?
>>
>> I have an open mailing list (anybody can post), receiving lot of spam.
>> This list is more like an alias (as in /etc/aliases), with multiple dest=
inations,
>> but it's convenient for me to have it managed by mlmmj.
>>
>> Those spams are deleted by the subscribers antispams, however, mlmmj rec=
eives
>> bounces, and send bounce probes to check, I guess, that the subscriber i=
s active.
>>
>> So my users are receiving the following.
>> Question : is it possible to disable bounce probes ?
>>
>> "
>> Some messages to you could not be delivered. If you're seeing this
>> message it means things are back to normal, and it's merely for your
>> information.
>>
>> Here is the list of the bounced messages:
>> "
>>
>> Thanks in advance,
>> Marc
>
>

