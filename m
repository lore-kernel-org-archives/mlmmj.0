From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Thu, 29 Jun 2006 10:38:26 +0000
Subject: Re: Moderators mail addresses case sensitive?
Message-Id: <2682.130.83.233.215.1151577506.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <1391.130.83.236.92.1150991901.squirrel@130.83.185.211>
In-Reply-To: <1391.130.83.236.92.1150991901.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hej!
On Thu, June 22, 2006 22:24, Mads Martin Joergensen wrote:
> * Christoph Wilke <chris@filmkreis.tu-darmstadt.de> [Jun 22. 2006
> 21:09]:
>> Hej!
>>
>> Are the mail addresses given in the 'moderators'
>> controlfile case sensitive?
>>
>> Or is the address of the moderating reply and the
>> one in the file converted to lowercase before the
>> check is done?
>
> I haven't looked yet, but if they are case sensitive, it's clearly a
> bug. It's been around somewhere else in the past, so it might be.

It's not sensitive at all. It's not in there...

I've looked over the code and there is _no_ check
who has sent the 'moderate' command.
So anyone who has the cookie is able to start the
spreading of the mail to be moderated.

If I have some spare time this weekend I try to
do something about it.

> --
> Mads Martin Joergensen, http://mmj.dk

Ciao
Chris
