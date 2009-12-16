From: =?iso-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Wed, 16 Dec 2009 06:07:53 +0000
Subject: Re: [PATCH] Re: requeued mail files going missing from archive/
Message-Id: <CD5291AC-FA36-43A8-A010-20EAA37E8A10@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 16/12/2009, at 03.58, Robin H. Johnson wrote:

>> Lately I've had a lot of mail be requeued, and I'm running into some of the
>> requeue subdirectories existing, but the original mail that goes with them
>> going missing after being delivered only to some users.
> Patch that fixes it attached.
> 
> If the maintd visited more than one mail in the /requeue/ directory, and the
> FIRST one set the fromrequeuedir flag to unlink the mail file, the flag was NOT
> cleared and caused mail in the real archive to be erronously removed.
> 
> Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>

Yikes, good catch. Looks like Morten will grant the mailing world a 1.2.17 christmas present :)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.



