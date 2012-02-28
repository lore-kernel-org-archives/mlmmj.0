From: Marc MAURICE <marc-mlmmj@pub.positon.org>
Date: Tue, 28 Feb 2012 09:47:55 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4CA2CB.1020301@pub.positon.org>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

I agree with you Thomas.
I forgot the check because the interface is http auth restricted, but=20
this is not not an excuse.

We should also fix the existing code in save.php.

Marc


Le 28/02/2012 10:25, Thomas Goirand a =E9crit :
> On 02/28/2012 05:50 AM, Marc MAURICE wrote:
>> +} else if (isset($_POST["delete"])) {
>> +
>> +	$email =3D $_POST["email"];
>> +	$cmd =3D "/usr/bin/mlmmj-unsub -L /var/spool/mlmmj/$list -a '$email' 2=
>&1";
> What if $email contains:
>
> '; rm -rf /
>
> Please don't accept such a weak code. At least, a minimum check on the
> validity of $email variable content should be made. In fact, and
> generally speaking, absolutely *all* input variables should be checked.
>
> Thomas
>
>

