From: Filippo Fadda <fifadd@tin.it>
Date: Mon, 23 May 2005 08:19:19 +0000
Subject: Re: Automatic mailing list creation, something like Google
Message-Id: <6.2.1.2.2.20050523101834.02a203a8@box5.tin.it>
List-Id: <mlmmj.mlmmj.org>
References: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
In-Reply-To: <6.2.1.2.2.20050521154015.02b52830@postino.programmazione.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

At 13:07 22/05/2005, you wrote:
>* Filippo Fadda <fifadd@tin.it> [May 21. 2005 15:56]:
> > I'm creating something like Google Groups and I need two important 
> features:
> >
> > 1) Each group is associated to a specific mailing list with the same
> > group alias. For example peaceandlove@example.com is the mailing list
> > related to the group identified as peaceandlove.
> > I need that any "valid" mail sent to peaceandlove mailing list launch
> > a PHP script that insert into the related group database the mail
> > itself, like Google Groups works.
>
>This might need a wrapper script around mlmmj-process. Having the
>possibility to provide a DIR/control/postcommand is on the TODO list. I
>can provide you with a patch to do what you want if you tell me exactly
>what it is.

Great! I will write you in the next days. It's not difficult, I think that 
simply you can call a script with some parameter. The script makes some 
check, as verify if the user has subscribed to the group, etc.

> > 2) I need also to create a new mailing list each time that a new group
> > is created and naturally to delete it when a group itself is deleted.
> > The group is created via a web page. Is some way to do this? The mail
> > server and the web server are not on the same PC, they are running on
> > two different machines. I need to create some NFS link and run a
> > script that create the directory and files needed by mlmmj? Can you
> > suggest to me some way to do this? Have you an idea?
>
>Take mlmmj-make-ml.sh and modify it to fit your needs.

So do you think that the NFS link between web server and mail server is the 
only possible solution?
Is there some other method? Is it possibile for example configure a .qmail 
to serve this purpose?

> > I'm running qmail on the mail server and Apache+PHP on the web server.
>
>If you're running qmail, why not go with ezmlm which will give you
>better performance since it's working with the very interns of the mail
>server?

Because ezmlm doesn't fit my needed. Actually I'm running Postfix with 
Majordomo, and I have write an italian how-to related the issue (because 
majordomo is designed for qmail and the documentation neglect some 
important issues), but I want switch to qmail, because postfix loses a lot 
of email message when it speaks with slowly mail server like hotmail, aol, 
ecc. and in my opinion qmail is better designed.
I have configured postfix with dedicated transport processes but it lost 
always messages, so I have decided to switch qmail.
Majordomo can manage easily a newsletter, because you can configure a one 
way list: you can post only if you know a password. Instead ezmlm is based 
on "moderation" concept and if you want configure a newsletter, you (the 
admin) have to moderated each message that you send to the newsletter 
itself. This is good for moderated mailing list, but not for newsletter. 
I'm not an expert of ezmlm, if I'm wrong you can correct me. This is that I 
have understand reading the documentation of ezmlm.
I have seen that with mlmmj you can configure a newsletter with a simple 
hack. Just using an extra header cointaining a password, that mlmmmj 
deletes first to delivery the message itself. This extra header will 
contain the password to newsletter posting. You can restrict list post 
using regular expression to stop all the messages that haven't this special 
extra header. This is similar to majordomo makes.

Thank you

-Filippo Fadda  

