From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 03:23:15 +0000
Subject: Treatment of Return-Path: headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Morten K. Poulsen wrote:

> When the mail is "malformed" - e.g. no Return-Path: - we should return 
> EXIT_FAILURE.

Do you have a reference to an RFC which says that Return-Path: is a 
required header? I don't believe that it is required. It's used by 
sendmail (and other MTAs which follow the pattern of sendmail) to record 
the envelope sender, but can't be expected to be provided by all MTAs 
unless it is mandated by an RFC.

In the case of qmail deliveries, the envelope sender is available as 
$SENDER.

> The problem here is that we fork() to make sure that we are not 
> killed by the mail daemon who spawned us.

In the case of .qmail delivery, from the examples I've seen, the -F flag 
will be used to avoid forking.

I suspect this behaviour is wrong anyway. We can't just assume that the 
mlmmj-send completed - the system might be shut down before it's done its 
work, for instance. The LDA shouldn't return a delivery completed status 
until the delivery is completed. This might mean that in rare 
circumstances the delivery is done twice, but it should ensure that the 
message is never lost.
