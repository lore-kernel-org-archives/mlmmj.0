From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 08 Feb 2005 17:57:15 +0000
Subject: Re: mlmmj-1.2.3 released. Features added and bugs squashed.
Message-Id: <20050208175715.GA12405@note241453.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050208095412.GE56543@mmj.dk>
In-Reply-To: <20050208095412.GE56543@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Wolf,

On Tue, Feb 08, 2005 at 02:56:32PM +0200, Wolf Bergenheim wrote:
> ahem.. it is a production server... I'd rather not put untested code there...
> I hope you understand... /:
> 
> But thanks for jumping up and doing it. It's not that much of a rush.. the
> new domains are going live 1.3 (:

If you want to support two addresses for the same list, you could create two
lists with symlinks for the common files. Eg.:

$ ls -l /var/spool/mlmmj/list-386596/
drwxr-xr-x  2 nobody  wheel   240 Dec  3 12:49 archive
drwxr-xr-x  2 nobody  wheel   632 Aug 26 19:59 bounce
drwxr-xr-x  2 nobody  wheel   288 Aug  3  2004 control
drwxr-xr-x  2 nobody  wheel  2224 Dec  3 13:51 incoming
-rw-r--r--  1 nobody  wheel     2 Dec  3 12:48 index
drwxr-xr-x  2 nobody  wheel   368 Dec  3 12:48 log
drwxr-xr-x  2 nobody  wheel    48 Aug  3  2004 moderation
drwxr-xr-x  3 nobody  wheel    80 Aug 26 19:59 queue
drwxr-xr-x  6 nobody  wheel   144 Sep  3 15:20 requeue
drwxr-xr-x  2 nobody  wheel    48 May  5  2004 subconf
drwxr-xr-x  2 nobody  wheel    72 Dec  3 12:48 subscribers.d
drwxr-xr-x  2 nobody  wheel   216 May 12  2004 text
drwxr-xr-x  2 nobody  wheel    48 May  6  2004 unsubconf

$ ls -l /var/spool/mlmmj/list-386596-alias
lrwxrwxrwx  1 nobody  wheel    23 Feb  8 18:52 archive -> ../list-386596/archive/
lrwxrwxrwx  1 nobody  wheel    22 Feb  8 18:52 bounce -> ../list-386596/bounce/
drwxr-xr-x  2 nobody  wheel    48 Feb  8 18:53 control
lrwxrwxrwx  1 nobody  wheel    24 Feb  8 18:53 incoming -> ../list-386596/incoming/
lrwxrwxrwx  1 nobody  wheel    20 Feb  8 18:53 index -> ../list-386596/index
lrwxrwxrwx  1 nobody  wheel    19 Feb  8 18:53 log -> ../list-386596/log/
lrwxrwxrwx  1 nobody  wheel    26 Feb  8 18:53 moderation -> ../list-386596/moderation/
lrwxrwxrwx  1 nobody  wheel    21 Feb  8 18:53 queue -> ../list-386596/queue/
lrwxrwxrwx  1 nobody  wheel    23 Feb  8 18:53 requeue -> ../list-386596/requeue/
lrwxrwxrwx  1 nobody  wheel    23 Feb  8 18:53 subconf -> ../list-386596/subconf/
lrwxrwxrwx  1 nobody  wheel    29 Feb  8 18:53 subscribers.d -> ../list-386596/subscribers.d/
lrwxrwxrwx  1 nobody  wheel    20 Feb  8 18:53 text -> ../list-386596/text/
lrwxrwxrwx  1 nobody  wheel    25 Feb  8 18:53 unsubconf -> ../list-386596/unsubconf/

OBS! This is not tested, but it should "solve" your problem without any change
to the code.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
