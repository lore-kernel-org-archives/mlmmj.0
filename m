From: Gavin Henry <ghenry@suretec.co.uk>
Date: Tue, 16 Feb 2016 21:01:33 +0000
Subject: Re: [mlmmj] bounces-help and exim
Message-Id: <CAPcb_GKcU4s5O--vwonBTvd2n0e6dofq90TtFDTFTenA17tAog@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
In-Reply-To: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> There are probably Exim configuration options that can be used to
> achieve this. They're possibly off by default so that any user can't
> just manipulate the envelope from by putting a Return-Path header in
> their messages, potentially bypassing authentication which may
> ordinarily be used to set the envelope from. I found these pages which
> might help:
>
> - <http://stackoverflow.com/a/7047164/4785823>
> -
> <http://www.exim.org/exim-html-current/doc/html/spec_html/ch-generic_options_for_transports.html>
>   (see return_path_add and possibly return_path)
> -
> <http://www.exim.org/exim-html-current/doc/html/spec_html/ch-message_processing.html>
>   (see point 15)
>
> If you can get that working, I think things should settle down (and,
> indeed, improve, because bouncing addresses will be handled, rather than
> building up and making you look like a spammer).
>
> That is, of course, assuming all of my guesses are correct about what's
> going on here.

Ful bits:

# mlmmj
mlmmj_router:
  driver = accept
  domains = +mlmmj_domains
  require_files = MLMMJ_HOME/${lc::$local_part}
  # Use this instead, if you don't want to give Exim rx rights to mlmmj spool.
  # Exim will then spawn a new process running under the UID of "mlmmj".
  #require_files = mlmmj:MLMMJ_HOME/${lc::$local_part}
  local_part_suffix = +*
  local_part_suffix_optional
  headers_remove = Delivered-To
  headers_add = Delivered-To: $local_part$local_part_suffix@$domain
  transport = mlmmj_transport


smarthost:
  debug_print = "R: smarthost for $local_part@$domain"
  driver = manualroute
  domains = !+mlmmj_domains : !+local_domains
  transport = remote_smtp_smarthost
  route_list = * DCsmarthost byname
  host_find_failed = defer
  same_domain_copy_routing = yes
  no_more


This is already set in the transport:

# mlmmj
mlmmj_transport:
  driver = pipe
  return_path_add
  user = mlmmj
  group = mlmmj
  home_directory = MLMMJ_HOME
  current_directory = MLMMJ_HOME
  command = /usr/bin/mlmmj-receive -F -L MLMMJ_HOME/${lc:$local_part}


15. The Return-path: header line

Return-path: header lines are defined as something an MTA may insert
when it does the final delivery of messages. (See the
genericreturn_path_add transport option.) Therefore, they should not
be present in messages in transit. If the return_path_remove
configuration option is set (the default), Exim removes Return-path:
header lines from incoming messages.


I've now added this to existing vars:

# mlmmj 16.02.16 - GH
MLMMJ_HOME=/var/spool/mlmmj
domainlist mlmmj_domains = lists.suretec.net
return_path_remove = false


>> P.S. No updates for this year:
>>
>> http://mlmmj.org/archive/mlmmj/
>
>
> Yours was the first truly meaningful message of the year.

Ah, good to know.



-- 
Kind Regards,
Gavin Henry.

