From: Martin Koch Andersen <martin@925.dk>
Date: Fri, 29 Oct 2010 12:39:53 +0000
Subject: Re: [mlmmj] Re: Permission trouble
Message-Id: <5272BE26-A0D8-41C7-8A58-5E9054EE7696@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
In-Reply-To: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 29/10/2010 13.02, Ben Schmidt wrote:

>> Ah, my problem seem to be that postfix (local) does not read
>> secondary-groups. So adding postfix to the mlmmj group made no
>> difference.
> 
> This may just be related to my point about OSes not noticing group
> membership changes until a new login. Rebooting might fix it or stopping
> and starting Postfix from a newly su'ed terminal or something.

On FreeBSD at least, and with mlmmj executed from a postfix aliases file (owned by root), the mlmmj process is started as nobody:nobody (default_privs).
Only the primary group of user nobody is read (by postfix local), thus adding user nobody to additional groups has no effect (restart or not).

Instead I've added user www to group nobody, and made listdirs recursively owned by nobody:nobody with group write permissions. Now it all works.

> 
>> It would have been nice with a "permission denied" message somewhere
>> though :)
> 
> Mmm. Reworking Mlmmj's logging and checking system call return values
> more carefully is on the to do list for attention after I get 1.2.18
> out, which will hopefully be around the end of the year.

Cool, thanks for your input. And have a splendid weekend.

-- 
Martin Koch Andersen
http://925.dk

