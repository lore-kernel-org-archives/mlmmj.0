From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sun, 02 Jul 2023 17:46:45 +0000
Subject: Re: SOLVED: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <146d521f-6d05-0594-346b-ef1ba5563274@telenet.be>
List-Id: <mlmmj.mlmmj.org>
References: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
In-Reply-To: <d59ddb9d-a113-5225-f26e-c24d42134ff4@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

My tests still fail on 4 checks:

mlmmj:generate_subconfirm  ->  failed: atf-c/utils.c:81: Cannot open 
atf_utils_fork_out.txt  [0.048s]
mlmmj:generate_subscription  ->  failed: atf-c/utils.c:81: Cannot open 
atf_utils_fork_out.txt  [0.049s]
mlmmj:notify_sub  ->  failed: atf-c/utils.c:81: Cannot open 
atf_utils_fork_out.txt  [0.047s]
mlmmj:send_help  ->  failed: atf-c/utils.c:81: Cannot open 
atf_utils_fork_out.txt  [0.052s]

Running on latest fedora 38, all updates installed (not running as root 
as well, but a regular user account used for compiling)

After running make check via strace, it seems atf fails because of 
nopenope not existing. I never heard of this program, but then I found 
this in ./tests/mlmmj.c:

  ./tests/mlmmj.c:        exec_or_die("/usr/bin/nopenope", NULL);
./tests/mlmmj.c:    atf_utils_wait(p, 1, "", "mlmmj: Execution failed 
for '/usr/bin/nopenope': No such file or directory\n");
./tests/mlmmj.c:    int val = exec_and_wait("/usr/bin/nopenope", NULL);

I don't know why tests/mlmmj.c searches for this weird command :-)


Franky

On 7/2/23 17:25, A. Schulze wrote:
> Hello all,
>
> I spend some time on mlmmj today and now I manage to build and PASS 
> 'make check'!
> Since my last try 1.4.0b2 is available. So I used that version.
>
> The key point was to *not* run 'make check' as root but as user nobody.
>
> So finally my build issue is solved and I could step further to create 
> a working lab environment to make real live tests.
>
> Thanks
> Andreas
>
> Am 04.03.23 um 16:45 schrieb A. Schulze:
>>
>> mlmmj-bounce:basics_6  ->  failed: atf-check failed; see the output 
>> of the test for details  [0.054s]
>>
>
>

