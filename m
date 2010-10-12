From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 12 Oct 2010 10:19:31 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <4CB43633.1070506@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>>>>> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d \
>>>>> -exec /usr/bin/mlmmj-maintd -F -d {} \;
>>>>
> The trailing \; is generally required too. Without it the shell can/will treat the
> ; as a command separator rather than a command argument. Some versions of find may
> be happy without the ; at the end of exec but not all are.

Yep, I've left that there too, I think. I'll double check. My find
definitely needs it.

Thanks for mentioning, Richard.

Ben.





