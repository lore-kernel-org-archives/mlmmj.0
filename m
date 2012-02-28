From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 28 Feb 2012 09:25:35 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4C9D8F.6050205@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 02/28/2012 05:50 AM, Marc MAURICE wrote:
> +} else if (isset($_POST["delete"])) {
> +
> +	$email = $_POST["email"];
> +	$cmd = "/usr/bin/mlmmj-unsub -L /var/spool/mlmmj/$list -a '$email' 2>&1";

What if $email contains:

'; rm -rf /

Please don't accept such a weak code. At least, a minimum check on the
validity of $email variable content should be made. In fact, and
generally speaking, absolutely *all* input variables should be checked.

Thomas

