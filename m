From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Tue, 26 Sep 2006 08:26:16 +0000
Subject: Re: mlmmj on Solaris
Message-Id: <4518E428.7050704@kite.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000605000704090001070307"
List-Id: <mlmmj.mlmmj.org>
References: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
In-Reply-To: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------000605000704090001070307
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rob Shepherd wrote:
>> But does
>>
>> 	/bin/sh -c "echo $((1+1))"
>>
>> result in "2" for you, Rob?
> 
> 
> Yes it does.
> 
> Send me an updated mlmmj-make-ml.sh with the updated scripting...
> 
> I'll test it.
> 

Ok this is a patch against mlmmj-1.2.12-RC3, tell me if you need the 
patch against some other version.
You apply it by issuing these commands:

	cd mlmmj-1.2.12-RC3
	patch -p1 < mlmmj-let-go-1.diff

And then try "make" again.
Also, could you please use "Reply To All" when youre answering mails to 
the mlmmj list? The list doesn't automatically gets a copy otherwise...

Regards,
Magnus


--------------000605000704090001070307
Content-Type: text/x-patch;
 name="mlmmj-let-go-1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mlmmj-let-go-1.diff"

--- mlmmj-1.2.12-RC3-vanilla/src/mlmmj-make-ml.sh.in	2005-10-02 16:54:33.000000000 +0200
+++ mlmmj-1.2.12-RC3/src/mlmmj-make-ml.sh.in	2006-09-26 10:16:47.000000000 +0200
@@ -46,7 +46,7 @@
 	exit 1
 esac
 done
-let SHIFTVAL=$OPTIND-1
+SHIFTVAL=$(( $OPTIND - 1 ))
 shift $SHIFTVAL
 
 if [ -z "$SPOOLDIR" ]; then

--------------000605000704090001070307--
