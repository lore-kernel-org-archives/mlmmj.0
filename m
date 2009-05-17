From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Sun, 17 May 2009 18:45:49 +0000
Subject: Re: Bug in mlmmj-maintd: notice on non-existing digests
Message-Id: <34480.172.16.32.1.1242585949.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
In-Reply-To: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hej,

On Sat, May 16, 2009 18:16, Morten K. Poulsen wrote:
> Hi Chris,
>
> On Fri, 2009-05-15 at 14:14 +0200, Christoph Wilke wrote:
>> mlmmj-maintd doesn't honour the nodigestsub tunable.
>
> The nodigestsub tunable only disables subscriptions to the digest
> version of the list. It does not stop mlmmj from sending digests.
>
>> It tries to resend digests even if there aren't any at all, omitting a
>> notice for every existing non-digestive list.
>
> It should not log any notices, just because a given list has no digest
> subscribers. Which notice does it show?

this one:

May 17 18:00:01 strange /usr/bin/mlmmj-maintd[17651]: send_digest.c:229:
Notice: Could not open std mail digest: No such file or directory

Regards
Chris
