From: Mike Grice <Mike@MikeGrice.com>
Date: Thu, 31 Mar 2005 13:05:38 +0000
Subject: Re: how to delete a mailing list?
Message-Id: <1112274338.24863.22.camel@localhost.localdomain>
List-Id: <mlmmj.mlmmj.org>
References: <1112273798.14927.2.camel@zion>
In-Reply-To: <1112273798.14927.2.camel@zion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, 2005-03-31 at 14:56 +0200, lupin3rd wrote:
> I read all man of the commands... but seem that there isn't a command to
> delete a mailing list...
> if i create a mailing list with command mlmmj-make-ml, could be a
> mlmmj-rm-ml :) that remove...
> 
> Manually i must only delete the directory of mailing list?

A mailing-list is only the sum of its directory and control files... so
just delete the directory.  Remember to delete any aliases you may have
set up for your MTA, as well.

Mike

-- 
Sticking feathers up your butt does not make you a chicken.

