From: fifadd@tin.it
Date: Mon, 30 May 2005 16:51:26 +0000
Subject: qmail and the default delimeter
Message-Id: <428B2A8900017B47@ims3a.cp.tin.it>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I have got another problem with qmail. The mailing list works fine, but
if you try to subscribe it, or unsubscribe, you got an error because qmail
default delimeter is '-' not '+'. Also vpopmail use '-' for the aliases.
Is there some way to recompile qmail forcing to use another delimeter, but
is not so easy. I think that you have to modify the way to work of mlmmj
to manage '-' and '+' delimeter _together_. Actually mlmmj manages the delimeter
with the following constant. What happens if I change it and recompile mlmmj?

#define RECIPDELIM '+'  /* XXX Warning: not changable at the moment */

At the end I will write a README as you have asked me.

-Filippo Fadda

