From: Thomas Goirand <thomas@goirand.fr>
Date: Mon, 09 Jan 2012 11:40:23 +0000
Subject: [mlmmj] Re: [mlmmj bugs] Req #32 [NEW]: moderate from command line
Message-Id: <4F0AD227.1060401@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 01/09/2012 01:43 AM, floeff at gmail dot com wrote:
> ATTENTION! Do NOT reply to this email!
> 
> From:             floeff at gmail dot com
> Mlmmj Version:    1.2.17
> Operating system: 
> MTA:              
> MTA Version:      
> Package:          Generic
> Type:             Feature/Change Request
> Summary:          moderate from command line
> 
> Description:
> ------------
> It would be good to have a feature to moderate from within the command
> line. Sometimes it occurs that a message needs moderation, but while I am
> postmaster, I am not moderator of the specific list. Invoking something
> like mlmmj-moderate -L /path/to/list -i ID of message would be good.

Can't you simply write a mail from the command line?

apt-get install bsd-mailx
Mail -s "none" listname-moderate-<ID-OF-MODERATION>@example.com

I do this very often, and it works very well!

Now, if you really need a script to do this on the shell, there must be
half a million way to do it and to write a script for it. Do you really
think something that easy to do should be added to MLMMJ?

Thomas

P.S: I don't know how to reply to a bug entry, if I knew, I would have.

