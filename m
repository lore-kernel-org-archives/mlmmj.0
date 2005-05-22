From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 22 May 2005 11:07:17 +0000
Subject: Re: Automatic mailing list creation, something like Google Groups
Message-Id: <20050522110717.GC80196@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
In-Reply-To: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Filippo Fadda <fifadd@tin.it> [May 21. 2005 15:56]:
> I'm creating something like Google Groups and I need two important features:
> 
> 1) Each group is associated to a specific mailing list with the same
> group alias. For example peaceandlove@example.com is the mailing list
> related to the group identified as peaceandlove.
> I need that any "valid" mail sent to peaceandlove mailing list launch
> a PHP script that insert into the related group database the mail
> itself, like Google Groups works.

This might need a wrapper script around mlmmj-process. Having the
possibility to provide a DIR/control/postcommand is on the TODO list. I
can provide you with a patch to do what you want if you tell me exactly
what it is.

> 2) I need also to create a new mailing list each time that a new group
> is created and naturally to delete it when a group itself is deleted.
> The group is created via a web page. Is some way to do this? The mail
> server and the web server are not on the same PC, they are running on
> two different machines. I need to create some NFS link and run a
> script that create the directory and files needed by mlmmj? Can you
> suggest to me some way to do this? Have you an idea?

Take mlmmj-make-ml.sh and modify it to fit your needs.

> I'm running qmail on the mail server and Apache+PHP on the web server.

If you're running qmail, why not go with ezmlm which will give you
better performance since it's working with the very interns of the mail
server?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
