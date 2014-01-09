From: Andreas Schulze <sca@andreasschulze.de>
Date: Thu, 09 Jan 2014 21:08:47 +0000
Subject: Re: [mlmmj] TUNEABLES relayhost and smtpport
Message-Id: <20140109210847.GA15623@solar.andreasschulze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
In-Reply-To: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Am 10.01.2014 07:22 schrieb Ben Schmidt:
> Everything should use relayhost/smtpport. All mail Mlmmj sends is sent
> by mlmmj-send, and it always does it by SMTP to relayhost on smtpport.
> 
> What makes you think it isn't?
Helo Ben,

I configured a separate port for mlm submission
and created ~mlm/testing/control/smtpport

I have subonlypost and if I send to the list from a subscriber address
the message is injected via my separate submissionport.

But when I send from a nonsubscriber adresse, the reject goes via
127.0.0.1:25

In no case the local sendmail interface was used. That claim was false.

Also I miss a little bit detail of logging.
The only logging from mlmmj-process is not very informational:

Jan  8 17:22:58 main /usr/bin/mlmmj-process[5114]: mlmmj-process.c:828: Found To: undisclosed-recipients:;: Success
Jan  8 17:23:01 main /usr/bin/mlmmj-process[5121]: mlmmj-process.c:828: Found To: undisclosed-recipients:;: Success
Jan  8 17:23:05 main /usr/bin/mlmmj-process[5130]: mlmmj-process.c:828: Found To: undisclosed-recipients:;: Success
Jan  8 21:37:09 main /usr/bin/mlmmj-process[11412]: mlmmj-process.c:828: Found To: testing@example.org: Success
Jan  8 21:38:31 main /usr/bin/mlmmj-process[11433]: mlmmj-process.c:828: Found To: testing@example.org: Success
Jan  8 21:47:59 main /usr/bin/mlmmj-process[11585]: mlmmj-process.c:828: Found To: testing@example.org: Success

That where my test from different senders resulting in ml distibution or rejects.
I also checked mlmmj.operation.log but there also only successfull messages where logged.

I'm using mlmmj-1.2.18.0 build from source:
  ./configure --prefix=/usr --enable-receive-strip
  make
  make install-strip


Andreas

