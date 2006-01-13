From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Fri, 13 Jan 2006 22:10:18 +0000
Subject: Re: Is anyone using mlmmj with qmail?
Message-Id: <Pine.LNX.4.61.0601131703410.16146@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601112014230.3643@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601112014230.3643@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Fri, 13 Jan 2006, Mads Martin Joergensen wrote:

>> Jan 13 13:33:12 xen010503 qmail: 1137159192.508432 status: local 1/10
>> remote 0/20
>> Jan 13 13:33:12 xen010503 qmail: 1137159192.881010 delivery 1: success:
>> did_0+0+1/
...
>>
>> Here is the log. As you can see, it's doing the delivery correctly. The
>> problem is that it seems it's not sending it to mlmmj-recieve.

What's your evidence for that? qmail reported a successful delivery.

>> My .qmail-default contains the following:

Do you know that that .qmail file is used for the delivery?

>> |preline -f /usr/bin/mlmmj-recieve -L
>> /var/spool/mlmmj/xen010503.gplhost.com_test -F
>>
>> What is strange, is that when I just type "preline -f
>> /usr/bin/mlmmj-recieve -L /var/spool/mlmmj/xen010503.gplhost.com_test"
>> on the command line, it says "preline: usage: preline cmd [ arg ... ]"
>> so it seems to be wrong.
>
> Someone on this list have gotten this working--if it's not passing it on
> to mlmmj-recieve, then mlmmj cannot be blamed (yet :-)
>
> http://mlmmj.mmj.dk/archive/0331.html <- can that help?

That message says that "preline -f ..." is needed, which is what we've 
been shown is being used.

>> Where is that folder supposed to be? If it's supposed to be in the list
>> folder, then mlmmj-make-ml didn't make it.
>
> It's in queue/

Which "queue/"? Not the qmail queue (under /var/qmail/queue), because, as 
we've already seen, it's been successfully delivered.

Thomas, please tell us the full story (and there's no need to SHOUT, I'm 
sure).
