From: Roderick <hruodr@gmail.com>
Date: Thu, 08 Apr 2021 17:30:32 +0000
Subject: [mlmmj] customheaders
Message-Id: <alpine.BSF.2.23.453.2104081729130.1369@fbsd.local>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


It seems the last header should not end with \n. Otherwise it mlmmj
ads something to the headers (\n) and dkim signature verifying fails.

Rod.


