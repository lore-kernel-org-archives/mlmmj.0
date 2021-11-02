From: R Richard Summerhill <rrsum@summerhill.org>
Date: Tue, 02 Nov 2021 23:31:43 +0000
Subject: [mlmmj] Setting up mlmmj
Message-Id: <d0f08508-d9c3-f419-8015-9cb539f80208@summerhill.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

I'm trying to setup mlmmj on a FreeBSD server running sendmail. I've 
followed the recipe in the mlmmj README file, but on sending email to 
mlmmj-test@summerhill.org, I get the following return message:

-- 
"|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/mlmmj-test"
     (reason: 1)
     (expanded from: <mlmmj-test@summerhill.org>)

    ----- Transcript of session follows -----
Have to invoke either as root or as the user owning listdir
554 5.3.0 unknown mailer error 1
-- 

I have all the files in the spool directory owned by smmsp.  The other 
possibility is mailnull.

Can anyone tell me what is wrong?  Thanks in advance.

--Rick

-- 
Rick Summerhill
Retired, Chief Technology Officer, Internet2
10233 Timberhill Rd
Manchester, MI 48158 USA
-- 
Home: 734-428-1422
Web: http://www.rick.summerhill.org


