From: Christian Gleerup <christian.gleerup@swn.nu>
Date: Thu, 30 Sep 2010 18:01:39 +0000
Subject: Re: [SPAM Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CA4D083.4020704@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <4CA37FC4.1030500@swn.nu>
In-Reply-To: <4CA37FC4.1030500@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

  All the files are owned by the user nobody as you correctly guessed,
to be more specific,

The directories are owned by
* nobody : nobody *

most of the files in /var/spool/mlmmj/nyhedsbrev/subscribers.d have 
ownership
* nobody : root *
few of the files have ownership
* nobody : nobody *

all the files have ownership u=rw

So I am not sure this is related to ownership, since I could add and 
delete one adress to /var/spool/mlmmj/nyhedsbrev/subscribers.d/c
while another adress in the same file would move.

I still recieve news letters on that adress that i can't delete, and if 
I try tu unsub without the -s argument, i recieve an email stating that 
I am not subscribed

I tried to add the problematic that i can't delete, and watch the following.
/$ sudo /usr/bin/mlmmj-sub -L /var/spool/mlmmj/nyhedsbrev/ -a 
cromozon@swn.nu
[sudo] password for fjernsynet:
Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
/$ sudo cat /var/spool/mlmmj/nyhedsbrev/subscribers.d/c | grep cromozon
cromozon@swn.nu
cromozon@swn.nu

Note that the mail adress shows up 2 times!
/var/spool/mlmmj/nyhedsbrev/subscribers.d/c thus contains the same mail 
adress two times!

if I unsubcribe, I get down to one again,
Is that supposed to happen?

I actually don't know what MTA the server use, but the file 
/var/spool/mlmmj/nyhedsbrev/control/verp contains  postfix. (I have 
taken over administration of the server, but don't really no much about 
mail)


Den 9/30/2010 12:42 AM, Ben Schmidt skrev:
> Have a look at the permissions:
>
> ls -ld /var/spool/mlmmj/nyhedsbrev
> ls -ld /var/spool/mlmmj/nyhedsbrev/subscribers.d
> ls -l /var/spool/mlmmj/nyhedsbrev/subscribers.d
>
> Do the owners of all the directories and files match? (They should be
> owned by the user that Mlmmj runs as when invoked by your MTA.) Are they
> all writeable by the owner?
>
> Commands like
>
> chown -R nobody /var/spool/mlmmj/nyhedsbrev
> chmod -R u+rw /var/spool/mlmmj/nyhedsbrev
>
> can be used to set the permissions of everything in the list directory.
> I've guessed 'nobody' because user ID 65534 is likely to be that user,
> but you may need to adjust that. Are you using Postfix? If so, and
> you're using it simply, it is likely that it is correct for 'nobody' to
> be used.
>
> Hope this helps,
>
> Ben.

