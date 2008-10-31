From: =?UTF-8?Q?=E9=AD=8F=E4=BA=AE_DavidWei?= <davidwei@newbread.tj.cn>
Date: Fri, 31 Oct 2008 02:57:39 +0000
Subject: Re: any software to display the mail archive on =?UTF-8?Q?web=3F?=
Message-Id: <c35efca9ca16187e7c7e65a549a18f40@localhost>
List-Id: <mlmmj.mlmmj.org>
References: <32aeee10775e11b682ad20081bd301fa.squirrel@mail.newbread.tj.cn>
In-Reply-To: <32aeee10775e11b682ad20081bd301fa.squirrel@mail.newbread.tj.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi Sven,
I am so sorry I have already deleted the shell script when I received your
messege,but the config file is still in /etc dir.I remember that I changed
all the configfile items to fit my computer and run the shell script,the
script just quit and no error message is given,only create "archive" dir
under my web dir ,and the dir is empty. I think my config file may have
some problem. If this script can leave me some debug msg to tell which part
has mistake,that will help me a lot . I will attach my conf file below for
reference.
Thanks.

# Webarchiver Config

# mlmmj list dir (normally /var/spool/mlmmj)
MLMMJ_LISTDIR="/var/spool/mlmmj"

# weboutput dir
WEBARCHIVE_OUT="/home/share/website/vhost/newbread/che"

# more output (normally just errors, disable if you want to run as cron)
VERBOSE="1"

# default hypermail.rc file (will be used if no file exist for
# the list itself)
HYPERMAIL_RC="hypermail.rc"

# which permissions should be set for our archive dirs (file permissions
# should be set with hypermail config!)
DIRMODES="755"

# index file copied into new lists main dir
NEW_LIST_INDEX_SRC="newlist.index.php.example"
NEW_LIST_INDEX_DST="index.php"

# create archive as maildir zip?
ZIP_ARCHIVE="no"

# if you want a link to your archive, you can insert it here
MORE_LISTS_URL="http://che.newbread.tj.cn"

# here you can put stuff added to hypermail command for every mail (you
# may not need it, but its here ;)
HM_CMDS=""

# Which AuthType for htaccess protected archives?
AUTHTYPE="Basic"


 
On Thu, 30 Oct 2008 21:22:13 +0100, Sven 'Darkman' Michels
<sven@darkman.de> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi David,
> 
> may i ask what problem you had with my scripts? It's always
> good to know if i need to fix something ;)
> 
> Regards,
> Sven
> 
> 
> 魏亮 DavidWei wrote:
>> Hi Morten,
>>   Thanks a lot,I try that software,but i cannot get it worked.maybe
there
>> is some mistake with my config files.
>>   But , I find this shell script instead:
>> http://www.leopold.dk/~martin/mlmmj-scripts.html ,that one is shorter
>> and yet it worked well.
>>   thanks.
>> -------------------------------
>> 您可以通过下面的方式和我联系：
>> MSN: inadavid@hotmail.com
>> Gtalk: inadavid@gmail.com
>> Email: davidwei@newbread.tj.cn
>> 
>> On Thu, 十月 30, 2008 17:18, Morten K. Poulsen wrote:
>>> Hi ?,
>>>
>>> On Thu, 2008-10-30 at 17:05 +0900, ?? wrote:
>>>> my web server supports php and perl,is there any software can show the
>>>> mail archive of the list?
>>> We're using Sven "Darkman" Michels' Hypermail scripts. The latest
>>> version can be downloaded here:
>>>
>>> http://mlmmj.mmj.dk/~darkman/mlmmj-webarchiver-0.72.tar.gz
>>>
>>> Best regards,
>>> Morten
>>>
>>>
>>>
>> 
>> 
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQFJChd0QoCguWUBzBwRAm2YAJwNqSG4fHEqz7opywGCEhfp8uxNOQCfXlZP
> f0LcSxg+XrMdilaZ113ZvbI> =wC4T
> -----END PGP SIGNATURE-----
> 
-- 
-------------------------------
您可以通过下面的方式和我联系：
MSN: inadavid@hotmail.com
Gtalk: inadavid@gmail.com
Email: davidwei@newbread.tj.cn
