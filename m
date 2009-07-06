From: Henk Cortier <henk@melimato.com>
Date: Mon, 06 Jul 2009 19:48:02 +0000
Subject: Re: moderation only by sender
Message-Id: <870AD343-CC17-4FE7-8E0D-5E2100FAA122@melimato.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-13-167027061"
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
To: mlmmj@mlmmj.org


--Apple-Mail-13-167027061
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Hi Marco,

> ???   I've an access file for a moderated list that ends in "allow".
> All postings are still moderated.  What am I missing?

it depends on what comes before the "allow".
-- from the manual -- The first rule to match a header decides which  
action to take - allow, deny or moderate the post.
I believe having allow as a last line to be quite dangerous if you  
don't have anything that would apply to most unknown mails before that.

> Should I remove the moderated control file and replace the access
> file with something like:

>
> 	deny the-stuff-I-don't-like
> 	allow whatever-header-I-use-to-bypass-moderation
> 	moderate


What is a "moderated control file"?
The rules you mention seem ok to me.
Henk
--Apple-Mail-13-167027061
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">Hi =
Marco,<div><br></div><div><blockquote type=3D"cite"><div>??? =
&nbsp;&nbsp;I've an access file for a moderated list that ends in =
"allow".<br>All postings are still moderated. &nbsp;What am I =
missing?</div></blockquote></div><div>it&nbsp;depends&nbsp;on&nbsp;what&nb=
sp;comes&nbsp;before&nbsp;the&nbsp;"allow".</div><div>-- from the manual =
--&nbsp;<span class=3D"Apple-style-span" style=3D"color: rgb(25, 26, =
25); font-size: 12px; line-height: 20px; ">The first rule to match a =
header decides which action to take - allow, deny or moderate the =
post.</span></div><div><span class=3D"Apple-style-span" =
style=3D"font-size: 12px; "></span><font class=3D"Apple-style-span" =
color=3D"#191A19"><span class=3D"Apple-style-span" style=3D"line-height: =
20px;">I believe having allow as a last line to be quite dangerous if =
you don't have anything that would apply to most unknown mails before =
that.</span></font></div><div><font class=3D"Apple-style-span" =
color=3D"#191A19"><span class=3D"Apple-style-span" style=3D"line-height: =
20px;"><br></span></font></div><div><font class=3D"Apple-style-span" =
color=3D"#191A19"><span class=3D"Apple-style-span" style=3D"line-height: =
20px;"><span class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 0); =
line-height: normal; "><blockquote type=3D"cite"><div>Should I remove =
the moderated control file and replace the access<br>file with something =
like:</div></blockquote></span></span></font></div><div><font =
class=3D"Apple-style-span" color=3D"#191A19"><span =
class=3D"Apple-style-span" style=3D"line-height: 20px;"><span =
class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 0); line-height: =
normal; "><blockquote type=3D"cite"><div><br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre; ">	</span>deny =
the-stuff-I-don't-like<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre; ">	</span>allow =
whatever-header-I-use-to-bypass-moderation<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre; ">	=
</span>moderate<br></div></blockquote></span></span></font></div><div><fon=
t class=3D"Apple-style-span" color=3D"#191A19"><span =
class=3D"Apple-style-span" style=3D"line-height: =
20px;"><br></span></font></div><div><font class=3D"Apple-style-span" =
color=3D"#191A19"><span class=3D"Apple-style-span" style=3D"line-height: =
20px;">What is a "moderated control file"?</span></font></div><div><font =
class=3D"Apple-style-span" color=3D"#191A19"><span =
class=3D"Apple-style-span" style=3D"line-height: 20px;">The rules you =
mention seem ok to =
me.</span></font></div><div><div><div>Henk</div></div></div></body></html>=

--Apple-Mail-13-167027061--

