From: Thomas Goirand <thomas@goirand.fr>
Date: Wed, 08 Jul 2009 04:49:41 +0000
Subject: Re: moderation only by sender
Message-Id: <4A542565.7040100@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:
> You probably don't send automated newsletters from your phone.

I do, when doing server maintenance with putty, I might need to warn all
customers of this server, which I do using an MLMMJ moderated list.

To me, if you guys want to add such flag, this would be to keep
compatibility with the old behavior where MLMMJ is sending the
moderation to all moderators. The default should be to bounce ONLY to
the moderator sending to the list. IMHO mlmmj-make-ml should create new
list with the tunable in by default.

Another thing, when I add myself as moderator, then use the "subscriber
only post" flag, I can't send to the list unless I also subscribe. This
doesn't make sense. All moderator should be considered as able to write
to the list, even if they are not subscribed and the flag "subscriber
only post" is set. Can this behavior be changed as well???

Thomas

