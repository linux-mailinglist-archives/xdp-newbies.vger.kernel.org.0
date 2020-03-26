Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90476193FD6
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Mar 2020 14:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCZNfu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 26 Mar 2020 09:35:50 -0400
Received: from postout2.mail.lrz.de ([129.187.255.138]:39891 "EHLO
        postout2.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCZNfu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Mar 2020 09:35:50 -0400
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
        by postout2.mail.lrz.de (Postfix) with ESMTP id 48p5bR4BWpzymG
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Mar 2020 14:35:47 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -0.584
X-Spam-Level: 
X-Spam-Status: No, score=-0.584 tagged_above=-999 required=5
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, LRZ_CT_PLAIN_ISO8859_1=0.001,
        LRZ_DATE_TZ_0000=0.001, LRZ_DKIM_DESTROY_MTA=0.001,
        LRZ_DMARC_OVERWRITE=0.001, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
        LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_FROM_AP_PHRASE=0.001,
        LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
        LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
        LRZ_FROM_PHRASE=0.001, LRZ_FWD_MS_EX=0.001, LRZ_HAS_CLANG=0.001,
        LRZ_HAS_THREAD_INDEX=0.001, LRZ_HAS_URL_HTTP=0.001,
        LRZ_HAS_URL_HTTP_SINGLE=0.001, LRZ_HAS_X_ORIG_IP=0.001,
        LRZ_MSGID_HL32=0.001, LRZ_RCVD_BADWLRZ_EXCH=0.001,
        LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5, RDNS_NONE=0.793,
        SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
        by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id 6cCxscgbxzIg for <xdp-newbies@vger.kernel.org>;
        Thu, 26 Mar 2020 14:35:47 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (BADWLRZ-SWMBX03.ads.mwn.de [IPv6:2001:4ca0:0:108::159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX03", Issuer "BADWLRZ-SWMBX03" (not verified))
        by postout2.mail.lrz.de (Postfix) with ESMTPS id 48p5bR2V6Vzyft
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Mar 2020 14:35:47 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 26 Mar 2020 14:35:47 +0100
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.010; Thu, 26 Mar 2020 14:35:47 +0100
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Is there a way to process multiple shared umem sockets on same
 RX-queue in parallel?
Thread-Topic: Is there a way to process multiple shared umem sockets on same
 RX-queue in parallel?
Thread-Index: AQHWA3N007xG7v0DXEOrz9V9fCLzpg==
Date:   Thu, 26 Mar 2020 13:35:47 +0000
Message-ID: <c442671a3c7145a7b76b1f871e2b01cf@hm.edu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2003:c6:4f25:4be0:801c:6db5:405:327c]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

*xdpsock_user.c* (https://github.com/torvalds/linux/blob/master/samples/bpf/xdpsock_user.c) implements multiple AF-XDP sockets on the same RX-Queue using shared Umem.
The sockets are then processed in a for-loop like this (1:1 copy):

		struct pollfd fds[MAX_SOCKS] = {};
		int i, ret;

		for (i = 0; i < num_socks; i++) {
			fds[i].fd = xsk_socket__fd(xsks[i]->xsk);
			fds[i].events = POLLIN;
		}

		for (;;) {
			if (opt_poll) {
				ret = poll(fds, num_socks, opt_timeout);
				if (ret <= 0)
					continue;
			}

			for (i = 0; i < num_socks; i++)
				rx_drop(xsks[i], fds);

			if (benchmark_done)
				break;
		}

This approach works fine in my implementation as well but I was wondering if it is possible to spawn a thread for every socket and let those threads process receiving packets in a parallel fashion.
After processing is done (right before they go to sleep to wait for the next batch of packets), those threads are adding an entry to a message queue, instructing another thread (which is processing the queue) to free Umem-Fill-Queue and RX-Ring memory of that socket.
I know that Umem is only single producer / single consumer so I went into the implementation with the mindset that it probably wouldn't work out - and it didn't. But now I am wondering whether this is not possible by design (this means that indeed every socket of a RX-Queue using shared umem has to be processed sequentially) or if I did something wrong.
So this is how a thread processes incoming packets:

		uint32_t idx_rx = 0;
		const int rcvd = xsk_ring_cons__peek(&xsk_socket->rx, INT32_MAX, &idx_rx);
		if (rcvd == 0) {
			continue;
		}

		uint32_t idx_fq = 0;
		const int ret = xsk_ring_prod__reserve(&xsk_socket->umem->fq, rcvd, &idx_fq);
                /* continue checking if ret != rcvd ... */
		if(ret == rcvd) {
			for (uint32_t i = idx_rx; i < (idx_rx + rcvd); i++) {
				const struct xdp_desc *desc = xsk_ring_cons__rx_desc(&xsk_socket->rx, i);
				uint64_t addr = desc->addr;
				const uint32_t len = desc->len;
				const uint64_t orig = xsk_umem__extract_addr(addr);

				addr = xsk_umem__add_offset_to_addr(addr);

				const int hdr_size = process_packet(xsk_socket, addr, len);
				*xsk_ring_prod__fill_addr(&xsk_socket->umem->fq, idx_fq++) = orig;
				
				xsk_socket->stats.rx_bytes += (len - hdr_size);
			}

			xsk_socket->stats.rx_packets += rcvd;

			struct xsk_thread_msg msg;
			msg.xsk_rx = &xsk_socket->rx;
			msg.xsk_rx_rcvd = rcvd;
			msg.xsk_prod_reserve_amnt = ret;
			if(msgsnd(msg_queue_id, (void*)(&msg), sizeof(struct xsk_thread_msg), 0) < 0) {
				fprintf(stderr, "Failed to add msg from xsk-socket: %s\n", strerror(errno));
			}
		
		}

and those messages are then received by another thread:

		struct xsk_thread_msg msg;
		while(!global_exit) {
			memset(&msg, 0, sizeof(struct xsk_thread_msg));
			if(msgrcv(msg_queue_id, (void*)(&msg), sizeof(struct xsk_thread_msg), 0, 0) == -1) {
				fprintf(stderr, "Failed to receive message: %s\n", strerror(errno));
			} else {
				xsk_ring_cons__release(msg.xsk_rx, msg.xsk_rx_rcvd);
				xsk_ring_prod__submit(&umem_info->fq, msg.xsk_prod_reserve_amnt);
			}
		}

What I am observing is that it works for a few seconds or so and then packet loss gradually increases to 100% (e.g. sequence numbers don't match up) but the amount of received packets stays the same.

