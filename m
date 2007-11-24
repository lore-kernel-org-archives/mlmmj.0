From: Patrick Bennett <patrick@pebcomputing.com>
Date: Sat, 24 Nov 2007 21:32:37 +0000
Subject: Re: Disabling delivery
Message-Id: <47489875.4070009@pebcomputing.com>
List-Id: <mlmmj.mlmmj.org>
References: <42c4a32b0711241313h6428a936h33c0bb4936983b30@mail.gmail.com>
In-Reply-To: <42c4a32b0711241313h6428a936h33c0bb4936983b30@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

I only use the command line interface, so don't know if it is available 
in the web interface.  From the command line, it's quite obvious (see 
*'d line):

# /usr/bin/mlmmj-sub -h
Usage: /usr/bin/mlmmj-sub -L /path/to/list -a john@doe.org [-c] [-C] [-h]
       [-L] [-d | -n] [-s] [-U] [-V]
 -a: Email address to subscribe
 -c: Send welcome mail
 -C: Request mail confirmation
 -d: Subscribe to digest of list
 -h: This help
 -L: Full path to list directory
** -n: Subscribe to no mail version of list  **
 -s: Don't send a mail to the subscriber if already subscribed
 -U: Don't switch to the user id of the listdir owner
 -V: Print version
When no options are specified, subscription silently happens


Kovács István wrote:
> Hi,
>
> I have some users who want to be able to send mail to the list, but
> not receive others' posts. In mailman, there's an option to disable
> delivery. I know it's also possible with ezmlm (don't know how, I only
> used it via a custom web interface).
>
> Can the access control rules override the "subonlypost" tunable? I
> could then list those few antisocial users there :-)
>
> TIA,
> Kofa
>   

