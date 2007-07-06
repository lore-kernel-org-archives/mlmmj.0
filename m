From: Jakob Hirsch <jh@plonk.de>
Date: Fri, 06 Jul 2007 02:17:05 +0000
Subject: Re: Support for X-No-Archive planned?
Message-Id: <468DA621.1010201@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20070705144515.GC21671@ptaff.ca>
In-Reply-To: <20070705144515.GC21671@ptaff.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thomas Goirand wrote:

>> This would be no real-time solution, of
>> course, but more like Google's "remove after X days" feature (which I'd
>> say is a good thing).
> I don't really like that solution. I run mhonarc using the MLMMJ folder,
> and unless I force it to reprocess all the full archive each time, the
> archived message WOULD be processed in my web archive.

Well, that's a problem of your web archive software then. There's
probably a way to purge message from that one, too.

> It would be VERY nice to be able to launch a web archive program to
> update the web archive in real time whenever a message arrives (mhonarc

You could easily do that with Linux' inotifywait. But that's an
additional background process running, and this is simple to do inside
mlmmj.

