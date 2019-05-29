Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8652E450
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2019 20:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfE2SQx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 May 2019 14:16:53 -0400
Received: from smtp-3.sys.kth.se ([130.237.48.192]:49262 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2SQx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 May 2019 14:16:53 -0400
Received: from smtp-3.sys.kth.se (localhost.localdomain [127.0.0.1])
        by smtp-3.sys.kth.se (Postfix) with ESMTP id 142085CD2;
        Wed, 29 May 2019 20:16:48 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at kth.se
Received: from smtp-3.sys.kth.se ([127.0.0.1])
        by smtp-3.sys.kth.se (smtp-3.sys.kth.se [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id KcxhRDBSW0Ig; Wed, 29 May 2019 20:16:47 +0200 (CEST)
X-KTH-Auth: barbette [130.237.20.142]
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kth.se; s=default;
        t=1559153807; bh=aOyrr5CsAjm+EHdP5MEi5LJ9UFS2frDBDs1N51seDUg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=aQ7o83M53g0nPxtLp2sgW4fTDlAzOCm5rSKdLOtMN49+/0WYq6aXSlOQdqA+PsMIx
         yLf1I63nzlkM2up3hMk+/jsxM1NqLAOYeGI1w7Sec0VwkOMUtldCKiUpxqkPwOI/Sm
         eVzr8idzq3llgT/+LYCaWLkLv01351EdPxj0F20s=
X-KTH-mail-from: barbette@kth.se
Received: from [130.237.20.142] (s2587.it.kth.se [130.237.20.142])
        by smtp-3.sys.kth.se (Postfix) with ESMTPSA id D38A35A9A;
        Wed, 29 May 2019 20:16:46 +0200 (CEST)
Subject: Re: Bad XDP performance with mlx5
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <d7968b89-7218-1e76-86bf-c452b2f8d0c2@kth.se>
 <20190529191602.71eb6c87@carbon>
From:   Tom Barbette <barbette@kth.se>
Message-ID: <0836bd30-828a-9126-5d99-1d35b931e3ab@kth.se>
Date:   Wed, 29 May 2019 20:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529191602.71eb6c87@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2019-05-29 19:16, Jesper Dangaard Brouer wrote:
> On Wed, 29 May 2019 18:03:08 +0200
> Tom Barbette <barbette@kth.se> wrote:
> 
>> Hi all,
>>
>> I've got a very simple eBPF program that counts packets per queue in a
>> per-cpu map.
> 
> Like xdp_rxq_info --dev mlx5p1 --action XDP_PASS ?

Even simpler.

> 
>> I use IPerf in TCP mode, I limit the CPU cores to 2 so performance is
>> limited by CPU (always at 100%).
>>
>> With a XL710 NIC 40G link, with the XDP program loaded, I get 32.5.
>> Without I get ~33.3Gbps. Pretty similar, somehow expected.
>>
>> With a ConnectX 5 100G link, I get ~33.3Gbps without the XDP program but
>> ~26 with it. The behavior seems similar with a simple XDP_PASS program.
> 
> Are you sure?


xdp_pass.c:
---
#include <linux/bpf.h>

#ifndef __section
# define __section(NAME)                  \
    __attribute__((section(NAME), used))
#endif

__section("prog")
int xdp_drop(struct xdp_md *ctx) {
     return XDP_PASS;
}

char __license[] __section("license") = "GPL";
---
clang -O2 -target bpf -c xdp_pass.c -o xdp_pass.o

Then see results with netperf below.

> 
> My test on a ConnectX 5 100G link show:
>   - 33.8 Gbits/sec = with no-XDP prog
>   - 34.5 Gbits/sec - with xdp_rxq_info
> 

Even faster? :p

>> Any idea why MLX5 driver behaves like this? perf top is not conclusive
>> at first glance. I'd say check_object_size and
>> copy_user_enhanced_fast_string rise up but the stack is unclear from where.
>   
> It is possible to get very different and varying TCP bandwidth results,
> depending on if TCP-server-process is running on the same CPU as the
> NAPI-RX loop.  If they share the CPU then results are worse, as
> process-context scheduling is setting a limit.

IPerf has one instance per-core, with SO_REUSEPORT and a BPF filter to 
map queues <-> CPU in 1:1 with irqbalance killed and set_affinity*sh.
So the setup on that regard is similar between tests and the variance do 
not come from different assignments.
Which is not what you're advising but ensure a similar per-core 
"pipeline" and tests reproducibility. It's a side question but any link 
on this L1/L2 cache misses vs scheduling question is welcome.

> 
> This is easiest to demonstrate with netperf option -Tn,n:
> 
> $ netperf -H 198.18.1.1 -D1 -T2,2 -t TCP_STREAM -l 120
> MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.1 () port 0 AF_INET : histogram : demo : cpu bind
> Interim result: 35344.39 10^6bits/s over 1.002 seconds ending at 1559149724.219
> Interim result: 35294.66 10^6bits/s over 1.001 seconds ending at 1559149725.221
> Interim result: 36112.09 10^6bits/s over 1.002 seconds ending at 1559149726.222
> Interim result: 36301.13 10^6bits/s over 1.000 seconds ending at 1559149727.222
> ^CInterim result: 36146.78 10^6bits/s over 0.507 seconds ending at 1559149727.730
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
> 
> 131072  16384  16384    4.51     35801.94
> 

server$ sudo service netperf start
server$ sudo killall -9 irqbalance
server$ sudo ethtool -X dpdk1 equal 2
server$ sudo ip link set dev dpdk1 xdp off
client$ netperf -H 10.220.0.5 -D1 -T2,2 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 
10.220.0.5 () port 0 AF_INET : demo : cpu bind
Interim result: 37221.90 10^6bits/s over 1.015 seconds ending at 
1559151699.433
Interim result: 37811.52 10^6bits/s over 1.003 seconds ending at 
1559151700.436
Interim result: 38195.47 10^6bits/s over 1.001 seconds ending at 
1559151701.437
Interim result: 41089.18 10^6bits/s over 1.000 seconds ending at 
1559151702.437
Interim result: 38005.40 10^6bits/s over 1.081 seconds ending at 
1559151703.518
Interim result: 34419.33 10^6bits/s over 1.104 seconds ending at 
1559151704.622
^CInterim result: 40634.33 10^6bits/s over 0.198 seconds ending at 
1559151704.820
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec

131072  16384  16384    6.41     37758.53

server$ sudo ip link set dev dpdk1 xdp obj xdp_pass.o
client$ netperf -H 10.220.0.5 -D1 -T2,2 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 
10.220.0.5 () port 0 AF_INET : demo : cpu bind
Interim result: 31669.02 10^6bits/s over 1.021 seconds ending at 
1559151575.906
Interim result: 31164.97 10^6bits/s over 1.016 seconds ending at 
1559151576.923
Interim result: 31525.57 10^6bits/s over 1.001 seconds ending at 
1559151577.924
Interim result: 28835.03 10^6bits/s over 1.093 seconds ending at 
1559151579.017
Interim result: 36336.89 10^6bits/s over 1.000 seconds ending at 
1559151580.017
Interim result: 31021.22 10^6bits/s over 1.171 seconds ending at 
1559151581.188
Interim result: 37469.64 10^6bits/s over 1.000 seconds ending at 
1559151582.189
^CInterim result: 33209.38 10^6bits/s over 0.403 seconds ending at 
1559151582.591
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec

131072  16384  16384    7.71     32518.84

server$ sudo ip link set dev dpdk1 xdp off
server$ sudo ip link set dev dpdk1 xdp obj xdp_count.o
netperf -H 10.220.0.5 -D1 -T2,2 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 
10.220.0.5 () port 0 AF_INET : demo : cpu bind
Interim result: 33090.36 10^6bits/s over 1.019 seconds ending at 
1559151856.741
Interim result: 32823.68 10^6bits/s over 1.008 seconds ending at 
1559151857.749
Interim result: 34766.21 10^6bits/s over 1.000 seconds ending at 
1559151858.749
Interim result: 36246.28 10^6bits/s over 1.034 seconds ending at 
1559151859.784
Interim result: 34757.19 10^6bits/s over 1.043 seconds ending at 
1559151860.826
Interim result: 29434.22 10^6bits/s over 1.181 seconds ending at 
1559151862.007
Interim result: 32619.29 10^6bits/s over 1.004 seconds ending at 
1559151863.011
^CInterim result: 36102.22 10^6bits/s over 0.448 seconds ending at 
1559151863.459
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec

131072  16384  16384    7.74     33470.75

There is a higher variance than my iperf test (50 flows) but without is 
always around 40, while with is ranging from 32 to 37, mostly 32. What 
I'm more sure of is that XL710 does not exhibit this behavior, with 
netperf too :

server$ sudo ip link set dev enp213s0f0 xdp off
client$ netperf -H 10.230.0.1 -D1 -T2,2 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 
10.230.0.1 () port 0 AF_INET : demo : cpu bind
Interim result: 18358.39 10^6bits/s over 1.001 seconds ending at 
1559152311.334
Interim result: 18635.27 10^6bits/s over 1.001 seconds ending at 
1559152312.334
Interim result: 18393.82 10^6bits/s over 1.013 seconds ending at 
1559152313.348
Interim result: 18741.75 10^6bits/s over 1.000 seconds ending at 
1559152314.348
Interim result: 18700.84 10^6bits/s over 1.002 seconds ending at 
1559152315.350
^CInterim result: 18059.26 10^6bits/s over 0.307 seconds ending at 
1559152315.657
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec

131072  16384  16384    5.33     18523.59

server$ sudo ip link set dev enp213s0f0 xdp obj xdp_pass.o
netperf -H 10.230.0.1 -D1 -T2,2 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 
10.230.0.1 () port 0 AF_INET : demo : cpu bind
Interim result: 17867.08 10^6bits/s over 1.001 seconds ending at 
1559152387.230
Interim result: 18444.22 10^6bits/s over 1.000 seconds ending at 
1559152388.230
Interim result: 18226.31 10^6bits/s over 1.012 seconds ending at 
1559152389.242
Interim result: 18411.24 10^6bits/s over 1.001 seconds ending at 
1559152390.243
Interim result: 18420.69 10^6bits/s over 1.001 seconds ending at 
1559152391.244
Interim result: 18236.47 10^6bits/s over 1.010 seconds ending at 
1559152392.254
Interim result: 18026.38 10^6bits/s over 1.012 seconds ending at 
1559152393.265
^CInterim result: 18390.50 10^6bits/s over 0.465 seconds ending at 
1559152393.730
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec

131072  16384  16384    7.50     18236.5

For some reason, everything happens on the same core with the XL710, but 
not mlx5 which uses 2 cores (one interrupt/napi and one netserver). Any 
idea why? TX affinity working with XL710 but not mlx5? Anyway my iperf 
test would not set that, so the problem does not lie there.

> 
> $ netperf -H 198.18.1.1 -D1 -T1,1 -t TCP_STREAM -l 120
> MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.1 () port 0 AF_INET : histogram : demo : cpu bind
> Interim result: 26990.45 10^6bits/s over 1.000 seconds ending at 1559149733.554
> Interim result: 27730.35 10^6bits/s over 1.000 seconds ending at 1559149734.554
> Interim result: 27725.76 10^6bits/s over 1.000 seconds ending at 1559149735.554
> Interim result: 27513.39 10^6bits/s over 1.008 seconds ending at 1559149736.561
> Interim result: 27421.46 10^6bits/s over 1.003 seconds ending at 1559149737.565
> ^CInterim result: 27523.62 10^6bits/s over 0.580 seconds ending at 1559149738.145
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
> 
> 131072  16384  16384    5.59     27473.50
>
> 
>> I use 5.1-rc3, compiled myself using Ubuntu 18.04's latest .config file.
> 
> I use 5.1.0-bpf-next (with some patches on top of commit 35c99ffa20).
> 
I'm rebasing on 5.1.5, I do not wish to go too leading edge on this 
project (unless needed).
I do have one patch to copy the RSS hash in the xdp_buff, but the field 
is read even if xdp is disabled.

Thanks for the help !

Tom
