From: webmaster <webmaster@vlsc.org>
Date: Sat, 20 Jun 2020 21:10:55 +0000
Subject: [mlmmj] Trying to use moderation, but email server is rejecting moderator's release reply to list-ow
Message-Id: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------B506810F0179CC68A1277A14"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------B506810F0179CC68A1277A14
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

I've been using MLMMJ for years with several closed lists, and it works
great! Can't say enough good things about it.

Now I have finally reached a place where I need moderation on a list, so
I implemented the two files [list]/control/moderated and
[list]/control/moderators.

Tested some email submissions, and as expected they were sent to the
moderators for release or rejection...So far so good...

But when I reply to the moderation notice to release the original email
to the list, it's sent back to a pseudo-email address (the reply-to
address) like:

[list name]_release-59d6019902a42d96@vlsc.org

(list name obviscated above)

Our email server doesn't recognize this as a real email account so it's
bouncing back my "release" response with the usual "Unknown user"
bounce-back.

I tried reply-all, which also included the [list]-owner@vlsc.org
address, and the email server still bounced the reply.

I've re-read the docs but can't find anything pointing to additional
steps needed to get the moderation-release replies to get past my email
server's filtering of non-existent addresses.  I doubt I'm supposed to
simply add these address accounts to the email server, not least because
there's no nothing to that effect in the documentation.

How is this email-reply moderation process supposed to work when sending
pseudo-addresses to my email server, which is correctly rejecting such
incoming mail as directed to a non-existing account?

Philip





--------------B506810F0179CC68A1277A14
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">I've been using MLMMJ for
      years with several closed lists, and it works great! Can't say
      enough good things about it.<br>
      <br>
      Now I have finally reached a place where I need moderation on a
      list, so I implemented the two files [list]/control/moderated and
    </font><font face="Helvetica, Arial, sans-serif"><font
        face="Helvetica, Arial, sans-serif">[list]/control/moderators.<br>
        <br>
        Tested some email submissions, and as expected they were sent to
        the moderators for release or rejection...</font></font><font
      face="Helvetica, Arial, sans-serif"><font face="Helvetica, Arial,
        sans-serif">So far so good...<br>
        <br>
        But when I reply to the moderation notice to release the
        original email to the list, it's sent back to a pseudo-email
        address </font></font><font face="Helvetica, Arial, sans-serif"><font
        face="Helvetica, Arial, sans-serif"><font face="Helvetica,
          Arial, sans-serif"><font face="Helvetica, Arial, sans-serif">
            (the reply-to address) </font></font>like:<br>
        <br>
        [list <a class="moz-txt-link-abbreviated" href="mailto:name]_release-59d6019902a42d96@vlsc.org">name]_release-59d6019902a42d96@vlsc.org</a><br>
        <br>
        (list name obviscated above)<br>
        <br>
        Our email server doesn't recognize this as a real email account
        so it's bouncing back my "release" response with the usual
        "Unknown user" bounce-back.<br>
        <br>
        I tried reply-all, which also included the [<a class="moz-txt-link-abbreviated" href="mailto:list]-owner@vlsc.org">list]-owner@vlsc.org</a>
        address, and the email server still bounced the reply.<br>
        <br>
        I've re-read the docs but can't find anything pointing to
        additional steps needed to get the moderation-release replies to
        get past my email server's filtering of non-existent addresses. 
        I doubt I'm supposed to simply add these address accounts to the
        email server, not least because there's no nothing to that
        effect in the documentation.<br>
        <br>
        How is this email-reply moderation process supposed to work when
        sending pseudo-addresses to my email server, which is correctly
        rejecting such incoming mail as directed to a non-existing
        account?<br>
        <br>
        Philip<br>
        <br>
        <br>
        <br>
        <br>
      </font></font>
  </body>
</html>

--------------B506810F0179CC68A1277A14--

