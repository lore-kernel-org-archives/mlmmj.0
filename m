From: Christian Czech <cc@derago.com>
Date: Sat, 07 Mar 2009 17:02:58 +0000
Subject: Re: Version control systems
Message-Id: <49B2A8C2.4080309@derago.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040707090005090007020401"
List-Id: <mlmmj.mlmmj.org>
References: <49B17DC7.7070600@goirand.fr>
In-Reply-To: <49B17DC7.7070600@goirand.fr>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------040707090005090007020401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I think you have really to try hg or git, to get a feel what is different.

Personally I used rcs for one year and than personally and in company 
cvs for another 13 years until beginning 2006. Than all projects where 
switched to hg  because if several developers are involved especially 
over the internet it is more easy and efficient. I think that mozilla 
for firefox and other projects also switched to hg and other small or 
big projects to git or hg does show that they have some advantages. To 
try something out and keep this changes in your personal repo and maybe 
reuse it at a later time can be quite interesting. You just have your 
personal repo for testing, commiting etc. but not push it to main repo 
maybe at this time. It is much more flexible.

Just convert the cvs repo to hg/mercurial and use it for several weeks 
in parallel. Or maybe just go to the directory where your source is and 
enter:

hg init
hg addremove
hg commit

than you have the current source code in hg and try it for some weeks.

Another point is if you want try something and you have a central repo 
of hg you can just create a directory and enter

hg init
hg pull (with https://path to repo)
hg update
to get a working copy of the source and the repo. If your new changes 
don't work you can just delete the directory. For big tests this is 
quite nice. You just commit to your local repo. If you see that your 
ideas work you can just push them to central repo.

Maybe if you are used to use cvs this sounds complicated but first there 
is also a graphical version you don't need to use command line and 
second after a small amount of time you see that you are much more 
flexible and creative with such an approach like hg or git. I use hg 
because in the past it was more straight forward to use and the windows 
version was in par. Maybe this changed over the years so in general 
there is no big difference if you  use git or hg but cvs is really 
another world. It is not so much different to use but because of the 
centralized nature much less convenient.

It does not matter if you use it for a small or a big project. I really 
recommend just to try. Just spent 2 or 3 ours with hg and you will learn 
a lot and it is also quite interesting. So just give it a try.



--------------040707090005090007020401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
<font face="Tahoma">I think you have really to try hg or git, to get a
feel what is different.<br>
<br>
Personally I used rcs for one year and than personally and in company
cvs for another 13 years until beginning 2006. Than all projects where
switched to hg&nbsp; because if several developers are involved especially
over the internet it is more easy and efficient. I think that mozilla
for firefox and other projects also switched to hg and other small or
big projects to git or hg does show that they have some advantages. To
try something out and keep this changes in your personal repo and maybe
reuse it at a later time can be quite interesting. You just have your
personal repo for testing, commiting etc. but not push it to main repo
maybe at this time. It is much more flexible.<br>
<br>
Just convert the cvs repo to hg/mercurial and use it for several weeks
in parallel. Or maybe just go to the directory where your source is and
enter:<br>
<br>
hg init<br>
hg addremove<br>
hg commit<br>
<br>
than you have the current source code in hg and try it for some weeks.<br>
<br>
Another point is if you want try something and you have a central repo
of hg you can just create a directory and enter<br>
<br>
hg init<br>
hg pull (with <a class="moz-txt-link-freetext" href="https://path">https://path</a> to repo)<br>
hg update<br>
to get a working copy of the source and the repo. If your new changes
don't work you can just delete the directory. For big tests this is
quite nice. You just commit to your local repo. If you see that your
ideas work you can just push them to central repo.<br>
<br>
Maybe if you are used to use cvs this sounds complicated but first
there is also a graphical version you don't need to use command line
and second after a small amount of time you see that you are much more
flexible and creative with such an approach like hg or git. I use hg
because in the past it was more straight forward to use and the windows
version was in par. Maybe this changed over the years so in general
there is no big difference if you&nbsp; use git or hg but cvs is really
another world. It is not so much different to use but because of the
centralized nature much less convenient.<br>
<br>
It does not matter if you use it for a small or a big project. I really
recommend just to try. Just spent 2 or 3 ours with hg and you will
learn a lot and it is also quite interesting. So just give it a try.<br>
<br>
</font><br>
</body>
</html>

--------------040707090005090007020401--
