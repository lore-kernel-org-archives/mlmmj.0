From: Nate Beaty <natebeaty@gmail.com>
Date: Mon, 03 Jul 2006 05:25:23 +0000
Subject: Re: Encoding emails in header for AOL feedback loop?
Message-Id: <128A1D1C-7E5E-4D2D-BF3D-73EE51E0AE3E@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <42739F1F-EDF1-4641-B780-FD4061B679D4@gmail.com>
In-Reply-To: <42739F1F-EDF1-4641-B780-FD4061B679D4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> You are referreing to the "Client TOS Notification" mails, right?

Correct.

> I just took a look at one of those mails, and I see a non-stripped
> Return-Path header:
>
> Return-Path: 	<news-daily+bounces-78- 
> foobar=aol.com@list.somedomain.tld>
>
> I have of course changed the address above a little bit, but the info
> seems to be there, at least in the mails they send to us.

Holy smokes, you're right. Never mind! I was looking at these in  
Apple Mail and pressing cmd-shift-h to view Long Headers, which only  
expands the main headers. I didn't realize Mail would hide any  
headers included in a message that's part of a multipart/mixed email!  
Agh! Cmd-alt-u shows the Raw Source, which reveals the Return-Path  
header.

Thanks for pointing this out. Immensely helpful to me. (Skulks away  
feeling dumb.)

Nate.

--
Clixel Design & Coding ~ http://clixel.com/

