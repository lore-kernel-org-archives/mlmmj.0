From: webmaster <webmaster@vlsc.org>
Date: Sun, 10 Jun 2018 20:13:56 +0000
Subject: Re: [mlmmj] new mlmmj install on 64bit CentOS 7 server running Exim
Message-Id: <a25ba08f-130e-85ed-4517-028a49f4b4f0@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------CD2256F70F2F7EBA704E6853"
List-Id: <mlmmj.mlmmj.org>
References: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
In-Reply-To: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------CD2256F70F2F7EBA704E6853
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 6/10/2018 12:57 PM, Zhang Huangbin wrote:
>> On Jun 10, 2018, at 4:46 PM, webmaster@vlsc.org wrote:
>>
>> I'm using a /var/spool/mlmmj/check-test/subscribers.d/test.txt file with 3 emails in it, that I've used for test purposes previously, and all other list parameters are defaults.
> Does renaming file “test.txt” to “t” fix the issue?
>
> btw, i use Postfix instead of Exim, i hope i didn’t lead you to wrong direction due to we use different MTAs.
>
> ----
> Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
> Time zone: GMT+2 (Slovenia/Ljubljana).
> Available on Telegram: https://t.me/iredmail
>
>
>
>
>

Thanks Geert, for the heads-up on reading the discussion in order!

No worries Zhang - all feedback is welcome.


I re-checked the ownership of the new server /var/spool/mlmmj - I have 
it set the same as on the old server:

mail:mlmmj

I changed this to: mlmmj:mlmmj on the new server ...and now I receive a 
different bounce message when sending email:

The message from<webmaster@vlsc.org>  with subject "Re: team racing event" was unable to be delivered to the list because you are not a list subscriber.

progress././.

I know the subscribers.d file contains my email, so I checked the 
maillog and found this:

/usr/local/bin/mlmmj-process[29043]: subscriberfuncs.c:135: Could not open /var/spool/mlmmj/vlsc-test/subscribers.d/test.txt: Permission denied

So it is a linux permissions issue; not really a non-subscriber issue.

I renamed the subscriber file to 't' but still getting a post denial bounce.

Philip







--------------CD2256F70F2F7EBA704E6853
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 6/10/2018 12:57 PM, Zhang Huangbin wrote:<br>
    <blockquote type="cite"
      cite="mid:4D5C3890-D03C-4747-B400-94A736CE3315@iredmail.org">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">On Jun 10, 2018, at 4:46 PM, <a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a> wrote:

I'm using a /var/spool/mlmmj/check-test/subscribers.d/test.txt file with 3 emails in it, that I've used for test purposes previously, and all other list parameters are defaults.
</pre>
      </blockquote>
      <pre wrap="">
Does renaming file “test.txt” to “t” fix the issue?

btw, i use Postfix instead of Exim, i hope i didn’t lead you to wrong direction due to we use different MTAs.

----
Zhang Huangbin, founder of iRedMail project: <a class="moz-txt-link-freetext" href="http://www.iredmail.org/">http://www.iredmail.org/</a>
Time zone: GMT+2 (Slovenia/Ljubljana).
Available on Telegram: <a class="moz-txt-link-freetext" href="https://t.me/iredmail">https://t.me/iredmail</a>





</pre>
    </blockquote>
    <br>
    <font face="Helvetica, Arial, sans-serif">Thanks Geert, for the
      heads-up on reading the discussion in order!<br>
      <br>
      No worries Zhang - all feedback is welcome.<br>
      <br>
      <br>
      I re-checked the ownership of the new server /var/spool/mlmmj - I
      have it set the same as on the old server: </font><br>
    <br>
    <tt>mail:mlmmj</tt><br>
    <font face="Helvetica, Arial, sans-serif"><br>
      I changed this to: mlmmj:mlmmj on the new server ...and now I
      receive a different bounce message when sending email:</font><br>
    <br>
    <pre wrap="">The message from <a class="moz-txt-link-rfc2396E" href="mailto:webmaster@vlsc.org">&lt;webmaster@vlsc.org&gt;</a> with subject "Re: team racing event" was unable to be delivered to the list because you are not a list subscriber.

</pre>
    <font face="Helvetica, Arial, sans-serif">progress.<i>.</i>. <br>
      <br>
      I know the subscribers.d file contains my email, so I checked the
      maillog and found this:</font>
    <pre wrap="">
/usr/local/bin/mlmmj-process[29043]: subscriberfuncs.c:135: Could not open /var/spool/mlmmj/vlsc-test/subscribers.d/test.txt: Permission denied

</pre>
    <font face="Helvetica, Arial, sans-serif">So it is a linux
      permissions issue; not really a non-subscriber issue.<br>
      <br>
      I renamed the subscriber file to 't' but still getting a post
      denial bounce.<br>
      <br>
      Philip<br>
      <br>
      <br>
      <br>
      <br>
    </font><br>
    <br>
  </body>
</html>

--------------CD2256F70F2F7EBA704E6853--

