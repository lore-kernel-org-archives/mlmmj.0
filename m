From: R Richard Summerhill <rrsum@summerhill.org>
Date: Wed, 03 Nov 2021 02:23:40 +0000
Subject: Re: [mlmmj] Setting up mlmmj
Message-Id: <1b87bfb5-24cd-aa6e-1869-d431f8a82439@summerhill.org>
List-Id: <mlmmj.mlmmj.org>
References: <d0f08508-d9c3-f419-8015-9cb539f80208@summerhill.org>
In-Reply-To: <d0f08508-d9c3-f419-8015-9cb539f80208@summerhill.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

I changed the ownership of /var/spool/mlmmj/mlmmj-test (with -R) to 
mailnull and I think it got further.  However, now sending mail to the 
list motivates the following in the maillog:

Nov  2 21:31:20 cody sm-mta[26820]: 1A31VKqs026819: 
to="|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/mlmmj-test", 
ctladdr=<mlmmj-test@summerhill.org> (26/0), delay=00:00:00, 
xdelay=00:00:00, mailer=prog, pri=31726, dsn=2.0.0, stat=Sent
Nov  2 21:31:20 cody /usr/local/bin/mlmmj-process[26822]: 
mlmmj-process.c:901: Discarding 
/var/spool/mlmmj/mlmmj-test/incoming/3f2c93fb5508b0d5 due to missing 
envelope from address: No error: 0

This was composed on a linux laptop doing imap to the FreeBSD server, 
which succeeds to all other addresses.  I get the same result running 
the primitive mail function from my user on the server (which is a 
member of the list) to the list.

  On 11/2/21 7:48 PM, Svetlana Tkachenko wrote:
> Hi Richard,
>
>> I have all the files in the spool directory owned by smmsp.
> My files in spool are owned by _smtpd, in an openbsd install. Just letting you know in case you might also have such a user.
>
> Svetlana
>
> P.S. Message content after '-- ' is email signature, some email clients ignore it. In this particular case, that is all the error text and everything in the second half of the message.
>
>

