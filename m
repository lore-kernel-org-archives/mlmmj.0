From: webmaster <webmaster@vlsc.org>
Date: Thu, 21 Jan 2021 17:43:40 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <4f78ab8c-b4c2-f43f-e4d7-4e96ea3d392e@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------0FF5E6BE86F6D473C75AFFFD"
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------0FF5E6BE86F6D473C75AFFFD
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

I'm just a site admin who uses mlmmj on several domains, so I can't 
speak to the maintenance issues but only as a user of mlmmj:

I've recently looked at other mailing list options (again) and I still 
find nothing with the same level of flexibility and ease of use, in 
terms of managing several lists on a domain and being able to write 
basic PHP to manage the lists per my own needs.

Compared to Mailman... well there is no comparison - I'd rather use 
mlmmj every time.

mlmmj can be a bit difficult to install, given the sometimes terse and 
incomplete documentation, but once it's working, it IS a joy to work with.

I too have been concerned that it appears there's been no activity 
recently, but until it breaks or some email security paradigm shifts and 
makes mlmmj un-safe to use, I'll still be a fan, and I'll still 
recommend it to others.  I'm not surprised to hear adoption is currently 
going up.

It might get even more adoption if it appeared it was being maintained 
currently. I realize its easy to say this from a user perspective; I'd 
be happy to help in some way if my skill-set would be useful, but I 
don't have a deep knowledge of email systems.

It would be a great shame to see such a well-structured mailing list app 
fade into history.

just my two cents.

Philip



On 1/21/2021 2:35 AM, Chris Knadle wrote:
> Today I was contacted and asked about the status of mlmmj upstream 
> because from the point of view of the outside world it looks dead; the 
> mailing list archive stopped working in Dec 2017, there's no new 
> commits to the Mercurial or Git repositories since 2017, and thus no 
> indication that MLMMJ is "alive".
>
> I happen to be on the mlmmj "discussion" mailing list because I 
> maintain the 'mlmmj' package in Debian, so I took the time to read 
> through the "Is this list active? Where is "upstream"??" and similar 
> threads, and I see that there's a Git repo fork at 
> https://gitlab.com/mlmmj/mlmmj and had a look at it ... but nobody 
> from the outside world can see that this exists, because that repo is 
> not mentioned on the website nor the mailing list archives.
>
> From the distribution point of view this appears to be "dead upstream" 
> and is a reason for package removal. Debian is about to do a "soft 
> freeze" for preparation for the next release whereby packages in the 
> archive will need bug support for 3 years.
>
> The main thing I want to know is "what should I do about the release?"
> I'm considering the following choices:
>   a) release 'mlmmj' as before, with myself as maintainer of the package.
>   b) orphan the package so that there is no listed maintainer, where 
> the package
>      might be released with Debian 11 or might get dropped, depending 
> on what
>      the Release Team decides about the package themselves
>   c) request removal of the package from the archive
>
> Choice "a)" only fits if someone in "upstream" is willing to try to 
> fix bugs that get reported. Are there others helping with this at 
> present?
> Right now I'm uncomfortable about this because the GitLab repo can't 
> be found from the mlmmj.org web page, and that repo seems to be where 
> bugs are reported and handled lately, as best I can tell. Is that 
> correct?
>
> Side note: In terms of chances of bugs needing upstream help, looking 
> at the Debian "popularity contest" figures I see that the number of 
> users reporting having mlmmj loaded is low but slowly going /up/, 
> which is good but not what I expected to see. (Note: these "popcon" 
> numbers are likely artificially low, because not all machines are set 
> to report popcon data to Debian.)
>
>    https://qa.debian.org/popcon.php?package=mlmmj
>
> Choice "b)" seems the most reasonable to me under the circumstances, 
> but puts the package at risk of removal. This option does not preclude 
> me from continuing to help fix bugs on the package as a 
> "non-maintainer", which is what I would intend to do, for as long as I 
> still use the package.
>
> I'd like to hear other's thoughts about this so we can discuss it some.
> Thanks.
>    -- Chris
>


--------------0FF5E6BE86F6D473C75AFFFD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">I'm just a site admin who
      uses mlmmj on several domains, so I can't speak to the maintenance
      issues but only as a user of mlmmj:<br>
      <br>
      I've recently looked at other mailing list options (again) and I
      still find nothing with the same level of flexibility and ease of
      use, in terms of managing several lists on a domain and being able
      to write basic PHP to manage the lists per my own needs.<br>
      <br>
      Compared to Mailman... well there is no comparison - I'd rather
      use mlmmj every time.<br>
      <br>
      mlmmj can be a bit difficult to install, given the sometimes terse
      and incomplete documentation, but once it's working, it IS a joy
      to work with.<br>
      <br>
      I too have been concerned that it appears there's been no activity
      recently, but until it breaks or some email security paradigm
      shifts and makes mlmmj un-safe to use, I'll still be a fan, and
      I'll still recommend it to others.  I'm not surprised to hear
      adoption is currently going up. <br>
      <br>
      It might get even more adoption if it appeared it was being
      maintained currently. I realize its easy to say this from a user
      perspective; I'd be happy to help in some way if my skill-set
      would be useful, but I don't have a deep knowledge of email
      systems.<br>
      <br>
      It would be a great shame to see such a well-structured mailing
      list app fade into history.<br>
      <br>
      just my two cents.<br>
      <br>
      Philip<br>
      <br>
      <br>
    </font><br>
    <div class="moz-cite-prefix">On 1/21/2021 2:35 AM, Chris Knadle
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us">Today
      I was contacted and asked about the status of mlmmj upstream
      because from the point of view of the outside world it looks dead;
      the mailing list archive stopped working in Dec 2017, there's no
      new commits to the Mercurial or Git repositories since 2017, and
      thus no indication that MLMMJ is "alive".
      <br>
      <br>
      I happen to be on the mlmmj "discussion" mailing list because I
      maintain the 'mlmmj' package in Debian, so I took the time to read
      through the "Is this list active? Where is "upstream"??" and
      similar threads, and I see that there's a Git repo fork at 
      <a class="moz-txt-link-freetext" href="https://gitlab.com/mlmmj/mlmmj">https://gitlab.com/mlmmj/mlmmj</a> and had a look at it ... but nobody
      from the outside world can see that this exists, because that repo
      is not mentioned on the website nor the mailing list archives.
      <br>
      <br>
      From the distribution point of view this appears to be "dead
      upstream" and is a reason for package removal. Debian is about to
      do a "soft freeze" for preparation for the next release whereby
      packages in the archive will need bug support for 3 years.
      <br>
      <br>
      The main thing I want to know is "what should I do about the
      release?"
      <br>
      I'm considering the following choices:
      <br>
        a) release 'mlmmj' as before, with myself as maintainer of the
      package.
      <br>
        b) orphan the package so that there is no listed maintainer,
      where the package
      <br>
           might be released with Debian 11 or might get dropped,
      depending on what
      <br>
           the Release Team decides about the package themselves
      <br>
        c) request removal of the package from the archive
      <br>
      <br>
      Choice "a)" only fits if someone in "upstream" is willing to try
      to fix bugs that get reported. Are there others helping with this
      at present?
      <br>
      Right now I'm uncomfortable about this because the GitLab repo
      can't be found from the mlmmj.org web page, and that repo seems to
      be where bugs are reported and handled lately, as best I can tell.
      Is that correct?
      <br>
      <br>
      Side note: In terms of chances of bugs needing upstream help,
      looking at the Debian "popularity contest" figures I see that the
      number of users reporting having mlmmj loaded is low but slowly
      going /up/, which is good but not what I expected to see. (Note:
      these "popcon" numbers are likely artificially low, because not
      all machines are set to report popcon data to Debian.)
      <br>
      <br>
         <a class="moz-txt-link-freetext" href="https://qa.debian.org/popcon.php?package=mlmmj">https://qa.debian.org/popcon.php?package=mlmmj</a>
      <br>
      <br>
      Choice "b)" seems the most reasonable to me under the
      circumstances, but puts the package at risk of removal. This
      option does not preclude me from continuing to help fix bugs on
      the package as a "non-maintainer", which is what I would intend to
      do, for as long as I still use the package.
      <br>
      <br>
      I'd like to hear other's thoughts about this so we can discuss it
      some.
      <br>
      Thanks.
      <br>
         -- Chris
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------0FF5E6BE86F6D473C75AFFFD--

