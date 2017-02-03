From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 03 Feb 2017 10:13:46 +0000
Subject: Re: [mlmmj] Errors on Cron job
Message-Id: <bb41bb09-0639-da40-a167-f1ccc8410e77@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <15f8a122-c3d0-1386-9eed-f46dec861aaa@atservice.co.za>
In-Reply-To: <15f8a122-c3d0-1386-9eed-f46dec861aaa@atservice.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

My guess:

Mlmmj looks at the command used to invoke it to call other processes. It
requires the full path to be used. So you must use
/usr/bin/mlmmj-receive not just mlmmj-receive. It will then execute
other commands such as /usr/bin/mlmmj-sub and /usr/bin/mlmmj-send. If
you used a symlink, it could be that it can't find these other
executables unless you symlinked them all. I would suggest finding where
/usr/local/bin/mlmmj-receive is being called by script or your mail
server and changing it to the correct path rather than using symlinks.

Check syslog and $listdir/operation.log for useful messages (most likely
in syslog), too. They might shed more light on what's going on.

Smiles,

Ben



On 27/01/2017 4:31 am, Barco van Rhijn wrote:
> Good Evening,
>
> Recently setup MLMMJ on a Centos server that has Cpanel installed.
>
> *I get this error in my mail delivery log:*
>
> "Child process of mlmmj_transport transport returned 127 (could mean unable to
> exec or command does not exist) from command: /usr/local/bin/mlmmj-receive"
>
> I checked the commands do not exist in this location
> On Centos the commands are indeed located in /usr/bin/
>
> So I've created a symbolic link for that file in the expected directory.
>
> *This did sort of work but now I get an error :*
> Child process of mlmmj_transport transport returned 1 from command:
> /usr/local/bin/mlmmj-receive
>
> Any ideas how I could resolve this?
>
> BTW: My Cron is executed as root and I've checked permissions to the spool
> directory before hitting this roadblock.
>
> Warm Regards
> Barco van Rhijn

