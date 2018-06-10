From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Sun, 10 Jun 2018 14:46:22 +0000
Subject: Re: [mlmmj] new mlmmj install on 64bit CentOS 7 server running Exim
Message-Id: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------90123619CDDA63241A156CF6"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------90123619CDDA63241A156CF6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Ben et al,

I've been using mlmmj for several years on a 32bit CentOS server running
sendmail - its been very stable, and I've been very happy with how it works.

Last week I migrated everything to a new 64bit CentOS 7 server running Exim.

I followed the directions on the README.exim doc on the mlmmj site, and
got the correct response from the "exim -bt test-list@mydomain.org" per
the README.exim doc page, ie:

 test-list@mydomain.org
      router = mlmmj_router,  transport = mlmmj_transport

When I send a test email to the list, I find two entries in the server
/var/log/maillog file, like this:

Jun 10 14:14:43 new /usr/local/bin/mlmmj-receive[18390]:
mlmmj-receive.c:112: Have to invoke either as root or as the user owning
listdir Invoked with uid = [1000]: Success

Jun 10 14:14:43 new dovecot: lda(webmaster@mydomain.org):
msgid=<E1fS17D-0004me-TE@new.mydomain.org>: saved mail to INBOX

I also find an entry in /var/log/exim/main.log file indicating its
returning a code 1 response, like this:

2018-06-10 14:14:43 1fS17D-0004mY-OJ ** check-test@mydomain.org
R=mlmmj_router T=mlmmj_transport: Child process of mlmmj_transport
transport returned 1 from command: /usr/local/bin/mlmmj-receive

But I'm receiving a bounce message back with a similar msg that Barco
reported a little over a year ago:

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  check-test@mydomain.org
    local delivery failed

Reporting-MTA: dns; new.mydomain.org

Action: failed
Final-Recipient: rfc822;check-test@mydomain.org
Status: 5.0.0

I generated the test list using mlmmj-make-ml, and all file / directory
permissions and ownership appear to be set correctly.

I'm using a /var/spool/mlmmj/check-test/subscribers.d/test.txt file with
3 emails in it, that I've used for test purposes previously, and all
other list parameters are defaults.

At this point I'm at a loss as to why my test emails are bouncing back.
Can anyone provide suggestions for why this might be failing, or what I
should check?

Any help or feedback would be greatly appreciated!

Philip
webmaster@vlsc.org



On 2/17/2017 4:56 PM, Ben Schmidt wrote:
> Hi, Barco,
>
> Your permissions seem OK. Some questions and things to try:
>
> - I trust you created your list with mlmmj-make-ml so it has all the
> necessary subdirectories, texts, etc. in the listdir?
>
> - I can see your exim logs. If I remember correctly, Exim by default
> has its own log, e.g. /var/log/exim4.log or something. Have you
> checked syslog? Mlmmj's messages go to syslog, with the mail facility,
> so you might find its messages in /var/log/syslog or /var/log/mail.log
> or /var/log/mail.err or something like that. mlmmj-receive is clearly
> being executed and returning 1, which means it almost certainly will
> have logged a message. We just need to find it.
>
> - Try removing the -F flag from the mlmmj-receive command and
> replacing it with a -P flag and send a test message. This tells
> mlmmj-receive not to try to process the message at all. When you send
> mail to the list then, it will deliberately not be processed, but we
> will know if it is failing earlier than that or not. See if it still
> returns 1 and you get a bounce message, or whether Exim thinks it has
> succeeded. See if your message appears in listdir/incoming; it should
> be left there if Mlmmj doesn't process it further.
>
> - Are there other messages in listdir/incoming? Or listdir/queue or
> listdir/requeue or listdir/moderation or listdir/archive? What is the
> content of the listdir/index file, if it exists? Finding where in
> these folders your messages are, and what index it's up to, will give
> some insight into how much processing Mlmmj is succeeding to do.
>
> - Try with neither the -F or -P flag and send a test message. That
> tells Mlmmj to operate as it does by default: it receives the message
> in the foreground, but attempts to process it in the background. I'm
> not sure why the Exim configuration doesn't use this mode, and it
> could be because Exim will kill the background process or something,
> but it might give some insight trying it anyway.
>
> - Are there any special or unusual characters in your email address,
> list name, or domain at all?
>
> - Is something (Exim? your shell?) running in a chroot environment, so
> actually things aren't where you expect them to be? Do you need to put
> the listdir, etc. inside a chroot jail somewhere for it to work?
>
> - About the only time Mlmmj won't log an error but exit with failure
> is if the listdir isn't given on the commandline at all (it's missing
> -L). To be absolutely certain the correct command is being executed by
> Exim, you could rename mlmmj-receive to something else temporarily,
> and put a simple shell script there to log the commandline arguments,
> and send a test message. For example:
>
> #!/bin/sh
> echo "$@" > /tmp/mlmmj-args
>
> Then look at /tmp/mlmmj-args after sending your test message and see
> what's there. I guess if the file doesn't appear where you expect,
> it's probably in a chroot jail somewhere.
>
> Maybe one of these suggestions will help.
>
> Smiles,
>
> Ben
>
>
>
> On 15/02/2017 12:41 am, Barco van Rhijn wrote:
>>
>> Ben, Thanks for your friendly reply.
>>
>> I have indeed copied the files to the /usr/bin directory. Usually
>> this would break other references in other programs. But I remembered
>> after reading your mail that MLMMJ has no dependencies.
>>
>> I've corrected some Permissions errors in the /var/spool/mlmmj/
>> directory. But I still don't get any mail back from mlmmj even though
>> the list does actually receive it.
>>
>> The queue directory in the mailing list folder has several files in
>> it. Which I guess are some of the test messages I've sent.
>>
>>   * Since correcting the permissions I've not received any errors or
>>     messages from the mlmmj-test group.
>>   * Any idea how I could check why this is not being processed?
>>
>> Barco
>>
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> Here's more information on the Troubleshooting process up to this point:
>>
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> I'm still getting this nagging thing with the mail. I've tested my
>> Exim config as suggested in the mlmmj-exim readme files.
>> And everything checks out nicely. Email does in fact get routed to
>> MLMMJ's spool directory.
>>
>> But I get an error message back when I post to the list:
>>
>> This message was created automatically by mail delivery software.
>>
>> A message that you sent could not be delivered to one or more of its
>> recipients. This is a permanent error. The following address(es) failed:
>>
>>   mlmmj-test@listdomain.co.za
>>     local delivery failed
>>
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> BTW - My email address and the mlmmj group are on the same server
>>
>> *Checking the logs I found:*
>>
>> P=esmtpsa X=TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128 CV=no
>> A=dovecot_plain:barco@atservice.co.za S=810
>> id=76b40b36-fb85-d9d1-e7c5-960c9aa71c80@atservice.co.za T="Hello
>> world" for mlmmj-test@listdomain.co.za
>> 2017-02-14 12:43:18 cwd=/var/spool/exim 3 args: /usr/sbin/exim -Mc
>> 1cdaZp-00044A-GZ
>> 2017-02-14 12:43:19 1cdaZp-00044A-GZ ** mlmmj-test@listdomain.co.za
>> R=mlmmj_router */T=mlmmj_transport: Child process of mlmmj_transport
>> transport returned 1 from command/*: */usr/local/bin/mlmmj-receive*
>> 2017-02-14 12:43:19 cwd=/var/spool/exim 7 args: /usr/sbin/exim -t
>> -oem -oi -f <> -E1cdaZp-00044A-GZ
>> 2017-02-14 12:43:19 SMTP connection from xxx.xxx.x.x closed by QUIT
>> 2017-02-14 12:43:19 1cdaZr-00044T-1p <= <> R=1cdaZp-00044A-GZ
>> U=mailnull P=local S=2078 T="Mail delivery failed: returning message
>> to sender" for barco@atservice.co.za
>> 2017-02-14 12:43:19 cwd=/var/spool/exim 3 args: /usr/sbin/exim -Mc
>> 1cdaZr-00044T-1p
>> 2017-02-14 12:43:19 1cdaZp-00044A-GZ Completed
>>
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> *From my digging into this on the mlmmj mailing-list archives it
>> appears to be permission related. *
>>
>> I found some files and folders in the /var/spool/mlmmj directory did
>> not have the permissions specified.
>>
>> -- Setting permissions.
>>
>> *I've checked my /var/spool/mlmmj directory and all files and lists
>> under this have the following permissions:*
>>
>> mlmmj mlmmj 755
>>
>> *I've also changed the permissions of all the mlmmj files in
>> /usr/local/bin/*
>>
>> mlmmj mlmmj 755
>>
>> *After checking this* *when I run the Maintenance Script
>> (/usr/bin/mlmmj-maintd -F -L)**
>> **I get:*
>>
>> **reply from quit: 250 OK
>>
>> reply from quit: 250 OK
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> *Output of the operation log*
>>
>> Tue Feb 14 12:51:46 2017 mlmmj-process: access - A mail from
>> "barco@atservice.co.za" was allowed by rule #0 "allow"
>> Tue Feb 14 12:57:19 2017 mlmmj-process: access - A mail from
>> "barco@atservice.co.za" was allowed by rule #0 "allow"
>> Tue Feb 14 13:09:12 2017 mlmmj-process: access - A mail from
>> "barco@atservice.co.za" was allowed by rule #0 "allow"
>> Tue Feb 14 15:06:50 2017 mlmmj-process: access - A mail from
>> "barco@atservice.co.za" was allowed by rule #0 "allow"
>>
>> *Output of mlmmj-maint.d lastrun.log*
>>
>> Starting maintenance run at Tue Feb 14 15:10:55 2017
>>
>> clean_moderation(/var/spool/mlmmj/mlmmj-test);
>> clean_discarded(/var/spool/mlmmj/mlmmj-test);
>> clean_subconf(/var/spool/mlmmj/mlmmj-test);
>> clean_unsubconf(/var/spool/mlmmj/mlmmj-test);
>> resend_queue(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);
>> resend_requeue(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);
>> clean_nolongerbouncing(/var/spool/mlmmj/mlmmj-test);
>> unsub_bouncers(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-unsub);
>> probe_bouncers(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-bounce);
>> run_digests(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);
>>
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>>
>


--------------90123619CDDA63241A156CF6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font face="Helvetica, Arial, sans-serif">Hi Ben et al,<br>
      <br>
      I've been using mlmmj for several years on a 32bit CentOS server
      running sendmail - its been very stable, and I've been very happy
      with how it works.<br>
      <br>
      Last week I migrated everything to a new 64bit CentOS 7 server
      running Exim.<br>
      <br>
      I followed the directions on the README.exim doc on the mlmmj
      site, and got the correct response from the "exim -bt
      <a class="moz-txt-link-abbreviated" href="mailto:test-list@mydomain.org">test-list@mydomain.org</a>" per the README.exim doc page, ie:<br>
      <br>
       <a class="moz-txt-link-abbreviated" href="mailto:test-list@mydomain.org">test-list@mydomain.org</a><br>
            router = mlmmj_router,  transport = mlmmj_transport<br>
      <br>
      When I send a test email to the list, I find two entries in the
      server /var/log/maillog file, like this:<br>
      <br>
    </font><tt>Jun 10 14:14:43 new /usr/local/bin/mlmmj-receive[18390]:
      mlmmj-receive.c:112: Have to invoke either as root or as the user
      owning listdir Invoked with uid = [1000]: Success</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Jun 10 14:14:43 new dovecot: lda(<a class="moz-txt-link-abbreviated" href="mailto:webmaster@mydomain.org">webmaster@mydomain.org</a>):
      msgid=<a class="moz-txt-link-rfc2396E" href="mailto:E1fS17D-0004me-TE@new.mydomain.org">&lt;E1fS17D-0004me-TE@new.mydomain.org&gt;</a>: saved mail to
      INBOX</tt><font face="Helvetica, Arial, sans-serif"><font
        face="Helvetica, Arial, sans-serif"><br>
        <br>
      </font>I also find an entry in /var/log/exim/main.log file
      indicating its returning a code 1 response, like this:<br>
    </font><tt><br>
    </tt><tt>2018-06-10 14:14:43 1fS17D-0004mY-OJ **
      <a class="moz-txt-link-abbreviated" href="mailto:check-test@mydomain.org">check-test@mydomain.org</a> R=mlmmj_router T=mlmmj_transport: Child
      process of mlmmj_transport transport returned 1 from command:
      /usr/local/bin/mlmmj-receive</tt><tt><br>
    </tt><font face="Helvetica, Arial, sans-serif"><br>
      But I'm receiving a bounce message back with a similar msg that
      Barco reported a little over a year ago:<br>
      <br>
    </font><tt>This message was created automatically by mail delivery
      software.</tt><tt><br>
    </tt><tt><br>
    </tt><tt>A message that you sent could not be delivered to one or
      more of its</tt><tt><br>
    </tt><tt>recipients. This is a permanent error. The following
      address(es) failed:</tt><tt><br>
    </tt><tt><br>
    </tt><tt>  c</tt><tt>heck</tt><tt>-test@mydomain.org</tt><tt><br>
    </tt><tt>    local delivery failed</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Reporting-MTA: dns; new.mydomain.org</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Action: failed</tt><tt><br>
    </tt><tt>Final-Recipient: <a class="moz-txt-link-abbreviated" href="mailto:rfc822;check-test@mydomain.org">rfc822;check-test@mydomain.org</a></tt><tt><br>
    </tt><tt>Status: 5.0.0</tt><font face="Helvetica, Arial, sans-serif"><br>
      <br>
      I generated the test list using mlmmj-make-ml, and all file /
      directory permissions and ownership appear to be set correctly. <br>
      <br>
      I'm using a /var/spool/mlmmj/check-test/subscribers.d/test.txt
      file with 3 emails in it, that I've used for test purposes
      previously, and all other list parameters are defaults.<br>
      <br>
      At this point I'm at a loss as to why my test emails are bouncing
      back. Can anyone provide suggestions for why this might be
      failing, or what I should check?<br>
      <br>
      Any help or feedback would be greatly appreciated!<br>
      <br>
      Philip<br>
      <a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a><br>
      <br>
      <br>
      <br>
    </font>
    <div class="moz-cite-prefix">On 2/17/2017 4:56 PM, Ben Schmidt
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:63b9bb08-6ba2-5c0a-daff-f3cb38b1bede@yahoo.com.au">
      <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
      Hi, Barco,
      <p>Your permissions seem OK. Some questions and things to try:</p>
      <p>- I trust you created your list with mlmmj-make-ml so it has
        all the necessary subdirectories, texts, etc. in the listdir?<br>
      </p>
      <p>- I can see your exim logs. If I remember correctly, Exim by
        default has its own log, e.g. /var/log/exim4.log or something.
        Have you checked syslog? Mlmmj's messages go to syslog, with the
        mail facility, so you might find its messages in /var/log/syslog
        or /var/log/mail.log or /var/log/mail.err or something like
        that. mlmmj-receive is clearly being executed and returning 1,
        which means it almost certainly will have logged a message. We
        just need to find it.</p>
      <p>- Try removing the -F flag from the mlmmj-receive command and
        replacing it with a -P flag and send a test message. This tells
        mlmmj-receive not to try to process the message at all. When you
        send mail to the list then, it will deliberately not be
        processed, but we will know if it is failing earlier than that
        or not. See if it still returns 1 and you get a bounce message,
        or whether Exim thinks it has succeeded. See if your message
        appears in listdir/incoming; it should be left there if Mlmmj
        doesn't process it further.</p>
      <p>- Are there other messages in listdir/incoming? Or
        listdir/queue or listdir/requeue or listdir/moderation or
        listdir/archive? What is the content of the listdir/index file,
        if it exists? Finding where in these folders your messages are,
        and what index it's up to, will give some insight into how much
        processing Mlmmj is succeeding to do.<br>
      </p>
      <p>- Try with neither the -F or -P flag and send a test message.
        That tells Mlmmj to operate as it does by default: it receives
        the message in the foreground, but attempts to process it in the
        background. I'm not sure why the Exim configuration doesn't use
        this mode, and it could be because Exim will kill the background
        process or something, but it might give some insight trying it
        anyway.</p>
      <p>- Are there any special or unusual characters in your email
        address, list name, or domain at all?</p>
      <p>- Is something (Exim? your shell?) running in a chroot
        environment, so actually things aren't where you expect them to
        be? Do you need to put the listdir, etc. inside a chroot jail
        somewhere for it to work?<br>
      </p>
      <p>- About the only time Mlmmj won't log an error but exit with
        failure is if the listdir isn't given on the commandline at all
        (it's missing -L). To be absolutely certain the correct command
        is being executed by Exim, you could rename mlmmj-receive to
        something else temporarily, and put a simple shell script there
        to log the commandline arguments, and send a test message. For
        example:</p>
      <p>#!/bin/sh<br>
        echo "$@" &gt; /tmp/mlmmj-args</p>
      <p>Then look at /tmp/mlmmj-args after sending your test message
        and see what's there. I guess if the file doesn't appear where
        you expect, it's probably in a chroot jail somewhere.<br>
      </p>
      <p>Maybe one of these suggestions will help.</p>
      <p>Smiles,<br>
      </p>
      <p>Ben</p>
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">On 15/02/2017 12:41 am, Barco van
        Rhijn wrote:<br>
      </div>
      <blockquote
        cite="mid:ae95c94d-99ce-7487-9669-001f5db171b3@atservice.co.za"
        type="cite">
        <meta content="text/html; charset=utf-8"
          http-equiv="Content-Type">
        <p>Ben, Thanks for your friendly reply.</p>
        <p>I have indeed copied the files to the /usr/bin directory.
          Usually this would break other references in other programs.
          But I remembered after reading your mail that MLMMJ has no
          dependencies. <br>
        </p>
        <p>I've corrected some Permissions errors in the
          /var/spool/mlmmj/ directory. But I still don't get any mail
          back from mlmmj even though the list does actually receive it.<br>
        </p>
        <p>The queue directory in the mailing list folder has several
          files in it. Which I guess are some of the test messages I've
          sent.</p>
        <ul>
          <li>Since correcting the permissions I've not received any
            errors or messages from the mlmmj-test group.<br>
          </li>
          <li>Any idea how I could check why this is not being
            processed?</li>
        </ul>
        <p>Barco<br>
        </p>
        <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
        </p>
        <p>Here's more information on the Troubleshooting process up to
          this point:<br>
        </p>
        <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
        </p>
        <p>I'm still getting this nagging thing with the mail. I've
          tested my Exim config as suggested in the mlmmj-exim readme
          files. <br>
          And everything checks out nicely. Email does in fact get
          routed to MLMMJ's spool directory.</p>
        <p>But I get an error message back when I post to the list:</p>
        <pre wrap="">This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  <a moz-do-not-send="true" class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@posklip.co.za">mlmmj-test@listdomain.co.za</a>
    local delivery failed</pre>
        <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
        <p>BTW - My email address and the mlmmj group are on the same
          server</p>
        <p><b>Checking the logs I found:</b></p>
        <p>P=esmtpsa X=TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128 CV=no <a
            moz-do-not-send="true" class="moz-txt-link-abbreviated"
            href="mailto:A=dovecot_plain:barco@atservice.co.za">A=dovecot_plain:barco@atservice.co.za</a>
          S=810 <a moz-do-not-send="true"
            class="moz-txt-link-abbreviated"
            href="mailto:id=76b40b36-fb85-d9d1-e7c5-960c9aa71c80@atservice.co.za">id=76b40b36-fb85-d9d1-e7c5-960c9aa71c80@atservice.co.za</a>
          T="Hello world" for <a moz-do-not-send="true"
            class="moz-txt-link-abbreviated"
            href="mailto:mlmmj-test@listdomain.co.za">mlmmj-test@listdomain.co.za</a><br>
          2017-02-14 12:43:18 cwd=/var/spool/exim 3 args: /usr/sbin/exim
          -Mc 1cdaZp-00044A-GZ<br>
          2017-02-14 12:43:19 1cdaZp-00044A-GZ ** <a
            moz-do-not-send="true" class="moz-txt-link-abbreviated"
            href="mailto:mlmmj-test@listdomain.co.za">mlmmj-test@listdomain.co.za</a>
          R=mlmmj_router <strong><em>T=mlmmj_transport: Child process
              of mlmmj_transport transport returned 1 from command</em></strong>:
          <b>/usr/local/bin/mlmmj-receive</b><br>
          2017-02-14 12:43:19 cwd=/var/spool/exim 7 args: /usr/sbin/exim
          -t -oem -oi -f &lt;&gt; -E1cdaZp-00044A-GZ<br>
          2017-02-14 12:43:19 SMTP connection from xxx.xxx.x.x closed by
          QUIT<br>
          2017-02-14 12:43:19 1cdaZr-00044T-1p &lt;= &lt;&gt;
          R=1cdaZp-00044A-GZ U=mailnull P=local S=2078 T="Mail delivery
          failed: returning message to sender" for <a
            moz-do-not-send="true" class="moz-txt-link-abbreviated"
            href="mailto:barco@atservice.co.za">barco@atservice.co.za</a><br>
          2017-02-14 12:43:19 cwd=/var/spool/exim 3 args: /usr/sbin/exim
          -Mc 1cdaZr-00044T-1p<br>
          2017-02-14 12:43:19 1cdaZp-00044A-GZ Completed</p>
        <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
        <p><b><font color="#ff0000">From my digging into this on the
              mlmmj mailing-list archives it appears to be permission
              related. </font></b><br>
        </p>
        <p>I found some files and folders in the /var/spool/mlmmj
          directory did not have the permissions specified.</p>
        <p>-- Setting permissions.<br>
        </p>
        <p><b>I've checked my /var/spool/mlmmj directory and all files
            and lists under this have the following permissions:</b></p>
        <p>mlmmj mlmmj 755</p>
        <p><b>I've also changed the permissions of all the mlmmj files
            in /usr/local/bin/</b></p>
        <p>mlmmj mlmmj 755</p>
        <p><b>After checking this</b> <b>when I run the Maintenance
            Script (/usr/bin/mlmmj-maintd -F -L)</b><b><br>
          </b><b> I get:</b></p>
        <p><b> </b>reply from quit: 250 OK<br>
          <br>
          reply from quit: 250 OK<br>
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
        </p>
        <p><b>Output of the operation log</b></p>
        <p>Tue Feb 14 12:51:46 2017 mlmmj-process: access - A mail from
          <a moz-do-not-send="true" class="moz-txt-link-rfc2396E"
            href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a>
          was allowed by rule #0 "allow"<br>
          Tue Feb 14 12:57:19 2017 mlmmj-process: access - A mail from <a
            moz-do-not-send="true" class="moz-txt-link-rfc2396E"
            href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a>
          was allowed by rule #0 "allow"<br>
          Tue Feb 14 13:09:12 2017 mlmmj-process: access - A mail from <a
            moz-do-not-send="true" class="moz-txt-link-rfc2396E"
            href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a>
          was allowed by rule #0 "allow"<br>
          Tue Feb 14 15:06:50 2017 mlmmj-process: access - A mail from <a
            moz-do-not-send="true" class="moz-txt-link-rfc2396E"
            href="mailto:barco@atservice.co.za">"barco@atservice.co.za"</a>
          was allowed by rule #0 "allow"</p>
        <p><b>Output of mlmmj-maint.d lastrun.log</b><br>
        </p>
        <p>Starting maintenance run at Tue Feb 14 15:10:55 2017<br>
          <br>
          clean_moderation(/var/spool/mlmmj/mlmmj-test);<br>
          clean_discarded(/var/spool/mlmmj/mlmmj-test);<br>
          clean_subconf(/var/spool/mlmmj/mlmmj-test);<br>
          clean_unsubconf(/var/spool/mlmmj/mlmmj-test);<br>
          resend_queue(/var/spool/mlmmj/mlmmj-test,
          /usr/bin/mlmmj-send);<br>
          resend_requeue(/var/spool/mlmmj/mlmmj-test,
          /usr/bin/mlmmj-send);<br>
          clean_nolongerbouncing(/var/spool/mlmmj/mlmmj-test);<br>
          unsub_bouncers(/var/spool/mlmmj/mlmmj-test,
          /usr/bin/mlmmj-unsub);<br>
          probe_bouncers(/var/spool/mlmmj/mlmmj-test,
          /usr/bin/mlmmj-bounce);<br>
          run_digests(/var/spool/mlmmj/mlmmj-test, /usr/bin/mlmmj-send);</p>
        <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------90123619CDDA63241A156CF6--

