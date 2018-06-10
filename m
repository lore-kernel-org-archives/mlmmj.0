From: webmaster <webmaster@vlsc.org>
Date: Sun, 10 Jun 2018 20:34:39 +0000
Subject: Re: [mlmmj] new mlmmj install on 64bit CentOS 7 server running Exim
Message-Id: <70bad9aa-e202-0956-126a-67552169ac2d@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------D17996AB51259B57AD45F931"
List-Id: <mlmmj.mlmmj.org>
References: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
In-Reply-To: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------D17996AB51259B57AD45F931
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 6/10/2018 1:13 PM, webmaster wrote:
> On 6/10/2018 12:57 PM, Zhang Huangbin wrote:
>>> On Jun 10, 2018, at 4:46 PM,webmaster@vlsc.org  wrote:
>>>
>>> I'm using a /var/spool/mlmmj/check-test/subscribers.d/test.txt file with 3 emails in it, that I've used for test purposes previously, and all other list parameters are defaults.
>> Does renaming file “test.txt” to “t” fix the issue?
>>
>> btw, i use Postfix instead of Exim, i hope i didn’t lead you to wrong direction due to we use different MTAs.
>>
>> ----
>> Zhang Huangbin, founder of iRedMail project:http://www.iredmail.org/
>> Time zone: GMT+2 (Slovenia/Ljubljana).
>> Available on Telegram:https://t.me/iredmail
>>
>>
>>
>>
>>
>
> Thanks Geert, for the heads-up on reading the discussion in order!
>
> No worries Zhang - all feedback is welcome.
>
>
> I re-checked the ownership of the new server /var/spool/mlmmj - I have 
> it set the same as on the old server:
>
> mail:mlmmj
>
> I changed this to: mlmmj:mlmmj on the new server ...and now I receive 
> a different bounce message when sending email:
>
> The message from<webmaster@vlsc.org>  with subject "Re: team racing event" was unable to be delivered to the list because you are not a list subscriber.
>
> progress././.
>
> I know the subscribers.d file contains my email, so I checked the 
> maillog and found this:
> /usr/local/bin/mlmmj-process[29043]: subscriberfuncs.c:135: Could not open /var/spool/mlmmj/vlsc-test/subscribers.d/test.txt: Permission denied
>
> So it is a linux permissions issue; not really a non-subscriber issue.
>
> I renamed the subscriber file to 't' but still getting a post denial 
> bounce.
>
> Philip
>
>
>
>
>
>

SUCCESS!

I chmod'd the /var/spool/mlmmj with -R to 755, and then the email list 
began working.


So it looks like it was 2 problems:

The ownership of /var/spool/mlmmj was set to:

mail:mlmmj

which worked on my old server (running sendmail and an older CentOS), 
but on my new server it needs to be:

mlmmj:mlmmj

(could be a difference of group memberships perhaps? not sure on the 
exact issue here).

It was also the permissions issue, as it finally worked as soon as I 
reset all to 755 (although I thought I'd already done this once before).

Its working now.  There might be other combinations of ownership, 
membership, and permissions that could work as well, but I can stick 
with what works!

Thanks so much for all the feedback! I was stuck, and it definitely 
helped me get mlmmj working...

Joyful now!!!

Philip


--------------D17996AB51259B57AD45F931
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 6/10/2018 1:13 PM, webmaster wrote:<br>
    <blockquote type="cite"
      cite="mid:a25ba08f-130e-85ed-4517-028a49f4b4f0@vlsc.org">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      On 6/10/2018 12:57 PM, Zhang Huangbin wrote:<br>
      <blockquote type="cite"
        cite="mid:4D5C3890-D03C-4747-B400-94A736CE3315@iredmail.org">
        <blockquote type="cite">
          <pre wrap="">On Jun 10, 2018, at 4:46 PM, <a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org" moz-do-not-send="true">webmaster@vlsc.org</a> wrote:

I'm using a /var/spool/mlmmj/check-test/subscribers.d/test.txt file with 3 emails in it, that I've used for test purposes previously, and all other list parameters are defaults.
</pre>
        </blockquote>
        <pre wrap="">Does renaming file “test.txt” to “t” fix the issue?

btw, i use Postfix instead of Exim, i hope i didn’t lead you to wrong direction due to we use different MTAs.

----
Zhang Huangbin, founder of iRedMail project: <a class="moz-txt-link-freetext" href="http://www.iredmail.org/" moz-do-not-send="true">http://www.iredmail.org/</a>
Time zone: GMT+2 (Slovenia/Ljubljana).
Available on Telegram: <a class="moz-txt-link-freetext" href="https://t.me/iredmail" moz-do-not-send="true">https://t.me/iredmail</a>





</pre>
      </blockquote>
      <br>
      <font face="Helvetica, Arial, sans-serif">Thanks Geert, for the
        heads-up on reading the discussion in order!<br>
        <br>
        No worries Zhang - all feedback is welcome.<br>
        <br>
        <br>
        I re-checked the ownership of the new server /var/spool/mlmmj -
        I have it set the same as on the old server: </font><br>
      <br>
      <tt>mail:mlmmj</tt><br>
      <font face="Helvetica, Arial, sans-serif"><br>
        I changed this to: mlmmj:mlmmj on the new server ...and now I
        receive a different bounce message when sending email:</font><br>
      <br>
      <pre wrap="">The message from <a class="moz-txt-link-rfc2396E" href="mailto:webmaster@vlsc.org" moz-do-not-send="true">&lt;webmaster@vlsc.org&gt;</a> with subject "Re: team racing event" was unable to be delivered to the list because you are not a list subscriber.

</pre>
      <font face="Helvetica, Arial, sans-serif">progress.<i>.</i>. <br>
        <br>
        I know the subscribers.d file contains my email, so I checked
        the maillog and found this:</font>
      <pre wrap="">/usr/local/bin/mlmmj-process[29043]: subscriberfuncs.c:135: Could not open /var/spool/mlmmj/vlsc-test/subscribers.d/test.txt: Permission denied

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
    </blockquote>
    <br>
    <font face="Helvetica, Arial, sans-serif">SUCCESS!<br>
      <br>
      I chmod'd the /var/spool/mlmmj with -R to 755, and then the email
      list began working.<br>
      <br>
      <br>
      So it looks like it was 2 problems: <br>
      <br>
      The ownership of /var/spool/mlmmj was set to:<br>
      <br>
    </font><tt>mail:mlmmj</tt><font face="Helvetica, Arial, sans-serif"><br>
      <br>
      which worked on my old server (running sendmail and an older
      CentOS), but on my new server it needs to be:<br>
      <br>
       </font><tt>mlmm</tt><tt>j:mlmmj</tt><font face="Helvetica, Arial,
      sans-serif"> <br>
      <br>
      (could be a difference of group memberships perhaps? not sure on
      the exact issue here).<br>
      <br>
      It was also the permissions issue, as it finally worked as soon as
      I reset all to 755 (although I thought I'd already done this once
      before).<br>
      <br>
      Its working now.  There might be other combinations of ownership,
      membership, and permissions that could work as well, but I can
      stick with what works!<br>
      <br>
      Thanks so much for all the feedback! I was stuck, and it
      definitely helped me get mlmmj working... <br>
      <br>
      Joyful now!!!<br>
      <br>
      Philip<br>
      <br>
    </font>
  </body>
</html>

--------------D17996AB51259B57AD45F931--

