From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Mon, 01 Feb 2021 12:03:50 +0000
Subject: Re: [mlmmj] mlmmj replication
Message-Id: <20210201120350.GB28068@bonclok.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <7c27eb47-7a10-cdc2-4e1b-d319aba01008@arctur.si>
In-Reply-To: <7c27eb47-7a10-cdc2-4e1b-d319aba01008@arctur.si>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Feb 01, 2021 at 11:52:35AM +0100, Rok Saksida wrote:
> Now, I want to create HA system. Does mlmmj provides some way of
> replication?

As you've probably noticed, mlmmj is a very simple piece of software.
It does not provide sophisticates features. You need to build your HA
capability yourself.

For my private small server, I have contenerized mlmmj, so I can bring
it up on one of two machines, and it connects to an internal bridge
using a private IP address, so I don't have to reconfigure postfix,
bridge takes care of delivering packets. But the container is only
software etc. The run-time data (configuration, state and archive)
is mounted form outside the container. Configuration is kept in git
with clones on both machines. State (subscribed addresses and message
sequence numbers) and archives are copied via rsync in cron. I had not
implemented automatic switchover and don't intend to, it is too
complicated for my small installation, and postfix will keep messages
in its queue until I fire up the container on the other host.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

