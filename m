From: Mark Alan <varia@e-healthexpert.org>
Date: Mon, 09 May 2011 10:45:09 +0000
Subject: Re: [mlmmj] How to recover subscribers?
Message-Id: <20110509114509.37874a64@e-healthexpert.org>
List-Id: <mlmmj.mlmmj.org>
References: <3FC8EB83-700A-42CE-9D89-2968ACAE158B@davetaylor.name>
In-Reply-To: <3FC8EB83-700A-42CE-9D89-2968ACAE158B@davetaylor.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 8 May 2011 10:00:36 -0700, Dave Taylor <ddt@davetaylor.name>
wrote:
> Is there any way to recover the email addresses were removed from the
> subscriber list?

Would executing this as root help?

sed '/ bouncing/!d;s/.*: \(.*\)
un.*/\1/' /var/spool/mlmmj/LISTNAME/mlmmj.operation.log

(NB replace LISTNAME by the name of the list that you wish to process)


M.


