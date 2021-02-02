From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Tue, 02 Feb 2021 09:08:48 +0000
Subject: Re: [mlmmj] mlmmj replication
Message-Id: <20210202090848.GD28068@bonclok.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <7c27eb47-7a10-cdc2-4e1b-d319aba01008@arctur.si>
In-Reply-To: <7c27eb47-7a10-cdc2-4e1b-d319aba01008@arctur.si>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Feb 02, 2021 at 07:36:49AM +0000, Robin H. Johnson wrote:
> How do you intend to handle the case where the failure might be after a
> mail is delivered, index/sequence has incremented, but before the next
> rsync cron has fired?

I do not at the moment. My installation is small and traffic is very low.
I have implemented my 'cluster' mostly to be able to resume operation quickly
after a failure, not to have 99.999% availability. If something happens to
one of my VPSes, I will just switch to the other and take time to repair or
rebuild the broken one. I have described my setup as an example and an
inspiration for further work.

> If the /archives/ directory could be sharded, then it would be
> significantly easier;

It would be a nice feature request/contribution. I started a workaround:
a cron script that will move old archived emails to a different, sharded
hierarchy, at the cost of not being able to retrieve old messages by
list+get-N functionality, but I abandoned it because I don't get that
many emails.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

