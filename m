Return-Path: <xdp-newbies+bounces-37-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A04850EDD
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 09:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7BB1F252CD
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 08:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EE7FC03;
	Mon, 12 Feb 2024 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Aw2epG9J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6Wgzn1Cq"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F471FBF5
	for <xdp-newbies@vger.kernel.org>; Mon, 12 Feb 2024 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707726475; cv=none; b=D/nvBmCKgBP9h4qe8RawJxbMKDk0neArU3So1E/um1DjNU1vYzzsUKl6SBcOwA3yBreSsgiiDUWM+O6CbJQwH18l3zUdzRGGdy71OIQlxoWG6WPsjPqKAdrRRd4azyLOMAokSGSi5ctTj6wHU4OiIkvGcbVv7YwlXflV1HRx/54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707726475; c=relaxed/simple;
	bh=uwmr1sk5poxBaJ8oozM/vqEx4FIMXiYdmzLoS2knDD4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Ci+0dpFHkb98i3ddkP/axgiuuU32ch/kvwb2uPzhWXqGB+UTugtOikKS5WQtOvMLUWOJv3OWBSMeMex92tT4m8byZl3fjLZcUgxDjr5aUo+R566HuKYSq6mQ5hwrngXwyVimfvWEhzT4Zp1hHWXFszKVoQjJzviLZWx0eeKORJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Aw2epG9J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6Wgzn1Cq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1707726464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=6ohdj2kUy1Xbg/Wxqf8gDKrqOO9VbUl9nU/TI9naKeE=;
	b=Aw2epG9JAW1/j5jcrWQT+gpXaT5EPP9lT4cskYWf4FZ4ihowaOP+2Yjsd6h7YSLylRw8Qc
	p6ZK+k6kNvt8pjtp+XyvdXMY93qHIIQ5sjKpZzq5xsrNj+4aMM0g2LxDFwzf65oY1uCYjt
	unqhOkliHK0UdaNx1x3uA5M/IkGCUJkQhZbnV7Ut0Zch++jo4U6l0kdrwGbXPql3UBgXi9
	ZG1K05n7is10mOIUUmrlvpAHRrkDGJPiFMDh4+uS4n0Rz/EVpD/+pdGCYMALPE7k2hB0UW
	TSavmqC8v6O2MICepRqZYtucoE1KrGrPWVPN1Z8YQttOjbeE0/wSXa53cxMt6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1707726464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=6ohdj2kUy1Xbg/Wxqf8gDKrqOO9VbUl9nU/TI9naKeE=;
	b=6Wgzn1CqcXmsRdbOLTkA3jSOfP1ByMfcsujWQXWmUwSAKEWaNwfvsMK+oNkjlG2CuXVP8C
	BlnFm5/jYVYJvUDw==
Date: Mon, 12 Feb 2024 09:27:40 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: xdp-hints@xdp-project.net, xdp-newbies@vger.kernel.org
From: Florian Kauer <florian.kauer@linutronix.de>
Subject: XDP Redirect and TX Metadata
Autocrypt: addr=florian.kauer@linutronix.de; keydata=
 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
 ugsSqUGtSA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
I am currently implementing an eBPF for redirecting from one physical interface to another. So basically loading the following at enp8s0:

SEC("prog")
int xdp_redirect(struct xdp_md *ctx) {
	/* ... */
	return bpf_redirect(3 /* enp5s0 */, 0);
}

I made three observations that I would like to discuss with you:

1. The redirection only works when I ALSO load some eBPF at the egress interface (enp5s0). It can be just

SEC("prog")
int xdp_pass(struct xdp_md *ctx) {
	return XDP_PASS;
}

but there has to be at least something. Otherwise, only xdp_redirect is called, but xdp_devmap_xmit is not.
It seems somewhat reasonable that the interface where the traffic is redirected to also needs to have the
XDP functionality initialized somehow, but it was unexpected at first. It tested it with an i225-IT (igc driver)
and a 82576 (igb driver). So, is this a bug or a feature?

2. For the RX side, the metadata is documented as "XDP RX Metadata" (https://docs.kernel.org/networking/xdp-rx-metadata.html),
while for TX it is "AF_XDP TX Metadata" (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
That seems to imply that TX metadata only works for AF_XDP, but not for direct redirection. Is there a reason for that?

3. At least for the igc, the egress queue is currently selected by using the smp_processor_id.
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igc/igc_main.c?h=v6.8-rc4#n2453)
For our application, I would like to define the queue on a per-packet basis via the eBPF.
This would allow to steer the traffic to the correct queue when using TAPRIO full hardware offload.
Do you see any problem with introducing a new metadata field to define the egress queue?

Thanks,
Florian

