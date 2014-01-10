From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 10 Jan 2014 05:02:44 +0000
Subject: Re: [mlmmj] TUNEABLES relayhost and smtpport
Message-Id: <52CF7EF4.3090202@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
In-Reply-To: <20140108222928.Horde.EGrNHHlwq_UyjxXFw7ahsg3@horde.andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 10/01/14 8:08 AM, Andreas Schulze wrote:
> Am 10.01.2014 07:22 schrieb Ben Schmidt:
>> Everything should use relayhost/smtpport. All mail Mlmmj sends is sent
>> by mlmmj-send, and it always does it by SMTP to relayhost on smtpport.
>>
>> What makes you think it isn't?
> Helo Ben,
>
> I configured a separate port for mlm submission
> and created ~mlm/testing/control/smtpport
>
> I have subonlypost and if I send to the list from a subscriber address
> the message is injected via my separate submissionport.
>
> But when I send from a nonsubscriber adresse, the reject goes via
> 127.0.0.1:25
>
> In no case the local sendmail interface was used. That claim was false.

Thank you for the more detailed and accurate information.

I believe I have found the bug. Could you please see if the patch below
fixes it?

> Also I miss a little bit detail of logging.
> The only logging from mlmmj-process is not very informational:
>
> Jan  8 17:22:58 main /usr/bin/mlmmj-process[5114]: mlmmj-process.c:828: Found To: undisclosed-recipients:;: Success
> Jan  8 17:23:01 main /usr/bin/mlmmj-process[5121]: mlmmj-process.c:828: Found To: undisclosed-recipients:;: Success
> Jan  8 17:23:05 main /usr/bin/mlmmj-process[5130]: mlmmj-process.c:828: Found To: undisclosed-recipients:;: Success
> Jan  8 21:37:09 main /usr/bin/mlmmj-process[11412]: mlmmj-process.c:828: Found To: testing@example.org: Success
> Jan  8 21:38:31 main /usr/bin/mlmmj-process[11433]: mlmmj-process.c:828: Found To: testing@example.org: Success
> Jan  8 21:47:59 main /usr/bin/mlmmj-process[11585]: mlmmj-process.c:828: Found To: testing@example.org: Success

Very true. The logging is one of the areas that needs attention.

> I'm using mlmmj-1.2.18.0 build from source:
>    ./configure --prefix=/usr --enable-receive-strip
>    make
>    make install-strip

Excellent!

Smiles,

Ben.



diff --git a/src/mlmmj-process.c b/src/mlmmj-process.c
--- a/src/mlmmj-process.c
+++ b/src/mlmmj-process.c
@@ -1025,6 +1025,7 @@
                                 unlink(donemailname);
                                 myfree(donemailname);
                                 execlp(mlmmjsend, mlmmjsend,
+                                       "-L", listdir,
                                         "-l", "1",
                                         "-T", posteraddr,
                                         "-F", fromaddr,




