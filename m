From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Wed, 16 Mar 2011 15:18:51 +0000
Subject: Re: [mlmmj] proposal: sending list-archive as mbox?
Message-Id: <20110316151851.GI23268@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20110315205427.GD23268@barfooze.de>
In-Reply-To: <20110315205427.GD23268@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

Well, I guess you're right, which inspired me to hack a little shellscript that
does this kind of archive creation.

I didn't implement the tar archiver (yet) because I don't need it.

http://paste.xinu.at/gcIq5/
consider it public domain.

It's actually quite hacky, but it works. The formail part is for From-escaping.
I'm going to run it via cronjob.


Best regards,

Moritz

