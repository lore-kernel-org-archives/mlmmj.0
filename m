From: Marc MAURICE <marc-mlmmj@pub.positon.org>
Date: Mon, 26 Mar 2012 13:29:14 +0000
Subject: Re: [mlmmj] How to disable bounce probes
Message-Id: <4F706F2A.9030201@pub.positon.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040800030207000406020407"
List-Id: <mlmmj.mlmmj.org>
References: <4F625B33.4000802@pub.positon.org>
In-Reply-To: <4F625B33.4000802@pub.positon.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------040800030207000406020407
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

Thanks for your response.
> One way to do it is to set 'staticbounceaddr' (see TUNABLES) to send the
> bounces to a black-hole, rather than having Mlmmj process them. Mlmmj
> will then think nothing is bouncing, so will not try to probe.
But if I do that it will disable all bounces. I want to get bounces, but
I don't want mlmmj to check for bounces.
I want to do it manually.
>
> I think removing the text/probe or text/bounce-probe list text would
> also turn off the messages, but log an error to syslog when Mlmmj tries
> to send one. You'd have a record of which address are bouncing that way,
> though, which may or may not be a benefit.
In mlmmj 1.2.17 (debian stable version) it is not sufficient because
mlmmj will fallback on /usr/share/mlmmj/text.skel/en/.
I had to remove read access to it too :

rm -vf /var/spool/mlmmj/*/text/bounce-probe
chmod o-r /usr/share/mlmmj/text.skel/*/bounce-probe

and to prevent package upgrades to reset it (ext fs only) :
chattr +i /usr/share/mlmmj/text.skel/*/bounce-probe

Is it different in mlmmj 1.2.18 ??
>
> Beware, though, that if a lot of spam emails are being sent from your
> mail server, you may end up with your IP blacklisted or something like
> that. It's probably more worth your while to try to filter out the spam
> and avoid it going out at all. Ignoring the problem by turning the
> bounces off will just let the problem grow, unnoticed and unrestrained.
You're right. I will install a spamassassin if I find the time one day.

--------------040800030207000406020407
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="+1">Hello,<br>
      <br>
      Thanks for your response.</font><br>
    <blockquote cite="mid:4F626356.5080001@yahoo.com.au" type="cite">One
      way to do it is to set 'staticbounceaddr' (see TUNABLES) to send
      the
      <br>
      bounces to a black-hole, rather than having Mlmmj process them.
      Mlmmj
      <br>
      will then think nothing is bouncing, so will not try to probe.
      <br>
    </blockquote>
    But if I do that it will disable all bounces. I want to get bounces,
    but I don't want mlmmj to check for bounces.<br>
    I want to do it manually.<br>
    <blockquote cite="mid:4F626356.5080001@yahoo.com.au" type="cite">
      <br>
      I think removing the text/probe or text/bounce-probe list text
      would
      <br>
      also turn off the messages, but log an error to syslog when Mlmmj
      tries
      <br>
      to send one. You'd have a record of which address are bouncing
      that way,
      <br>
      though, which may or may not be a benefit.
      <br>
    </blockquote>
    In mlmmj 1.2.17 (debian stable version) it is not sufficient because
    mlmmj will fallback on /usr/share/mlmmj/text.skel/en/.<br>
    I had to remove read access to it too :<br>
    <br>
    rm -vf /var/spool/mlmmj/*/text/bounce-probe<br>
    chmod o-r /usr/share/mlmmj/text.skel/*/bounce-probe<br>
    <br>
    and to prevent package upgrades to reset it (ext fs only) :<br>
    chattr +i /usr/share/mlmmj/text.skel/*/bounce-probe<br>
    <br>
    Is it different in mlmmj 1.2.18 ??<br>
    <blockquote cite="mid:4F626356.5080001@yahoo.com.au" type="cite">
      <br>
      Beware, though, that if a lot of spam emails are being sent from
      your
      <br>
      mail server, you may end up with your IP blacklisted or something
      like
      <br>
      that. It's probably more worth your while to try to filter out the
      spam
      <br>
      and avoid it going out at all. Ignoring the problem by turning the
      <br>
      bounces off will just let the problem grow, unnoticed and
      unrestrained.
      <br>
    </blockquote>
    You're right. I will install a spamassassin if I find the time one
    day.<br>
  </body>
</html>

--------------040800030207000406020407--

