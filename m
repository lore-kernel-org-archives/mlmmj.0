From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Tue, 03 Dec 2013 19:35:00 +0000
Subject: Re[2]: [mlmmj] Problems with microsoft
Message-Id: <a3f9f4c3d49d5c29785c8598f5aaec20@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
In-Reply-To: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hello list,

I have now updated to 1.2.18, and id did take some time to get the list tex=
ts right, but it seems to be worken fine now.
(I did a make install, and then moved the installed binaries since the old =
binaries was installed in a different location)

But obviously I still have the problem with sending to hotmail accounts sin=
ce that is a different problem...
but as i noted in another mail,
hotmail did, when they accepted mails from me, tell me to take it easy with=
 sending that many mails in a little period of time.

so the question is, how can i tell mlmmj+postfix to only deliver x mails pr=
. hour to the hotmail domain?

Also, It will be interesting to see if mlmmj unsubscribes those subscribers=
 after bouncelife (=3D15 days) =C2=A0with the accounts from the domain that=
 was taken down 2009.

and just another note,
after upgrading the memory amount, I had to set noatime on the harddrive si=
nce kjournald was using all the resources bringing the system practically t=
o a halt.

Regards
Christian

-----Original Message-----=20
> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au>=20
> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj@mlmmj.org=20
> Date: 28/11/2013 22:49=20
> Subject: Re: [mlmmj] Problems with microsoft=20
>=20
> On 29/11/13 4:58 AM, Christian Gleerup wrote:
> > I am considering just copying the 8 binaries
> > (mlmmj-(bounce,list,maintd,process, recieve, send, sub, unsub)) in
> > ~/mlmmj-1.2.18.0/src/ to /usr/bin/ where my old mlmmj files are.
> >
> > is there something I should be aware of or should it just Work?
> > (I will give the files same owership, I will delete mlmmj-make-ml and m=
lmmj-make-ml.sh)
>=20
> I never used a version as old as 1.2.16, so I'm not 100% sure.
>=20
> However...
>=20
> Take a bit of time to update your list texts as Mlmmj 1.2.18 uses a new
> list text mechanism. As well as list-specific ones, there are
> system-wide ones (can't quite remember where; maybe
> /usr/local/share/mlmmj) which Mlmmj falls back to when it can't find
> list-specific ones (and IIRC, it doesn't fall back in the most optimal
> way, so it's best to update both).
>=20
> Also note how mlmmj-receive has had the spelling fixed. "make install"
> installs a symlink with the old name, I think, so old entries in mail
> server config continue to work. You might prefer to update your mail
> server config.
>=20
> Apart from that, I think replacing the binaries will work. But no
> guarantees!
>=20
> > (I have upgraded the installation so I now have 768MB of ram, so I
> > hope there will be no more 'log blackouts')
>=20
> Cool. I had similar problems at one stage, where processes were killed
> due to lack of memory. In fact, that's one reason I got into Mlmmj in
> the first place, as its minimalist design makes it suitable for
> constrained-memory applications. I have also found the software Monit
> (single-host M/Monit) very helpful to keep essential services running
> despite the kernel killing things (or other process death). By
> installing it into inittab, Monit can be made to never die (or at least
> be guaranteed a resurrection if it does).
>=20
> Ben.




