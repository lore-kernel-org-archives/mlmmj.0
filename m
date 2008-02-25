From: Christian Laursen <xi@borderworlds.dk>
Date: Mon, 25 Feb 2008 16:18:08 +0000
Subject: Re: Postfix virtual users
Message-Id: <ygfk5ktnh6n.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <000201c87732$34fa05d0$0500a8c0@liomk23cfxd68z>
In-Reply-To: <000201c87732$34fa05d0$0500a8c0@liomk23cfxd68z>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"mattias" <mj@mjw.se> writes:

> I run my postfix with virtual users
> How to run mlmmj with this?

For each list you want, you need to add an entry to your virtual table
as well as an alias that invokes mlmmj-recieve.

Let's assume that you are using the domian example.com and want to add
a list called mlmmj-testexample.com.


Put something like this in your virtual file:

example.com                -----
mlmmj-test@example.com     mlmmj-example.com-mlmmj-test


Then put the following in your aliases file:

mlmmj-example.com-mlmmj-test   "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/example.com/mlmmj-test/"


And then setup the list in the usual way using
/var/spool/mlmmj/example.com/mlmmj-test/ as its list directory.

This way you can have multiple lists with the same name on different
domains without much effort.

-- 
Christian Laursen
