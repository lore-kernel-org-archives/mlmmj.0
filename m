From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 28 Feb 2012 14:29:00 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4CE4AC.9060205@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 28/02/12 8:25 PM, Thomas Goirand wrote:
> On 02/28/2012 05:50 AM, Marc MAURICE wrote:
>> +} else if (isset($_POST["delete"])) {
>> +
>> +	$email = $_POST["email"];
>> +	$cmd = "/usr/bin/mlmmj-unsub -L /var/spool/mlmmj/$list -a '$email' 2>&1";
>
> What if $email contains:
>
> '; rm -rf /
>
> Please don't accept such a weak code. At least, a minimum check on the
> validity of $email variable content should be made. In fact, and
> generally speaking, absolutely *all* input variables should be checked.

And indeed, since ' is a valid character in an email address, the value
will have to be properly escaped when passed to the shell, not just
validated.

It wouldn't surprise me if some of the other PHP code is wrong, too.

Please do throw some good patches my way and I'll get them in. These
kinds of validation fixes are worth getting into a release as soon as
possible.

The extra functionality will go in too, but perhaps not into the next
release unless I get it very soon. (I finished implementation for the
next release tonight, so in a day or two, after a little testing, I'll
release an alpha and declare feature-freeze.)

Ben.




