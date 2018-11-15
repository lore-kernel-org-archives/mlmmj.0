From: Fabian Aldo Santiago <fsantiago@gardenlan.com>
Date: Thu, 15 Nov 2018 23:14:44 +0000
Subject: Re: [mlmmj] Mlmmj webarchiver
Message-Id: <71cb4b6b2e0ba1ba78d3e77a098fe714@gardenlan.com>
List-Id: <mlmmj.mlmmj.org>
References: <74E860C1-8583-4681-B3BD-4B77BC283293@gardenlan.com>
In-Reply-To: <74E860C1-8583-4681-B3BD-4B77BC283293@gardenlan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 2018-11-15 13:47, Fabian Aldo Santiago wrote:
> On 2018-11-15 13:35, A. Schulze wrote:
>> Am 15.11.18 um 16:28 schrieb fsantiago@gardenlan.com:
>>> https://git.cryptomilk.org/projects/mlmmj-webarchiver.git/
>>> And I’ve gotten it mostly working fine except the search link when 
>>> clicked presents a blank page. 
>>> I nginx with php-fpm to serve the site. The nginx error log complains 
>>> about an unexpected ‘&’ somewhere around line 34 of the search.php 
>>> file.
>> 
>> I've created a package for my installations. And - surprise - I wrote
>> a patch years ago that looks similar to your problem.
>> 
>> --- mlmmj-webarchiver.orig/mlmmj-webarchiver/search.php.newlist
>> +++ mlmmj-webarchiver/mlmmj-webarchiver/search.php.newlist
>> @@ -31,13 +31,13 @@
>>                 $html=array();
>>                 $count=0;
>>                 $maxresults=##MAX_RESULTS##;
>> -               exec("find -type f -name '0*.html' | xargs egrep -roi
>> '$words' | perl -pe 's/:.*//' | sort | uniq",&$output);
>> +               exec("find -type f -name '0*.html' | xargs egrep -roi
>> '$words' | perl -pe 's/:.*//' | sort | uniq",$output);
>>                 while(isset($output[$count]) && $count<$maxresults)
>>                 {
>>                         $file=$output[$count++];
>>                         $content=file_get_contents($file);
>>                         $matches=array();
>> -                       if (preg_match('/<em>Subject<\/em>:
>> ([^<]*)<\/li>[\S\s]+From<\/em>: ([^<]*)<\/li>[\S\s]+Date<\/em>:
>> ([^<]*)<\/li>/',$content,&$matches))
>> +                       if (preg_match('/<em>Subject<\/em>:
>> ([^<]*)<\/li>[\S\s]+From<\/em>: ([^<]*)<\/li>[\S\s]+Date<\/em>:
>> ([^<]*)<\/li>/',$content,$matches))
>>                         {
>>                                 $html[]="<li><a
>> href='$file'>$matches[1]</a>, $matches[2], $matches[3]</li>";
>>                         }
>> 
>>> Has anyone seen this?
>> obviously, because I wrote and forgot that patch :-)
>> 
>>> Does anyone still use this project?
>> yes - https://signing-milter.org/listarchive/ and
>> https://mail.dnswl.org/ml-archive/
>> 
>> Andreas
> 
> that's awesome! Thank you very much. I'll give this a whirl.

worked fine. thank you.

-- 
- Fabian S.

Open PGP:
0xE6826058E6ED7726DAA4C78303190CC0D1800E36

