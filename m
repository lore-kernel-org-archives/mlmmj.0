From: webmaster <webmaster@vlsc.org>
Date: Sun, 10 Jun 2018 19:26:54 +0000
Subject: Re: [mlmmj] new mlmmj install on 64bit CentOS 7 server running Exim
Message-Id: <99419ec3-acda-cb8c-c11d-cd5dc45b22b6@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------405942A0D86AED7E855A95EC"
List-Id: <mlmmj.mlmmj.org>
References: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
In-Reply-To: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------405942A0D86AED7E855A95EC
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Thanks Zhang for your response.

A copied from my /etc/exim/exim.conf file:

...

begin transports

         mlmmj_transport:
                 driver = pipe
                 return_path_add
                 user = mlmmj
                 group = mlmmj
                 home_directory = MLMMJ_HOME
                 current_directory = MLMMJ_HOME
                 command = /usr/local/bin/mlmmj-receive -F -L 
MLMMJ_HOME/${lc:$local_part}

         remote_smtp:
                 driver = smtp

...

I did notice the reference to:

Have to invoke either as root or as the user owning listdir Invoked with uid = [1000]: Success

I checked the mlmmj user id:

# id mlmmj
uid=1000(mlmmj) gid=1001(mlmmj) groups=1001(mlmmj),48(apache)

and it matches the # specified in the log entry.

I assumed "...[1000]: Success" meant this was just a warning, but the 
requirement was successfully met - am I interpreting this incorrectly?

Philip



On 6/10/2018 7:56 AM, Zhang Huangbin wrote:
>> On Jun 10, 2018, at 4:46 PM, webmaster@vlsc.org wrote:
>>
>> Jun 10 14:14:43 new /usr/local/bin/mlmmj-receive[18390]: mlmmj-receive.c:112: Have to invoke either as root or as the user owning listdir Invoked with uid = [1000]: Success
> This message is clear enough.
>
> According to mlmmj document (http://mlmmj.org/docs/readme-exim4/ ), did you setup exim to run mlmmj as mlmmj daemon user?
>
> ---------------------
> mlmmj_transport:
>    …
>    user = mlmmj
>    group = mlmmj
>    …
> -----------------------------
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


--------------405942A0D86AED7E855A95EC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Helvetica, Arial, sans-serif">Thanks Zhang for your
        response.</font></p>
    <p><font face="Helvetica, Arial, sans-serif">A copied from my
        /etc/exim/exim.conf file:</font></p>
    <p><tt>...<br>
      </tt></p>
    <p><tt>begin transports</tt><tt><br>
      </tt><tt><br>
      </tt><tt>        mlmmj_transport:</tt><tt><br>
      </tt><tt>                driver = pipe</tt><tt><br>
      </tt><tt>                return_path_add</tt><tt><br>
      </tt><tt>                user = mlmmj</tt><tt><br>
      </tt><tt>                group = mlmmj</tt><tt><br>
      </tt><tt>                home_directory = MLMMJ_HOME</tt><tt><br>
      </tt><tt>                current_directory = MLMMJ_HOME</tt><tt><br>
      </tt><tt>                command = /usr/local/bin/mlmmj-receive -F
        -L MLMMJ_HOME/${lc:$local_part}</tt><tt><br>
      </tt><tt><br>
      </tt><tt>        remote_smtp:</tt><tt><br>
      </tt><tt>                driver = smtp</tt></p>
    <p><tt>...</tt></p>
    <p><font face="Helvetica, Arial, sans-serif">I did notice the
        reference to:<br>
      </font></p>
    <pre wrap="">Have to invoke either as root or as the user owning listdir Invoked with uid = [1000]: Success

</pre>
    <p><font face="Helvetica, Arial, sans-serif">I checked the mlmmj
        user id:</font></p>
    <p><tt># id mlmmj<br>
        uid=1000(mlmmj) gid=1001(mlmmj) groups=1001(mlmmj),48(apache)</tt></p>
    <p><font face="Helvetica, Arial, sans-serif">and it matches the #
        specified in the log entry. <br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">I assumed </font><tt>"...[1000]:
        Success" </tt><font face="Helvetica, Arial, sans-serif">meant
        this was just a warning, but the requirement was successfully met
        - am I interpreting this incorrectly?</font></p>
    <p><font face="Helvetica, Arial, sans-serif">Philip<br>
      </font></p>
    <p><tt></tt></p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 6/10/2018 7:56 AM, Zhang Huangbin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9FBAAD67-EB59-41B7-BD79-3B28E4BB1923@iredmail.org">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">On Jun 10, 2018, at 4:46 PM, <a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a> wrote:

Jun 10 14:14:43 new /usr/local/bin/mlmmj-receive[18390]: mlmmj-receive.c:112: Have to invoke either as root or as the user owning listdir Invoked with uid = [1000]: Success
</pre>
      </blockquote>
      <pre wrap="">
This message is clear enough.

According to mlmmj document (<a class="moz-txt-link-freetext" href="http://mlmmj.org/docs/readme-exim4/">http://mlmmj.org/docs/readme-exim4/</a> ), did you setup exim to run mlmmj as mlmmj daemon user?

---------------------
mlmmj_transport:
  …
  user = mlmmj
  group = mlmmj
  …
-----------------------------

----
Zhang Huangbin, founder of iRedMail project: <a class="moz-txt-link-freetext" href="http://www.iredmail.org/">http://www.iredmail.org/</a>
Time zone: GMT+2 (Slovenia/Ljubljana).
Available on Telegram: <a class="moz-txt-link-freetext" href="https://t.me/iredmail">https://t.me/iredmail</a>





</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------405942A0D86AED7E855A95EC--

