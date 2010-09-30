From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 30 Sep 2010 23:16:59 +0000
Subject: Re: [SPAM Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CA51A6B.8000206@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4CA37FC4.1030500@swn.nu>
In-Reply-To: <4CA37FC4.1030500@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 1/10/10 7:37 AM, Franky Van Liedekerke wrote:
> On Thu, 30 Sep 2010 20:01:39 +0200
> Christian Gleerup<christian.gleerup@swn.nu>  wrote:
>
>>    All the files are owned by the user nobody as you correctly guessed,
>> to be more specific,
>>
>> The directories are owned by
>> * nobody : nobody *
>>
>> most of the files in /var/spool/mlmmj/nyhedsbrev/subscribers.d have
>> ownership
>> * nobody : root *
>> few of the files have ownership
>> * nobody : nobody *
>>
>> all the files have ownership u=rw
>>
>> So I am not sure this is related to ownership, since I could add and
>> delete one adress to /var/spool/mlmmj/nyhedsbrev/subscribers.d/c
>> while another adress in the same file would move.
>>
>> I still recieve news letters on that adress that i can't delete, and
>> if I try tu unsub without the -s argument, i recieve an email stating
>> that I am not subscribed
>>
>> I tried to add the problematic that i can't delete, and watch the
>> following. /$ sudo /usr/bin/mlmmj-sub -L /var/spool/mlmmj/nyhedsbrev/
>> -a cromozon@swn.nu
>> [sudo] password for fjernsynet:
>> Changing to uid 65534, owner of /var/spool/mlmmj/nyhedsbrev/.
>> /$ sudo cat /var/spool/mlmmj/nyhedsbrev/subscribers.d/c | grep
>> cromozon cromozon@swn.nu
>> cromozon@swn.nu
>>
>> Note that the mail adress shows up 2 times!
>> /var/spool/mlmmj/nyhedsbrev/subscribers.d/c thus contains the same
>> mail adress two times!
>>
>
> Is it possible that the unsubsribale address has some white spaces
> behind it (or other invisible characters)
> in /var/spool/mlmmj/nyhedsbrev/subscribers.d/c?

I agree.

Also, have you tried unsubscribing through the mail system (assuming
it's not a closed list), i.e. by sending mail to
nyhedsbrev+unsubscribe@... from the problematic address?

Finally...I should say if it's just this one address, not a recurring
problem that you need to fix, it wouldn't hurt to find the line in the
subscribers.d/c file and just remove it with a text editor.

It would be good to know if that illusive extra whitespace is there
though, regardless, particularly if you know how the address was
subscribed, because there may be a bug in Mlmmj we can track down, or an
improvement we can make to avoid it happening again.

Smiles,

Ben.





