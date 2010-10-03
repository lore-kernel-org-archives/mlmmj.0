From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sun, 03 Oct 2010 13:53:30 +0000
Subject: Re: [mlmmj] Is using the include path for php-admin a good idea?
Message-Id: <20101003155330.58a3af06@franky>
List-Id: <mlmmj.mlmmj.org>
References: <4CA87D1F.6030009@yahoo.com.au>
In-Reply-To: <4CA87D1F.6030009@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 3 Oct 2010 15:49:35 +0200
Franky Van Liedekerke <liedekef@telenet.be> wrote:

> As a longtime php-coder, here's my opinion:
> - Putting it in the include path is a bad idea
> - hardcoding the path also
> So best of all: figure out the current filepath, put it in a variable
> and start from there (don't put this in a config file, it can be
> determined automatically), something like "dirname(__FILE__);" or to
> have the parent dir "basename(dirname(__FILE__));"
> 

well, please ignore my last statement :-)
Basename strips the parent dir, not returns it. I wish for a mail-recall
feature in mlmmj ;-)

Franky

