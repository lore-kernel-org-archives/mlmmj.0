From: Gareth Fiford <gareth@phporaclehosting.com>
Date: Wed, 06 Aug 2008 22:03:52 +0000
Subject: Quick hack to get mlmmj to work in PHP 5
Message-Id: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quick hack to get php user and admin to work in PHP5

add the following to
/usr/share/mlmmj/contrib/web/php-admin/conf/config.php

/usr/share/mlmmj/contrib/web/php-user/mlmmj.php

$HTTP_GET_VARS = $_GET;
foreach($_GET as $key => $value) {
	$$key=$value;
}

$HTTP_POST_VARS = $_POST;
foreach($_POST as $key => $value) {
	$$key=$value;
}

