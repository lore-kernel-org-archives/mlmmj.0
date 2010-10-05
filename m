From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 05 Oct 2010 09:34:32 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <4CAAF128.5040706@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Florian Effenberger wrote:
> Hi,
> 
> is there an option to run mlmmj-maintd recursively? My Ubuntu cron
> script invokes
> 
> /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj
> 
> However, I have my list organized in
> 
> /var/spool/mlmmj/site1.org
> /var/spool/mlmmj/site2.org
> 
> and the like, and it seems that the above command at least doesn't
> send out digests. I just invoked it manually with
> 
> /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj/site1.org
> /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmjsite2.org
> 
> and this seems to work.
> 
> Thanks,
> Florian

Hint:

find /var/spool/mlmmj -type d -exec \
	/usr/bin/mlmmj-maintd -F -d {} \;

Thomas

