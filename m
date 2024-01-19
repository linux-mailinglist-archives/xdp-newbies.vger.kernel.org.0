Return-Path: <xdp-newbies+bounces-35-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94C832A0A
	for <lists+xdp-newbies@lfdr.de>; Fri, 19 Jan 2024 14:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 314A6B21152
	for <lists+xdp-newbies@lfdr.de>; Fri, 19 Jan 2024 13:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED5251C51;
	Fri, 19 Jan 2024 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeIq4xu3"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959654F1ED
	for <xdp-newbies@vger.kernel.org>; Fri, 19 Jan 2024 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669460; cv=none; b=lfywvLcd4s0GYRGAOI8wqCNQSh5QSzL6dA49ZaBKgrbAl1m0LsUpFEzjlWlichGEDM33fMsHJ1TxH0H901vs+cihzta9c2SwFOvbExx4Uqxwj7V9sy/8sDGQlx6KAfkw971M7uw23QuomzE0E/rkF05taoppY4dnupYnNl0tMfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669460; c=relaxed/simple;
	bh=y/5gxKUV6dxPjDUMreTkkSKz8VVMtkrv7eXOPuvIK00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z2fyL+5Fg89pX6Und/o01DC6c8NJQH4OOrrvlXPhVQMcafW/asUe7GclWq2rqXvLrtF4zYYwBGNIZAHzxyiaCE4hBgwodWl0doPQfYY9iyhxUD7DqYA4nxYyCm6D+hHqeNBXOBlyZvr8aPXYoP5K8rFx/0ipkBXj2i536/at6KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeIq4xu3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705669457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdbq94QwYBziPFjRbgYxu+1YlbfnTeicJKCobcLTrJE=;
	b=MeIq4xu3keIjls0rtcAFpX6fTJtkb8T1QLQGeWm6xfoC5gRJ0U+PWJvPjTtG78CttJp/Gr
	CKlYTQjLcjHOYkNicB/70HUIuFoUm58KLSvlCBAzC3nTXdfoemf9PMbRXgv6cCzR0z+z3N
	3wK87IsEDsMBCtbAHWNV1nAm3+rIGeQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-IWhz5MIyOh2qdDimFZPF8A-1; Fri, 19 Jan 2024 08:04:10 -0500
X-MC-Unique: IWhz5MIyOh2qdDimFZPF8A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2c4e9cb449so38261866b.1
        for <xdp-newbies@vger.kernel.org>; Fri, 19 Jan 2024 05:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705669449; x=1706274249;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bdbq94QwYBziPFjRbgYxu+1YlbfnTeicJKCobcLTrJE=;
        b=Q1Gfz/7N0TtUbK4GJbEwCDNiREMSN8M3GdcgXcbx1jfHsmT5jyEMFWTWDGYB7/X2vc
         OgsQT9TjZdLpeEY+BwX4fCHPsV+9Q95RIh9k5mv3G2uizpg7Dbj56KQZiSfmT3Mkwsa2
         Ru0JsbwOS4NfQenV6qDr6luvTr+UzOAxxX0vnWVpwmoRt7gdYKIp4AL0XQLIpsQHOj7f
         76LSeV6CX7BdDsWUlZS32f7VmokxzcpiXQvVPFgIWZEAaQ8PuYPuJdXJlL+nxXAzmFKN
         7aUceXCuRPSdKt8fXN4qFhDkJz8I5VcvBO7GT8KsjtSVxRBkpeeUhEa4SD8JNuStJWpe
         Bigw==
X-Gm-Message-State: AOJu0YwLTq9Uj6ET1gTcLkf/csbr6vpCTmNCEz/eyTuCmgERbcFxjcXY
	h9ra7rJxblgp2gGBSbJDwnj5A1sHY5FWi2rlkJZQ3/i1Dy+SWhF9wgNMUarSbZsYjifblsBRvx+
	BQnDfdJ7NbUnEyNJbtd2HjNQFobC6p5d655TA4r7cs/wzxOPrQTk/e5VdGYo9
X-Received: by 2002:a17:907:c247:b0:a2f:61cd:bdab with SMTP id tj7-20020a170907c24700b00a2f61cdbdabmr324697ejc.12.1705669449757;
        Fri, 19 Jan 2024 05:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkOY/0XK9eWuZBcHnxYL6/z/fkoKpbD/BTk1jKqwThgOzCQC8apubzypiwEggSOOEBUw+1+w==
X-Received: by 2002:a17:907:c247:b0:a2f:61cd:bdab with SMTP id tj7-20020a170907c24700b00a2f61cdbdabmr324683ejc.12.1705669449172;
        Fri, 19 Jan 2024 05:04:09 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090699c800b00a2f1bc99137sm1996139ejn.114.2024.01.19.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:04:08 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id A49541088DB6; Fri, 19 Jan 2024 14:04:07 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Prashant Batra <prbatra.mail@gmail.com>, Magnus Karlsson
 <magnus.karlsson@gmail.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
 xdp-newbies@vger.kernel.org, Maryam Tahhan <mtahhan@redhat.com>, Jesper
 Dangaard Brouer <hawk@kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
In-Reply-To: <CAAAYKZPeCFbyTadsVJEUUv=HTHN8pnMOwF_i3NfCv-py1FtYDg@mail.gmail.com>
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
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 19 Jan 2024 14:04:07 +0100
Message-ID: <87zfx14gqg.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Prashant Batra <prbatra.mail@gmail.com> writes:

> Just to get your expert opinion on this, I am sharing at a very high
> level what my objectives are-
> For Rx handling:
> Demultiplex the packets received on the physical/bond interface based
> on the packet's src + dst combination and direct it to the process
> (Pn) handling that src + dst packets.
>     a) One way of doing this is to pick all packets in userspace in a
> central process (Pc) using AF_XDP socket (ZC with phy device and
> XDP_DRV with bond) and then Pc passes it using shared memory to the
> correct process (Pn) for further handling.
> ens1f0/bond (AF_XDP) -> Pc -> Pn
>     b) The other way is to run a xdp code attached to the phy/bond
> device which based on the src + dst redirects the packets to the veth
> pair (one per process Pn). The packet is then forwarded to the other
> end of the veth-pair over which there is an AF_XDP socket opened.The
> advantage here is that the packet demultiplex happens in the kernel
> and there is no Pc process needed.
> ens1f0/bond (XDP_REDIRECT_IF) ->vethext -> vethint ( AF_XDP) -> Pn

Adding in Jesper, Lorenzo and Maryam, as we've had various discussions
around improving AF_XDP support in containers, which seems to have some
overlap with your use case. Basically, what we have been discussing is
that your (b) approach has many desirable properties, also from a
container management PoV, and we believe it is possible to make it
perform reasonably well on both RX and TX.

It's most likely never going to be completely zero-copy because of the
veth traversal, but we should be able to get it down to a single copy at
least.

However, there is some work to be done before we can realise this
potential; but having more people interested in the use case may help
here :)

> Regarding netkit, I don't see much documentation or samples available
> except the selftest available in the kernel code. If you have or know
> of some samples that might fit in the above requirements that will
> surely help. Does it fit in the above requirement?

Netkit does not support XDP at all, and I doubt it ever will. Rather, it
is meant for optimising the use of BPF in the kernel stack (skb) path,
so it doesn't sound like it's a good fit for your use case if you want
to go directly from XDP to userspace.

-Toke


