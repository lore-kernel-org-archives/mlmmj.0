From: "Marcelo E. Magallon" <marcelo.magallon@gmail.com>
Date: Mon, 27 Jun 2005 13:06:44 +0000
Subject: Re: "forwarding" recipient_delimited addresses
Message-Id: <20050627130644.GA9799@jacinta.casa>
List-Id: <mlmmj.mlmmj.org>
References: <20050627120803.GJ4446@svanberg.no>
In-Reply-To: <20050627120803.GJ4446@svanberg.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Jun 27, 2005 at 02:08:03PM +0200, Vegard Svanberg wrote:

 > I have mailing lists on one domain (lists.domain.test) and forward
 > list addresses from listname@realdomain.test to
 > listname@lists.domain.test.  Do I have to forward each and every
 > command (listname+subscribe, unsubscribe etc) or can I, easily,
 > forward something like listname+* to listname@lists.domain.test?

 It depends on your MTA, really.

 With Exim and Postfix it's rather easy.  If realdomain.test is a
 "virtual" domain (all the addresses are delivered elsewhere), with exim
 you can setup a virtual router which reads something like this:

    virtual:
        driver = redirect
        allow_defer
        allow_fail
        local_part_suffix = +*
        local_part_suffix_optional
        domains = dsearch;CONFDIR/virtual
        data = ${lookup{$local_part}lsearch{CONFDIR/virtual/$domain}}
        pipe_transport = address_pipe
        file_transport = address_file
        no_more

 Now you have a CONFDIR/virtual/realdomain.test which contains:

    listname: listname@lists.domain.test

 Note that this is accomplished because of the local_part_suffix bits.

 If the domain isn't virtual, you can do the same, just add the
 local_part_suffix bits to the proper router.

-- 
Marcelo
