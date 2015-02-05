From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Thu, 05 Feb 2015 20:15:53 +0000
Subject: Re: [mlmmj] mlmmj wishlist request
Message-Id: <54D3CF79.1080302@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020207060305070703000605"
List-Id: <mlmmj.mlmmj.org>
References: <54D14B2F.3010003@vlsc.org>
In-Reply-To: <54D14B2F.3010003@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------020207060305070703000605
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Ben!

I'll take a look at this - I'm glad to see something like this is 
already there.

Philip

On 2/3/2015 3:57 PM, Ben Schmidt wrote:
> Hi, Philip!
>
> Mlmmj can do what you want already, I believe. Just add a subscriber 
> of the 'nomail' type using the -n option to mlmmj-sub or by sending 
> mail to listname+subscribe-nomail@domain.tld. Nomail users can post to 
> the list, but posts are not distributed to them.
>
> See the third paragraph of the description here:
> http://mlmmj.org/docs/mlmmj-sub/
>
> And the help list text (which you get by sending mail to 
> listname+help@domain.tld) also contains information on this (though in 
> source form, not the most readable):
> http://mlmmj.org/hg/listtexts/file/904ef6171308/en/help
>
> Best regards,
>
> Ben.
>
>
>
> On 4/02/15 9:26 AM, webmaster@vlsc.org wrote:
>> I've been successfully running a handful of small mlmmj lists for 
>> several months
>> now, on an eApps centOS cloud server, running sendmail. I have a 
>> question/request
>> related to a feature that I used to exploit when working with the old 
>> majordomo
>> mailing list tool:
>>
>> When using majordomo it was possible to configure a "closed" list, in 
>> terms of
>> senders and receivers of posts (functionally similar to how mlmmj 
>> works using the
>> "subonlypost" control file), while at the same time it was also 
>> possible to
>> configure a secondary file (containing addresses) that could only 
>> submit posts,
>> but not receive any posts.
>>
>> Perhaps a simple example can illustrate how this might be used:
>> Acme Services is run by a board of directors, and the board has their 
>> own closed
>> mlmmj list.  There are also several dept managers that work for Acme 
>> Services, and
>> the board would like these managers to be able to communicate 
>> directly with all
>> the members of the board by simply sending an email to the board 
>> list. On the
>> other hand, the board doesn't want the managers receiving any of the 
>> board list posts.
>>
>> There are several other scenarios that might benefit from this 
>> ability - in fact
>> I'd say it might find many uses, and the varied possibilities are 
>> likely the
>> reason majordomo had this feature.
>>
>> I haven't seen anything that indicates this is somehow currently 
>> possible with
>> mlmmj, so I apologize in advance for missing the notes on how to do this
>> currently, if its already available.
>>
>> With mlmmj, I could envision having another directory similar to the 
>> existing
>> "subscribers.d", that would contain file(s) of addresses that only 
>> had permission
>> to "submit" posts.
>>
>> Or perhaps there could be some way to flag or code files contained in 
>> the existing
>> "subscribers.d" directory that would indicate if the addresses it 
>> contains are
>> only "submitters" or only " receivers" or both "submitters and 
>> receivers".
>>
>> I haven't looked under the hood far enough to know how simple or 
>> complicated this
>> might be to implement with mlmmj (assuming its not there now) so I'm 
>> just sharing
>> the thought, in the hope that someone might be intrigued by the idea 
>> of adding
>> this feature, and hoping it would not be difficult to implement.
>>
>> Philip Parshley
>>
>
>
>
>
> -----
> No virus found in this message.
> Checked by AVG - www.avg.com
> Version: 2015.0.5645 / Virus Database: 4281/9054 - Release Date: 02/04/15
>
>


--------------020207060305070703000605
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id t15KHb9O001290

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif">Thanks Ben!<br>
      <br>
      I'll take a look at this - I'm glad to see something like this is
      already there.<br>
      <br>
      Philip<br>
      <br>
    </font>
    <div class=3D"moz-cite-prefix">On 2/3/2015 3:57 PM, Ben Schmidt wrote=
:<br>
    </div>
    <blockquote cite=3D"mid:54D16061.1000702@yahoo.com.au" type=3D"cite">=
Hi,
      Philip!
      <br>
      <br>
      Mlmmj can do what you want already, I believe. Just add a
      subscriber of the 'nomail' type using the -n option to mlmmj-sub
      or by sending mail to <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:listname+subscribe-nomail@domain.tld">listname+subscribe-nomail@d=
omain.tld</a>. Nomail
      users can post to the list, but posts are not distributed to them.
      <br>
      <br>
      See the third paragraph of the description here:
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"http://mlmmj.org/docs/ml=
mmj-sub/">http://mlmmj.org/docs/mlmmj-sub/</a>
      <br>
      <br>
      And the help list text (which you get by sending mail to
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:listname+help@=
domain.tld">listname+help@domain.tld</a>) also contains information on th=
is
      (though in source form, not the most readable):
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"http://mlmmj.org/hg/list=
texts/file/904ef6171308/en/help">http://mlmmj.org/hg/listtexts/file/904ef=
6171308/en/help</a>
      <br>
      <br>
      Best regards,
      <br>
      <br>
      Ben.
      <br>
      <br>
      <br>
      <br>
      On 4/02/15 9:26 AM, <a class=3D"moz-txt-link-abbreviated" href=3D"m=
ailto:webmaster@vlsc.org">webmaster@vlsc.org</a> wrote:
      <br>
      <blockquote type=3D"cite">I've been successfully running a handful
        of small mlmmj lists for several months
        <br>
        now, on an eApps centOS cloud server, running sendmail. I have a
        question/request
        <br>
        related to a feature that I used to exploit when working with
        the old majordomo
        <br>
        mailing list tool:
        <br>
        <br>
        When using majordomo it was possible to configure a "closed"
        list, in terms of
        <br>
        senders and receivers of posts (functionally similar to how
        mlmmj works using the
        <br>
        "subonlypost" control file), while at the same time it was also
        possible to
        <br>
        configure a secondary file (containing addresses) that could
        only submit posts,
        <br>
        but not receive any posts.
        <br>
        <br>
        Perhaps a simple example can illustrate how this might be used:
        <br>
        Acme Services is run by a board of directors, and the board has
        their own closed
        <br>
        mlmmj list.=C2=A0 There are also several dept managers that work =
for
        Acme Services, and
        <br>
        the board would like these managers to be able to communicate
        directly with all
        <br>
        the members of the board by simply sending an email to the board
        list. On the
        <br>
        other hand, the board doesn't want the managers receiving any of
        the board list posts.
        <br>
        <br>
        There are several other scenarios that might benefit from this
        ability - in fact
        <br>
        I'd say it might find many uses, and the varied possibilities
        are likely the
        <br>
        reason majordomo had this feature.
        <br>
        <br>
        I haven't seen anything that indicates this is somehow currently
        possible with
        <br>
        mlmmj, so I apologize in advance for missing the notes on how to
        do this
        <br>
        currently, if its already available.
        <br>
        <br>
        With mlmmj, I could envision having another directory similar to
        the existing
        <br>
        "subscribers.d", that would contain file(s) of addresses that
        only had permission
        <br>
        to "submit" posts.
        <br>
        <br>
        Or perhaps there could be some way to flag or code files
        contained in the existing
        <br>
        "subscribers.d" directory that would indicate if the addresses
        it contains are
        <br>
        only "submitters" or only " receivers" or both "submitters and
        receivers".
        <br>
        <br>
        I haven't looked under the hood far enough to know how simple or
        complicated this
        <br>
        might be to implement with mlmmj (assuming its not there now) so
        I'm just sharing
        <br>
        the thought, in the hope that someone might be intrigued by the
        idea of adding
        <br>
        this feature, and hoping it would not be difficult to implement.
        <br>
        <br>
        Philip Parshley
        <br>
        <br>
      </blockquote>
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
      Version: 2015.0.5645 / Virus Database: 4281/9054 - Release Date:
      02/04/15
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------020207060305070703000605--

