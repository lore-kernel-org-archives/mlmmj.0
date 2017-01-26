From: Barco van Rhijn <barco@atservice.co.za>
Date: Thu, 26 Jan 2017 14:49:11 +0000
Subject: [mlmmj] Configuring Exim
Message-Id: <f147daff-67ff-3421-ebf3-8b844ba44fbe@atservice.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------4E6F5108874B0E6A8A54DB95"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------4E6F5108874B0E6A8A54DB95
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hallo to everyone,

I'm trying to get MLMMJ setup on a Centos server running Cpanel.
As the owner of this server I have root.

I've followed along the documentation to setup Exim and MLMMJ
At the end of the exim configuration in step 6. I'm instructed to test 
routing.
*
**I receive the following output:*
exim -bt mlmmj-test@mymailinglist.com mlmmj-test@mymailinglist.com
mail to mlmmj-test@mymailinglist.com is discarded
mail to mlmmj-test@mymailinglist.com is discarded

/(I've substituted domain names for security).

*What I've tried so far**:*
/

  * /Searched previous mailing list entries to mlmmj.org/
  * /Searched the web./
  * /Searched through Exim documentation - but did not make much headway
    here. All I've found was it's possibly an ACL but if it is I've
    missed the rule that matches.
    /

/
Can anyone point me in the right direction for troubleshooting why this 
message gets discarded.
/
Warm Regards
Barco van Rhijn

--------------4E6F5108874B0E6A8A54DB95
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hallo to everyone,<br>
    <br>
    I'm trying to get MLMMJ setup on a Centos server running Cpanel. <br>
    As the owner of this server I have root. <br>
    <br>
    I've followed along the documentation to setup Exim and MLMMJ <br>
    At the end of the exim configuration in step 6. I'm instructed to
    test routing.<br>
    <b><br>
    </b><b>I receive the following output:</b><br>
    exim -bt <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@mymailinglist.com">mlmmj-test@mymailinglist.com</a> <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@mymailinglist.com">mlmmj-test@mymailinglist.com</a><br>
    mail to <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@mymailinglist.com">mlmmj-test@mymailinglist.com</a> is discarded<br>
    mail to <a class="moz-txt-link-abbreviated" href="mailto:mlmmj-test@mymailinglist.com">mlmmj-test@mymailinglist.com</a> is discarded<br>
    <br>
    <i>(I've substituted domain names for security).<br>
      <br>
      <b>What I've tried so far</b><b>:</b><br>
    </i>
    <ul>
      <li><i>Searched previous mailing list entries to mlmmj.org</i></li>
      <li><i>Searched the web.</i></li>
      <li><i>Searched through Exim documentation - but did not make much
          headway here. All I've found was it's possibly an ACL but if
          it is I've missed the rule that matches.<br>
        </i></li>
    </ul>
    <i><br>
      Can anyone point me in the right direction for troubleshooting why
      this message gets discarded. <br>
    </i><br>
    Warm Regards<br>
    Barco van Rhijn<br>
  </body>
</html>

--------------4E6F5108874B0E6A8A54DB95--

