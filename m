Return-Path: <xdp-newbies+bounces-169-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A8A10F8B
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jan 2025 19:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8158188A615
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jan 2025 18:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83771FC10E;
	Tue, 14 Jan 2025 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dQM4xdFs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c50mFxai"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9E1F9ABE
	for <xdp-newbies@vger.kernel.org>; Tue, 14 Jan 2025 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878048; cv=none; b=G3zg66w836DL3vAs0hctmsqPE2+kOnx2SR61foyv3ZAGDxQIx58A5JR1+eA00d63+v7qJpSDV/ILibsz1lqjVR2FqvAsx4St4R7dVFpU8mCXvpd+L9x48o7WvgSTFaFpro8mbFhmEDg/pyvGobUIu0C4aynxKY+9R2qKpGDCVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878048; c=relaxed/simple;
	bh=OExveBQWVVQWLJRI4IhFQURzex7zXX5F3/lV/UoVPcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDBABBtcsNvktaTAtlXuxs0lSFdlCJ2/7CDzJ40sgppydXa2wm5KxqSJ9aBOH9XvdLQa87IabcU3n1Y3xvQoth6ndrL3Xnb3vflAvM0nk+9Au5tZHvcv18CbRitZ41rKSgIL585cTof8w+jrew0M6t+cv++l8IpcA+IacA/ovw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dQM4xdFs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c50mFxai; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <3c4192e4-0305-40f3-93ce-e2250d658c93@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736878045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nqde8rs2PbY1pWAsVZJlqMgrbngAGhREEUdv9mHkpFE=;
	b=dQM4xdFsL77kQ09tLUOc5/A5iPZvC6knkJ2igwl5egi/cqOUezEA/uvwihjQpU0nBQGrAb
	kBcLVciL9HPaS9FhXzpI4UYXq5d5CPyRJK1xJsbAScFkPTlD5yKw1yVYVHyYXSoUTKSmbE
	iTMQ+lCGHH8obPnM1AHHum5HOP/qVmq27u7X06iH6MGGLzZ7vc6RdGwzwJuqSdVo3db9ob
	qy1AwaK1ojzyHOKL8kTY4o0/aHS0LQvPO8Z7o0Sboo2EfD0tOUQJXa9TcpC/1d34YuWQVo
	xrTdtEXRt5mi6/VdUOpUdKp6C67Y9FSVfKvhbjVdNMmkEX9Bsv7mNIZlUVsBuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736878045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nqde8rs2PbY1pWAsVZJlqMgrbngAGhREEUdv9mHkpFE=;
	b=c50mFxaiTXZIgkcEPHfY1PC8udg7i4LJnCDJL0yZIOynfjgBevwkebqjd9hB4/v2FDpBUJ
	tq07JXhJIVl1P1Dw==
Date: Tue, 14 Jan 2025 19:07:18 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [xdp-hints] Re: XDP Redirect and TX Metadata
To: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 xdp-hints@xdp-project.net, xdp-newbies@vger.kernel.org
Cc: hawk@kernel.org, sdf@google.com
References: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
 <87v86tg5qp.fsf@toke.dk> <b3112980-1e58-4615-9a1e-9d8a01d364cc@linutronix.de>
 <a8f8d8af-0573-49dc-9ddb-1eadb8c31b7b@hetzner-cloud.de>
Content-Language: en-US
From: Florian Kauer <florian.kauer@linutronix.de>
In-Reply-To: <a8f8d8af-0573-49dc-9ddb-1eadb8c31b7b@hetzner-cloud.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Marcus,

On 1/14/25 17:47, Marcus Wichelmann wrote:
> Am 12.02.24 um 15:35 schrieb Florian Kauer:
>> On 12.02.24 14:41, Toke Høiland-Jørgensen wrote:
>>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>>
>>>> 2. For the RX side, the metadata is documented as "XDP RX Metadata"
>>>> (https://docs.kernel.org/networking/xdp-rx-metadata.html), while for
>>>> TX it is "AF_XDP TX Metadata"
>>>> (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
>>>> That seems to imply that TX metadata only works for AF_XDP, but not
>>>> for direct redirection. Is there a reason for that?
>>>
>>> Well, IIRC, AF_XDP was the most pressing use case, and no one has gotten
>>> around to extending this to the regular XDP forwarding path yet.
>>
>> Ok, that is fine. I had the fear that there is some fundamental problem
>> that prevents to implement this.
> 
> Hi,
> are there any updates on this? I'm currently looking into this as well.

I am still interested, but have no implementation planned short- or mid-term.
So, looking forward to your implementation :-)

Greetings,
Florian

> 
> I'd like to have a way to enable the TX checksum offload when redirecting from
> one device to another.
> Stanislav Fomichev already implemented [1] the TX offload support for the AF_XDP
> use case (thanks for that), but for now, this cannot be used for "regular"
> redirects.
> 
> I'm currently in a position where I can invest some work into this, but figured
> it would make sense to ask you first:
> 
> Do you already have concrete plans or ideas in mind, how the API to trigger the
> TX offloads should look like?
> I have seen the talk [2] from Jesper about this, but I'm not sure if the
> proposals in there are still up to date.
> 
> I think it could be possible to introduce a program flag, just like
> `BPF_F_XDP_HAS_FRAGS`, and if this flag is set, interpret a part of the
> metadata area as a `struct xsk_tx_metadata`. Then, the code to apply the
> offloads from that struct when xmit-ing the frame could be reused, as it
> is already implemented in `mlx5e_xmit_xdp_frame` for example.
> But the "xsk" in the struct name may be a bit confusing. :/
> 
> Do you think this could work or could you guide me into a direction that may
> have a chance to be upstreamable? Also, is there any recent work on this that
> I should know off?
> 
> Thanks!
> 
> Marcus Wichelmann
> Hetzner Cloud GmbH
> 
> [1] https://lore.kernel.org/bpf/20231127190319.1190813-3-sdf@google.com/
> [2] https://lpc.events/event/16/contributions/1362/attachments/1056/2017/xdp-hints-lpc2022.pdf
> 


