Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F27F814F602
	for <lists+xdp-newbies@lfdr.de>; Sat,  1 Feb 2020 04:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgBADTK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 31 Jan 2020 22:19:10 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44964 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBADTK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 31 Jan 2020 22:19:10 -0500
Received: by mail-ua1-f68.google.com with SMTP id x16so3348038uao.11
        for <xdp-newbies@vger.kernel.org>; Fri, 31 Jan 2020 19:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=H7DW88lGkC5CUfQTLtRAdxFO2vnD6A9UP1ZxQOEoejs=;
        b=vKsHLSSvnnpPhJ9jYbhIi+MYarv511qHNanqL7pyPMHrpea7Z4lvfXzMnk2jqSJ9oJ
         KodsjoaksrLPi42S0yBvk+JxKuHEVsp94MjasblP8dTX8h9277GNttjKDYvyaYq2eO89
         KLUh/bq0Z4aJsD9zv9xwyINswDfB7Y16brInP5Z6MUVEXXM6Ay5hZ+d/8d3X79xmaa2O
         uw9dG5R7NE7DrwYcSjX81uRVJV6aFcp+1Lwr5K2PnDMar7SE7oNh119NkUAnlLD/x8kJ
         MXQE+2no8xh3WXQNBMPGHGw4J+dgBhIaxt2pgQwRZbLrtBYcPVfSTFXjLI9FBwJ6cjmj
         ysDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=H7DW88lGkC5CUfQTLtRAdxFO2vnD6A9UP1ZxQOEoejs=;
        b=jC4NqCORukEmMgbqIggiBtW73xb7b2ycH7GTlbpjQymTFdR/TWA11rhtun76dnmBoj
         jsfUlOFmOtD9kEyvtiib+5ALUyobQjkFaa8ZHJRHpuUlG9dn73/4R7V2zxZ5dY94v4ZF
         ZvXd6awoRNVjuTOOqb78c/GymmEdwTkVdHyKvv+QLbi+1N8koKbxS9349UsP4s4Nid8J
         mY4zgQ1m8006SP+KnVcvyF4pMc+GS9TBa8pBpLQlwzmeV1dCUWtuTHmhGgpujfM8SxCF
         JFbAM01h2j34L37+48rAjpDhXYiaKn6XQQBjOd606EQBx9L3qyzQJHRfYjGP7oarmU1w
         acVw==
X-Gm-Message-State: APjAAAVJmkgOBQRMSl3m2Ao4cLmx1EvUaQfyqx4fmLIncGDZa8TJWH4i
        f4HkNwTCzeHpMHkHu1X31qkgwgVQAIxDoC3aCW53Cv6Ocz4=
X-Google-Smtp-Source: APXvYqwanPyuUN4Y8vFLVcLZYUmcOk5rasxBsBPaX+3ZTLo2ENhj2Ao2W5I3GE7MadfD5Dic1qn2tS/2gFA6Nv8qQmM=
X-Received: by 2002:ab0:26cd:: with SMTP id b13mr8041447uap.44.1580527148683;
 Fri, 31 Jan 2020 19:19:08 -0800 (PST)
MIME-Version: 1.0
References: <CAMDScm=w_B-tqTaoUCQiYiUEye4WO_sVfAA741XRLzAQEdwxKg@mail.gmail.com>
 <CAMDScmn-fOiwn7i1VsUFvyK==dv_E2WGKTbN9npL9aMeiv8xXw@mail.gmail.com>
In-Reply-To: <CAMDScmn-fOiwn7i1VsUFvyK==dv_E2WGKTbN9npL9aMeiv8xXw@mail.gmail.com>
From:   Elerion <elerion1000@gmail.com>
Date:   Fri, 31 Jan 2020 19:18:57 -0800
Message-ID: <CAMDScmntfwY_SJb+zj8kuKv-Pw3CG1HYNBXtO5hy38ycsgspig@mail.gmail.com>
Subject: Re: Packets randomly dropped with virtio-net with xdp loaded in
 native mode
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I figured out how to fix the baremetal server by sending the packet to
ctx->rx_queue_index.

But this change didn't fix the vm using virtio. Maybe because the host
received a packet in a queue that doesn't exist in the guest? That
would explain why only some packets are dropped and not all of them.

The host probably has >8 cores and my vm only has 1.

On Fri, Jan 31, 2020 at 2:51 PM Elerion <elerion1000@gmail.com> wrote:
>
> I'm also getting the same issues with a 6 core baremetal server.
>
> if I load the XDP in native mode, it will drop packets, if it is in
> generic mode, it will not drop packets.
>
> However if I only create 1 xsk socket instead of 1 per core, it
> doesn't drop packets in native mode. The strange thing is that I get
> dropped packets even when I don't send anything to xsk sockets in my
> xdp filter.
>
> I try to make xsk sockets with non-shared umem for each cpu core.
>
> for (int queue_number=0; i< get_nprocs_conf(); queue_number++)
>       xsks[queue_number] = xsk_configure(NULL, queue_number);
>
> ....
> xsk_socket__create(&xsk->xsk, opt_if, queue_number, umem->umem, rxr, txr, &cfg);
>
> So if I just do this instead, it doesn't drop any packets in native mode.
>
> xsks[0] = xsk_configure(NULL, 0);
> xsk_socket__create(&xsk->xsk, opt_if, 0, umem->umem, rxr, txr, &cfg);
>
>
> Any tips on how to fix this?
> ----
>
> 5.0.0-37-generic #40~18.04.1-Ubuntu SMP Thu Nov 14 12:06:39 UTC 2019
> x86_64 x86_64 x86_64 GNU/Linux
>
> 01:00.0 Ethernet controller: Intel Corporation 82599 10 Gigabit
> Network Connection (rev 01)
>         Subsystem: Super Micro Computer Inc 82599 10 Gigabit Network Connection
>         Flags: bus master, fast devsel, latency 0, IRQ 16
>         Memory at 91300000 (64-bit, prefetchable) [size=512K]
>         I/O ports at 4000 [size=32]
>         Memory at 91380000 (64-bit, prefetchable) [size=16K]
>         Expansion ROM at 91100000 [disabled] [size=512K]
>         Capabilities: [40] Power Management version 3
>         Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
>         Capabilities: [70] MSI-X: Enable+ Count=64 Masked-
>         Capabilities: [a0] Express Endpoint, MSI 00
>         Capabilities: [e0] Vital Product Data
>         Capabilities: [100] Advanced Error Reporting
>         Capabilities: [140] Device Serial Number ac-1f-6b-ff-ff-a5-1a-6b
>         Capabilities: [150] Alternative Routing-ID Interpretation (ARI)
>         Capabilities: [160] Single Root I/O Virtualization (SR-IOV)
>         Kernel driver in use: ixgbe
>         Kernel modules: ixgbe
>
> On Fri, Jan 31, 2020 at 1:33 PM Elerion <elerion1000@gmail.com> wrote:
> >
> > Not sure if this is a known issue or if I'm doing something wrong, but
> > when I tried to load an xdp program in native mode, my server starts
> > randomly dropping packets while there are no issues with generic mode.
> >
> > bpf_set_link_xdp_fd(ifindex, fd, XDP_FLAGS_DRV_MODE); // drops packets
> > bpf_set_link_xdp_fd(ifindex, fd, XDP_FLAGS_SKB_MODE); // doesn't drop packets
> >
> > Guest
> > 5.0.0-16-generic #17~18.04.1-Ubuntu SMP Mon May 20 14:00:27 UTC 2019
> > x86_64 x86_64 x86_64 GNU/Linux
> >
> > 00:03.0 Ethernet controller: Red Hat, Inc. Virtio network device
> >         Subsystem: Red Hat, Inc. Virtio network device
> >         Physical Slot: 3
> >         Flags: bus master, fast devsel, latency 0, IRQ 10
> >         I/O ports at c000 [size=64]
> >         Memory at febf1000 (32-bit, non-prefetchable) [size=4K]
> >         Memory at fe000000 (64-bit, prefetchable) [size=16K]
> >         Capabilities: [98] MSI-X: Enable+ Count=18 Masked-
> >         Capabilities: [84] Vendor Specific Information: VirtIO: <unknown>
> >         Capabilities: [70] Vendor Specific Information: VirtIO: Notify
> >         Capabilities: [60] Vendor Specific Information: VirtIO: DeviceCfg
> >         Capabilities: [50] Vendor Specific Information: VirtIO: ISR
> >         Capabilities: [40] Vendor Specific Information: VirtIO: CommonCfg
> >         Kernel driver in use: virtio-pci
> >
> > Host
> > Unknown. It is a server from vultr.com
