From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 30 Aug 2006 21:54:15 +0000
Subject: Re: mailinglist owner =?UTF-8?B?c3Vic2NyaWJlPw==?=
Message-Id: <15133548d086fa73878aa6de1c46b716@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Christian,

On Thu, 24 Aug 2006 13:34:43 +0200, "Christian Nygaard" <christiannygaard@gmail.com> wrote:
> I've tried chgrp subscribers.d folder and the files in it to list owners
> group + emacs to edit them but as soon as someone unsubscribes from the
> list the permissions are changed back to nobody.nobody ownership.

That is because the unsunbscribe process is as follows:

- create a temporary file (which by default is owned by nobody:nobody, if your mail server runs as that)

- copy the subscriber list - minus the newly unsunscribed user - to the temporary file

- rename the temporary file to the name of the old subscriber list

Rename is atomic, so there is no risc of having a broken list if mlmmj crashes or - more likely ;) - a hardware failure occures.

> Is there some mailinglist owner command that I missed that can be used?

If you set the s-bit on a directory (chmod g+s my_dir), files created in that directory will by default have their group set to the directory's group. That will solve your issue.

... or you can just use sudo and mlmmj-sub as Mads Martin suggested :)

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

