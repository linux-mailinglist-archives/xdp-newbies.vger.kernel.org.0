Return-Path: <xdp-newbies+bounces-59-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612487FD36
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Mar 2024 12:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42773283CD8
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Mar 2024 11:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664A57F477;
	Tue, 19 Mar 2024 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EzLvvL7U"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208827EF1F
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Mar 2024 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710849462; cv=none; b=S1RiFVwpkCe0UzJSOalkMe6QJhbicF9Pah5vm75JqZiTPi5uMTBYHzEkDb7wY0+6LCZLqEmmSyp+Y7O2ccsoaq2sUgPUp9JV0RMCO0H3YfY6AlV6KxkFG7o686pEQrTrbWt9raSx2/dAYg1LitcO7CCxTtY/2O63bfOstJGJ6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710849462; c=relaxed/simple;
	bh=f7rvMm3DMEIJJLMZCdGkMN5BoWjNE87qZlGhjHltDuU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BWhFFpBo4MplXUWBiyLETVngG30tiEGF6kqGU5IHzhIx8EOHHnHSlkpPgD7wSJ4LLodDRhwDJzsi7Yz04goZlImjdLVdb/azShG6bzF1qCOrYFwpkcEWgM9iKD/8u6NmWEjnkuPVh6L7xiKylGSW7Jmxub/QOSvRwNMEgQg+Dsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EzLvvL7U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710849459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fz9wwqkdgeSswEVHD7WTIs499q5bDur5ph2OMoZ4qEs=;
	b=EzLvvL7U0KICyAaEVMO/HD6TFX9lvO9TvknOkpipa2uVI4jS//hyZmYGVDU82JgYUTIfWM
	TMJaqjsAj69gs7HM7eICeR50yl7fwYNdkbuU1ERxys4iAvQyYbW/B/NMeUrr2LpbCS6PRy
	br3QAbcprQWDRwcCERrmiXFoIKx8yDg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-MgIYWmJ2OiKujiO2zH0uSw-1; Tue, 19 Mar 2024 07:57:37 -0400
X-MC-Unique: MgIYWmJ2OiKujiO2zH0uSw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e435a606aso29747785e9.3
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Mar 2024 04:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710849456; x=1711454256;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fz9wwqkdgeSswEVHD7WTIs499q5bDur5ph2OMoZ4qEs=;
        b=UPLpYoUv9+8h2bh4w2Oi7GAWBMgVZxMzFKK7SmNDe6qPsCeZz42vreidBYGncTWenv
         7wJ2HEBSreMvkX65rsTRb2p7nM0wejI2rxN4UKvWYaUdUi3smWVxCmf+DGArshHO2Kc8
         aMw7k4nXkGu+3duDPIbFNEjkAyOMmO4k4q0v5Qc0rU11Oqy6+tt6NZt4zlxsU8OzYawp
         2U89rbxJpzYVMkYuRWbofVSWyApSF5kBqwXAxr8noKdkNFyP1nE5Rh6AHWAPMypvDCdO
         GhbGbESf4Fez+D1Redaw2tgOEVzNdyDcfifQGWxNRsKvygCoMZyWBKqXEm52DAtT8FeG
         MDvQ==
X-Gm-Message-State: AOJu0YzgRJztKobl0wfVb0nk1sQPgnXoQs+7LoKRglC6eIGmJjcGq4yW
	4fan4+v7MTfhCpSXhpzR6yEph7blrfYF2ju3AFquqZqUawKesa5KnN1WPhly3RR0vKyWbs+8SkR
	EGJaJwAKVkkmmgICU8iKof6L2P5dBwCTSDRFSju2YU+9t5xXOxurRVuBJcVea
X-Received: by 2002:a05:600c:4ed1:b0:413:f7a2:55e0 with SMTP id g17-20020a05600c4ed100b00413f7a255e0mr1729050wmq.30.1710849456488;
        Tue, 19 Mar 2024 04:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi16PPvw8ZRT1ACQ2EmNwdBWAUOIQT8EZpPrgqAyhG4v6tUroKtTxoNKBzdmcJio/4GqQ5bA==
X-Received: by 2002:a05:600c:4ed1:b0:413:f7a2:55e0 with SMTP id g17-20020a05600c4ed100b00413f7a255e0mr1729037wmq.30.1710849456042;
        Tue, 19 Mar 2024 04:57:36 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b00414618bea7csm3135368wmq.37.2024.03.19.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 04:57:35 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 7326811A1242; Tue, 19 Mar 2024 12:57:34 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Magnus Karlsson <magnus.karlsson@gmail.com>, Christian Deacon
 <christian.m.deacon@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
In-Reply-To: <CAJ8uoz25bTNDXsDDd1J5zKcoTAtEpAf35WTkFBZi6hyMJvRsRA@mail.gmail.com>
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
 <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
 <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com>
 <CAJ8uoz30xYV7dG1r30wNx+M-5uoDytNtVCOU+avTaVWBJ-57yw@mail.gmail.com>
 <CAAAYKZM35fLYfibDmq9WB5W5ht2N05prd_N2-ABY07+tWbKMcA@mail.gmail.com>
 <CAJ8uoz3aLQR65GhuO5JSVr=BAB7eJ3R06Cx5mO-bU1upyDt+Cw@mail.gmail.com>
 <CAAAYKZOwckVv+xHmXTg8QpfbRGy=ysy0NTJZb77ij-6ZPCVQMw@mail.gmail.com>
 <CAJ8uoz065BceDsz+DEGVZvKWs2AeAPaB0dKgaX8SsQ36rVN2wg@mail.gmail.com>
 <CAAAYKZPbvTwEzTH0_gPg_jsgUKz8EhDK_whd1AvA0nBRyAgGcg@mail.gmail.com>
 <CAJ8uoz0kBtkQYe0SL_zbAg_7Eo+zZTomshgPcEyJYFvY2S1cvg@mail.gmail.com>
 <CAAAYKZMh9_kifHgcVDZ9-2Ofg=aA_GR7B9bz=D+71qYEviviYQ@mail.gmail.com>
 <CAJ8uoz2JvwUp54mUAKdvHtP8FsxZ2Zw0e8FxwNFMPRwQ8P=oxQ@mail.gmail.com>
 <CAAAYKZP808XtUNOwRs4x0K8jfSMUfEoASoSzeSzbfAV_sHeQLQ@mail.gmail.com>
 <CAJ8uoz2S5qkbD6odkV=Y8EHijsn5jyU01-6a8pv19eFE3=o1uA@mail.gmail.com>
 <CAAAYKZPeCFbyTadsVJEUUv=HTHN8pnMOwF_i3NfCv-py1FtYDg@mail.gmail.com>
 <87zfx14gqg.fsf@toke.dk>
 <CAD0p+fUM5DcG44cxYXU3fMd9PgTjhTaMCH_oy=4iejJ41zxHpA@mail.gmail.com>
 <CAD0p+fUp9SGOwCNMB676inLTOAETdo2vki02dx7=gc_MmCKATA@mail.gmail.com>
 <CAJ8uoz25bTNDXsDDd1J5zKcoTAtEpAf35WTkFBZi6hyMJvRsRA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 19 Mar 2024 12:57:34 +0100
Message-ID: <87a5muzb69.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Magnus Karlsson <magnus.karlsson@gmail.com> writes:

> On Mon, 18 Mar 2024 at 19:41, Christian Deacon
> <christian.m.deacon@gmail.com> wrote:
>>
>> Resending the following email to the XDP Newbies mailing list since it
>> was rejected due to HTML contents (I've switched email clients and
>> forgot to disable HTML, I apologize).
>>
>> Hey everyone,
>>
>> I was wondering if there was an update to this. I'm currently running
>> into the same issue with a similar setup.
>>
>> When running the XDP program on a bonding device via native mode,
>> packets redirected to the AF_XDP sockets with `bpf_redirect_map()`
>> inside the XDP program do not make it to the AF_XDP sockets. Switching
>> between zero copy and copy mode does not make a difference along with
>> setting the need wakeup flag.
>>
>> I've tried the latest mainline kernel `6.8.1-060801`, but that did not
>> make a difference. If the XDP program is attached with SKB mode,
>> packets do show up on the AF_XDP sockets as mentioned in this thread
>> already.
>>
>> While I haven't confirmed it on my side, I'm assuming the
>> `xsk_rcv_check()` function is the issue here. I'm unsure if skipping
>> this check for the time being would work for my needs, but I'm hoping
>> a better solution will be implemented to the mainline kernel.
>>
>> I also saw there was another similar issue on this mailing list with
>> the title "Switching packets between queues in XDP program". However,
>> judging from the last reply in that thread, the fix implemented
>> wouldn't help with the bonding driver.
>>
>> Any help is appreciated and thank you for your time!
>
> You are correct in that the fix above does not address the bonding
> case and that the problem is indeed that XDP reports the device as the
> real NIC and that the AF_XDP socket is bound to the bonding device.
> Therefore xdp->dev != xsk->dev (in principle, not the actual code) and
> all packets will be discarded. I got as far as sketching on a solution
> but I do not have the bandwidth at the moment to implement it.
> Unfortunately it is not a one-liner or even just one hundred lines of
> code. Let me know what you think, or if someone can come up with an
> easier solution.
>
> *** Suggestion on how to implement AF_XDP for the bond device
>
> Two steps: XDP_DRV mode then zero-copy mode
>
> * XDP_DRV:
>
> For XDP_DRV mode, the problem to overcome is this piece of code
> in xsk_rcv_check():
>
>         struct net_device *dev = xdp->rxq->dev;
>         u32 qid = xdp->rxq->queue_index;
>
>         if (!dev->_rx[qid].pool || xs->umem != dev->_rx[qid].pool->umem)
>                 return -EINVAL;
>
> xs is the socket that was bound to the bonding device e.g., bond0. So
> xs->dev points to bond0. xdp->rxq->dev, on the other hand, comes from
> XDP and the real driver e.g. eth0, thus xs->dev != xdp->rxq->dev. The
> problem here is that only _rx[] of bond0 is populated with the pool
> pointer at bind time, so dev->_rx[qid].pool is NULL as it refers to
> the _rx of eth0 that was never set. The solution here is then to make
> sure that the _rx[] of bond0 is propagated to eth0 (and any other device
> bonded to bond0).
>
> Two new features are needed to support this:
>
> 1) A helper that copies _rx[].pool from one struct to another
> 2) A new xsk_bind netdev event that a driver can subscribe to. Will be called
>    whenever a xsk socket is bound to a device.
>
> In the case the socket is bound to bond0 before eth0 is bonded to
> bond0, only 1) needs to be used in the bonding driver.
>
> In the case the socket is bound to bond0 after bonding of eth0 to
> bond0, the bonding driver need to subscribe to 2) and in the event
> handle call 1).
>
> * ZERO-COPY
>
> 1) Relay through the XDP_SETUP_XSK_POOL command in NDO_BPF to the
>    bonded devices.
>
> 2) Relay through the ndo_xsk_wakeup to the bonded devices.
>
> Standby mode seems straight-forward to support.
>
> How to deal with round-robin mode in the bonding driver? Not possible
> to have multiple bonded devices access the same ring. Would require
> multiple rings and copying to them. Also not clear how to propagate
> the need_wakeup flags of the individual network devices to the one of
> the bond device. I think this kind of functionality is much better
> performed in user-space with a lib. Simpler and faster.

I think this goes for all the things you mentioned above. There is no
way we can make this consistent with the in-kernel bond behaviour, so
it's going to be a pretty leaky abstraction anyway. So I don't think we
should add all this complexity, it's better to handle this in userspace
(and just attach to the component interfaces).

In fact, I think supporting XDP at all on the bond interface was a
mistake; let's not exacerbate it :/

-Toke


