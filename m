Return-Path: <xdp-newbies+bounces-13-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDA80C61D
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 Dec 2023 11:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182251F21447
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 Dec 2023 10:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164972230A;
	Mon, 11 Dec 2023 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iya3IZ2p"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F65B6
	for <xdp-newbies@vger.kernel.org>; Mon, 11 Dec 2023 02:12:23 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-466006f9fa5so977849137.3
        for <xdp-newbies@vger.kernel.org>; Mon, 11 Dec 2023 02:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702289543; x=1702894343; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4BUdSP+iv+lI0P3PRCggGghfuGH1IptfxoDp8f2+Fo=;
        b=iya3IZ2p+/zunT66rws26ZD4VlLRME6LGHRaHhemRkId7qgJfwLQU0NIUaW3/NxNyQ
         uciMR0xSaPKb31hPjR1ZunlBO7oNqXPtdsysDMPNK6ML2N0bJN5zWdD+PkDnurU6fFC7
         fpNAv43iZwLFn3k/By1GDp9aH5tFRF27Fh3BFsoM+U1IoP8NlGEXtAEU3f3TKI5fLADT
         mwGI23Z6dwPaAds2atGo/9vvbkj4zJhu0m0hNBAFLGcztbVKgoqyMF5CfHIAYp4wnoZw
         sukpYWK0R818QauPgOh5sYBtfgzK7C8AsMyKbTy53bbTy+WD2M2vIgascqdaH0k5RVce
         zIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289543; x=1702894343;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4BUdSP+iv+lI0P3PRCggGghfuGH1IptfxoDp8f2+Fo=;
        b=t37y6MiVNMGZN4JqwM2t8heL3iz/Uv8i9LoQUh8PeWV1aDC5fh6KVKn0Xr077vxceA
         2BP2kdEXxWvCwzeW0Uc35gda3Q+djid3EmWFsVvhvNznBlNo1/05U6WNyggfBkqysx1A
         P+7Lf6QAkuwPC7CV/Wo9f0eBtt4uX1o2dNsB4ufJZmU7pLVIsHjLpswj/hXjhLTn55Y+
         4EgrE9x11db3Vt71cT4Elx9p7wRmqOxL9qcV4F84Orw5dw6cFevnhRVVsgsQH8SdJs/V
         8zoCC5DQV5522bmS7C/ehEafz7PypFrfV20lXdG+Oq4kDAmbzIp+UItXniTXTBQzqrUj
         fK2g==
X-Gm-Message-State: AOJu0YwLOMbz/3RZJmhpLcjWNvuem43RhkicD6/9NDyim3MxcLy1PdqN
	PcN6kX75SVTMCw9CKZMYGQnG7iZ0FgMQhAFUZ2uvM65G0w==
X-Google-Smtp-Source: AGHT+IHWvoF3QBfdyoq0GdWh3spax8vb2xvLGLePl3bhVfJHQ1xeTzdlOnoaAP3EyWHYIJXoMAHxWDQ08Wi0uywXn0c=
X-Received: by 2002:a05:6102:3a10:b0:464:7a10:6d2f with SMTP id
 b16-20020a0561023a1000b004647a106d2fmr2469683vsu.4.1702289542672; Mon, 11 Dec
 2023 02:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOafi9EZ8L150jw_pC_DZj4_VO6r-BxCMDZzsC_X-V06o73org@mail.gmail.com>
In-Reply-To: <CAOafi9EZ8L150jw_pC_DZj4_VO6r-BxCMDZzsC_X-V06o73org@mail.gmail.com>
From: Joshua Coutinho <souichirosano@gmail.com>
Date: Mon, 11 Dec 2023 10:12:12 +0000
Message-ID: <CAOafi9FEH7dPOVftHx=02O7DNFJNK0mRe_xxwTm2OAZC+bHARQ@mail.gmail.com>
Subject: Re: XSK tx on loopback drops packets.
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please let me know if there is a better forum for this type of
question or if there is someone in particular I should address this
to.
If this is a known issue, I would not mind taking a stab at fixing it
and would appreciate pointers on what needs to be done.

Yours sincerely,
Josh

On Mon, Dec 4, 2023 at 3:41=E2=80=AFPM Joshua Coutinho <souichirosano@gmail=
.com> wrote:
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
>         u32 txIdx =3D -1;
>         const u32 txSlotsRecvd =3D xsk_ring_prod__reserve(&qs.txQ, 1, &tx=
Idx);
>         u32 addr =3D umem.txState.nextSlot();
>
>         xdp_desc* txDescr =3D xsk_ring_prod__tx_desc(&qs.txQ, txIdx);
>         txDescr->addr =3D addr;
>         txDescr->len =3D sizeof(OrderFrame);
>         txDescr->options =3D 0;
>
>         u8* outputBuf =3D umem.buffer + addr;
>
>         TimeNs submitTime =3D currentTimeNs();
>         OrderFrame& frame =3D *reinterpret_cast<OrderFrame *>(outputBuf);
>
>         std::array<u8, ETH_ALEN> sourceMac =3D {0x0, 0x0, 0x0, 0x0, 0x0, =
0x0};
>         std::array<u8, ETH_ALEN> destMac =3D {0x0, 0x0, 0x0, 0x0, 0x0, 0x=
0};
>         std::copy(sourceMac.begin(), sourceMac.end(), frame.eth.h_source)=
;
>         std::copy(destMac.begin(), destMac.end(), frame.eth.h_dest);
>
>         frame.eth.h_proto =3D htons(ETH_P_IP);
>         frame.ip.ihl =3D 5;
>         frame.ip.version =3D 4;
>         frame.ip.tos =3D 0;
>         frame.ip.tot_len =3D htons(sizeof(OrderFrame) - sizeof(ethhdr));
>         frame.ip.id =3D orderId;
>
>         frame.ip.frag_off =3D 0x0;
>         frame.ip.ttl =3D static_cast<u8>(255);
>         frame.ip.protocol =3D 17;
>         frame.ip.check =3D 0;
>         constexpr u8 sourceIPBytes[4] =3D {127, 0, 0, 1};
>         constexpr u8 destIPBytes[4] =3D {127, 0, 0, 1};
>         const u32 sourceIP =3D *reinterpret_cast<const u32*>(sourceIPByte=
s);
>         const u32 destIP =3D *reinterpret_cast<const u32*>(destIPBytes);
>         frame.ip.saddr =3D sourceIP;
>         frame.ip.daddr =3D destIP;
>         const u8* dataptr =3D reinterpret_cast<u8 *>(&frame.ip);
>         const u16 kernelcsum =3D ip_fast_csum(dataptr, frame.ip.ihl);
>         frame.ip.check =3D kernelcsum;
>         constexpr int udpPacketSz =3D sizeof(OrderFrame) -
> sizeof(ethhdr) - sizeof(iphdr);
>         frame.udp.len =3D htons(udpPacketSz);
>         frame.udp.check =3D 0;
>         frame.udp.dest =3D htons(OE_PORT);
>         frame.udp.source =3D htons(1234);
>         ... // application packet logic
>         frame.udp.check =3D 0;
>
>         xsk_ring_prod__submit(&qs.txQ, 1);
>         if (xsk_ring_prod__needs_wakeup(&qs.txQ)) {
>             assert((socket.cfg.bind_flags & XDP_COPY) !=3D 0);
>             const ssize_t ret =3D sendto(socket.xskFD, nullptr, 0,
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
>         cfg.rx_size =3D XSKQueues::NUM_READ_DESC;
>         cfg.tx_size =3D XSKQueues::NUM_WRITE_DESC;
>         cfg.libxdp_flags =3D XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD;
>         cfg.xdp_flags =3D XDP_FLAGS_SKB_MODE;
>         cfg.bind_flags =3D XDP_USE_NEED_WAKEUP | XDP_COPY;
>
>         if (xsk_socket__create(&socket, iface.c_str(), QUEUE, umem.umem,
>                                &qs.rxQ, &qs.txQ, &cfg)) {
>             perror("XSK: ");
>             exit(EXIT_FAILURE);
>         }
>
> What could be the issue?

