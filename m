From: Michael Erdely <merdely@gmail.com>
Date: Thu, 15 Sep 2005 15:05:14 +0000
Subject: Re: Removing attachments?
Message-Id: <72aa2990509150805f79e67f@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <a8f65f4b050915072446534516@mail.gmail.com>
In-Reply-To: <a8f65f4b050915072446534516@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 9/15/05, Perry Ismangil <ismangil@gmail.com> wrote:
> One of the thing that is not clear from reading docs is does mlmmj
> support removal of (some) attachments?

If using sendmail, you could try running the message through a filter
before sending it to mlmmj.  Not tested, but you could try the
following in your /etc/mail/aliases:
mylist:  "| /usr/local/bin/myfilter | /usr/local/bin/mlmmj-recieve -L
/var/spool/mlmmj/mylist/"

-- 
http://erdelynet.com/

Support OpenBSD! http://www.openbsd.org/orders.html
