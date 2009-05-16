From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sat, 16 May 2009 16:16:31 +0000
Subject: Re: Bug in mlmmj-maintd: notice on non-existing digests
Message-Id: <1242490591.4426.10.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
In-Reply-To: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Chris,

On Fri, 2009-05-15 at 14:14 +0200, Christoph Wilke wrote:
> mlmmj-maintd doesn't honour the nodigestsub tunable.

The nodigestsub tunable only disables subscriptions to the digest
version of the list. It does not stop mlmmj from sending digests.

> It tries to resend digests even if there aren't any at all, omitting a
> notice for every existing non-digestive list.

It should not log any notices, just because a given list has no digest
subscribers. Which notice does it show?

Best regards,
Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

