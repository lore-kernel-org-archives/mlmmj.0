From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 07 Aug 2006 09:44:57 +0000
Subject: Re: Bug in subscriber searching function is_subbed_in()
Message-Id: <20060807094457.GA54628@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <44D6B83A.6030701@kite.se>
In-Reply-To: <44D6B83A.6030701@kite.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Magnus Naeslund(k) <mag@kite.se> [Aug 07. 2006 05:49]:
> I found out that the subscribercode searches the subscriber directory 
> and tries to mmap the lockfile it created earlier which size is zero,
> hence the logentry:
> 
> /usr/bin/mlmmj-sub[25209]: subscriberfuncs.c:61: Could not mmap fd: Invalid argument
> 
> I modified the code to skip ALL files that starts with a dot, that
> takes care if . and .. directories aswell as the .$file.lock files.
> 
> Is this patch acceptable?

Not really. It means it wont search .somesubshereinthis file. But to
that bug, there's already a fix in the tree:

        /* No need to check in 0-size file */
        if(st.st_size = 0)
                return (off_t)-1;

So after ignoring . and .. we only work on files bigger than 0.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
