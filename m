From: Christian Gleerup <christian.gleerup@swn.nu>
Date: Tue, 28 Sep 2010 18:06:31 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CA22EA7.2080707@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

  Hi Martin,

can you tell me where to look after the files?
I have tried too look around below /var/spool/mlmmj/nyhedsbrev/, but I=20
can't find any adresses in there.


Den 9/26/2010 9:08 PM, Mads Martin J=F8rgensen skrev:
> On Sun, Sep 26, 2010 at 8:06 PM, Christian Gleerup
> <christian.gleerup@swn.nu>  wrote:
>> I have a server that uses mlmmj, but now I have the problem, that some
>> email address cannot be deleted.
>>
>> for instance, I have this problem with my own, but the applikation user
>> has repported that she had th eproblem several times, so people simply
>> can't unsubscribe!
>>
>> see the following,
>>
>> /$ sudo mlmmj-list -L /var/spool/mlmmj/nyhedsbrev/ | grep cromozon
>> cromozon@swn.nu
>> /$ sudo /usr/bin/mlmmj-unsub -L /var/spool/mlmmj/nyhedsbrev/ -a
>> cromozon@swn.nu -s
>> Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
>> /$ sudo mlmmj-list -L /var/spool/mlmmj/nyhedsbrev/ | grep cromozon
>> cromozon@swn.nu
>>
>> As you can see, the mail adress is not deleted after the unsub command,
>> but in most cases, it works, what can be wrong?
> Have a look at the owner and permissions of the files - it looks to me as=
 if the
> one in question is owned by someone other than it should.
>


