From: Quentin Heath <dawan@melix.net>
Date: Wed, 02 May 2012 16:41:44 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18a1 released
Message-Id: <CAFSJjVnP2M82ROTWMR+vZwJ_ECLqKSy=kB9NyG8BM=n3rEXHUA@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4F5E32B9.6090908@yahoo.com.au>
In-Reply-To: <4F5E32B9.6090908@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi everyone,

I know this comes a little late, and I don't really ave the time to
introduce myself right now, but I would like to back on the 1.2.18-a1
/ 1.2.18 proposal. It seems to me that it is the most intuitive and
widely used.
If your only concern is to be compatible with debian's scheme, the
tilde was introduced for this reason: it is the only character smaller
than the empty string, meaning that
  1.2.18~ < 1.2.18 < 1.2.18-
and therefore that
  1.2.18~a3 < 1.2.18~b2 < 1.2.18~rc1 < 1.2.18 < 1.2.18-p1

You can even formally call the package 1.2.18-a1 and give the deb the
number 1.2.18~a1, I don't think anyone would get confused.

As soon as I have more time I will try to do more fundamental contributions.

-- 
Quentin

