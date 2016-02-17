From: Gavin Henry <ghenry@suretec.co.uk>
Date: Wed, 17 Feb 2016 19:28:59 +0000
Subject: Re: [mlmmj] bounces-help and exim
Message-Id: <CAPcb_GL=7hFe4fqRDiomGa9ndeu8DKrEBJETQ0jgV3Px8WH2Ww@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="047d7bdc8f7013fd42052bfc4398"
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
In-Reply-To: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
To: mlmmj@mlmmj.org

--047d7bdc8f7013fd42052bfc4398
Content-Type: text/plain; charset=UTF-8

>
> I've now added this to existing vars:
>
> # mlmmj 16.02.16 - GH
> MLMMJ_HOME=/var/spool/mlmmj
> domainlist mlmmj_domains = lists.suretec.net
> return_path_remove = false
>

Just for others, return_path_remove = false fixed this when using a
smarthost.

Thanks all.

--047d7bdc8f7013fd42052bfc4398
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
&gt;<br>
&gt; I&#39;ve now added this to existing vars:<br>
&gt;<br>
&gt; # mlmmj 16.02.16 - GH<br>
&gt; MLMMJ_HOME=/var/spool/mlmmj<br>
&gt; domainlist mlmmj_domains = <a href="http://lists.suretec.net">lists.suretec.net</a><br>
&gt; return_path_remove = false<br>
&gt;</p>
<p dir="ltr">Just for others, return_path_remove = false fixed this when using a smarthost. </p>
<p dir="ltr">Thanks all. </p>

--047d7bdc8f7013fd42052bfc4398--

