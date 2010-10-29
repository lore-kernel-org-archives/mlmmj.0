From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 29 Oct 2010 11:02:08 +0000
Subject: Re: [mlmmj] Re: Permission trouble
Message-Id: <4CCAA9B0.5060405@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
In-Reply-To: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Ah, my problem seem to be that postfix (local) does not read
> secondary-groups. So adding postfix to the mlmmj group made no
> difference.

This may just be related to my point about OSes not noticing group
membership changes until a new login. Rebooting might fix it or stopping
and starting Postfix from a newly su'ed terminal or something.

> It would have been nice with a "permission denied" message somewhere
> though :)

Mmm. Reworking Mlmmj's logging and checking system call return values
more carefully is on the to do list for attention after I get 1.2.18
out, which will hopefully be around the end of the year.

Ben.





