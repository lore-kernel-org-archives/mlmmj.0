From: Christian Laursen <xi@borderworlds.dk>
Date: Fri, 18 May 2007 14:07:19 +0000
Subject: Re: virtual domain support
Message-Id: <ygfbqgiw7hk.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <464DAF4C.1030800@gmail.com>
In-Reply-To: <464DAF4C.1030800@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Mehul N. Sanghvi" <mehul.sanghvi@gmail.com> writes:

>      How does mlmmj work with virtual domains ?   Is there a document
> that someone can point me to that has guidelines for it ?

It's actually quite simple. In your virtual file you make an entry for
each list like this:

listname@virtualdomain.example.com      mlmmj-virtualdomain.example.com-listname


And then, also for each list, make an entry in your aliases file like this:

mlmmj-virtualdomain.example.com-listname:     "/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/virtualdomain.example.com/listname"


Of course you can choose your directory layout and alias names any way
you like, but this should give you the general idea.

-- 
Christian Laursen
