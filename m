From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 20 Mar 2006 23:08:56 +0000
Subject: Re: testing mlmmj
Message-Id: <441F3608.9030304@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:

>>>>> invalid envelope from email count (was 0, must be 1): No such file or
> *But* if your mail server is not configured to add the envelope from address as
> a Return-Path: header, mlmmj can not see it. Is your server configured to add

oops, you are right, envelope from is Return-Path, of course.

Exim does not add a Return-Path header by default, this is done by
return_path_add in the transport.

