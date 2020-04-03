Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D303419CE0E
	for <lists+xdp-newbies@lfdr.de>; Fri,  3 Apr 2020 03:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389939AbgDCBFv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 2 Apr 2020 21:05:51 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47061 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389857AbgDCBFu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 2 Apr 2020 21:05:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id A17765C0318
        for <xdp-newbies@vger.kernel.org>; Thu,  2 Apr 2020 21:05:49 -0400 (EDT)
Received: from imap38 ([10.202.2.88])
  by compute2.internal (MEProxy); Thu, 02 Apr 2020 21:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jibi.io; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        mesmtp; bh=LN9OuAT37HwSNKL70BpVyrtqP15V734I7bfxMb3qiSk=; b=fhEPG
        rZ/B3K2my/1JdNI6hvFljnr50avvg/F93H9+T4SyHtI3lwEOAehPwtXBsO4oSZg9
        0H6WcHfiO+JcXhDb8hf8j+vuc0BscWdMRJoz0xVVU8lFvM/solV3nth+eDHehcgm
        MBxCKBm9jdji/JZptoW143i2HR9mZ5/PmsY2nE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=LN9OuAT37HwSNKL70BpVyrtqP15V7
        34I7bfxMb3qiSk=; b=tVRQw3bxtFE07oCWvmcCD5/ZHU7IsoGkIid4hKsyYv4zf
        xPQ9jbNHV/QzCgcl6gyKbhqcjjU1tN8o70lMZx0gt9EPtJDkeKkX2NZofpfsUVhi
        F/1P+uA8l87sWig2KUpt1iVFEASaY3b3ZCk/PhxpHSGD55XM5VD9ITH3OvlvmZ3D
        hkJCbmzJpoH0yWHCu85QwPoD4FDnzfKB7uQq2LqsUXlXIwq6eaSA0NfENnY8DslH
        w27uOb40ECvjnKJVMPlWNwsh/Q230JZqRcXVouI7h+9xO0UeSautT1jhejOm5+YC
        IYd6AbwXQdlf68tEf8gsf4lDQ0RHqILahlhUEzruA==
X-ME-Sender: <xms:7YuGXlkPGaE5ftC-jbTkZi7V1VDOCv89W_CmVo3ZGqyYpzQI02KtIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdfiihhlsggvrhhtohcuuegvrhhtihhnfdcuoehmvgesjhhisghi
    rdhioheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesjhhisghirdhioh
X-ME-Proxy: <xmx:7YuGXthcb4ZRDudx68-BTGFtJIl-rU6mDJX6aBAsiQYoKr8-NfrX2A>
    <xmx:7YuGXm9Qp4chGgoy9Sgq5FVuaWRtC1pP8FxK5kpEyvnbgQtqNU-ASA>
    <xmx:7YuGXonWKWUCylaqg_Hwfn5wn8OuYYswX_PKiVryUXtChC0SQI-z8Q>
    <xmx:7YuGXlRrscI1JzDJwcEImxU1lHwBRfNvkvbJiwfjXHU0pkXbvURJqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5DB214C000A4; Thu,  2 Apr 2020 21:05:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1080-gca5de7b-fmstable-20200402v5
Mime-Version: 1.0
Message-Id: <7c11add0-e837-4ce4-9158-249c800d0d2d@www.fastmail.com>
Date:   Fri, 03 Apr 2020 03:05:15 +0200
From:   "Gilberto Bertin" <me@jibi.io>
To:     xdp-newbies@vger.kernel.org
Subject: Running XSK on a tun device
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I am trying to bind an XSK socket to a tun device, so that I can run some
automated tests on an XSK based server I'm working on. A tun device would in
fact allow me to have fine control over what packets I'm sending to and
receiving from the server (as opposed for example to an approach where the
server listens on a regular interface and tests interact with it over sockets).

The XSK logic of the server is largely based on the one presented in the
xdpsock_user sample in samples/bpf in the Linux kernel (the server is using the
XDP_USE_NEED_WAKEUP bind flag).

When I manually interact with it using a pair of veth devices and netcat,
everything works as expected: the server receives and then sends back packets
properly.

The troubles start when I try to bind it to a tun device as I am not able to move
any packet between the device and the server.

I tried then to reproduce the issue with a simplified setup based on the
xdpsock_user sample, and I got the same results (I tested different combination
of options such as driver mode vs skb mode, poll vs non poll mode, need-wakeup
vs no-need-wakeup, all with the same outcome).

By inspecting more closely the behavior of the sample program I found that:

- packets are actually being received in the rx ring, as poll returns 1 each time
  something is written on the fd of the tun device
- the program gets stuck in rx_drop() [1], more precisely in:

	ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
	while (ret != rcvd) {
		if (ret < 0)
			exit_with_error(-ret);
		if (xsk_ring_prod__needs_wakeup(&xsk->umem->fq))
			ret = poll(fds, num_socks, opt_timeout);
		ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
	}

  where xsk_ring_prod__reserve keeps returning 0.

I'm not sure why this is happening as most of the descriptors in the fill ring
should be available (especially since this exact same code works fine for other
devices like veth).

As I'm still getting acquainted with the codebase it's not obvious to me where I
should start looking for to understand what's the underling cause of this issue
so I'd really appreciate some help/pointers on this.

Cheers,
Gilberto

[1] https://github.com/torvalds/linux/blob/8ed47e140867a6e7d56170f325c8d4fdee6d6b66/samples/bpf/xdpsock_user.c#L873-L880
