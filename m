From: Marco S Hyman <marc@snafu.org>
Date: Thu, 22 Oct 2009 15:53:12 +0000
Subject: Re: Howto for using mlmmj
Message-Id: <CA7E5E23-B6B9-43CC-A92D-2978FEA6D984@snafu.org>
List-Id: <mlmmj.mlmmj.org>
References: <A47BAB0B49FD934EA28A3A21B943AB9001194240@eusex01.sweden.ecsoft>
In-Reply-To: <A47BAB0B49FD934EA28A3A21B943AB9001194240@eusex01.sweden.ecsoft>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Can you tell me where I can find answers to questions like:

By reading the doc, specifically the section on Tunables

    http://mlmmj.org/man/tunables

and Access Rules

    http://mlmmj.org/man/access

> How do I add a moderator to a list?

Add their address to control/moderators

> How do I remove a moderator from a list?

Remove their address from control/moderators

> How do I remove moderation from a list?

Remove the file control/moderated and/or remove moderate
commands in control/access.

> How do I add moderation to a list?

Create the file control/moderated or add a moderate rule
to the control/access file.

> How do I get a list of all recipients of a list?

normal users: /usr/local/bin/mlmmj-list -L /var/spool/mlmmj/<list> -s
digest users: /usr/local/bin/mlmmj-list -L /var/spool/mlmmj/<list> -d

> How do I remove a user from a list?

/usr/local/bin/mlmmj-unsub -L /var/spool/mlmmj/<list> -a <addr>

> How do I add a user from a list?

/usr/local/bin/mlmmj-sub -L /var/spool/mlmmj/<list> -a <addr>

> How do I delete a message from the archive?

This I've never done.   Guess: rm /path/to/archive/message

Note that all of these commands are run on the machine that
hosts the list.  I'm not aware of any way of doing these functions
remotely through email, but then I've never looked, either.

/\/\arc

