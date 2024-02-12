Return-Path: <xdp-newbies+bounces-38-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A6851613
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 14:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE7D1C23618
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 13:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7358C3A1D9;
	Mon, 12 Feb 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="ylF8F+FO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC53A1B8
	for <xdp-newbies@vger.kernel.org>; Mon, 12 Feb 2024 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.95.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745869; cv=none; b=pdTAACl7uU3whtgca0s1hzxqhtEgozWdBYsE+U+I2i+HjhRDJoi+JqGRk6P9fiPLpqna+x4TuT1bwnPKJ+TAPeSgeQkBWygcAJHcSLbTLTWGcDLz68MkUgqazlk/xGDwHou6H6Fee16+Dnc3EQ3iPBBjVWm4jYf7qM8GD4pFtos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745869; c=relaxed/simple;
	bh=vCkxXs3ZeIc9TLUvqEvNv18RZpWCTrdmj7+uM0JFTyA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UyaYrt+hfcWL9AXJIpYBAfbOKBI7/xO55nz4Xcpk/Rq0Nt0/9wou6OgFtAq6bP0rYZP7KM42IzIX3UQuz/rCzOyHvIbyV3rJ8H1Awd9LViMrKhtC5HbCi4qtGEajaO3a73eIYzBAjOr46xSRtmoHZ7Y7jb7YWLuec1IeuZDxUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk; spf=pass smtp.mailfrom=toke.dk; dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b=ylF8F+FO; arc=none smtp.client-ip=45.145.95.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1707745264; bh=vCkxXs3ZeIc9TLUvqEvNv18RZpWCTrdmj7+uM0JFTyA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=ylF8F+FO+sgvuALQ8pwFI+w04AUUVxq5SoLLm8E/nxl2D/gbhDbWELARj/UlzH1cp
	 pKsLPUqTfMu7gUMe6BqmTW9cJ1lTciT2DOb1I95dQr82vJmoRk8c1intMxsIWXanUw
	 +LswKoiFTku/+DhuUOlkQTKotU3qmnzgbzCxooftGpfJICC3ilWEkdbLyCdL2BDOHY
	 oETeH5gPNSXJQZJ4XZBiUBPr+R90sC4Lc9tpdxyIGM9mMIGSILxUi9siu38ZODo8Vw
	 PCH+zZxMnzYbYAXWDAkJFnp1clQDMhlYLfpKDwohwK3NVUbrytK0eWJNDBrLK93Puq
	 jAMLSxVPOaY6A==
To: Florian Kauer <florian.kauer@linutronix.de>, xdp-hints@xdp-project.net,
 xdp-newbies@vger.kernel.org
Subject: Re: [xdp-hints] XDP Redirect and TX Metadata
In-Reply-To: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
References: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
Date: Mon, 12 Feb 2024 14:41:02 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v86tg5qp.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Florian Kauer <florian.kauer@linutronix.de> writes:

> Hi,
> I am currently implementing an eBPF for redirecting from one physical interface to another. So basically loading the following at enp8s0:
>
> SEC("prog")
> int xdp_redirect(struct xdp_md *ctx) {
> 	/* ... */
> 	return bpf_redirect(3 /* enp5s0 */, 0);
> }
>
> I made three observations that I would like to discuss with you:
>
> 1. The redirection only works when I ALSO load some eBPF at the egress interface (enp5s0). It can be just
>
> SEC("prog")
> int xdp_pass(struct xdp_md *ctx) {
> 	return XDP_PASS;
> }
>
> but there has to be at least something. Otherwise, only xdp_redirect is called, but xdp_devmap_xmit is not.
> It seems somewhat reasonable that the interface where the traffic is redirected to also needs to have the
> XDP functionality initialized somehow, but it was unexpected at first. It tested it with an i225-IT (igc driver)
> and a 82576 (igb driver). So, is this a bug or a feature?

I personally consider it a bug, but all the Intel drivers work this way,
unfortunately. The was some discussion around making the XDP feature
bits read-write, making it possible to enable XDP via ethtool instead of
having to load a dummy XDP program. But no patches have materialised yet.

> 2. For the RX side, the metadata is documented as "XDP RX Metadata"
> (https://docs.kernel.org/networking/xdp-rx-metadata.html), while for
> TX it is "AF_XDP TX Metadata"
> (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
> That seems to imply that TX metadata only works for AF_XDP, but not
> for direct redirection. Is there a reason for that?

Well, IIRC, AF_XDP was the most pressing use case, and no one has gotten
around to extending this to the regular XDP forwarding path yet.

> 3. At least for the igc, the egress queue is currently selected by
> using the smp_processor_id.
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igc/igc_main.c?h=v6.8-rc4#n2453)
> For our application, I would like to define the queue on a per-packet
> basis via the eBPF. This would allow to steer the traffic to the
> correct queue when using TAPRIO full hardware offload. Do you see any
> problem with introducing a new metadata field to define the egress
> queue?

Well, a couple :)

1. We'd have to find agreement across drivers for a numbering scheme to
refer to queues.

2. Selecting queues based on CPU index the way its done now means we
guarantee that the same queue will only be served from one CPU. Which
means we don't have to do any locking, which helps tremendously with
performance. Drivers handle the case where there are more CPUs than
queues a bit differently, but the ones that do generally have a lock
(with associated performance overhead).

As a workaround, you can use a cpumap to steer packets to specific CPUs
and perform the egress redirect inside the cpumap instead of directly on
RX. Requires a bit of knowledge of the hardware configuration, but it
may be enough for what you're trying to do.

-Toke

