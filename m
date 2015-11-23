From: "Christian Gleerup" <cromozon@swn.nu>
Date: Mon, 23 Nov 2015 22:08:19 +0000
Subject: Re[2]: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <02b18adf31d229fc17a1b9015444850b@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


Good question, 
there is 'something' at port 25, here is the output


sudo netstat -nltp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      490/rpcbind
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      517/sshd
tcp        0      0 0.0.0.0:25              0.0.0.0:*               LISTEN      1135/master
tcp        0      0 0.0.0.0:39048           0.0.0.0:*               LISTEN      499/rpc.statd
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      10910/mysqld
tcp6       0      0 :::111                  :::*                    LISTEN      490/rpcbind
tcp6       0      0 :::80                   :::*                    LISTEN      13443/apache2
tcp6       0      0 :::22                   :::*                    LISTEN      517/sshd
tcp6       0      0 :::25                   :::*                    LISTEN      1135/master
tcp6       0      0 :::443                  :::*                    LISTEN      13443/apache2
tcp6       0      0 :::56747                :::*                    LISTEN      499/rpc.statd



Kind regards and thanks
Christian Gleerup


-----Original Message----- 
> From: "Morten Shearman Kirkegaard" <moki@fabletech.com> 
> To: mlmmj@mlmmj.org 
> Date: 23/11/2015 20:49 
> Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix 
> 
> Hi Christian,
> 
> On 2015-11-23 at 19:20:38 +0100, Christian Gleerup wrote:
> > I have some problems getting mlmmj to send mails out, and I don't know
> > where to look, so I hope you can help me.
> > 
> > I have the following clues
> > In /var/log/mail.err
> > Nov 23 16:00:01 Lists /usr/local/bin/mlmmj-send[21648]:
> > init_sockfd.c:56: Could not connect to 127.0.0.1: Connection refused
> 
> By default mlmmj uses 127.0.0.1 as relay host, when sending mails. It
> appears that you don't have an SMTP server listening there.
> 
> Does the following command (assuming you're on Linux) show an SMTP
> daemon?
> 
> $ netstat -nltp
> 
> Kind regards,
> Morten
> 
> 
> 
> 


