From: Christian Laursen <xi@borderworlds.dk>
Date: Tue, 25 Oct 2005 07:20:38 +0000
Subject: Re: mlmmj + postfix + virtual
Message-Id: <86u0f6oyex.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <a1c8fe210510242315y45d547dcj319abb8182873881@mail.gmail.com>
In-Reply-To: <a1c8fe210510242315y45d547dcj319abb8182873881@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Harrison Caudill <Harrison.Caudill@HyperSphere.org> writes:

> /etc/postfix/virtual.regex:
> /(gtda-announce.*)@gtda.org/ gtda-announce

What happens if you change it to
/gtda-announce@gtda.org/ gtda-announce
?

My first guess is that your regex eats the stuff after the delimiter.

-- 
Christian Laursen
