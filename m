From: =?iso-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Thu, 22 Oct 2009 20:10:26 +0000
Subject: mlmmj FAQ
Message-Id: <EF4CBA12-57AE-48CD-96EE-837A4841C475@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I think we just got a great basis for a FAQ on mlmmj.org :)

Thanks Marco

Begin forwarded message:

> From: Marco S Hyman <marc@snafu.org>
> Date: 22. okt 2009 17.53.12 CEST
> To: Jesper Lund Stocholm <jesper.stocholm@ciber.dk>
> Cc: <mlmmj@mlmmj.org>
> Subject: Re: Howto for using mlmmj
>
>> Can you tell me where I can find answers to questions like:
>
> By reading the doc, specifically the section on Tunables
>
>   http://mlmmj.org/man/tunables
>
> and Access Rules
>
>   http://mlmmj.org/man/access
>
>> How do I add a moderator to a list?
>
> Add their address to control/moderators
>
>> How do I remove a moderator from a list?
>
> Remove their address from control/moderators
>
>> How do I remove moderation from a list?
>
> Remove the file control/moderated and/or remove moderate
> commands in control/access.
>
>> How do I add moderation to a list?
>
> Create the file control/moderated or add a moderate rule
> to the control/access file.
>
>> How do I get a list of all recipients of a list?
>
> normal users: /usr/local/bin/mlmmj-list -L /var/spool/mlmmj/<list> -s
> digest users: /usr/local/bin/mlmmj-list -L /var/spool/mlmmj/<list> -d
>
>> How do I remove a user from a list?
>
> /usr/local/bin/mlmmj-unsub -L /var/spool/mlmmj/<list> -a <addr>
>
>> How do I add a user from a list?
>
> /usr/local/bin/mlmmj-sub -L /var/spool/mlmmj/<list> -a <addr>
>
>> How do I delete a message from the archive?
>
> This I've never done.   Guess: rm /path/to/archive/message
>
> Note that all of these commands are run on the machine that
> hosts the list.  I'm not aware of any way of doing these functions
> remotely through email, but then I've never looked, either.
>
> /\/\arc
>
>

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.


