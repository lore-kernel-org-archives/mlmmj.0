From: "Franky Van Liedekerke" <liedekef@telenet.be>
Date: Wed, 02 Jul 2008 14:45:42 +0000
Subject: Re: limit post to moderators
Message-Id: <60567dcc0807020745g2c79eff5j460c3e4a22847ae6@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_9205_8636012.1215009942421"
List-Id: <mlmmj.mlmmj.org>
References: <60567dcc0807020140u46488453n9a4fd25e46df6c09@mail.gmail.com>
In-Reply-To: <60567dcc0807020140u46488453n9a4fd25e46df6c09@mail.gmail.com>
To: mlmmj@mlmmj.org

------=_Part_9205_8636012.1215009942421
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/2/08, Morten K. Poulsen <morten@afdelingp.dk> wrote:
>
> Franky Van Liedekerke wrote:
>
>> is there a config option (or patch) to limit the posting possibility to
>> moderators only (without them needing to be subscribers if possible)?
>>
>
> Not directly, but you can do it via the "access" tunable. Something like:
>
> moderate aaa@example.org
> moderate bbb@example.org
> deny



I was just checking the access feature out myself :-) I think this will do
for me:
moderate aaa@example.org
moderate bbb@example.org
discard

(I want to discard other mails, and don't bounce the mail, to limit
bounce-back spam)

 For now every subscriber can post (using moderation), but I want a kind of
>> newsletter functionality ...
>>
>
> For a newsletter I usually have a secret header with a password, something
> like:
>
> allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517
> deny
>
> and in "delheaders":
> X-MySecret:



This would be great if it was me to send it :-) But the moderators are not
very familiar with adding headers to mail (and they live quite far from me
to configure it for them). So: good trick, but not for me :-)

Morten
>

tx for the tip.

Franky


On 7/2/08, Morten K. Poulsen <morten@afdelingp.dk> wrote:
>
> Franky Van Liedekerke wrote:
>
>> is there a config option (or patch) to limit the posting possibility to
>> moderators only (without them needing to be subscribers if possible)?
>>
>
> Not directly, but you can do it via the "access" tunable. Something like:
>
> moderate aaa@example.org
> moderate bbb@example.org
> deny
>
>  For now every subscriber can post (using moderation), but I want a kind of
>> newsletter functionality ...
>>
>
> For a newsletter I usually have a secret header with a password, something
> like:
>
> allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517
> deny
>
> and in "delheaders":
> X-MySecret:
>
> Morten
>
> --
> Morten K. Poulsen <morten@afdelingp.dk>
> http://www.afdelingp.dk/
>
>
>

------=_Part_9205_8636012.1215009942421
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div id="mb_2"><span class="q">On 7/2/08, <b class="gmail_sendername">Morten K. Poulsen</b> &lt;<a href="mailto:morten@afdelingp.dk" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">morten@afdelingp.dk</a>&gt; wrote:</span><div>
<span class="q"><span class="gmail_quote"></span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<span>Franky Van Liedekerke wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
is there a config option (or patch) to limit the posting possibility to
moderators only (without them needing to be subscribers if possible)?<br>
</blockquote>
<br></span>
Not directly, but you can do it via the &quot;access&quot; tunable. Something like:<br>
<br>
moderate <a href="mailto:aaa@example.org" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">aaa@example.org</a><br>
moderate <a href="mailto:bbb@example.org" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">bbb@example.org</a><br>
deny</blockquote></span><div><br><br>I was just checking the access feature out myself :-) I think this will do for me:<span class="q"><br>
moderate <a href="mailto:aaa@example.org" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">aaa@example.org</a><br>moderate <a href="mailto:bbb@example.org" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">bbb@example.org</a><br>
</span>
discard<br><br>(I want to discard other mails, and don&#39;t bounce the mail, to limit bounce-back spam)<br></div><span class="q"><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

<span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
For now every subscriber can post (using moderation), but I want a kind of newsletter functionality ...<br>
</blockquote>
<br></span>
For a newsletter I usually have a secret header with a password, something like:<br>
<br>
allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517<br>
deny<br>
<br>
and in &quot;delheaders&quot;:<br>
X-MySecret:</blockquote></span><div><br><br>This
would be great if it was me to send it :-) But the moderators are not
very familiar with adding headers to mail (and they live quite far from
me to configure it for them). So: good trick, but not for me :-)&nbsp;</div>
<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Morten<br><span>
</span></blockquote></div><br>tx for the tip.<br><span class="sg"><br>Franky<br>
</span></div><br><br><div><span class="gmail_quote">On 7/2/08, <b class="gmail_sendername">Morten K. Poulsen</b> &lt;<a href="mailto:morten@afdelingp.dk">morten@afdelingp.dk</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<span class="q">Franky Van Liedekerke wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
is there a config option (or patch) to limit the posting possibility to moderators only (without them needing to be subscribers if possible)?<br>
</blockquote>
<br></span>
Not directly, but you can do it via the &quot;access&quot; tunable. Something like:<br>
<br>
moderate <a href="mailto:aaa@example.org" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">aaa@example.org</a><br>
moderate <a href="mailto:bbb@example.org" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">bbb@example.org</a><br>
deny<span class="q"><br>
<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
For now every subscriber can post (using moderation), but I want a kind of newsletter functionality ...<br>
</blockquote>
<br></span>
For a newsletter I usually have a secret header with a password, something like:<br>
<br>
allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517<br>
deny<br>
<br>
and in &quot;delheaders&quot;:<br>
X-MySecret:<br>
<br>
Morten<br><span class="sg">
<br>
-- <br>
Morten K. Poulsen &lt;<a href="mailto:morten@afdelingp.dk" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">morten@afdelingp.dk</a>&gt;<br>
<a href="http://www.afdelingp.dk/" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">http://www.afdelingp.dk/</a><br>
<br>
<br>
</span></blockquote></div><br>

------=_Part_9205_8636012.1215009942421--
