From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Fri, 17 Oct 2014 21:30:23 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54418A6F.3000105@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060808010207050709070604"
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------060808010207050709070604
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

:) It was a PITB to get this figured out, so I did take the time to 
write it up, in case it would help someone else down the road.

I agree that sendmail isn't necessarily a good choice to start with, but 
it's still the default MTA on a lot of canned virtual servers that are 
made available - like the one we use from eapps.com - so I didn't want 
to wade into changing something that was already otherwise working Ok on 
the server (and supported by eapps.com).

In hindsight it might have been easier to simply get Postfix or Exim 
installed and running, but hindsight is always 20-20 :)

Philip

On 10/17/2014 1:41 PM, Ben Schmidt wrote:
>> Have been away for a while. The following are some facts about my
>> system setup :
>>
>> openSUSE 12.3 : Sendmail 8.14.5-85.1.2
>>
>> The config files are located /usr/share/sendmail, so cd to there
>>
>> README has the following :
>> LOCAL_SHELL_FLAGS       [eu9] The flags used by the shell mailer.  The
>>                          flags lsDFMoq are always included.
>
> The Mlmmj reference for this is <http://mlmmj.org/docs/readme-sendmail/>
> which suggests setting LOCAL_SHELL_FLAGS to 'eu9P' (i.e. the default,
> plus 'P').
>
> A Sendmail reference for what the flags mean is
> <http://www.sendmail.org/~ca/email/doc8.8/op-sh-5.html#sh-5.4>
>
>> cd feature/; grep LOCAL_SHELL_FLAGS * shows :
>> msp.m4:define(`LOCAL_SHELL_FLAGS', `lmDFMuXk5')dnl
>>
>> Note the absence of a 'P' in the README reference - and the 
>> disconcerting use of
>> flags in file msp.m4 that are not noted in the README.
>
> Googling suggests the 'msp' feature is the 'mail submission program'. I
> have no idea why it's defining LOCAL_SHELL_FLAGS, but I also know next
> to nothing about m4 or Sendmail (and have no real inclination to learn
> more), so for all I know, it could be a different scope.
>
>> So where is the all important Return-Path documented and set? I have 
>> 'grep -i
>> return-path *' till I am blue in the face and have not found anything 
>> that helps
>> me. <sigh>
>
> It took me quite a while to find the references above, too....
> Sendmail's documentation is pretty esoteric. I feel like unless you
> already know what you're looking for, you don't know where to even look
> for it.... I vastly prefer Postfix and Exim, both of which I have set up
> in very little time, including with Mlmmj. In my experience, Qmail and
> Sendmail are both significantly harder to get working, and if there's
> any real benefit once they're up and running, it's lost on me!
>
> Smiles,
>
> Ben.
>
>
>
>
>
>
>
> -----
> No virus found in this message.
> Checked by AVG - www.avg.com
> Version: 2014.0.4765 / Virus Database: 4040/8407 - Release Date: 10/17/14
>
>


--------------060808010207050709070604
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id s9HLXeOA012231

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif">:) It was a PITB to get
      this figured out, so I did take the time to write it up, in case
      it would help someone else down the road.<br>
      <br>
      I agree that sendmail isn't necessarily a good choice to start
      with, but it's still the default MTA on a lot of canned virtual
      servers that are made available - like the one we use from
      eapps.com - so I didn't want to wade into changing something that
      was already otherwise working Ok on the server (and supported by
      eapps.com).=A0 <br>
      <br>
      In hindsight it might have been easier to simply get Postfix or
      Exim installed and running, but hindsight is always 20-20 :)<br>
      <br>
      Philip<br>
      <br>
    </font>
    <div class=3D"moz-cite-prefix">On 10/17/2014 1:41 PM, Ben Schmidt
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:54417EED.2090004@yahoo.com.au" type=3D"cite">
      <blockquote type=3D"cite">Have been away for a while. The following
        are some facts about my
        <br>
        system setup :
        <br>
        <br>
        openSUSE 12.3 : Sendmail 8.14.5-85.1.2
        <br>
        <br>
        The config files are located /usr/share/sendmail, so cd to there
        <br>
        <br>
        README has the following :
        <br>
        LOCAL_SHELL_FLAGS=A0=A0=A0=A0=A0=A0 [eu9] The flags used by the s=
hell
        mailer.=A0 The
        <br>
        =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 flags lsDFMoq are always included.
        <br>
      </blockquote>
      <br>
      The Mlmmj reference for this is
      <a class=3D"moz-txt-link-rfc2396E" href=3D"http://mlmmj.org/docs/re=
adme-sendmail/">&lt;http://mlmmj.org/docs/readme-sendmail/&gt;</a>
      <br>
      which suggests setting LOCAL_SHELL_FLAGS to 'eu9P' (i.e. the
      default,
      <br>
      plus 'P').
      <br>
      <br>
      A Sendmail reference for what the flags mean is
      <br>
<a class=3D"moz-txt-link-rfc2396E" href=3D"http://www.sendmail.org/~ca/em=
ail/doc8.8/op-sh-5.html#sh-5.4">&lt;http://www.sendmail.org/~ca/email/doc=
8.8/op-sh-5.html#sh-5.4&gt;</a>
      <br>
      <br>
      <blockquote type=3D"cite">cd feature/; grep LOCAL_SHELL_FLAGS *
        shows :
        <br>
        msp.m4:define(`LOCAL_SHELL_FLAGS', `lmDFMuXk5')dnl
        <br>
        <br>
        Note the absence of a 'P' in the README reference - and the
        disconcerting use of
        <br>
        flags in file msp.m4 that are not noted in the README.
        <br>
      </blockquote>
      <br>
      Googling suggests the 'msp' feature is the 'mail submission
      program'. I
      <br>
      have no idea why it's defining LOCAL_SHELL_FLAGS, but I also know
      next
      <br>
      to nothing about m4 or Sendmail (and have no real inclination to
      learn
      <br>
      more), so for all I know, it could be a different scope.
      <br>
      <br>
      <blockquote type=3D"cite">So where is the all important Return-Path
        documented and set? I have 'grep -i
        <br>
        return-path *' till I am blue in the face and have not found
        anything that helps
        <br>
        me. &lt;sigh&gt;
        <br>
      </blockquote>
      <br>
      It took me quite a while to find the references above, too....
      <br>
      Sendmail's documentation is pretty esoteric. I feel like unless
      you
      <br>
      already know what you're looking for, you don't know where to even
      look
      <br>
      for it.... I vastly prefer Postfix and Exim, both of which I have
      set up
      <br>
      in very little time, including with Mlmmj. In my experience, Qmail
      and
      <br>
      Sendmail are both significantly harder to get working, and if
      there's
      <br>
      any real benefit once they're up and running, it's lost on me!
      <br>
      <br>
      Smiles,
      <br>
      <br>
      Ben.
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      -----
      <br>
      No virus found in this message.
      <br>
      Checked by AVG - <a class=3D"moz-txt-link-abbreviated" href=3D"http=
://www.avg.com">www.avg.com</a>
      <br>
      Version: 2014.0.4765 / Virus Database: 4040/8407 - Release Date:
      10/17/14
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------060808010207050709070604--

