From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 05 Jul 2007 20:26:17 +0000
Subject: Re: Support for X-No-Archive planned?
Message-Id: <468D53E9.1020302@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <20070705144515.GC21671@ptaff.ca>
In-Reply-To: <20070705144515.GC21671@ptaff.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Jakob Hirsch wrote:
> Quoting Patrice Levesque:
> 
>> I know I can delete the file in spool/ml/archive/, but is there anything
>> else that can be done?  Is something like “X-No-Archive: yes” supported
>> or planned?

How do you send this kind of header when sending a mail to the list
using thunderbird/icedove for example?

> Is this necessary inside the mlmmj itself? You could just grep over
> recent files with find and grep.

Humf... Before there's something better around, then! :)

> This would be no real-time solution, of
> course, but more like Google's "remove after X days" feature (which I'd
> say is a good thing).

I don't really like that solution. I run mhonarc using the MLMMJ folder,
and unless I force it to reprocess all the full archive each time, the
archived message WOULD be processed in my web archive.

> Anyway, a simple approach to do it synchronously could be to use the
> "noarchive" control flag, i.e. setting it to "2" would honour the
> X-No-Archive header. But it would be probably better (more generic and
> flexible) to create a new flag "archivewith", which would define an
> external program to do the archiving (or not, depending on whatever
> somebody wants, and also _where_ one wants, like an RDBMS or such, e.g.).

It would be VERY nice to be able to launch a web archive program to
update the web archive in real time whenever a message arrives (mhonarc
in my case), so it doesn't have to wait for the next cron job to be
executed (and even removing the need of any cron job).

Thomas

