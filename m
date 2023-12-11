Return-Path: <xdp-newbies+bounces-14-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1280C66C
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 Dec 2023 11:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BF3281780
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 Dec 2023 10:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A343124B32;
	Mon, 11 Dec 2023 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmgluGcD"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F06C3
	for <xdp-newbies@vger.kernel.org>; Mon, 11 Dec 2023 02:26:21 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dbc8c4e21c0so110365276.1
        for <xdp-newbies@vger.kernel.org>; Mon, 11 Dec 2023 02:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702290381; x=1702895181; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkLheJhuCONI6lYQKw2OOTWvz1jLmgdkBuYViQYMclE=;
        b=hmgluGcDn+jd9b3NBgWiadAuMq+gZG455+KzgiGqPOc8KTdeyw/KKRiTRXnD6TkL75
         2M9MqRYWYYJGkYkPM7g4AsixuVX7gkACJlwFYotol00juLww6ntmhdoKhl5g9WXBfNBo
         sbR23fHpymymfhkuJ5knjMRTXBnuhrNStCg2j/YhDASHpsGH/J6PczLX7HVKExFHqwjd
         x/h23DBffxNSopq1yi6TTzrhpbp7vmAclGIEJcQh+topzq+Z0XdJtdKdr8WD2tdyRE0X
         nJpjIQCqXjxeiWQP+QXcKfiQ8LkgKFL/o0+atK4jY6OVGwVQOhwzSfZ4+LzxPCM+Gl/M
         proQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290381; x=1702895181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkLheJhuCONI6lYQKw2OOTWvz1jLmgdkBuYViQYMclE=;
        b=AFzMdmMltmirlsTmNjWRC1i0/LQrSmjzwT4XRjkvW+fo/7q+ko8l9PlaamUkBffZuW
         QAXfL9p8X5rz25JX4UIpHM9c23NoLDWzz/6NNzl1aAPDgplAeqOqcxF13PzOh+CHkAzE
         qyEgbwLYXZfWtsprfSUxku7lgu+fTorjPrNC0rlUXu3YH7j51rT32tyKUjmQ9qVgNFaQ
         2ogh6wnUCwOajjFaHrHt3zP9ppy3ONkFTshWWlvNIxQYi75UHmIplB3OACLvjb7U8769
         nsODZOcnbGzHA4Nj/wo2fCJmuLHWg4M6ZKOiCOKTXe66EiMcz77AT5zv+VZFl42FiUqd
         EaBg==
X-Gm-Message-State: AOJu0YzCBI3rW9zYqhux/s2TbAdBDescJ79ujBT7t3fMDPi5hrvawzPI
	/Nj6iZjD9JAhhrq5HUKh8XKt2oy53IPkrkFR4B5NO2as5o0=
X-Google-Smtp-Source: AGHT+IFN3jMqBgFz46+/+UgjayduiCngiIca3zmC4fmwg/ynlT2fZT/YchBzB+DxX13nsJqSHHeM5V8h8sdmsIeiTeo=
X-Received: by 2002:a25:8d82:0:b0:daf:f5c4:ca73 with SMTP id
 o2-20020a258d82000000b00daff5c4ca73mr3251553ybl.0.1702290380658; Mon, 11 Dec
 2023 02:26:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOafi9EZ8L150jw_pC_DZj4_VO6r-BxCMDZzsC_X-V06o73org@mail.gmail.com>
In-Reply-To: <CAOafi9EZ8L150jw_pC_DZj4_VO6r-BxCMDZzsC_X-V06o73org@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 11 Dec 2023 11:26:09 +0100
Message-ID: <CAJ8uoz1fLNLS7Lyt3o6f+0+L5Yh1QEha-buji2sRVGNE_LzNCg@mail.gmail.com>
Subject: Re: XSK tx on loopback drops packets.
To: Joshua Coutinho <souichirosano@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 16:42, Joshua Coutinho <souichirosano@gmail.com> wrote:
>
> Hi All,
>
> I'm trying to transmit udp packets via an xsk socket. (XDP receives
> work just fine). The xdp program is irrelevant/unused, I'm trying to
> simply leverage the xsk socket write.
>
> (Kernel: Linux fedora 6.5.12-300.fc39.x86_64)
> (OS: "Fedora Linux 39 (Workstation Edition)"
>
> I want a minimal working example of sending packets via an XSK socket
> over loopback in user space land. I want to be able to fill in the
> required memory regions and trigger the kernel to send the packet and
> capture the sent packets on the other side with 'nc -lu 127.0.0.1
> <port>'  This seems to happen partly successfully but on the ingress
> part of the loopback it is dropped somewhere after reaching the kernel
> function ip_rcv and then nf_hook_slow. Specifically, I simply want to
> write a packet into a UMEM region, fill in the TX descriptor and then
> submit that descriptor like so.
>
>         u32 txIdx = -1;
>         const u32 txSlotsRecvd = xsk_ring_prod__reserve(&qs.txQ, 1, &txIdx);
>         u32 addr = umem.txState.nextSlot();
>
>         xdp_desc* txDescr = xsk_ring_prod__tx_desc(&qs.txQ, txIdx);
>         txDescr->addr = addr;
>         txDescr->len = sizeof(OrderFrame);
>         txDescr->options = 0;
>
>         u8* outputBuf = umem.buffer + addr;
>
>         TimeNs submitTime = currentTimeNs();
>         OrderFrame& frame = *reinterpret_cast<OrderFrame *>(outputBuf);
>
>         std::array<u8, ETH_ALEN> sourceMac = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
>         std::array<u8, ETH_ALEN> destMac = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
>         std::copy(sourceMac.begin(), sourceMac.end(), frame.eth.h_source);
>         std::copy(destMac.begin(), destMac.end(), frame.eth.h_dest);
>
>         frame.eth.h_proto = htons(ETH_P_IP);
>         frame.ip.ihl = 5;
>         frame.ip.version = 4;
>         frame.ip.tos = 0;
>         frame.ip.tot_len = htons(sizeof(OrderFrame) - sizeof(ethhdr));
>         frame.ip.id = orderId;
>
>         frame.ip.frag_off = 0x0;
>         frame.ip.ttl = static_cast<u8>(255);
>         frame.ip.protocol = 17;
>         frame.ip.check = 0;
>         constexpr u8 sourceIPBytes[4] = {127, 0, 0, 1};
>         constexpr u8 destIPBytes[4] = {127, 0, 0, 1};
>         const u32 sourceIP = *reinterpret_cast<const u32*>(sourceIPBytes);
>         const u32 destIP = *reinterpret_cast<const u32*>(destIPBytes);
>         frame.ip.saddr = sourceIP;
>         frame.ip.daddr = destIP;
>         const u8* dataptr = reinterpret_cast<u8 *>(&frame.ip);
>         const u16 kernelcsum = ip_fast_csum(dataptr, frame.ip.ihl);
>         frame.ip.check = kernelcsum;
>         constexpr int udpPacketSz = sizeof(OrderFrame) -
> sizeof(ethhdr) - sizeof(iphdr);
>         frame.udp.len = htons(udpPacketSz);
>         frame.udp.check = 0;
>         frame.udp.dest = htons(OE_PORT);
>         frame.udp.source = htons(1234);
>         ... // application packet logic
>         frame.udp.check = 0;
>
>         xsk_ring_prod__submit(&qs.txQ, 1);
>         if (xsk_ring_prod__needs_wakeup(&qs.txQ)) {
>             assert((socket.cfg.bind_flags & XDP_COPY) != 0);
>             const ssize_t ret = sendto(socket.xskFD, nullptr, 0,
> MSG_DONTWAIT, nullptr, 0);
>         }
>
> This is a relevant stacktrace from the kernel indicating the path of
> my packet after the above sendto is called.
>
>          __netif_receive_skb_one_core+0x3c/0xa0
>          process_backlog+0x85/0x120
>          __napi_poll+0x28/0x1b0
>          net_rx_action+0x2a4/0x380
>          __do_softirq+0xd1/0x2c8
>          do_softirq.part.0+0x3d/0x60
>          __local_bh_enable_ip+0x68/0x70
>          __dev_direct_xmit+0x152/0x210
>          __xsk_generic_xmit+0x3e4/0x710
>          xsk_sendmsg+0x12f/0x1f0
>          __sys_sendto+0x1d6/0x1e0
>          __x64_sys_sendto+0x24/0x30
>          do_syscall_64+0x5d/0x90
>          entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>
> My socket is bound to localhost using xdpgeneric. I see the
> transmitted packets in tcpdump and via bpftrace I see that ip_rcv is
> invoked for the packets. nf_hook_slow is also invoked with 1 active
> prerouting hook. On kfree_skb I see the reason for the drop is 'reason
> not specified'. Examining the packet in tcpdump I see no errors with
> the checksums or packet lengths and ports. Listeners for the
> corresponding udp ports never receieve the packets.This is how I
> create my socket
>
>         cfg.rx_size = XSKQueues::NUM_READ_DESC;
>         cfg.tx_size = XSKQueues::NUM_WRITE_DESC;
>         cfg.libxdp_flags = XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD;
>         cfg.xdp_flags = XDP_FLAGS_SKB_MODE;
>         cfg.bind_flags = XDP_USE_NEED_WAKEUP | XDP_COPY;
>
>         if (xsk_socket__create(&socket, iface.c_str(), QUEUE, umem.umem,
>                                &qs.rxQ, &qs.txQ, &cfg)) {
>             perror("XSK: ");
>             exit(EXIT_FAILURE);
>         }
>
> What could be the issue?

It is the right forum. Sorry, just forgot to answer your mail.

What happens if you instead of opening an AF_INET socket, open an
AF_PACKET socket (or an AF_XDP socket for that matter) at the
receiving end? Do you get the packet? If so, might it just be that
your packet is wrong and it is being discarded by the stack? Use
tcpdump or wireshark at the receiving end and see what it says. That
is if you get a packet out of the AF_PACKET socket.

