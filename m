From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 24 Jan 2006 03:48:21 +0000
Subject: Qmail trouble solved? :)
Message-Id: <43D5A385.6080902@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

As the strace showed, my trouble was in mlmmj-process. So I read the 
file, and just found this (arround line 514, in src/mlmmj-process.c):

        if(dtoemails.emaillist)
                whichto = &dtoemails;
        else if(toemails.emaillist)
                whichto = &toemails;
        else
                whichto = NULL;

then I've changed it to this in mlmmj 1.2.11:

        if(toemails.emaillist)
                whichto = &toemails;
        else if(dtoemails.emaillist)
                whichto = &dtoemails;
        else
                whichto = NULL;

and it suddenly started to work perfectly. Why does MLMMJ first tries to 
look at the Delivered-To:? Is it possible to change it the way I say? Or 
is it what you were all talking about and I didn't understand?

Anyway, it works well for me now, and I'm very happy that we have 
choosed MLMMJ. It's a wonderfull project, and I'm very happy to see it's 
very active. Having release often is all but bothering, it shows the 
project is very active!

Thomas

