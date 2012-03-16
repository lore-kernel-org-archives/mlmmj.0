From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 16 Mar 2012 11:59:04 +0000
Subject: Re: [mlmmj] deleting posts from archive
Message-Id: <4F632B08.6070500@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <CADNNayrp106uUkDfEzXCv_K7OBTp=xHAUWdS90eRhfHxS3K6VA@mail.gmail.com>
In-Reply-To: <CADNNayrp106uUkDfEzXCv_K7OBTp=xHAUWdS90eRhfHxS3K6VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 16/03/12 8:04 PM, Florian Effenberger wrote:
> what is the recommended way of deleting posts from the archive?
> Someone sent sensible data to a public mailing list and wants it to be
> purged from the archive. Can I simply delete the respective message ID
> from the folder, or will this confuse mlmmj?

I think deleting it is fine. Mlmmj keeps track of where it's up to using
$listdir/index, so missing archive files do not confuse it with regard
to new incoming messages. The listname+getN@domain.tld functionality
will fail for the missing messages, but that is of course desirable in
this case (and the failure isn't too ungraceful).

Of course you may also need to rebuild/purge any web pages built
incrementally from your archive.

Ben.




