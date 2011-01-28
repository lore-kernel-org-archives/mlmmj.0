From: Mark Alan <varia@e-healthexpert.org>
Date: Fri, 28 Jan 2011 08:59:48 +0000
Subject: Re: [mlmmj] ezmlm-like single command to subscribe an user?
Message-Id: <4d428589.6686d80a.3d41.44ae@mx.google.com>
List-Id: <mlmmj.mlmmj.org>
References: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
In-Reply-To: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Fri, 28 Jan 2011 06:13:50 +0100, Mads Martin J=F8rgensen <mmj@mmj.dk>
wrote:

> Why all the commandline stuff? I still fail to see what the problem
> with sending an empty mail through the system mail server, where the
> envelope from is set to any.user@example.com.
>=20
> mlmmj uses the envelope from to determine who sent the subscription
> request.

Changing the envelope, that's what we need to do now in order to make
it work. But that is fundamentally wrong. It is hardly good practice to
let the system itself act as a spammer, i.e., faking 'From:' envelopes.

In the Drupal CMS code that I mentioned in the first post, at the file
sites/all/modules/ezmlm/ezmlm.module,

we REPLACE the original:
  // subscribe address for list formatted below
  $to =3D trim($list_name) . '-subscribe-' . trim($user_name) .
'=3D' . trim($user_domain) . '@' . trim($list_domain);
  $lang =3D language_default();
  drupal_mail('ezmlm', 'subscribe', $to, $lang);

FOR this code:
  // subscribe address for list formatted below
  $to =3D trim($list_name) . '+subscribe' .'@' . trim($list_domain);
  $from =3D trim($user_name) . '@' . trim($user_domain);
  $lang =3D language_default();
  drupal_mail('ezmlm', 'subscribe', $to, $lang, '', $from);

I am not talking of quick fixes "to just make it working for now", I am
talking of fundamentally sound decisions involving best practices.

Why should we have to fake envelopes or, for that matter, have users
that own a mailing list and at the same time need to members of the
web server group and of the mail server group,
if we could have the much simpler and system/application agnostic:
listname+subscribe-some.user=3Dexample.com@domain.tld


Regards,

M.


