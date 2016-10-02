From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 02 Oct 2016 12:47:01 +0000
Subject: Re: [mlmmj] Notification sent to non-member for subscribers-only list
Message-Id: <f9a9ea69-07e0-23f7-666a-9bccf9bef480@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <57ED7184.7060108@smartlabrador.ca>
In-Reply-To: <57ED7184.7060108@smartlabrador.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Documentation doesn't tell anything about mlmmj looking in /usr/share
> for the listtext files if they are not in $LISTDIR/text, but I haven't
> looked at the code. Ben?

Yeah. Looks like the documentation could be improved. Mlmmj checks:

$listdir/text
$prefix/share/mlmmj/text.skel/default
$prefix/share/mlmmj/text.skel/en

It checks all three paths for each candidate filename, and then moves on
to the next candidate filename, so if there is a newer-version list text
in the system path, it will override a compatibility list text in the
list-local directory.

Ben




