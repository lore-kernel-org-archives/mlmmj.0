From: webmaster <webmaster@vlsc.org>
Date: Sun, 21 Jun 2020 14:50:18 +0000
Subject: Re: [mlmmj] Trying to use moderation, but email server is rejecting moderator's release reply to lis
Message-Id: <b58bbf9b-0de1-259d-fa57-22f82f52fcee@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------79F9F939E1B2F3CD86715A8F"
List-Id: <mlmmj.mlmmj.org>
References: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
In-Reply-To: <8cd0e063-4f12-5fed-ee05-d6d1f34640fd@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------79F9F939E1B2F3CD86715A8F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Thanks for the nudge, Roderick, that was all I needed - I reset the
delimiter to "+" and all is well.

I overlooked the "delimiter" Tunable while searching the docs yesterday
(I'm on US PST).

Several servers back, my MTA at the time did use "_" as the default, so
I'd configured my "delimiter" files that way; but as I said, never
actually implemented moderation. So the "_" delimiter has been silently
following my lists through several server migrations.

A simple comment in the docs somewhere close to the comments about the
moderation tunables, reminding the reader "the delimiter tunable must
match the MTA's current setting or moderation won't work" would perhaps
be helpful to people trying to use the documentation, and might avoid
queries like mine from happening.

Philip

Silence can sometimes be a weapon that is self-inflicting
:-)





On 6/21/2020 5:33 AM, Roderick wrote:
>
> On Sun, 21 Jun 2020, Geert Stappers wrote:
>
>>>>>>> [list name]_release-59d6019902a42d96@vlsc.org
>
>> Yes  and time will tell how usefull that is for original poster.
>
> I never used moderation, just tested a little mlmmj.
>
> As I remember, mlmmj is configured out of the box to use + as separator,
> and many MTA are out of the box configured to consider + part as
> extension.
>
> Perhaps he misconfigured mlmmj to use _ as separator?
>
> Rod.
>
>
>
>


--------------79F9F939E1B2F3CD86715A8F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">Thanks for the nudge,
      Roderick, that was all I needed - </font><font face="Helvetica,
      Arial, sans-serif"><font face="Helvetica, Arial, sans-serif">I
        reset the delimiter to "+" and all is well.</font><br>
      <br>
      I overlooked the "delimiter" Tunable while searching the docs
      yesterday (I'm on US PST).<br>
      <br>
      Several servers back, my MTA at the time did use "_" as the
      default, so I'd configured my "delimiter" files that way; but as I
      said, never actually implemented moderation. So the "_" delimiter
      has been silently following my lists through several server
      migrations.<br>
      <br>
      A simple comment in the docs somewhere close to the comments about
      the moderation tunables, reminding the reader "the delimiter
      tunable must match the MTA's current setting or moderation won't
      work" would perhaps be helpful to people trying to use the
      documentation, and might avoid queries like mine from happening.<br>
      <br>
      Philip <br>
      <br>
      Silence can sometimes be a weapon that is self-inflicting<br>
      :-)<br>
      <br>
      <br>
      <br>
      <br>
    </font><br>
    <div class="moz-cite-prefix">On 6/21/2020 5:33 AM, Roderick wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:alpine.BSF.2.22.419.2006211231240.885@fbsd.local">
      <br>
      On Sun, 21 Jun 2020, Geert Stappers wrote:
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">[list
                  <a class="moz-txt-link-abbreviated" href="mailto:name]_release-59d6019902a42d96@vlsc.org">name]_release-59d6019902a42d96@vlsc.org</a>
                  <br>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <br>
      <blockquote type="cite">Yes  and time will tell how usefull that
        is for original poster.
        <br>
      </blockquote>
      <br>
      I never used moderation, just tested a little mlmmj.
      <br>
      <br>
      As I remember, mlmmj is configured out of the box to use + as
      separator,
      <br>
      and many MTA are out of the box configured to consider + part as
      extension.
      <br>
      <br>
      Perhaps he misconfigured mlmmj to use _ as separator?
      <br>
      <br>
      Rod.
      <br>
      <br>
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------79F9F939E1B2F3CD86715A8F--

