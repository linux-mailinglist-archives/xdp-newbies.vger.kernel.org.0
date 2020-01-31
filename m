Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B548B14F4FB
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 Jan 2020 23:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgAaWvr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 31 Jan 2020 17:51:47 -0500
Received: from mail-vs1-f41.google.com ([209.85.217.41]:38446 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgAaWvr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 31 Jan 2020 17:51:47 -0500
Received: by mail-vs1-f41.google.com with SMTP id r18so5432490vso.5
        for <xdp-newbies@vger.kernel.org>; Fri, 31 Jan 2020 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=sUtpRp6dIvKBF833nDEEzB7k/dg1H/qxfzj316TbXpI=;
        b=AuzZ6vFW9OEj+vF/jCoumsV9HFmT+f+nTRShUYN2AavWthOrKkt0oHbzLMt2RrrQy5
         epvoNNPhUH16AMrbi1C7SvIm/pG2XupjvEJb4K/LgZcvjmUv8cUJA6CQiaarbf7Ffs5M
         oU6qsNZrj/SZLipdEfDZooHylWXtx38VNbxF+G/59s0okZp6xFquoTzbmIeJyaakPkmG
         f1pQK0VzSmhSCVfgRBy7L+L9PyfVLVhq734GXlEPpKg5a4MUSTW2Cho9DFIJ7LzEJuN8
         kLT6BrAtiFwUixFBdLHA+XIx9fgjjzQMaQBomqS58ks8wXA3IAVjPbEaR2t2TjCxybd3
         jnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=sUtpRp6dIvKBF833nDEEzB7k/dg1H/qxfzj316TbXpI=;
        b=I2I2O1Z0E3oBQBzoJtmruOtLfPfgMyDAC7JU1ygXBv4oEQhuNZahH/fhcp5iL6ZVnR
         lRzDjR9l5BlRqCJro6Oe5uDO0irGH7DtaWuhX5Gc0xP0kYCUPPNrQnBba8QaQ18ddbUj
         EKE0rTJdOB4p/UgY0tCE/KcvCVWxXBr216wfqb2AC2Md276MdDna0MqUR1j6CMc7pWAq
         2BdQXDAnsdzhBSmBvjYEjE6DdMi/w58bzgsREowqWAkAHT9jU7RGFuBfIp5okJqCv/7W
         lcCYGKXaQYjIFDw6Q+7y2rqmJklb4uwwKn4cSrFQz+kXVkncr4eyeGV2ENTlOC56dDBv
         QsEA==
X-Gm-Message-State: APjAAAVi2yMmUFqeIlGot3FjxgDvz5232evLYDyS0Bc/8KHLpG/2PVif
        VkwhsiAQnZsPBOvIP5BPP1kIb+1XR1/dPQRhQBtVfQmCNaI=
X-Google-Smtp-Source: APXvYqzdY3N4wcOILiWlvynSEmv/kwSDYCFsSsdq9tuKaoZCCEZz6y/VIS2gfwUDvIjyt2CAk2MwgjhnZZiqXKL7vnY=
X-Received: by 2002:a67:e3b1:: with SMTP id j17mr8555806vsm.209.1580511106406;
 Fri, 31 Jan 2020 14:51:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMDScm=w_B-tqTaoUCQiYiUEye4WO_sVfAA741XRLzAQEdwxKg@mail.gmail.com>
In-Reply-To: <CAMDScm=w_B-tqTaoUCQiYiUEye4WO_sVfAA741XRLzAQEdwxKg@mail.gmail.com>
From:   Elerion <elerion1000@gmail.com>
Date:   Fri, 31 Jan 2020 14:51:34 -0800
Message-ID: <CAMDScmn-fOiwn7i1VsUFvyK==dv_E2WGKTbN9npL9aMeiv8xXw@mail.gmail.com>
Subject: Re: Packets randomly dropped with virtio-net with xdp loaded in
 native mode
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I'm also getting the same issues with a 6 core baremetal server.

if I load the XDP in native mode, it will drop packets, if it is in
generic mode, it will not drop packets.

However if I only create 1 xsk socket instead of 1 per core, it
doesn't drop packets in native mode. The strange thing is that I get
dropped packets even when I don't send anything to xsk sockets in my
xdp filter.

I try to make xsk sockets with non-shared umem for each cpu core.

for (int queue_number=0; i< get_nprocs_conf(); queue_number++)
      xsks[queue_number] = xsk_configure(NULL, queue_number);

....
xsk_socket__create(&xsk->xsk, opt_if, queue_number, umem->umem, rxr, txr, &cfg);

So if I just do this instead, it doesn't drop any packets in native mode.

xsks[0] = xsk_configure(NULL, 0);
xsk_socket__create(&xsk->xsk, opt_if, 0, umem->umem, rxr, txr, &cfg);


Any tips on how to fix this?
----

5.0.0-37-generic #40~18.04.1-Ubuntu SMP Thu Nov 14 12:06:39 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

01:00.0 Ethernet controller: Intel Corporation 82599 10 Gigabit
Network Connection (rev 01)
        Subsystem: Super Micro Computer Inc 82599 10 Gigabit Network Connection
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at 91300000 (64-bit, prefetchable) [size=512K]
        I/O ports at 4000 [size=32]
        Memory at 91380000 (64-bit, prefetchable) [size=16K]
        Expansion ROM at 91100000 [disabled] [size=512K]
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
        Capabilities: [70] MSI-X: Enable+ Count=64 Masked-
        Capabilities: [a0] Express Endpoint, MSI 00
        Capabilities: [e0] Vital Product Data
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [140] Device Serial Number ac-1f-6b-ff-ff-a5-1a-6b
        Capabilities: [150] Alternative Routing-ID Interpretation (ARI)
        Capabilities: [160] Single Root I/O Virtualization (SR-IOV)
        Kernel driver in use: ixgbe
        Kernel modules: ixgbe

On Fri, Jan 31, 2020 at 1:33 PM Elerion <elerion1000@gmail.com> wrote:
>
> Not sure if this is a known issue or if I'm doing something wrong, but
> when I tried to load an xdp program in native mode, my server starts
> randomly dropping packets while there are no issues with generic mode.
>
> bpf_set_link_xdp_fd(ifindex, fd, XDP_FLAGS_DRV_MODE); // drops packets
> bpf_set_link_xdp_fd(ifindex, fd, XDP_FLAGS_SKB_MODE); // doesn't drop packets
>
> Guest
> 5.0.0-16-generic #17~18.04.1-Ubuntu SMP Mon May 20 14:00:27 UTC 2019
> x86_64 x86_64 x86_64 GNU/Linux
>
> 00:03.0 Ethernet controller: Red Hat, Inc. Virtio network device
>         Subsystem: Red Hat, Inc. Virtio network device
>         Physical Slot: 3
>         Flags: bus master, fast devsel, latency 0, IRQ 10
>         I/O ports at c000 [size=64]
>         Memory at febf1000 (32-bit, non-prefetchable) [size=4K]
>         Memory at fe000000 (64-bit, prefetchable) [size=16K]
>         Capabilities: [98] MSI-X: Enable+ Count=18 Masked-
>         Capabilities: [84] Vendor Specific Information: VirtIO: <unknown>
>         Capabilities: [70] Vendor Specific Information: VirtIO: Notify
>         Capabilities: [60] Vendor Specific Information: VirtIO: DeviceCfg
>         Capabilities: [50] Vendor Specific Information: VirtIO: ISR
>         Capabilities: [40] Vendor Specific Information: VirtIO: CommonCfg
>         Kernel driver in use: virtio-pci
>
> Host
> Unknown. It is a server from vultr.com
