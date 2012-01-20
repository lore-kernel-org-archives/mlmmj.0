From: Mark Alan <varia@e-healthexpert.org>
Date: Fri, 20 Jan 2012 10:48:35 +0000
Subject: Re: [mlmmj] Add Suscribers
Message-Id: <20120120104835.53a3ee10@e-healthexpert.org>
List-Id: <mlmmj.mlmmj.org>
References: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
In-Reply-To: <D176E0C7E42DA44992D7811C809C30844E4963@redbull.leachman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, 19 Jan 2012 08:24:55 -0700, "Cody Moreshead"
<cody@leachman.com> wrote:

> What I was hoping is that at the end of each day I
> could send two emails from the SQL server (easily done) to our ISP
> that would automatically add and remove people from the list.  For
> various reasons the person that does the newsletter does not want to
> relinquish control of the additions/subtractions to the list.

If you have root access to the servers, try this:

I. create a SQL script to export the 2 lists as 2 text files:
/tmp/subs.txt (will have the emails to be susbcribed)
  newuser1@example.com
  newuser2@example.tld
/tmp/unsubs.txt  (will have the emails to be unsusbcribed).
  byebyeuser1@example.com
  byebyeuser2@example.com

II. create cron jobs to run a shell command for each list:
05 23 * * * root /usr/bin/test -x /tmp/subs.txt
    && /bin/cat /tmp/subs.txt | /usr/bin/xargs -rn1 /usr/bin/mlmmj-sub 
-L /var/spool/mlmmj/YOURLIST1 -a;

20 23 * * * root /usr/bin/test -x /tmp/unsubs.txt
  && /bin/cat /tmp/subs.txt | /usr/bin/xargs -rn1 /usr/bin/mlmmj-unsub
  -L /var/spool/mlmmj/YOURLIST1 -a;

From then on,
at 23h05 you will be subscribing the new users,
and at 23h20 you will be unsubscribing those that should not be with you
anymore.
And if you use 20 * * * * , instead of  20 23 * * * , you will be doing
that every 20 minutes.

Please note that shell commands inside cron jobs do like to use full
paths.


M.

