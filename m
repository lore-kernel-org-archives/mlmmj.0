From: Barco van Rhijn <barco@atservice.co.za>
Date: Tue, 14 Feb 2017 13:41:29 +0000
Subject: Re: [mlmmj] Errors on Cron job
Message-Id: <ae95c94d-99ce-7487-9669-001f5db171b3@atservice.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------0667C4B56A5DF95968ED4798"
List-Id: <mlmmj.mlmmj.org>
References: <15f8a122-c3d0-1386-9eed-f46dec861aaa@atservice.co.za>
In-Reply-To: <15f8a122-c3d0-1386-9eed-f46dec861aaa@atservice.co.za>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------0667C4B56A5DF95968ED4798
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ben, Thanks for your friendly reply.

I have indeed copied the files to the /usr/bin directory. Usually this 
would break other references in other programs. But I remembered after 
reading your mail that MLMMJ has no dependencies.

I've corrected some Permissions errors in the /var/spool/mlmmj/ 
directory. But I still don't get any mail back from mlmmj even though 
the list does actually receive it.

The queue directory in the mailing list folder has several files in it. 
Which I guess are some of the test messages I've sent.

  * Since correcting the permissions I've not received any errors or
    messages from the mlmmj-test group.
  * Any idea how I could check why this is not being processed?

Barco

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Here's more information on the Troubleshooting process up to this point:

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

I'm still getting this nagging thing with the mail. I've tested my Exim 
config as suggested in the mlmmj-exim readme files.
And everything checks out nicely. Email does in fact get routed to 
MLMMJ's spool directory.

But I get an error message back when I post to the list:

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

   mlmmj-test@listdomain.co.za
     local delivery failed

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BTW - My email address and the mlmmj group are on the same server

*Checking the logs I found:*

P=esmtpsa X=TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128 CV=no 
A=dovecot_plain:barco@atservice.co.za S=810 
id=76b40b36-fb85-d9d1-e7c5-960c9aa71c80@atservice.co.za T="Hello world" 
for mlmmj-test@listdomain.co.za
2017-02-14 12:43:18 cwd=/var/spool/exim 3 args: /usr/sbin/exim -Mc 
1cdaZp-00044A-GZ
2017-02-14 12:43:19 1cdaZp-00044A-GZ ** mlmmj-test@listdomain.co.za 
R=mlmmj_router */T=mlmmj_transport: Child process of mlmmj_transport 
transport returned 1 from command/*: */usr/local/bin/mlmmj-receive*
2017-02-14 12:43:19 cwd=/var/spool/exim 7 args: /usr/sbin/exim -t -oem 
-oi -f <> -E1cdaZp-00044A-GZ
2017-02-14 12:43:19 SMTP connection from xxx.xxx.x.x closed by QUIT
2017-02-14 12:43:19 1cdaZr-00044T-1p <= <> R=1cdaZp-00044A-GZ U=mailnull 
P=local S=2078 T="Mail delivery failed: returning message to sender" for 
barco@atservice.co.za
2017-02-14 12:43:19 cwd=/var/spool/exim 3 args: /usr/sbin/exim -Mc 
1cdaZr-00044T-1p
2017-02-14 12:43:19 1cdaZp-00044A-GZ Completed

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

*From my digging into this on the mlmmj mailing-list archives it appears 
to be permission related. *

I found some files and folders in the /var/spool/mlmmj directory did not 
have the permissions specified.

-- Setting permissions.

*I've checked my /var/spool/mlmmj directory and all files and lists 
under this have the following permissions:*

mlmmj mlmmj 755

*I've also changed the permissions of all the mlmmj files in 
/usr/local/bin/*

mlmmj mlmmj 755

*After checking this* *when I run the Maintenance Script 
(/usr/bin/mlmmj-maintd -F -L)**
**I get:*

**reply from quit: 250 OK

reply from quit: 250 OK
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

*Output of the operation log*

Tue Feb 14 12:51:46 2017 mlmmj-process: access - A mail from 
"barco@atservice.co.za" was allowed by rule #0 "allow"
Tue Feb 14 12:57:19 2017 mlmmj-process: access - A mail from 
"barco@atservice.co.za" was allowed by rule #0 "allow"
Tue Feb 14 13:09:12 2017 mlmmj-process: access - A mail from 
"barco@atservice.co.za" was allowed by rule #0 "allow"
Tue Feb 14 15:06:50 2017 mlmmj-process: access - A mail from 
"barco@atservice.co.za" was allowed by rule #0 "allow"

*Output of mlmmj-maint.d lastrun.log*

Starting maintenance run at Tue Feb 14 15:10:55 2017

clean_moderation(/var/spool/mlmmj/mlmmj-test);
clean_discarded(/var/spool/mlmmj/mlmmj-test);
clean_subconf(/var/spool/mlmmj/mlmmj-test);
clean_unsubconf(/var/spool/mlmmj/mlmmj-test);
resend_queue(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);
resend_requeue(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);
clean_nolongerbouncing(/var/spool/mlmmj/mlmmj-test);
unsub_bouncers(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-unsub);
probe_bouncers(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-bounce);
run_digests(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--------------0667C4B56A5DF95968ED4798
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Ben, Thanks for your friendly reply.</p>
    <p>I have indeed copied the files to the /usr/bin directory. Usually
      this would break other references in other programs. But I
      remembered after reading your mail that MLMMJ has no dependencies.
      <br>
    </p>
    <p>I've corrected some Permissions errors in the /var/spool/mlmmj/
      directory. But I still don't get any mail back from mlmmj even
      though the list does actually receive it.<br>
    </p>
    <p>The queue directory in the mailing list folder has several files
      in it. Which I guess are some of the test messages I've sent.</p>
    <ul>
      <li>Since correcting the permissions I've not received any errors
        or messages from the mlmmj-test group.<br>
      </li>
      <li>Any idea how I could check why this is not being processed?</li>
    </ul>
    <p>Barco<br>
    </p>
    <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
    </p>
    <p>Here's more information on the Troubleshooting process up to this
      point:<br>
    </p>
    <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
    </p>
    <p>I'm still getting this nagging thing with the mail. I've tested
      my Exim config as suggested in the mlmmj-exim readme files. <br>
      And everything checks out nicely. Email does in fact get routed to
      MLMMJ's spool directory.</p>
    <p>But I get an error message back when I post to the list:</p>
    <pre wrap="">This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@posklip.co.za">mlmmj-test@listdomain.co.za</a>
    local delivery failed</pre>
    <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
    <p>BTW - My email address and the mlmmj group are on the same server</p>
    <p><b>Checking the logs I found:</b></p>
    <p>P=esmtpsa X=TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128 CV=no
      <a class="moz-txt-link-abbreviated" href="mailto:A=dovecot_plain:barco@atservice.co.za">A=dovecot_plain:barco@atservice.co.za</a> S=810
      <a class="moz-txt-link-abbreviated" href="mailto:id=76b40b36-fb85-d9d1-e7c5-960c9aa71c80@atservice.co.za">id=76b40b36-fb85-d9d1-e7c5-960c9aa71c80@atservice.co.za</a> T="Hello
      world" for <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@listdomain.co.za">mlmmj-test@listdomain.co.za</a><br>
      2017-02-14 12:43:18 cwd=/var/spool/exim 3 args: /usr/sbin/exim -Mc
      1cdaZp-00044A-GZ<br>
      2017-02-14 12:43:19 1cdaZp-00044A-GZ **
      <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@listdomain.co.za">mlmmj-test@listdomain.co.za</a> R=mlmmj_router <strong><em>T=mlmmj_transport:
          Child process of mlmmj_transport transport returned 1 from
          command</em></strong>: <b>/usr/local/bin/mlmmj-receive</b><br>
      2017-02-14 12:43:19 cwd=/var/spool/exim 7 args: /usr/sbin/exim -t
      -oem -oi -f &lt;&gt; -E1cdaZp-00044A-GZ<br>
      2017-02-14 12:43:19 SMTP connection from xxx.xxx.x.x closed by
      QUIT<br>
      2017-02-14 12:43:19 1cdaZr-00044T-1p &lt;= &lt;&gt;
      R=1cdaZp-00044A-GZ U=mailnull P=local S=2078 T="Mail delivery
      failed: returning message to sender" for <a class="moz-txt-link-abbreviated" href="mailto:barco@atservice.co.za">barco@atservice.co.za</a><br>
      2017-02-14 12:43:19 cwd=/var/spool/exim 3 args: /usr/sbin/exim -Mc
      1cdaZr-00044T-1p<br>
      2017-02-14 12:43:19 1cdaZp-00044A-GZ Completed</p>
    <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
    <p><b><font color="#ff0000">From my digging into this on the mlmmj
          mailing-list archives it appears to be permission related. </font></b><br>
    </p>
    <p>I found some files and folders in the /var/spool/mlmmj directory
      did not have the permissions specified.</p>
    <p>-- Setting permissions.<br>
    </p>
    <p><b>I've checked my /var/spool/mlmmj directory and all files and
        lists under this have the following permissions:</b></p>
    <p>mlmmj mlmmj 755</p>
    <p><b>I've also changed the permissions of all the mlmmj files in
        /usr/local/bin/</b></p>
    <p>mlmmj mlmmj 755</p>
    <p><b>After checking this</b> <b>when I run the Maintenance Script
        (/usr/bin/mlmmj-maintd -F -L)</b><b><br>
      </b><b> I get:</b></p>
    <p><b> </b>reply from quit: 250 OK<br>
      <br>
      reply from quit: 250 OK<br>
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
    </p>
    <p><b>Output of the operation log</b></p>
    <p>Tue Feb 14 12:51:46 2017 mlmmj-process: access - A mail from
      <a class="moz-txt-link-rfc2396E" href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a> was allowed by rule #0 "allow"<br>
      Tue Feb 14 12:57:19 2017 mlmmj-process: access - A mail from
      <a class="moz-txt-link-rfc2396E" href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a> was allowed by rule #0 "allow"<br>
      Tue Feb 14 13:09:12 2017 mlmmj-process: access - A mail from
      <a class="moz-txt-link-rfc2396E" href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a> was allowed by rule #0 "allow"<br>
      Tue Feb 14 15:06:50 2017 mlmmj-process: access - A mail from
      <a class="moz-txt-link-rfc2396E" href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a> was allowed by rule #0 "allow"</p>
    <p><b>Output of mlmmj-maint.d lastrun.log</b><br>
    </p>
    <p>Starting maintenance run at Tue Feb 14 15:10:55 2017<br>
      <br>
      clean_moderation(/var/spool/mlmmj/mlmmj-test);<br>
      clean_discarded(/var/spool/mlmmj/mlmmj-test);<br>
      clean_subconf(/var/spool/mlmmj/mlmmj-test);<br>
      clean_unsubconf(/var/spool/mlmmj/mlmmj-test);<br>
      resend_queue(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);<br>
      resend_requeue(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);<br>
      clean_nolongerbouncing(/var/spool/mlmmj/mlmmj-test);<br>
      unsub_bouncers(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-unsub);<br>
      probe_bouncers(/var/spool/mlmmj/mlmmj-test,
      /usr/bin/mlmmj-bounce);<br>
      run_digests(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);</p>
    <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
    <br>
  </body>
</html>

--------------0667C4B56A5DF95968ED4798--

