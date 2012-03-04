From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 04 Mar 2012 14:05:42 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F5376B6.9030304@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Thanks for your contribution. The patch is getting better, but here are
some further review comments:

- You have added new files; could they have headers clarifying their
   license, please?
- /var/spool/mlmmj should not be hardcoded; you should use $topdir.
- You need to unset($out) before calling exec(...,$out,...); see the PHP
   documentation for exec().
- Please don't ini_set display_errors to true; that could expose details
   that the server administrator does not want to expose; admins should
   have their PHP logging set up adequately to give them what they need,
   or can change ini settings themselves if they need to.
- Could you concatenate strings and use \n for linebreaks, please,
   maintaining the indent in the PHP script, instead of having string
   literals that span multiple lines?
- Could you consider extending this slightly to allow subscription of
   digesters and nomailers? (Update the README, too, to get permissions
   set correctly on all relevant directories.) This could be a separate
   patch, or omitted, but it would be nice.

And yes, of course inside <pre> ln2br is unnecessary.

Cheers,

Ben.



On 2/03/12 11:59 PM, Marc MAURICE wrote:
> Here is the new patch version.
>
> The email should be displayed, otherwise the user will have no clue about=
 which
> email is wrong if his email list is very long.
>
> I put htmlspecialchars everywhere and errors are now enclosed in <pre> ta=
gs.
> no need for ln2br in <pre> tags no ?
>
> Marc
>
>
> Le 01/03/2012 16:07, Thomas Goirand a =E9crit :
>> On 03/01/2012 09:08 PM, Marc MAURICE wrote:
>>> +if (isset($_POST["tosubscribe"])) {
>>> +
>>> + foreach (preg_split('/\r\n|\n|\r/', $_POST["tosubscribe"]) as $line) {
>>> + $email =3D trim($line);
>>> + if ($email !=3D "") {
>>> + if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
>>> + $cmd =3D "/usr/bin/mlmmj-sub -L '/var/spool/mlmmj/".escapeshellarg($l=
ist)."' -a
>>> '".escapeshellarg($email)."' 2>&1";
>>> + exec($cmd, $out, $ret);
>>> + if ($ret !=3D 0) {
>>> + $message.=3D "Subscribe error for $email<!--cmd=3D$cmd out=3D".implod=
e($out)."
>>> ret=3D$ret--> <br/>";
>>> + }
>>> + } else {
>>> + $message.=3D "Email address not valid: $email<br/>";
>> If $email isn't valid, then it's even more a reason not to display it
>> (eg: unless you want to shoot yourself in the foot with issues like
>> cross site scripting...).
>>
>> Also, I'm not sure what you are attempting with "displaying" the output
>> of the subscribing command in a HTML comment. Why not displaying it for
>> real, using htmlspecialchars() (which by the way, you didn't use, which
>> is dangerous) and ln2br() in a<pre> tag?
>>
>> Thomas
>>
>>

