From: Baptiste Daroussin <bapt@nours.eu>
Date: Wed, 26 May 2021 13:06:07 +0000
Subject: [mlmmj] Where to send patches
Message-Id: <20210526130607.us4pobshuj5dnpb4@aniel.nours.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello everyone,

I am migrating FreeBSD's mailing lists from mailman2 to mlmmj, in the process I
had to write a couple of patches for mlmmj, I would like to upstream those
patches if possible.

My understanding is that the origin developement site is dead, and there has been a
kind of takeover on gitlab. Am I right? so pushing things upstream now means
pushing things to that gitlab?

The 2 patches in question are the following:
-  A patch which adds a new tunnable (boolean) nobounceprobe to be able to
   disable probes on demande if needed.

- A patch which Allow to support X-Origin-From header. This one is quite
  special. in our setup we didn't want to use the mungefrom patch that we can
  find on the mailing list (and on the gitlab repo), because we only want to
  munge when we actually need to and not always. so we are using the
  developement version of rspamd to handle the muning part. the interesting this
  is when rspamd do munge, it sets the original From into the new
  X-Original-From header, so our patch is taking in account this new header for
  mlmmj-process when testing is the sender is a subsriber to the mailing list or
  a moderator, it also uses it to send back the denial email if the email was
  denied.

Best regards,
Bapt

