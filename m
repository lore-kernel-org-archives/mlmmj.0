From: Thomas Goirand <thomas@goirand.fr>
Date: Thu, 01 Mar 2012 15:07:45 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4F90C1.1040003@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 03/01/2012 09:08 PM, Marc MAURICE wrote:
> +if (isset($_POST["tosubscribe"])) {
> +	
> +	foreach (preg_split('/\r\n|\n|\r/', $_POST["tosubscribe"]) as $line) {
> +		$email = trim($line);
> +		if ($email != "") {
> +			if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
> +				$cmd = "/usr/bin/mlmmj-sub -L '/var/spool/mlmmj/".escapeshellarg($list)."' -a '".escapeshellarg($email)."' 2>&1";
> +				exec($cmd, $out, $ret);
> +				if ($ret != 0) {
> +					$message.= "Subscribe error for $email <!--cmd=$cmd out=".implode($out)." ret=$ret--> <br/>";
> +				}
> +			} else {
> +				$message.= "Email address not valid: $email <br/>";

If $email isn't valid, then it's even more a reason not to display it
(eg: unless you want to shoot yourself in the foot with issues like
cross site scripting...).

Also, I'm not sure what you are attempting with "displaying" the output
of the subscribing command in a HTML comment. Why not displaying it for
real, using htmlspecialchars() (which by the way, you didn't use, which
is dangerous) and ln2br() in a <pre> tag?

Thomas

