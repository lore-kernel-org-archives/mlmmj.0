From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sat, 03 Dec 2022 08:48:11 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <d7c69b77-366a-a374-b9c9-8b14e510539e@telenet.be>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 12/2/22 21:31, A. Schulze wrote:

>
>
> Am 02.12.22 um 21:05 schrieb Baptiste Daroussin:
>> On debian it needs libatf-dev for the testsuite
>
> ok, now "make check" fail:
>
> Making check in src
> make[1]: Entering directory '/tmp/src'
> make[1]: Nothing to be done for 'check'.
> make[1]: Leaving directory '/tmp/src'
> Making check in listtexts
> make[1]: Entering directory '/tmp/listtexts'
> make[1]: Nothing to be done for 'check'.
> make[1]: Leaving directory '/tmp/listtexts'
> Making check in contrib
> make[1]: Entering directory '/tmp/contrib'
> Making check in receivestrip
> make[2]: Entering directory '/tmp/contrib/receivestrip'
> make[2]: Nothing to be done for 'check'.
> make[2]: Leaving directory '/tmp/contrib/receivestrip'
> make[2]: Entering directory '/tmp/contrib'
> make[2]: Nothing to be done for 'check-am'.
> make[2]: Leaving directory '/tmp/contrib'
> make[1]: Leaving directory '/tmp/contrib'
> Making check in tests
> make[1]: Entering directory '/tmp/tests'
> make  mlmmj mlmmj-send functional-tests mlmmj-maintd mlmmj-sub
> make[2]: Entering directory '/tmp/tests'
> make[2]: 'mlmmj' is up to date.
> make[2]: 'mlmmj-send' is up to date.
> make[2]: 'functional-tests' is up to date.
> make[2]: 'mlmmj-maintd' is up to date.
> make[2]: 'mlmmj-sub' is up to date.
> make[2]: Leaving directory '/tmp/tests'
> kyua --config=none test --kyuafile='./Kyuafile' \
>         --build-root='.'
> mlmmj:chomp  ->  passed  [0.002s]
> mlmmj:decode_qp  ->  passed  [0.002s]
> mlmmj:exec_and_wait  ->  passed  [0.007s]
> mlmmj:exec_or_die  ->  passed  [0.006s]
> mlmmj:extract_bouncetime  ->  passed  [0.001s]
> mlmmj:find_email_adr  ->  passed  [0.001s]
> mlmmj:genmsgid  ->  passed  [0.002s]
> mlmmj:init_sock  ->  passed  [1.002s]
> mlmmj:lowercase  ->  passed  [0.002s]
> mlmmj:mybasename  ->  passed  [0.002s]
> mlmmj:mydirname  ->  passed  [0.002s]
> mlmmj:mygetline  ->  passed  [0.051s]
> mlmmj:open_subscriber_directory  ->  passed  [0.002s]
> mlmmj:parse_lastdigest  ->  passed  [0.002s]
> mlmmj:random_int  ->  passed  [0.002s]
> mlmmj:strtoim  ->  passed  [0.002s]
> mlmmj:strtotimet  ->  passed  [0.002s]
> mlmmj:unsubscribe  ->  passed  [0.003s]
> mlmmj:write_data  ->  passed  [0.003s]
> mlmmj:write_dot  ->  passed  [0.002s]
> mlmmj:write_ehlo  ->  passed  [0.002s]
> mlmmj:write_helo  ->  passed  [0.002s]
> mlmmj:write_mail_from  ->  passed  [0.002s]
> mlmmj:write_mailbody_from_map  ->  passed  [0.004s]
> mlmmj:write_quit  ->  passed  [0.002s]
> mlmmj:write_rcpt_to  ->  passed  [0.002s]
> mlmmj:write_replyto  ->  passed  [0.002s]
> mlmmj:write_rset  ->  passed  [0.002s]
> mlmmj-send:__test_cases_list__  ->  broken: Test program did not exit 
> cleanly  [0.000s]
> functional-tests:__test_cases_list__  ->  broken: Test program did not 
> exit cleanly  [0.000s]
> mlmmj-maintd:__test_cases_list__  ->  broken: Test program did not 
> exit cleanly  [0.000s]
> mlmmj-sub:__test_cases_list__  ->  broken: Test program did not exit 
> cleanly  [0.001s]
>
> Results file id is tmp_tests.20221202-202359-479119
> Results saved to 
> /root/.kyua/store/results.tmp_tests.20221202-202359-479119.db
>
> 28/32 passed (4 failed)
> make[1]: *** [Makefile:559: check] Error 1
> make[1]: Leaving directory '/tmp/tests'
> make: *** [Makefile:443: check-recursive] Error 1


You need to install atf-sh (the devel-package of it, on fedora it is 
libatf-sh-devel)

Franky


