From: "Jesper Lund Stocholm" <jesper.stocholm@ciber.dk>
Date: Thu, 22 Oct 2009 20:35:27 +0000
Subject: RE: Howto for using mlmmj
Message-Id: <A47BAB0B49FD934EA28A3A21B943AB900119436C@eusex01.sweden.ecsoft>
List-Id: <mlmmj.mlmmj.org>
References: <A47BAB0B49FD934EA28A3A21B943AB9001194240@eusex01.sweden.ecsoft>
In-Reply-To: <A47BAB0B49FD934EA28A3A21B943AB9001194240@eusex01.sweden.ecsoft>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

> -----Original Message-----
> From: Marco S Hyman [mailto:marc@snafu.org]
> Sent: Thursday, October 22, 2009 5:53 PM
> To: Jesper Lund Stocholm
> Cc: mlmmj@mlmmj.org
> Subject: Re: Howto for using mlmmj
> 
[snip]
> 
> Note that all of these commands are run on the machine that
> hosts the list.  I'm not aware of any way of doing these functions
> remotely through email, but then I've never looked, either.

Ok - is /any/ of it available thru email commands? A few years back I
used another mail list mgr (I can't remember which) and I was able to do
a good part of day-to-day configuration via email.

The "email commands" could be

Add moderator to list:

To: mylist@dom.tld
Subject: add mod myemail@example.com

Remove moderator from list:

To: mylist@dom.tld
Subject: rm mod myemail@example.com

Add email to list:

Subject: add youremail@example.com

Remove email from list:

Subject: rm youremail@example.com

Get list of all recipients:

Subject: list

Bulk-add emails to list:

Subject: bulkinsert
Body:
Email1
Email2
Email3
...

The above are just examples of what I would like to be able to do. The
commands were naturally only available to people (email addresses)
registered as either admins or moderators.

Thanks for your time,

/Jesper


