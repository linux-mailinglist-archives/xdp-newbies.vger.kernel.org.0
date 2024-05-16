Return-Path: <xdp-newbies+bounces-67-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5A8C7541
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 May 2024 13:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CD96B20EDC
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 May 2024 11:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394B31459F6;
	Thu, 16 May 2024 11:29:23 +0000 (UTC)
X-Original-To: xdp-newbies@vger.kernel.org
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D61459E5;
	Thu, 16 May 2024 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858963; cv=none; b=PQd55JxrqJZbR0h7jwt4I24L1c2KJ0mvWZM9R0dMMONBUZINRifijFIoCifH+0LozAIxMz6KDNiDJlYGZP9hJM0EEDYkfht3CylrA6XMrIwiLqhPpFbwNYuCG+JFUQ2p0WBcd+janr8/CjkpnLiu3pOJ+n7YeYt7t6Vg4/9WuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858963; c=relaxed/simple;
	bh=aq6ITJh/YOvmeVso4+d1enkSB3/DKdAKgMUJRNUj5zc=;
	h=Subject:To:References:From:Cc:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ja3MExHNGc/FZeuP7935EGRgflkah6Ay4vcVVRH/lAwT4RwmI12yihY7YDuuD4gBgfo2O2kbz9vyi1jatDpIme9TWoRPCdShXrb3Ta6bS23zwBvdkp5036FFC6wsgMhxDXL2/6UxOCczpvL8EpMquX+zmf7JS1oBsf4UOyRlubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Vg7CQ54Xpz4f3nJf;
	Thu, 16 May 2024 19:29:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id E66971A016E;
	Thu, 16 May 2024 19:29:16 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
	by APP2 (Coremail) with SMTP id Syh0CgAnjgEJ7kVmMaWGNA--.21693S2;
	Thu, 16 May 2024 19:29:16 +0800 (CST)
Subject: Re: bpf_map_update_elem returns -ENOMEM
To: Chase Hiltz <chase@path.net>, xdp-newbies@vger.kernel.org
References: <CAOAiysedBwajcFQwuPrtn5bbdk_5zrNq=oY91j5mWyKdc+06uw@mail.gmail.com>
From: Hou Tao <houtao@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>
Message-ID: <e697a0b2-7197-9a33-2efe-e11278b8835d@huaweicloud.com>
Date: Thu, 16 May 2024 19:29:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAOAiysedBwajcFQwuPrtn5bbdk_5zrNq=oY91j5mWyKdc+06uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:Syh0CgAnjgEJ7kVmMaWGNA--.21693S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFyrtw45WF43WrW8JFy3twb_yoW5GrWkpF
	Z5KFyYgw1kXF1aq39ay348WrZYyws0qa9xX3Z8KrWkArZ8Wr92qFyfWF4YkFnxAr4DWF10
	qay2qFn8Ja98ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/

Hi,

+cc bpf list

On 5/6/2024 11:19 PM, Chase Hiltz wrote:
> Hi,
>
> I'm writing regarding a rather bizarre scenario that I'm hoping
> someone could provide insight on. I have a map defined as follows:
> ```
> struct {
>     __uint(type, BPF_MAP_TYPE_LRU_HASH);
>     __uint(max_entries, 1000000);
>     __type(key, struct my_map_key);
>     __type(value, struct my_map_val);
>     __uint(map_flags, BPF_F_NO_COMMON_LRU);
>     __uint(pinning, LIBBPF_PIN_BY_NAME);
> } my_map SEC(".maps");
> ```
> I have several fentry/fexit programs that need to perform updates in
> this map. After a certain number of map entries has been reached,
> calls to bpf_map_update_elem start returning `-ENOMEM`. As one
> example, I'm observing a program deployment where we have 816032
> entries on a 64 CPU machine, and a certain portion of updates are
> failing. I'm puzzled as to why this is occurring given that:
> - The 1M entries should be preallocated upon map creation (since I'm
> not using `BPF_F_NO_PREALLOC`)
> - The host machine has over 120G of unused memory available at any given time
>
> I've previously reduced max_entries by 25% under the assumption that
> this would prevent the problem from occurring, but this only caused

For LRU map with BPF_F_NO_PREALLOC, the number of entries is distributed
evenly between all CPUs. For your case, each CPU will have 1M/64 = 15625
entries. In order to reduce of possibility of ENOMEM error, the right
way is to increase the value of max_entries instead of decreasing it.
> map updates to start failing at a lower threshold. I believe that this
> is a problem with maps using the `BPF_F_NO_COMMON_LRU` flag, my
> reasoning being that when map updates fail, it occurs consistently for
> specific CPUs.

Does the specific CPU always fail afterwards, or does it fail
periodically ? Is the machine running the bpf program an arm64 host or
an x86-64 host (namely uname -a) ? I suspect that the problem may be due
to htab_lock_bucket() which may fail under arm64 host in v5.15.

Could you please check and account the ratio of times when
htab_lru_map_delete_node() returns 0 ? If the ratio high, it probably
means that there may be too many overwrites of entries between different
CPUs (e.g., CPU 0 updates key=X, then CPU 1 updates the same key again).
> At this time, all machines experiencing the problem are running kernel
> version 5.15, however I'm not currently able to try out any newer
> kernels to confirm whether or not the same problem occurs there. Any
> ideas on what could be responsible for this would be greatly
> appreciated!
>
> Thanks,
> Chase Hiltz
>
> .


