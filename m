From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 27 Sep 2007 07:49:16 +0000
Subject: Re: Possibility to deny the -list function that lists subscribers
Message-Id: <47DF4B48-4DDC-4E95-83EF-6681C1A82C6F@mmj.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-7--28724939"
List-Id: <mlmmj.mlmmj.org>
References: <46FB5BCB.7010004@goirand.fr>
In-Reply-To: <46FB5BCB.7010004@goirand.fr>
To: mlmmj@mlmmj.org


--Apple-Mail-7--28724939
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed


On 27/09/2007, at 9.29, Thomas Goirand wrote:

> Is there a way to remove the mylist-list@ function so my customers  
> can't
> list the other subscribers?

It's only possible to use the +list function if the request is coming  
from an owner emailaddress as it is now. But I can see why one would  
want to disable it completely, so here's a patch. Tunable name is  
'nolistsubsemail' as the patch indicates. If that file exists--it's  
not working anymore.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.




--Apple-Mail-7--28724939
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name=patch.diff
Content-Disposition: attachment;
	filename=patch.diff

---=20TUNABLES=093=20Mar=202007=2017:26:00=20-0000=091.37=0A+++=20=
TUNABLES=0927=20Sep=202007=2007:44:04=20-0000=0A@@=20-192,3=20+192,8=20=
@@=0A=20=0A=20=20=20=20If=20this=20is=20set,=20no=20reject=20=
notifications=20caused=20by=20violation=20of=20maxmailsize=0A=20=20=20=20=
will=20be=20sent.=0A+=0A+=20=B7=20nolistsubsemail=09=09(boolean)=0A+=0A+=20=
=20=20If=20this=20is=20set,=20the=20LISTNAME+list@=20functionality=20for=20=
requesting=20an=0A+=20=20=20email=20with=20the=20subscribers=20for=20=
owner=20is=20disabled.=0A---=20src/listcontrol.c=0910=20Dec=202006=20=
15:00:47=20-0000=091.52=0A+++=20src/listcontrol.c=0927=20Sep=202007=20=
07:44:04=20-0000=0A@@=20-711,6=20+711,8=20@@=0A=20=0A=20=09/*=20=
listname+list@domain.tld=20*/=0A=20=09case=20CTRL_LIST:=0A+=09=09=
if(statctrl(listdir,=20"nolistsubsemail"))=0A+=09=09=09return=20-1;=0A=20=
=09=09owner_idx=20=3D=20-1;=0A=20=09=09owners=20=3D=20=
ctrlvalues(listdir,=20"owner");=0A=20=09=09for(i=20=3D=200;=20i=20<=20=
owners->count;=20i++)=20{=0A=

--Apple-Mail-7--28724939
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed



--Apple-Mail-7--28724939--
