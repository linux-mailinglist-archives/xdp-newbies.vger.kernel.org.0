Return-Path: <xdp-newbies+bounces-8-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FDD80390B
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Dec 2023 16:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41FDCB20C69
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Dec 2023 15:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8241E2C870;
	Mon,  4 Dec 2023 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvyKLrok"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27DEB0
	for <xdp-newbies@vger.kernel.org>; Mon,  4 Dec 2023 07:42:01 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d8751c8e7eso1875814a34.3
        for <xdp-newbies@vger.kernel.org>; Mon, 04 Dec 2023 07:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701704521; x=1702309321; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wt7fBRwlkJrbcIKNltn4uIopGwU7xxEDv5voK+1mDbo=;
        b=OvyKLrokzfIZI/h5le7qVRdYiATLy8u5YfeLTIaE+i+niYBCShcwA3NMsYoWiwfPsy
         Fyj2hym5kRlIDcQtG85B1EXLE+oZGkzcWhKyGOxp7rZQaEtp+sC7HSQxwcQQ+FfdclsK
         uPFI++C2qzS9wkIS/8QpOSsCrCVqvTzRr9/bBufBsG/2zqzdPRUy5c9/nNtIq0Uq9X69
         ZhpQgX1QcdqnJieUNH020WfB8bsCH9rQIO5aiSZyF4AQdrejEZWQW5ZzRVAVmvcFKWPg
         Lk1r6C8vKEobTJdj4UwGoC2m5zuL4AV6pawNTVkUaVHyOr+rPrG0fXv1RoV09SDbzADO
         aXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701704521; x=1702309321;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wt7fBRwlkJrbcIKNltn4uIopGwU7xxEDv5voK+1mDbo=;
        b=T4c2806w4LLpKd3FtU34ia28UoDE4hZ/6i1S8eGqllN78jz6tm5l3JTSyquk5COr3d
         95cl2jzRYLLM7c+BiRTwpilUJ3zP8FKTFQGlm5UlbpKLXlBGVTHcNcKRkYzB/SkgWl5l
         nqnmjH+AhDwSVFP1gKwoZ3xV0R0oRFZ0qwz7utkIC6EWBBCg7ZD/cplIbY6261WlPZcx
         85u/cn1Bf6o8I6tt2iSlROiS/qyZORzsDTt1zPFSzp5mS4nEHIFf3ss0iQS3cyIH+PFJ
         zPNtEofnmeWaoc3C1IQRG4B5YcdOfk7QpNdGvPX/G4gsMNedMX6mpsSt3H5IJ6pn+GRp
         r7EQ==
X-Gm-Message-State: AOJu0YylfCrfi+QIf7tl4A+e9R9/CK9X+plya9WKn0Y0wHwe+cDdbb/Z
	UqFfyJLYvfes6Z6at9wEiKMCKNbsotxIVOHTHzi64QSgfNcV
X-Google-Smtp-Source: AGHT+IE1eM635Pa8wgcQfJD08/X7MI16c/bLxXsLgM0hqfifNnoIuW0K9hPRqKP4Zlx0pBv+XRPPc/NYjtZ6oLpFn+E=
X-Received: by 2002:a05:6830:43ab:b0:6d8:74e2:c076 with SMTP id
 s43-20020a05683043ab00b006d874e2c076mr4125595otv.40.1701704520928; Mon, 04
 Dec 2023 07:42:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Joshua Coutinho <souichirosano@gmail.com>
Date: Mon, 4 Dec 2023 15:41:50 +0000
Message-ID: <CAOafi9EZ8L150jw_pC_DZj4_VO6r-BxCMDZzsC_X-V06o73org@mail.gmail.com>
Subject: XSK tx on loopback drops packets.
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi All,

I'm trying to transmit udp packets via an xsk socket. (XDP receives
work just fine). The xdp program is irrelevant/unused, I'm trying to
simply leverage the xsk socket write.

(Kernel: Linux fedora 6.5.12-300.fc39.x86_64)
(OS: "Fedora Linux 39 (Workstation Edition)"

I want a minimal working example of sending packets via an XSK socket
over loopback in user space land. I want to be able to fill in the
required memory regions and trigger the kernel to send the packet and
capture the sent packets on the other side with 'nc -lu 127.0.0.1
<port>'  This seems to happen partly successfully but on the ingress
part of the loopback it is dropped somewhere after reaching the kernel
function ip_rcv and then nf_hook_slow. Specifically, I simply want to
write a packet into a UMEM region, fill in the TX descriptor and then
submit that descriptor like so.

        u32 txIdx = -1;
        const u32 txSlotsRecvd = xsk_ring_prod__reserve(&qs.txQ, 1, &txIdx);
        u32 addr = umem.txState.nextSlot();

        xdp_desc* txDescr = xsk_ring_prod__tx_desc(&qs.txQ, txIdx);
        txDescr->addr = addr;
        txDescr->len = sizeof(OrderFrame);
        txDescr->options = 0;

        u8* outputBuf = umem.buffer + addr;

        TimeNs submitTime = currentTimeNs();
        OrderFrame& frame = *reinterpret_cast<OrderFrame *>(outputBuf);

        std::array<u8, ETH_ALEN> sourceMac = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
        std::array<u8, ETH_ALEN> destMac = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
        std::copy(sourceMac.begin(), sourceMac.end(), frame.eth.h_source);
        std::copy(destMac.begin(), destMac.end(), frame.eth.h_dest);

        frame.eth.h_proto = htons(ETH_P_IP);
        frame.ip.ihl = 5;
        frame.ip.version = 4;
        frame.ip.tos = 0;
        frame.ip.tot_len = htons(sizeof(OrderFrame) - sizeof(ethhdr));
        frame.ip.id = orderId;

        frame.ip.frag_off = 0x0;
        frame.ip.ttl = static_cast<u8>(255);
        frame.ip.protocol = 17;
        frame.ip.check = 0;
        constexpr u8 sourceIPBytes[4] = {127, 0, 0, 1};
        constexpr u8 destIPBytes[4] = {127, 0, 0, 1};
        const u32 sourceIP = *reinterpret_cast<const u32*>(sourceIPBytes);
        const u32 destIP = *reinterpret_cast<const u32*>(destIPBytes);
        frame.ip.saddr = sourceIP;
        frame.ip.daddr = destIP;
        const u8* dataptr = reinterpret_cast<u8 *>(&frame.ip);
        const u16 kernelcsum = ip_fast_csum(dataptr, frame.ip.ihl);
        frame.ip.check = kernelcsum;
        constexpr int udpPacketSz = sizeof(OrderFrame) -
sizeof(ethhdr) - sizeof(iphdr);
        frame.udp.len = htons(udpPacketSz);
        frame.udp.check = 0;
        frame.udp.dest = htons(OE_PORT);
        frame.udp.source = htons(1234);
        ... // application packet logic
        frame.udp.check = 0;

        xsk_ring_prod__submit(&qs.txQ, 1);
        if (xsk_ring_prod__needs_wakeup(&qs.txQ)) {
            assert((socket.cfg.bind_flags & XDP_COPY) != 0);
            const ssize_t ret = sendto(socket.xskFD, nullptr, 0,
MSG_DONTWAIT, nullptr, 0);
        }

This is a relevant stacktrace from the kernel indicating the path of
my packet after the above sendto is called.

         __netif_receive_skb_one_core+0x3c/0xa0
         process_backlog+0x85/0x120
         __napi_poll+0x28/0x1b0
         net_rx_action+0x2a4/0x380
         __do_softirq+0xd1/0x2c8
         do_softirq.part.0+0x3d/0x60
         __local_bh_enable_ip+0x68/0x70
         __dev_direct_xmit+0x152/0x210
         __xsk_generic_xmit+0x3e4/0x710
         xsk_sendmsg+0x12f/0x1f0
         __sys_sendto+0x1d6/0x1e0
         __x64_sys_sendto+0x24/0x30
         do_syscall_64+0x5d/0x90
         entry_SYSCALL_64_after_hwframe+0x6e/0xd8

My socket is bound to localhost using xdpgeneric. I see the
transmitted packets in tcpdump and via bpftrace I see that ip_rcv is
invoked for the packets. nf_hook_slow is also invoked with 1 active
prerouting hook. On kfree_skb I see the reason for the drop is 'reason
not specified'. Examining the packet in tcpdump I see no errors with
the checksums or packet lengths and ports. Listeners for the
corresponding udp ports never receieve the packets.This is how I
create my socket

        cfg.rx_size = XSKQueues::NUM_READ_DESC;
        cfg.tx_size = XSKQueues::NUM_WRITE_DESC;
        cfg.libxdp_flags = XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD;
        cfg.xdp_flags = XDP_FLAGS_SKB_MODE;
        cfg.bind_flags = XDP_USE_NEED_WAKEUP | XDP_COPY;

        if (xsk_socket__create(&socket, iface.c_str(), QUEUE, umem.umem,
                               &qs.rxQ, &qs.txQ, &cfg)) {
            perror("XSK: ");
            exit(EXIT_FAILURE);
        }

What could be the issue?

