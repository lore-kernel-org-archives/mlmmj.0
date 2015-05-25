From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 May 2015 22:16:47 +0000
Subject: [mlmmj] Mlmmj 1.2.19.0 released
Message-Id: <55639F4F.4010303@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mlmmj 1.2.19.0 has been released. Find it on the downloads page 
<http://mlmmj.org/downloads/>. It offers a small number of bug-fixes and 
enhancements that have seen significant testing in production sites. These include:

- Ensuring OpenSMTPD sends 8-bit mail so it works with non-ASCII mail
- Improved handling of non-ASCII mail and long headers
- Tunable for moderation request lifetime
- Fix relayhost and related tunables which didn't work in some circumstances

Slightly more detail may be found in the ChangeLog 
<http://mlmmj.org/hg/mlmmj/file/RELEASE_1_2_19_0/ChangeLog>.

Apart from fixed bugs, this release is compatible with 1.2.18.

I don't anticipate too long a delay before preparing a pre-release distribution of 
1.2.20. I will use the bug-tracker <http://mlmmj.org/bugs/> as a guide to 
prioritise development. If there is something you would like to see in Mlmmj 
(fixed or added), please ensure it is included there, and vote for it.

Thanks for your support.

Ben.




