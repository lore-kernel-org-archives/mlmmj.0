From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Wed, 04 Mar 2009 20:20:39 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <1236198039.6562.15.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Thomas,

First of all: Sorry about the long response time.

On Mon, 2009-03-02 at 14:27 +0800, Thomas Goirand wrote:
> As I wrote to Martin, I don't really care that one too, I was just
> annoyed that a user of our open source web hosting control panel
> complained that MLMMJ didn't have the feature while Sympa did. So I
> thought it would be a nice addition, and a quite mandatory feature for
> busy moderated lists. I just hope this will help promoting my favorite
> mailing list software! :)

Thanks for the code - I've committed it to CVS, and it will be included
in the next release of mlmmj :)

For the impatient souls out there, it can also be downloaded from
http://mlmmj.mmj.dk/~mortenp/mlmmj-php-moderation-cvs20090304.tar.bz2

There is a few notices. Could you take care of them? It's not urgent.

Notice: Use of undefined constant show_message - assumed 'show_message'
in /home/mopo/mlmmj/contrib/web/php-moderation/mlmmj-moderation.php on
line 237

These can only be provoked by a malformed mail, but it would be nice to
get rid of them anyway:

Notice: Undefined index: date in
/home/mopo/mlmmj/contrib/web/php-moderation/mlmmj-moderation.php on
line 154

Notice: Undefined index: subject
in /home/mopo/mlmmj/contrib/web/php-moderation/mlmmj-moderation.php on
line 155

Notice: Undefined index: from
in /home/mopo/mlmmj/contrib/web/php-moderation/mlmmj-moderation.php on
line 161

Best regards,
Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

