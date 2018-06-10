From: Zhang Huangbin <zhb@iredmail.org>
Date: Sun, 10 Jun 2018 14:56:25 +0000
Subject: Re: [mlmmj] new mlmmj install on 64bit CentOS 7 server running Exim
Message-Id: <9FBAAD67-EB59-41B7-BD79-3B28E4BB1923@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
References: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
In-Reply-To: <dc20d767-6a0c-f51c-e72a-23e89d0b5985@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


> On Jun 10, 2018, at 4:46 PM, webmaster@vlsc.org wrote:
> 
> Jun 10 14:14:43 new /usr/local/bin/mlmmj-receive[18390]: mlmmj-receive.c:112: Have to invoke either as root or as the user owning listdir Invoked with uid = [1000]: Success

This message is clear enough.

According to mlmmj document (http://mlmmj.org/docs/readme-exim4/ ), did you setup exim to run mlmmj as mlmmj daemon user?

---------------------
mlmmj_transport:
  …
  user = mlmmj
  group = mlmmj
  …
-----------------------------

----
Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
Time zone: GMT+2 (Slovenia/Ljubljana).
Available on Telegram: https://t.me/iredmail


