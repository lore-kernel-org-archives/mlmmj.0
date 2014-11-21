From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 21 Nov 2014 21:26:58 +0000
Subject: Re: [mlmmj] Help setting up my first mailing list
Message-Id: <546FAE22.2010908@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <9EC4CE90-6B36-4C12-B02D-1E9328EBBD77@right2.org>
In-Reply-To: <9EC4CE90-6B36-4C12-B02D-1E9328EBBD77@right2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi!

The "No such file or directory" is a known red herring.

I do think it's the ^M.

Suspect Haraka doesn't convert the CRLF line endings in SMTP to unix LF-onl=
y line=20
endings before piping to external programs as other MTAs do. Looks like som=
e parts=20
of Mlmmj cope with this and other parts don't.

Try piping the mail through tr(1) to filter out the CRs and see if it works:

|tr -d '\r' | /bin/mlmmj-receive -L /opt/mlmmj/mylist/

If it doesn't like the pipe in aliases, try making a script that does the p=
iping=20
and referring to that in aliases rather than mlmmj-receive directly.

Cheers,

Ben.



On 22/11/14 4:42 AM, Joe Eaves wrote:
> Hi guys,
>
> I'm having some trouble setting up a mailing list with mlmmj, I'm running=
 1.2.18.1 from the EPEL repo on CentOS 7. I have set my smtp server to pipe=
 emails destined for the mailing list as so:
>
> |/bin/mlmmj-receive -L /opt/mlmmj/mylist/
>
> Everything seems to be going well, the email is received, but then I get =
errors when it tries to send a reply. The log looks as follows:
>
> /bin/mlmmj-process[6791]: mlmmj-process.c:828: Found To: right2-general@r=
ight2.org: Success
> /bin/mlmmj-send[6791]: mlmmj-send.c:925: Could not prepare headers: No su=
ch file or directory
>
> The only info I can find in the list directory is a file in the queue dir=
ectory which seems to be the version of my email that the list is supposed =
to receive. It has the following headers:
>
> Envelope-To: <right2-general@right2.org>
> Authentication-Results: email.right2.org; ; ^M
> Received: from email.right2.org (garum.right2.org [178.62.6.212])^M
>          by email.right2.org (Haraka/2.5.0) with ESMTP id F4EF895C-E9E9-4=
43D-8D34-81EB88DF501C.1^M
>          envelope-from <joe@right2.org>;^M
>          Fri, 21 Nov 2014 17:39:47 +0000^M
> Received: (Haraka outbound); Fri, 21 Nov 2014 17:39:46 +0000^M
> Received: from [192.168.33.137] (212.44.18.254.ip.redstone-isp.net [212.4=
4.18.254])^M
>          by email.right2.org (Haraka/2.5.0) with ESMTPSA id 770D3771-B9E8=
-48BA-B1EF-CD8161FC9183.1^M
>          envelope-from <joe@right2.org> (authenticated bits=3D0)^M
>          (version=3DTLSv1/SSLv3 cipher=AES128-SHA verify=FAIL);^M
>          Fri, 21 Nov 2014 17:39:46 +0000^M
> From: Joe Eaves <joe@right2.org>^M
> Content-Type: text/plain; charset=3Dus-ascii^M
> Content-Transfer-Encoding: 7bit^M
> Subject: [Right2] -general- Hi^M
> Message-Id: <79939293-967A-4149-A48F-DAAF9FEA6D09@right2.org>^M
> Date: Fri, 21 Nov 2014 17:39:45 +0000^M
> To: "right2-general@right2.org" <right2-general@right2.org>^M
> X-Mailinglist: right2-general
> Reply-To: right2-general@right2.org
> Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))^M
> X-Mailer: Apple Mail (2.1510)^M
>
> Any ideas? The ^M worries me but I don't know if it's a major issue? Mayb=
e I'm missing a header?
>
> Cheers,
>
> Joe
>
> --
> :wq!
>

