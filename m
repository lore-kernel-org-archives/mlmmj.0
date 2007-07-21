From: Thomas Goirand <thomas@goirand.fr>
Date: Sat, 21 Jul 2007 13:34:02 +0000
Subject: Re: mlmmj bug with qmail+vpopmail
Message-Id: <46A20B4A.1050008@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <1603698924.20070721141017@gmail.com>
In-Reply-To: <1603698924.20070721141017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Alexander Kardailsky wrote:
> Dear mlmmj,
> 
>   Just installed the latest version of the mlmmj on freebsd 6.1 box
>   and tried to work with it. I created test list sw-test and
>   configured .qmail-sw-test and .qmail-sw-test-default files.
>   Subscription was ok. However, when I tried to send email to the list
>   I got the following error: 
>   listcontrol.c:740: Unknown command "test". Ignoring mail: Unknown error: 0
>   Anyone else has such problem?

First of all, you shouldn't use vpopmail, it's simply useless (unless
you like it's stupid multiple flat password file thing), a bare qmail
has virtual users integrated.

Thomas
