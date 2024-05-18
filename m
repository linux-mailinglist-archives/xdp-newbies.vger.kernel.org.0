Return-Path: <xdp-newbies+bounces-69-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA668C8FA4
	for <lists+xdp-newbies@lfdr.de>; Sat, 18 May 2024 06:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1FFB283361
	for <lists+xdp-newbies@lfdr.de>; Sat, 18 May 2024 04:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CB52F24;
	Sat, 18 May 2024 04:49:37 +0000 (UTC)
X-Original-To: xdp-newbies@vger.kernel.org
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9E4D502;
	Sat, 18 May 2024 04:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716007777; cv=none; b=D8Totl3UBbYAw9yr4G6zMwWQO9noMcfj3tEOvYe0g6kC1G1oZmt1bOc7k4Y+V6x+vKPOdixwtg7pqCcJziKPfshZavIx+zPsa4DC0MVvgpFySZMeSz+4K9zb71GUpnw2wlV/3RFjFJINgw62T3O0cHQG2fJecOhmulwAt0Z8EZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716007777; c=relaxed/simple;
	bh=FIXomljXF6mk/8HMId+PDPDbr4LaPbGwF269cnnj6tU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AZYxhASjwrwI4alBgNcPK2fQepRkn1ULnZMgJc8U4Jgxulx2iRE92z2qbNJJDqlqCCiWgfJOEFBI+VDi0Jjci7XQkjqEfrM8CzSjTB0avpf+gJ7vqSoFYL437rzxeBNVd8Stt0clJBY4jz0hmv73pIiI9w18E9/Cs+zrTYbRxAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Vh9sh1qd3z4f3l1m;
	Sat, 18 May 2024 12:32:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 89B261A016E;
	Sat, 18 May 2024 12:32:34 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
	by APP3 (Coremail) with SMTP id _Ch0CgDHv4dfL0hm0wohMw--.30767S2;
	Sat, 18 May 2024 12:32:34 +0800 (CST)
Subject: Re: bpf_map_update_elem returns -ENOMEM
To: Chase Hiltz <chase@path.net>
Cc: xdp-newbies@vger.kernel.org, bpf <bpf@vger.kernel.org>
References: <CAOAiysedBwajcFQwuPrtn5bbdk_5zrNq=oY91j5mWyKdc+06uw@mail.gmail.com>
 <e697a0b2-7197-9a33-2efe-e11278b8835d@huaweicloud.com>
 <CAOAiysdcRkjNeJFKMss2nLYwAFd8QM87rLH6xjqBfmvWW5paZQ@mail.gmail.com>
From: Hou Tao <houtao@huaweicloud.com>
Message-ID: <185ac0e4-9375-96ee-a8c8-3c2a39ce035c@huaweicloud.com>
Date: Sat, 18 May 2024 12:32:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAOAiysdcRkjNeJFKMss2nLYwAFd8QM87rLH6xjqBfmvWW5paZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:_Ch0CgDHv4dfL0hm0wohMw--.30767S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WrWrGryfCw4DtFyUCr1rJFb_yoWxXF1fpF
	W5Ka4YganrXr13tw4I93yvqr40ywn8ta98JF15Jr1kAws8WF92gr1IgF4Y9F9rArs5XF1F
	qw4jg3ZxCFn8ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/

Hi,

On 5/17/2024 9:52 PM, Chase Hiltz wrote:
> Hi,
>
> Thanks for the replies.
>
>> Joe also gave a talk about LRU maps LPC a couple of years ago which
>> might give some insight:
> Thanks, this was very helpful in understanding how LRU eviction works!
> I definitely think it's related to high levels of contention on
> individual machines causing LRU eviction to fail, given that I'm only
> seeing it occur for those which consistently process the most packets.
>
>> There have been several updates to the LRU map code since 5.15 so it is
>> definitely possible that it will behave differently on a 6.x kernel.
> I've compared the implementation between 5.15 and 6.5 (what I would
> consider as a potential upgrade) and observed no more than a few
> refactoring changes, but of course it's possible that I missed
> something.
>
>> In order to reduce of possibility of ENOMEM error, the right
>> way is to increase the value of max_entries instead of decreasing it.
> Yes, I now see the error of my ways in thinking that reducing it would
> help at all when it actually hurts. For the time being, I'm going to
> do this as a temporary remediation.

Is there a special reason on why use
>> Does the specific CPU always fail afterwards, or does it fail
>> periodically ? Is the machine running the bpf program an arm64 host or
>> an x86-64 host (namely uname -a) ? I suspect that the problem may be due
>> to htab_lock_bucket() which may fail under arm64 host in v5.15
> It always fails afterwards, I'm doing RSS and we notice this problem
> occurring back-to-back for specific source-destination pairs (because
> they always land on the same queue). This is a 64-bit system:
> ```
> $ uname -a
> 5.15.0-76-generic #83-Ubuntu SMP Thu Jun 15 19:16:32 UTC 2023 x86_64
> x86_64 x86_64 GNU/Linux
> ```

It is an x86-64 host, so my previous guess is wrong.
>
>> Could you please check and account the ratio of times when
>> htab_lru_map_delete_node() returns 0 ? If the ratio high, it probably
>> means that there may be too many overwrites of entries between different
>> CPUs (e.g., CPU 0 updates key=X, then CPU 1 updates the same key again).
> I'm not aware of any way to get that information, if you have any
> pointers I'd be happy to check this.

Please install bpftrace on the host firstly, then running the following
one-line script in the host when bpf_map_update_elem() starts to return
-ENOMEM:

# sudo bpftrace -e 'kr:htab_lru_map_delete_node { if (retval == 0) {
@lock[cpu] = count(); } else { @del[retval & 0xff, cpu] = count(); } }
i:s:10 { exit(); }'

The script above tries to account the return value of
htab_lru_map_delete_node():
(1) if htab_lock_bucket() returns true,  retval will 0, so account the
case in the @lock map
(2) if the target node is found in the hash list, the lowest byte of
retval will be 1, otherwise it will 0. These returns are accounted in
@del map.

The snippet 'i:s:10 { exit(); }' is used to terminate the script after
10 seconds. You could adjust the time to a smaller one if there are too
many accounting. The following is the output from my local developer
environment:

# bpftrace -e 'kr:htab_lru_map_delete_node { if (retval == 0) {
@lock[cpu] = count(); } else { @del[retval & 0xff, cpu] = count(); } }
i:s:10 { exit(); }'
Attaching 2 probes...

@del[0, 3]: 4822
@del[0, 6]: 5656
@del[0, 2]: 5995
@del[0, 4]: 8652
@del[0, 1]: 24722
@del[0, 5]: 25146
@del[0, 0]: 36137
@del[0, 7]: 38254
@del[1, 3]: 162054
@del[1, 4]: 208696
@del[1, 6]: 245960
@del[1, 2]: 267437
@del[1, 5]: 533654
@del[1, 1]: 548974
@del[1, 7]: 618810
@del[1, 0]: 619459

>
>
> On Thu, 16 May 2024 at 07:29, Hou Tao <houtao@huaweicloud.com> wrote:
>> Hi,
>>
>> +cc bpf list
>>
>> On 5/6/2024 11:19 PM, Chase Hiltz wrote:
>>> Hi,
>>>
>>> I'm writing regarding a rather bizarre scenario that I'm hoping
>>> someone could provide insight on. I have a map defined as follows:
>>> ```
>>> struct {
>>>     __uint(type, BPF_MAP_TYPE_LRU_HASH);
>>>     __uint(max_entries, 1000000);
>>>     __type(key, struct my_map_key);
>>>     __type(value, struct my_map_val);
>>>     __uint(map_flags, BPF_F_NO_COMMON_LRU);
>>>     __uint(pinning, LIBBPF_PIN_BY_NAME);
>>> } my_map SEC(".maps");
>>> ```
>>> I have several fentry/fexit programs that need to perform updates in
>>> this map. After a certain number of map entries has been reached,
>>> calls to bpf_map_update_elem start returning `-ENOMEM`. As one
>>> example, I'm observing a program deployment where we have 816032
>>> entries on a 64 CPU machine, and a certain portion of updates are
>>> failing. I'm puzzled as to why this is occurring given that:
>>> - The 1M entries should be preallocated upon map creation (since I'm
>>> not using `BPF_F_NO_PREALLOC`)
>>> - The host machine has over 120G of unused memory available at any given time
>>>
>>> I've previously reduced max_entries by 25% under the assumption that
>>> this would prevent the problem from occurring, but this only caused
>> For LRU map with BPF_F_NO_PREALLOC, the number of entries is distributed
>> evenly between all CPUs. For your case, each CPU will have 1M/64 = 15625
>> entries. In order to reduce of possibility of ENOMEM error, the right
>> way is to increase the value of max_entries instead of decreasing it.
>>> map updates to start failing at a lower threshold. I believe that this
>>> is a problem with maps using the `BPF_F_NO_COMMON_LRU` flag, my
>>> reasoning being that when map updates fail, it occurs consistently for
>>> specific CPUs.
>> Does the specific CPU always fail afterwards, or does it fail
>> periodically ? Is the machine running the bpf program an arm64 host or
>> an x86-64 host (namely uname -a) ? I suspect that the problem may be due
>> to htab_lock_bucket() which may fail under arm64 host in v5.15.
>>
>> Could you please check and account the ratio of times when
>> htab_lru_map_delete_node() returns 0 ? If the ratio high, it probably
>> means that there may be too many overwrites of entries between different
>> CPUs (e.g., CPU 0 updates key=X, then CPU 1 updates the same key again).
>>> At this time, all machines experiencing the problem are running kernel
>>> version 5.15, however I'm not currently able to try out any newer
>>> kernels to confirm whether or not the same problem occurs there. Any
>>> ideas on what could be responsible for this would be greatly
>>> appreciated!
>>>
>>> Thanks,
>>> Chase Hiltz
>>>
>>> .
>


