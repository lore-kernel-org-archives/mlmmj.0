From: Per Jessen <per@opensuse.org>
Date: Mon, 26 Feb 2018 17:13:19 +0000
Subject: Re: [mlmmj] moderated subscription?  apparmor issue
Message-Id: <p71f7f$hkd$2@saturn.local.net>
List-Id: <mlmmj.mlmmj.org>
References: <20180222130504.GI9226@gpm.stappers.nl>
In-Reply-To: <20180222130504.GI9226@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Geert Stappers wrote:

> On Thu, Feb 22, 2018 at 02:01:23PM +0100, Per Jessen wrote:
>> Per Jessen wrote:
>> 
>> > I can't seem to get moderated subscription to work.
>> > I have list/control/submod = <address>
>> > 
>> > new subscribers are asked for confirmation, they confirm, the ops
>> > log
>> > says they have confirmed.  The moderator or <address> is never
>> > notified and the subscription doesn't happen.
>> 
>> Please ignore, it was an apparmor issue.
>> 
> 
> And how was it solved?   (Please share your expirence with ML and ML
> archive )

By updating the apparmor profile :-) 

Add this:
/var/spool/mlmmj/*/moderation/* rw,




-- 
Per Jessen, Zürich (-8.2°C)
openSUSE mailing list admin


