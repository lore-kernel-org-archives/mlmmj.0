From: Nate Beaty <natebeaty@gmail.com>
Date: Sun, 17 Sep 2006 16:54:24 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <F021B5BD-C76D-45E2-9C78-D46F4A3DED9A@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sep 17, 2006, at 9:49 AM, Sven 'Darkman' Michels wrote:

> Can you please check which fd 7 is? (/proc/$PID/fd)

 > sudo ls -la /proc/21636/fd
total 9
dr-x------ 2 Debian-exim root  0 2006-09-17 09:44 .
dr-xr-xr-x 5 Debian-exim root  0 2006-09-17 08:05 ..
lr-x------ 1 Debian-exim root 64 2006-09-17 09:45 0 -> pipe:[725488]
l-wx------ 1 Debian-exim root 64 2006-09-17 09:45 1 -> pipe:[725489]
l-wx------ 1 Debian-exim root 64 2006-09-17 09:45 2 -> pipe:[725489]
lr-x------ 1 Debian-exim root 64 2006-09-17 09:45 3 -> /var/spool/ 
mlmmj/topshelf-newsletter/text/bounce-probe
l-wx------ 1 Debian-exim root 64 2006-09-17 09:45 4 -> /var/spool/ 
mlmmj/topshelf-newsletter/maintdlog-cac9de92e092a5c
l-wx------ 1 Debian-exim root 64 2006-09-17 09:45 5 -> /var/spool/ 
mlmmj/topshelf-newsletter/bounce/erinn.hartman=us.penguingroup.com-probe
lrwx------ 1 Debian-exim root 64 2006-09-17 09:45 6 -> /var/spool/ 
mlmmj/topshelf-newsletter/queue/950c4a8771dfca7
lrwx------ 1 Debian-exim root 64 2006-09-17 09:44 7 -> socket:[728893]
lrwx------ 1 Debian-exim root 64 2006-09-17 09:45 8 -> socket:[728895]

I'm learning as we go here.. anything else I can do?

Nate.

--
Clixel Design & Coding ~ http://clixel.com/



