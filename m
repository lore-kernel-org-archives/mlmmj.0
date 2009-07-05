From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 05 Jul 2009 02:48:27 +0000
Subject: Re: statistics for mailing list
Message-Id: <4A50147B.5080508@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907040737i741ceb73tef60e0f62c3c9fb3@mail.gmail.com>
In-Reply-To: <5e77c93d0907040737i741ceb73tef60e0f62c3c9fb3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Henk Cortier wrote:
> Hi there,
> 
> we would like to monitor how many mails are sent, how much they weigh
> and to how many people they are send out each time.  A complete overview
> of monthly data transfer etc.  We are using Postfix and were wondering
> if anyone knew if AWstats is something we could and if anyone has done
> it before to give us a head start? many thanks
> 
> Hek  

Hi,

I wrote "mysqmail-postfix-logger" but it's quite buggy. It just crashes
after some log. Maybe you could help me debug it? My guess is that
there's not much to debug, and that there's an obvious silly mistake.

With this, it should be easy to keep a score board for each domains,
which is what we do. However it does it on a per domain basis, it should
be trivial to modify it so it also keeps per mailbox stats.

Get the project code:

apt-get install git-core curl
git clone http://git.gplhost.com/mysqmail.git

Compile and build:

apt-get install build-essential debhelper
cd mysqmail
dpkg-buildpackage # might need to solve build deps here

Thomas

