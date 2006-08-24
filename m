From: "Christian Nygaard" <christiannygaard@gmail.com>
Date: Thu, 24 Aug 2006 12:12:21 +0000
Subject: Re: mailinglist owner subscribe?
Message-Id: <4d4321660608240512u59f67132g7f62020e80698ae3@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_114955_28476410.1156421541847"
List-Id: <mlmmj.mlmmj.org>
References: <4d4321660608240434i5444467g171a8b77f83c1742@mail.gmail.com>
In-Reply-To: <4d4321660608240434i5444467g171a8b77f83c1742@mail.gmail.com>
To: mlmmj@mlmmj.org

------=_Part_114955_28476410.1156421541847
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Mads!

I will try to have the user use sudo and mlmmj-sub as you described.

Chris

On 8/24/06, Mads Martin Joergensen <mmj@mmj.dk> wrote:
>
> * Christian Nygaard <christiannygaard@gmail.com> [Aug 24. 2006 13:34]:
> > How can the mailinglist owner subscribe new members to a mlmmj list?
>
> Use the mlmmj-sub command directly:
>
> $ mlmmj-sub -L /path/to/list -a some@address.org
>
> Look at mlmmj-sub -h for options.
>
> > I've tried chgrp subscribers.d folder and the files in it to list owners
> > group + emacs to edit them but as soon as someone unsubscribes from the
> list
> > the permissions are
> > changed back to nobody.nobody ownership.
>
> It has to be the ownership of the process running mlmmj.
>
> > Is there some mailinglist owner command that I missed that can be used?
> >
> > ezmlm does this by:
> > mailinglist-subscribe-john=example.net@example.org
>
> This is not implemented in mlmmj. But since mlmmj uses From: and not
> envelope from, you can send a mail to the subscribe address, with the
> From: changed.
>
> --
> Mads Martin Joergensen, http://mmj.dk
> "Why make things difficult, when it is possible to make them cryptic
> and totally illogical, with just a little bit more effort?"
>                                  -- A. P. J.
>
>

------=_Part_114955_28476410.1156421541847
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Mads! <br><br>I will try to have the user use sudo and mlmmj-sub as you described.<br><br>Chris<br><br><div><span class="gmail_quote">On 8/24/06, <b class="gmail_sendername">Mads Martin Joergensen</b> &lt;<a href="mailto:mmj@mmj.dk">
mmj@mmj.dk</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">* Christian Nygaard &lt;<a href="mailto:christiannygaard@gmail.com">
christiannygaard@gmail.com</a>&gt; [Aug 24. 2006 13:34]:<br>&gt; How can the mailinglist owner subscribe new members to a mlmmj list?<br><br>Use the mlmmj-sub command directly:<br><br>$ mlmmj-sub -L /path/to/list -a <a href="mailto:some@address.org">
some@address.org</a><br><br>Look at mlmmj-sub -h for options.<br><br>&gt; I've tried chgrp subscribers.d folder and the files in it to list owners<br>&gt; group + emacs to edit them but as soon as someone unsubscribes from the list
<br>&gt; the permissions are<br>&gt; changed back to nobody.nobody ownership.<br><br>It has to be the ownership of the process running mlmmj.<br><br>&gt; Is there some mailinglist owner command that I missed that can be used?
<br>&gt;<br>&gt; ezmlm does this by:<br>&gt; mailinglist-subscribe-john=<a href="mailto:example.net@example.org">example.net@example.org</a><br><br>This is not implemented in mlmmj. But since mlmmj uses From: and not<br>envelope from, you can send a mail to the subscribe address, with the
<br>From: changed.<br><br>--<br>Mads Martin Joergensen, <a href="http://mmj.dk">http://mmj.dk</a><br>&quot;Why make things difficult, when it is possible to make them cryptic<br> and totally illogical, with just a little bit more effort?&quot;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- A. P. J.<br><br></blockquote></div><br>

------=_Part_114955_28476410.1156421541847--
