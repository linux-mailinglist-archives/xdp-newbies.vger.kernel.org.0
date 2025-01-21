Return-Path: <xdp-newbies+bounces-174-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78FA17619
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Jan 2025 04:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58258188AEB1
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Jan 2025 03:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627AF1531F9;
	Tue, 21 Jan 2025 03:04:54 +0000 (UTC)
X-Original-To: xdp-newbies@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92D8831;
	Tue, 21 Jan 2025 03:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737428694; cv=none; b=E6pzVpxF1m7N87KZdKfHUEIhBRBK2XrL6IVpSZh4OneEAcVKrPPSzEcQn/drTynbunbr83LukSzpeOmKuPd+EOmbgLwNpTf0rfdqpvW+I6VIiKDdtTh+QeGmTzXylvvhFFLEUTz6mlBe8CFTUf4egr4UYTiFWTRnZHzxYNwXnoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737428694; c=relaxed/simple;
	bh=HF3FpvUEjDe3QRSMI7BVye3D4xI+rwYvljIzoMprbVo=;
	h=Subject:To:References:From:Cc:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=htoBFQeeOw7c8HChB7vu0aRr/yYNQFU/LHxYsJUkP5AcaWdODNti1bS3yB4XFtAvqLA3tstRo6R1rlUtU8yc9Hf57B4xW75j7eBARQZ9uSlRkLqQuccGquKbV8ql7fpoLvlwc3iP52M2QZFyRttOF9o/9B8eA3SpPR15meJL9JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4YcX9q4FhHz4f3jkc;
	Tue, 21 Jan 2025 11:04:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 056BB1A083B;
	Tue, 21 Jan 2025 11:04:47 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
	by APP3 (Coremail) with SMTP id _Ch0CgBnB8LLDo9nWwUXBg--.50708S2;
	Tue, 21 Jan 2025 11:04:46 +0800 (CST)
Subject: Re: Race Condition between BPF_MAP_UPDATE_ELEM and
 BPF_MAP_LOOKUP_ELEM for BPF_MAP_TYPE_HASH_OF_MAPS?
To: Cody Haas <chaas@riotgames.com>, xdp-newbies@vger.kernel.org
References: <CAH7f-ULFTwKdoH_t2SFc5rWCVYLEg-14d1fBYWH2eekudsnTRg@mail.gmail.com>
From: Hou Tao <houtao@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>
Message-ID: <07a365d8-2e66-2899-4298-b8b158a928fa@huaweicloud.com>
Date: Tue, 21 Jan 2025 11:04:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH7f-ULFTwKdoH_t2SFc5rWCVYLEg-14d1fBYWH2eekudsnTRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:_Ch0CgBnB8LLDo9nWwUXBg--.50708S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1xXFy7Aryxtr4rZFWUArb_yoWkuwc_uF
	WkAFyvkwn0vryaqan0va1jgrZrJ3ykC3W7trWUG347GrykGrWDWrs29rnxWF4xJFy5Awn8
	Cr1DWay09rWfujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/

Hi,

+cc bpf list

On 1/16/2025 4:51 AM, Cody Haas wrote:
> Hey everyone,
>
> I've got a question. I've got an eBPF map that's a
> BPF_MAP_TYPE_HASH_OF_MAPS where user space updates elements in the
> map, user space will create a new inner map to do map-in-map swapping
> in order to update the outer map's values.  My XDP program will then
> read the inner maps by using BPF_MAP_LOOKUP_ELEM on the outer map.
> Does this create a potential race condition between
> BPF_MAP_LOOKUP_ELEM and BPF_MAP_UPDATE_ELEM when one thread is trying
> to lookup an existing element while another thread is trying to update
> the same existing element? I'm expecting to see either the old value
> or the new value, however I'm occasionally seeing the element does not
> exist when looking up the element from the eBPF program. Is this
> expected?

For now, it is expected. The reason is that the update of hash map is
not atomic and it is possible the lookup procedure may return ENOENT if
there is concurrent update operation on the same key. However, it seems
the atomic update for hash of maps is feasible (e.g., implement
spin-lock support for hash of maps). I will check it later.
>
> Thanks,
>
> Cody Haas
>
> .


