From: Mark Alan <varia@e-healthexpert.org>
Date: Wed, 08 Dec 2010 13:11:31 +0000
Subject: Re: [mlmmj] private lists with mlmmj
Message-Id: <4cff8412.87f4d80a.4067.18db@mx.google.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTikNkR-mQiMo2f3MVOStmn2VSgOat+O3Pbe0iAdO@mail.gmail.com>
In-Reply-To: <AANLkTikNkR-mQiMo2f3MVOStmn2VSgOat+O3Pbe0iAdO@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, 8 Dec 2010 11:26:18 +0100, Florian Effenberger
<floeff@gmail.com> wrote:

> * archives are available to all subscribers with ther individual
> username and password
> * every subscriber can change his address on his own
> 
> ideas on how to deal with the above to problems?

  1. We already have each user ID (in the form of his/her email address)
in list_name/subscribers.d. What we need is to store their
individual passwords.

  2. We could also store the password data in that file (or in another
  file named with a .pwd extension), much like dovecot does:

mark@example.com:{PLAIN}hello123
mark@example.com:{SSHA}1eiCI92yj1kwLNeqsRQWgpqtdZ/HPoVR
mark@example.com:{DIGEST-MD5}5a822514317b76bde6f0e92ad76c2c76 The above

  3. Data format:

  {PLAIN} is plain text

  The following were made using dovecotpw (which is part of the
  dovecot-common package):

  {SSHA} dovecotpw -p "hello123" -s SSHA
  {DIGEST-MD5} dovecotpw -p "hello123" -s DIGEST-MD5 -u
  mark@example.com This pwd schemes are further explained here:
  <http://wiki.dovecot.org/Authentication/PasswordSchemes>

  5. With such userID/password pairs, it would be rather
  straightforward to let the user in:
    - either from an email like:
  list_name+command+mark{DIGEST-MD5}5a822514317b76bde6f0e92ad76c2c76@example.com
    - or from a ordinary .php web form served from:
      https://webmlmmj.example.com

  Either way, no need for the inflexible and rather limited (and less
  secure !) .htaccess files (which are also rather cumbersome to have if
  one is not using apache as the web server)


Thank you.

M.

