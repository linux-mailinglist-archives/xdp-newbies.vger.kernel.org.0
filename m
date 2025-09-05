Return-Path: <xdp-newbies+bounces-188-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4AB45090
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Sep 2025 09:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B150017FF3D
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Sep 2025 07:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A832F7449;
	Fri,  5 Sep 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AW8dBiWR"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664E25B1FF;
	Fri,  5 Sep 2025 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059165; cv=none; b=YIes+TaeIOqRsfc1Yzb63l8AaaYHPJoOAtO5C/ynBZQlaH/o2hX5S75EtF8et7gcB34YFBGwkFmKTgxGeG8kEgePc29/HeefelnYhf4uuuTeMkUjxQNkiqT/CBYwN3eCIRW+W1aqB5ZqhK9Bqu7am9HfgUPOBlz+SnZmwKYtfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059165; c=relaxed/simple;
	bh=uGvDA9m6sEiDHXQJ2CltpgYpelV+ZBEQdGRYB6weCNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8GpYK0NZiJcArLwKD5/LPg916l7nQm6sNnyLz7/xzuxX9BuvKMK0WQnzMbuFoUo1hAy4qZBhpnBXQGMjVUngA0/2cqwPWrd/v1s1jdhzom0QTEvZgN7nT6R0ZrUg7Y+kVACvTWfLonek7aRh76bm9AV4DGQR8yd3Ke0OkzEoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AW8dBiWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE383C4CEF1;
	Fri,  5 Sep 2025 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059164;
	bh=uGvDA9m6sEiDHXQJ2CltpgYpelV+ZBEQdGRYB6weCNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AW8dBiWRWCy5mxsMh07AOMyyUQgIwG0NrvHalX6QtaXTiyu3U60IprddKMa9Gu34K
	 ut5Z+tGh2Q/U/0+hhCYd6to6wVmUCtZDtvTts8s197qJjoSeJI+5eOj4mJTk6taVOi
	 okPP+desmqI1Ba+vZwftPFOI9aXQi+8Nwr8DDrkuDZU7BhYiaLrbR5VyPuAJilijxg
	 0HUh2apQSA7hUejiHazapbEZJD3mLBbp+fYwSlBKXRu/y5zgXKm5y6h2TK2ehUtt1L
	 vIoo8dAi45MiJVhDSyyhN5Hrit9mdiKYn0FND7p7vIf+g3hopWXAtrdJ4nzOjc4hOl
	 MQ4LMFNtlb56Q==
Message-ID: <04169545-c40d-4ae1-8fd9-39e4c47472a4@kernel.org>
Date: Fri, 5 Sep 2025 09:59:18 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] driver stmmac reports page_pool_release_retry() stalled
 pool shutdown every minute
To: Vincent Li <vincent.mc.li@gmail.com>, Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
 loongarch@lists.linux.dev, Furong Xu <0x1207@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Philipp Stanner <phasta@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Qunqin Zhao <zhaoqunqin@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@kernel.org>
References: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
 <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org>
 <CAK3+h2xQFeVtkPb+Sr1k+E0Fre+8hi_QfWYd3ueK-2B1FgJmGA@mail.gmail.com>
 <CAK3+h2xx8Zp-tRvw7rG4XjBWd_2D=TqZ=+cRYp9tzuyva0qeXA@mail.gmail.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <CAK3+h2xx8Zp-tRvw7rG4XjBWd_2D=TqZ=+cRYp9tzuyva0qeXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/09/2025 01.27, Vincent Li wrote:
> On Mon, Sep 1, 2025 at 10:56 AM Vincent Li <vincent.mc.li@gmail.com> wrote:
>>
>> On Mon, Sep 1, 2025 at 2:23 AM Jesper Dangaard Brouer <hawk@kernel.org> wrote:
>>>
>>> On 01/09/2025 04.47, Vincent Li wrote:
>>>> Hi,
>>>>
>>>> I noticed once I attached a XDP program to a dwmac-loongson-pci
>>>> network device on a loongarch PC, the kernel logs stalled pool message
>>>> below every minute, it seems  not to affect network traffic though. it
>>>> does not seem to be architecture dependent, so I decided to report
>>>> this to netdev and XDP mailing list in case there is a bug in stmmac
>>>> related network device with XDP.
>>>>
>>>
>>> Dragos (Cc'ed) gave a very detailed talk[1] about debugging page_pool
>>> leaks, that I highly recommend:
>>>    [1]
>>> https://netdevconf.info/0x19/sessions/tutorial/diagnosing-page-pool-leaks.html
>>>
>>> Before doing kernel debugging with drgn, I have some easier steps, I
>>> want you to perform on your hardware (I cannot reproduce given I don't
>>> have this hardware).
>>
>> I watched the video and slide, I would have difficulty running drgn
>> since the loongfire OS [0] I am running does not have proper python
>> support. loongfire is a port of IPFire for LoongArch architecture. The
>> kernel is upstream stable release 6.15.9  with a backport of LoongArch
>> BPF trampoline for supporting xdp-tools. I run loongfire on a
>> LoongArch PC for my home Internet. I tried to reproduce this issue on
>> the LoongArch PC with a Fedora desktop OS release with the same kernel
>> 6.15.9, I can't reproduce the issue, not sure if this is only
>> reproducible for firewall/router like Linux OS with stmmac device.
>>
>>>
>>> First step is to check is a socket have unprocessed packets stalled in
>>> it receive-queue (Recv-Q).  Use command 'netstat -tapenu' and look at
>>> column "Recv-Q".  If any socket/application have not emptied it's Recv-Q
>>> try to restart this service and see if the "stalled pool shutdown" goes
>>> away.
>>
>> the Recv-Q shows 0 from  'netstat -tapenu'
>>

This tell us that is wasn't an easy case of packets waiting in a socket
queue.  Indicating a higher probability of a driver issue.

>>   [root@loongfire ~]#  netstat -tapenu
>> Active Internet connections (servers and established)
>> Proto Recv-Q Send-Q Local Address           Foreign Address
>> State       User       Inode      PID/Program name
>> tcp        0      0 127.0.0.1:8953          0.0.0.0:*
>> LISTEN      0          10283      1896/unbound
>> tcp        0      0 0.0.0.0:53              0.0.0.0:*
>> LISTEN      0          10281      1896/unbound
>> tcp        0      0 0.0.0.0:22              0.0.0.0:*
>> LISTEN      0          8708       2823/sshd: /usr/sbi
>> tcp        0    272 192.168.9.1:22          192.168.9.13:58660
>> ESTABLISHED 0          8754       3004/sshd-session:
>> tcp6       0      0 :::81                   :::*
>> LISTEN      0          7828       2841/httpd
>> tcp6       0      0 :::444                  :::*
>> LISTEN      0          7832       2841/httpd
>> tcp6       0      0 :::1013                 :::*
>> LISTEN      0          7836       2841/httpd
>> tcp6       0      0 10.0.0.229:444          192.168.9.13:58762
>> TIME_WAIT   0          0          -
>> udp        0      0 0.0.0.0:53              0.0.0.0:*
>>           0          10280      1896/unbound
>> udp        0      0 0.0.0.0:67              0.0.0.0:*
>>           0          10647      2803/dhcpd
>> udp        0      0 10.0.0.229:68           0.0.0.0:*
>>           0          8644       2659/dhcpcd: [BOOTP
>> udp        0      0 10.0.0.229:123          0.0.0.0:*
>>           0          8679       2757/ntpd
>> udp        0      0 192.168.9.1:123         0.0.0.0:*
>>           0          8678       2757/ntpd
>> udp        0      0 127.0.0.1:123           0.0.0.0:*
>>           0          8677       2757/ntpd
>> udp        0      0 0.0.0.0:123             0.0.0.0:*
>>           0          8670       2757/ntpd
>> udp        0      0 0.0.0.0:514             0.0.0.0:*
>>           0          5689       1864/syslogd
>> udp6       0      0 :::123                  :::*
>>           0          8667       2757/ntpd
>>
>>> Second step is compiling kernel with CONFIG_DEBUG_VM enabled. This will
>>> warn us if the driver leaked the a page_pool controlled page, without
>>> first "releasing" is correctly.  See commit dba1b8a7ab68 ("mm/page_pool:
>>> catch page_pool memory leaks") for how the warning will look like.
>>>    (p.s. this CONFIG_DEBUG_VM have surprisingly low-overhead, as long as
>>> you don't select any sub-options, so we choose to run with this in
>>> production).
>>>
>>
>> I added CONFIG_DEBUG_VM and recompiled the kernel, but no kernel
>> warning message about page leak, maybe false positive?
>>

This just tells us that the inflight page_pool page wasn't "illegality"
returned to the MM-subsystem.  So, this page is stuck somewhere in the
system, still "registered" to a page_pool instance. This is even more
indication of a driver bug.

We are almost out of easy options to try.  The last attempt I want you
to try is to unload the NIC drivers kernel module (via rmmod).  And then
wait to see if the "stalled pool shutdown" messages disappears. I hope
you have some serial console, so you can still observe the kernel log.

If the "stalled pool shutdown" messages continue, then we have to use
the techniques as Dragos did.

Basically scanning all page's in memory looking for PP_SIGNATURE bit.
Here is some example[1] code that walks all memory pages from the kernel
side.  This doesn't actually work as a kernel module... if I was you, I
would just copy-paste this into the driver or page_pool, and call it
when we see the stalled messages.  This will help us identify the
page_pool page. (After which I would use Drgn to investigate the state).

[1] 
https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/mm/bench/page_bench06_walk_all.c#L68-L97


>> [root@loongfire ~]# grep 'CONFIG_DEBUG_VM=y' /boot/config-6.15.9-ipfire
>>
>> CONFIG_DEBUG_VM=y
>>
>> [root@loongfire ~]# grep -E 'MEM_TYPE_PAGE_POOL|stalled' /var/log/kern.log
>>
>> Sep  1 10:23:19 loongfire kernel: [    7.484986] dwmac-loongson-pci
>> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
>> Sep  1 10:26:44 loongfire kernel: [  212.514302] dwmac-loongson-pci
>> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
>> Sep  1 10:27:44 loongfire kernel: [  272.911878]
>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 60
>> sec
>> Sep  1 10:28:44 loongfire kernel: [  333.327876]
>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 120
>> sec
>> Sep  1 10:29:45 loongfire kernel: [  393.743877]
>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 181
>> sec
>>
> 
> I came up a fentry bpf program [0]
> https://github.com/vincentmli/loongfire/issues/3 to trace the netdev
> value in page_pool_release_retry():
> 
>          /* Periodic warning for page pools the user can't see */
>          netdev = READ_ONCE(pool->slow.netdev);
>          if (time_after_eq(jiffies, pool->defer_warn) &&
>              (!netdev || netdev == NET_PTR_POISON)) {
>                  int sec = (s32)((u32)jiffies - (u32)pool->defer_start) / HZ;
> 
>                  pr_warn("%s() stalled pool shutdown: id %u, %d
> inflight %d sec\n",
>                          __func__, pool->user.id, inflight, sec);
>                  pool->defer_warn = jiffies + DEFER_WARN_INTERVAL;
>          }
> 
> The bpf program prints netdev  NULL, I wonder if there is left over
> page pool allocated initially by the stmmac driver, and  after
> attaching XDP program, the page pool allocated initially had netdev
> changed to NULL?
> 
> Page Pool: 0x900000010b54f000
>    netdev pointer: 0x0
>    is NULL: YES
>    is NET_PTR_POISON: NO
>    condition (!netdev || netdev == NET_PTR_POISON): TRUE
> 
> Page Pool: 0x900000010b54f000
>    netdev pointer: 0x0
>    is NULL: YES
>    is NET_PTR_POISON: NO
>    condition (!netdev || netdev == NET_PTR_POISON): TRUE
> 
>>> Third step is doing kernel debugging like Dragos did in [1].
>>>
>>> What kernel version are you using?
>>
>> kernel 6.15.9
>>

Nice, that is a very recent kernel.
The above shows us that we are indeed hitting the issue of a "hidden"
page_pool instance (related to the page_pool commit Jakub/Kuba added).


>>>
>>> In kernel v6.8 we (Kuba) silenced some of the cases.  See commit
>>> be0096676e23 ("net: page_pool: mute the periodic warning for visible
>>> page pools").
>>> To Jakub/kuba can you remind us how to use the netlink tools that can
>>> help us inspect the page_pools active on the system?
>>>
>>>
>>>> xdp-filter load green0
>>>>
>>>
>>> Most drivers change memory model and reset the RX rings, when attaching
>>> XDP.  So, it makes sense that the existing page_pool instances (per RXq)
>>> are freed and new allocated.  Revealing any leaked or unprocessed
>>> page_pool pages.
>>>
>>>
>>>> Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
>>>> Aug 31 19:19:07 loongfire kernel: [200872.810587] page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 200399 sec
>>>
>>> It is very weird that a stall time of 200399 sec is reported. This
>>> indicate that this have been happening *before* the xdp-filter was
>>> attached. The uptime "200871.855044" indicate leak happened 472 sec
>>> after booting this system.
>>>
>>
>> Not sure if I pasted the previous log message correctly, but this time
>> the log I pasted should be correct,
>>
>>> Have you seen these dmesg logs before attaching XDP?
>>
>> I didn't see such a log before attaching XDP.
>>

 From above we have established, that it makes sense, as the mentioned
commit would have "blocked it" from being printed.

>>>
>>> This will help us know if this page_pool became "invisible" according to
>>> Kuba's change, if you run kernel >= v6.8.
>>>
>>>
>>>> Aug 31 19:20:07 loongfire kernel: [200933.226488] page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 200460 sec
>>>> Aug 31 19:21:08 loongfire kernel: [200993.642391]
>>>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
>>>> 200520 sec
>>>> Aug 31 19:22:08 loongfire kernel: [201054.058292]
>>>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
>>>> 200581 sec
>>>>
>>>
>>> Cc'ed some people that might have access to this hardware, can any of
>>> you reproduce?
>>>

Anyone with this hardware?

>>
>> [0]: https://github.com/vincentmli/loongfire

--Jesper

