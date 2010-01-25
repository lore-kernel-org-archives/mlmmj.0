From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Mon, 25 Jan 2010 11:49:42 +0000
Subject: Re: PATCH: Not me too
Message-Id: <60567dcc1001250349w1b2da50fm4fcf5b9d8534f4f7@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0015174be33cda121f047dfbc3e4"
List-Id: <mlmmj.mlmmj.org>
References: <4B5D78F3.30600@yahoo.com.au>
In-Reply-To: <4B5D78F3.30600@yahoo.com.au>
To: mlmmj@mlmmj.org

--0015174be33cda121f047dfbc3e4
Content-Type: text/plain; charset=ISO-8859-1

Well, since I promised a patch but didn't get around doing it, I feel so
guilty that I will test your patch as well, maybe I can help to figure out
where the moderated problem thingie is.

Franky

On Mon, Jan 25, 2010 at 12:08 PM, Ben Schmidt <mail_ben_schmidt@yahoo.com.au
> wrote:

> That bit about testing being successful...might need to change that... It
> doesn't work for moderated mail; my test of that just got clogged somewhere
> in the Internet and didn't arrive for a while!
>
> Still feel free to offer any comments about the patch, or suggestions
> regarding implementing this for moderated mail, but also feel free to
> disregard it until I come back with something a bit more functional.
>
> Cheers,
>
> Ben.
>
>
>
>
> On 25/01/10 9:56 PM, Ben Schmidt wrote:
>
>> The attached patch adds a 'not me too' feature to mlmmj, where post
>> senders are excluded from the post distribution so people don't get
>> copies of their own mail. A number of people, particularly those who
>> aren't familiar with traditional email mailing lists, prefer this. It
>> applies on top of the tunables patch I emailed earlier (which I
>> neglected to mention applies over 1.2.17).
>>
>> Some info and design decisions:
>>
>> I decided a simple boolean tunable would suffice for this, at least in
>> the short term, and quite probably long term, too. For now, people who
>> really want confirmation their mail has arrived on the list can always
>> subscribe a nomail email to post from. I will devote my mind to how this
>> could neatly be extended later if it seems warranted.
>>
>> Thanks to Franky for getting me started on this. The from address in
>> those low level sending functions is the envelope sender, so based on
>> the list address, not the sender of the mail, though. The sender of the
>> mail is parsed with the other mail headers in mlmmj-process. This means
>> I needed to communicate that information from mlmmj-process to
>> mlmmj-send. Commandline paramaters seemed the way most consistent with
>> the rest of the program, so I added an option.
>>
>> I also had to decide whether the tunable should be tested in
>> mlmmj-process or mlmmj-send. I opted for mlmmj-process, as that's where
>> most decisions about whether and where to send mail are made, and as a
>> general rule it's best if commandline arguments can override tunables
>> rather than be affected by them. Thus I added an '-o' option to omit a
>> specified address. The alternative is making the option specify an
>> originator address, and testing the tunable in mlmmj-send to see whether
>> or not to omit them from the distribution.
>>
>> I decided to do an extra pass through the recipients list in main() to
>> do the filtering rather than modify the lower level functions, as the
>> functions are used in numerous locations, but this filtering is only
>> required once, so an interface change doesn't seem warranted, and
>> iterating the recipients shouldn't be too slow, even for large lists.
>>
>> Comments? Questions?
>>
>> I have tested it and it works fine for me.
>>
>> Could this be included in mlmmj?
>>
>> The patch includes updating the php and perl web admin interfaces'
>> tunables.pl file. Should I be CCing people of that code specifically?
>>
>> Cheers,
>>
>> Ben.
>>
>
>
>
>
>
>
>

--0015174be33cda121f047dfbc3e4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, since I promised a patch but didn&#39;t get around doing it, I feel s=
o guilty that I will test your patch as well, maybe I can help to figure ou=
t where the moderated problem thingie is.<br><br>Franky<br><br><div class=
=3D"gmail_quote">
On Mon, Jan 25, 2010 at 12:08 PM, Ben Schmidt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mail_ben_schmidt@yahoo.com.au">mail_ben_schmidt@yahoo.com.au</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1=
ex;">
That bit about testing being successful...might need to change that... It d=
oesn&#39;t work for moderated mail; my test of that just got clogged somewh=
ere in the Internet and didn&#39;t arrive for a while!<br>
<br>
Still feel free to offer any comments about the patch, or suggestions regar=
ding implementing this for moderated mail, but also feel free to disregard =
it until I come back with something a bit more functional.<br>
<br>
Cheers,<br><font color=3D"#888888">
<br>
Ben.</font><div><div></div><div class=3D"h5"><br>
<br>
<br>
<br>
On 25/01/10 9:56 PM, Ben Schmidt wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
The attached patch adds a &#39;not me too&#39; feature to mlmmj, where post=
<br>
senders are excluded from the post distribution so people don&#39;t get<br>
copies of their own mail. A number of people, particularly those who<br>
aren&#39;t familiar with traditional email mailing lists, prefer this. It<b=
r>
applies on top of the tunables patch I emailed earlier (which I<br>
neglected to mention applies over 1.2.17).<br>
<br>
Some info and design decisions:<br>
<br>
I decided a simple boolean tunable would suffice for this, at least in<br>
the short term, and quite probably long term, too. For now, people who<br>
really want confirmation their mail has arrived on the list can always<br>
subscribe a nomail email to post from. I will devote my mind to how this<br=
>
could neatly be extended later if it seems warranted.<br>
<br>
Thanks to Franky for getting me started on this. The from address in<br>
those low level sending functions is the envelope sender, so based on<br>
the list address, not the sender of the mail, though. The sender of the<br>
mail is parsed with the other mail headers in mlmmj-process. This means<br>
I needed to communicate that information from mlmmj-process to<br>
mlmmj-send. Commandline paramaters seemed the way most consistent with<br>
the rest of the program, so I added an option.<br>
<br>
I also had to decide whether the tunable should be tested in<br>
mlmmj-process or mlmmj-send. I opted for mlmmj-process, as that&#39;s where=
<br>
most decisions about whether and where to send mail are made, and as a<br>
general rule it&#39;s best if commandline arguments can override tunables<b=
r>
rather than be affected by them. Thus I added an &#39;-o&#39; option to omi=
t a<br>
specified address. The alternative is making the option specify an<br>
originator address, and testing the tunable in mlmmj-send to see whether<br=
>
or not to omit them from the distribution.<br>
<br>
I decided to do an extra pass through the recipients list in main() to<br>
do the filtering rather than modify the lower level functions, as the<br>
functions are used in numerous locations, but this filtering is only<br>
required once, so an interface change doesn&#39;t seem warranted, and<br>
iterating the recipients shouldn&#39;t be too slow, even for large lists.<b=
r>
<br>
Comments? Questions?<br>
<br>
I have tested it and it works fine for me.<br>
<br>
Could this be included in mlmmj?<br>
<br>
The patch includes updating the php and perl web admin interfaces&#39;<br>
<a href=3D"http://tunables.pl" target=3D"_blank">tunables.pl</a> file. Shou=
ld I be CCing people of that code specifically?<br>
<br>
Cheers,<br>
<br>
Ben.<br>
</blockquote>
<br>
<br>
<br>
<br>
<br>
<br>
</div></div></blockquote></div><br>

--0015174be33cda121f047dfbc3e4--

