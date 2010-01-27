From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 27 Jan 2010 00:12:31 +0000
Subject: Re: Web-based membership management
Message-Id: <4B5F84EF.30506@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EEC4B.20404@yahoo.com.au>
In-Reply-To: <4B5EEC4B.20404@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> So...I'd like to propose an extension to subscription handling,
>> where the subject line of mails to +subscribe or +unsubscribe can
>> contain the commandline options of mlmmj-sub or mlmmj-unsub (as
>> appropriate), excluding -L. The argument for -L would be implied by
>> the address the mail was sent to, of course. Different addresses to
>> the address the mail came from could easily be (un)subscribed by
>> using the -a argument: in fact, it would be required to be the
>> beginning of the subject line in order for the mechanism to be
>> activated. To be secure, it would require the email to come from the
>> list owner or someone listed in submod.
>>
>> Perhaps for added security it could be required to be turned on with
>> a tunable.
>
> Hi Ben,
>
> I like all the other stuff you proposed, but not this one :-)

:-)

> From-addresses can be faked easily by script, so to just base yourself on
> the sender as security mechanism is imho a no-no.

I was leaning that way, too, but then I figured, "it's exactly as secure
as mlmmj is for moderation." But I'm wrong. Moderation has a cookie, so
it's more secure. Duh.

> If I'm not mistaken, you don't like the other interfaces since they require
> certain parts of the mail-list data to be web-writeable, correct?

No, it's more that it's technically much more difficult and probably
harder to secure. They need to be web-writeable but also writeable by
mlmmj or mail-based subscriptions won't work. A lot of fiddling with
putting users in groups and making things group writable would be
necessary, and could be dangerous, giving the web server or mlmmj access
to other things it shouldn't if not done carefully. The mlmmj
administrative overhead to get things working, particularly with the web
interfaces, is already quite high. It can do without an extra level of
complexity!

So...we need another simple, but more secure interface. I still lean
towards something using email. mlmmj is definitely connected to email,
and almost any php installation is likely to have mail available, unlike
other things such as running an executable.

Maybe simply incorporating some kind of shared secret would do the
trick: a passwd control file that both the webserver and mlmmj can read
and which must prefix the subject line. If just used for the web
interface, using a random string would work and be pretty secure. For
convenience of list admins if they want to use the feature, they can set
up a more usable password as secure (or insecure) as they desire.

Would that suffice?

Ben.





