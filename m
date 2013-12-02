From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 02 Dec 2013 20:23:37 +0000
Subject: [mlmmj] Fwd: [mlmmj bugs] Req #50 [NEW]: Make handling of bounces configurable
Message-Id: <529CEC49.5090207@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, all,

This feature request recently came through on the bug tracker:

> From:             debian at timoboettcher dot name
> Summary:          Make handling of bounces configurable
>
> Description:
> ------------
> By default, mlmmj drops any incoming email with empty envelope-from
> address (bounce message) with the error message "Discarding $mail due
> to missing envelope from address". This should be configurable.

Assuming the suggestion here is not to discard the message, but deliver
it to the list as with other messages, I'm not convinced.

It seems to me that at best would introduce back-scatter, but that it
would also have security problems (it would open the door to spammers,
as we couldn't do verification of the address to accept/deny it, we
would have to accept it from anybody), as well as potentially cause
privacy problems (if someone's address bounces, for some reason to a
non-VERP error address, the whole list would receive the bounce message
including email address and other details).

I can't think of a truly valid use case where you would want the list to
accept bounce messages either.

As far as list post bounces go, these are already automatically handled,
with the option to instead forward them to an address of your choice.
One thing that could be done is, if they aren't already, include bounce
messages to the list address (non-VERP error address) in this
alternative mechanism.

What do others think?

Ben.




