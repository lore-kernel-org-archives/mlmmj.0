From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 29 Sep 2010 22:42:04 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CA3C0BC.3000003@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Have a look at the permissions:

ls -ld /var/spool/mlmmj/nyhedsbrev
ls -ld /var/spool/mlmmj/nyhedsbrev/subscribers.d
ls -l /var/spool/mlmmj/nyhedsbrev/subscribers.d

Do the owners of all the directories and files match? (They should be
owned by the user that Mlmmj runs as when invoked by your MTA.) Are they
all writeable by the owner?

Commands like

chown -R nobody /var/spool/mlmmj/nyhedsbrev
chmod -R u+rw /var/spool/mlmmj/nyhedsbrev

can be used to set the permissions of everything in the list directory.
I've guessed 'nobody' because user ID 65534 is likely to be that user,
but you may need to adjust that. Are you using Postfix? If so, and
you're using it simply, it is likely that it is correct for 'nobody' to
be used.

Hope this helps,

Ben.



On 30/09/10 4:04 AM, Christian Gleerup wrote:
> Ok, I see them now, but.
>
> the concerned email adress i can't delete, lives in
>
> /var/spool/mlmmj/nyhedsbrev/subscribers.d/c
>
> See the following:
> /$ sudo cat /var/spool/mlmmj/nyhedsbrev/subscribers.d/c | grep cromozon
> cromozon@swn.nu
> cromozon@sawsaw.redirectme.net
>
> /$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a
> cromozon@sawsaw.redirectme.net -s
> Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
> /$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a cromozon@=
swn.nu -s
> Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
>
> /$ sudo cat /var/spool/mlmmj/nyhedsbrev/subscribers.d/c | grep cromozon
> cromozon@swn.nu
>
> Note, If I ommit the -s when i unsubscribe, I get an email with the text =
from
> unsub-notsubscribed
>
>
>
> Den 9/29/2010 8:20 AM, Mads Martin J=F8rgensen skrev:
>> Look in:
>>
>> /var/spool/mlmmj/nyhedsbrev/subscribers.d/
>>
>> where all files containing emailadresses are subscribers.
>>
>
>
>
>


