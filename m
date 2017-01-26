From: Barco van Rhijn <barco@atservice.co.za>
Date: Thu, 26 Jan 2017 17:31:50 +0000
Subject: [mlmmj] Errors on Cron job
Message-Id: <15f8a122-c3d0-1386-9eed-f46dec861aaa@atservice.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------E8E36CB69A0620AA749A43BA"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------E8E36CB69A0620AA749A43BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Good Evening,

Recently setup MLMMJ on a Centos server that has Cpanel installed.

*I get this error in my mail delivery log:*

"Child process of mlmmj_transport transport returned 127 (could mean 
unable to exec or command does not exist) from command: 
/usr/local/bin/mlmmj-receive"

I checked the commands do not exist in this location
On Centos the commands are indeed located in /usr/bin/

So I've created a symbolic link for that file in the expected directory.

*This did sort of work but now I get an error :*
Child process of mlmmj_transport transport returned 1 from command: 
/usr/local/bin/mlmmj-receive

Any ideas how I could resolve this?

BTW: My Cron is executed as root and I've checked permissions to the 
spool directory before hitting this roadblock.

Warm Regards
Barco van Rhijn

--------------E8E36CB69A0620AA749A43BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Good Evening, <br>
    </p>
    <p>Recently setup MLMMJ on a Centos server that has Cpanel
      installed. <br>
    </p>
    <p><b>I get this error in my mail delivery log:</b><br>
    </p>
    <p>"Child process of mlmmj_transport transport returned 127 (could
      mean unable to exec or command does not exist) from command:
      /usr/local/bin/mlmmj-receive"</p>
    I checked the commands do not exist in this location <br>
    On Centos the commands are indeed located in /usr/bin/<br>
    <br>
    So I've created a symbolic link for that file in the expected
    directory.<br>
    <br>
    <b>This did sort of work but now I get an error :</b><br>
    Child process of mlmmj_transport transport returned 1 from command:
    /usr/local/bin/mlmmj-receive<br>
    <br>
    Any ideas how I could resolve this?<br>
    <br>
    BTW: My Cron is executed as root and I've checked permissions to the
    spool directory before hitting this roadblock.<br>
    <br>
    Warm Regards<br>
    Barco van Rhijn<br>
    <div class="moz-signature"> </div>
  </body>
</html>

--------------E8E36CB69A0620AA749A43BA--

