From: Thomas Goirand <thomas@goirand.fr>
Date: Sat, 07 Feb 2009 09:17:07 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <498D5193.2030502@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:
> Thinking really quickly about it, here's the route I would have a look
> at:
> 
>   i) tunable 'cmdlinemoderation' which makes mlmmj not send mails,
>      but just leave it in the directory. Maybe even put a path to a
>      directory in the moderation file where mlmmj then would put the
>      same files as it would in LISTDIR/moderation. That could be the
>      directory where your web code would look and reflect upon
>  ii) when someone in the web moderation page clicks to moderate a mail
>      you would invoke the same code path from the commandline (see
>      listcontrol.c) as when a mail arrives accepting a moderation. You
>      might do this by just sending a mail to listname+moderate-KEY or
>      what the precise address should be.
> 
> Comments from Morten, etc. wrt. security would of course be welcome :)

I have read a bit listcontrol.c, and the way I understand it, is that
the web interface should:

- rename moderated with:
mv hash hash.sending

- call the following:
mlmmjsend -L listdir -m hash.sending

Just one thing: what is in execlp() that is not in the system exec()
function?

If it's THAT simple, then I guess I can write a very tiny (single file)
php script to do that job... Of course, php should have enough access
right to be able to read/write in the list dir, but I guess this is more
an administrator's job than mine in this case.

The only real issue that I can forecast here, is how to display nicely
the list of message to be moderated. I guess it would be best to use
something that already exists. Maybe there's a lib to do that in PEAR?
Anybody has an idea how to do this with not too much programming work?

Thomas
