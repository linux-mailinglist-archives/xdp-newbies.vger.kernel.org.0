Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1C51EEB16
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 21:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgFDTZ2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 4 Jun 2020 15:25:28 -0400
Received: from postout1.mail.lrz.de ([129.187.255.137]:36635 "EHLO
        postout1.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbgFDTZ2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 15:25:28 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49dG2X60G4zyYQ
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 21:25:24 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -0.586
X-Spam-Level: 
X-Spam-Status: No, score=-0.586 tagged_above=-999 required=5
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, LRZ_CT_PLAIN_ISO8859_1=0.001,
        LRZ_DATE_TZ_0000=0.001, LRZ_DKIM_DESTROY_MTA=0.001,
        LRZ_DMARC_OVERWRITE=0.001, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
        LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_FROM_AP_PHRASE=0.001,
        LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
        LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
        LRZ_FROM_PHRASE=0.001, LRZ_FWD_MS_EX=0.001, LRZ_HAS_CLANG=0.001,
        LRZ_HAS_THREAD_INDEX=0.001, LRZ_HAS_X_ORIG_IP=0.001,
        LRZ_MSGID_HL32=0.001, LRZ_RCVD_BADWLRZ_EXCH=0.001,
        LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5, RDNS_NONE=0.793,
        SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
        by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id C8i1G4yPd6NL for <xdp-newbies@vger.kernel.org>;
        Thu,  4 Jun 2020 21:25:24 +0200 (CEST)
Received: from BADWLRZ-SWMBX05.ads.mwn.de (BADWLRZ-SWMBX05.ads.mwn.de [IPv6:2001:4ca0:0:108::161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX05", Issuer "BADWLRZ-SWMBX05" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49dG2X4JBhzyYL
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 21:25:24 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX05.ads.mwn.de (2001:4ca0:0:108::161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Thu, 4 Jun 2020 21:25:24 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Thu, 4 Jun 2020 21:25:24 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Intel 10G 2P X520 Adapter doesn't receive anything with AF XDP
Thread-Topic: Intel 10G 2P X520 Adapter doesn't receive anything with AF XDP
Thread-Index: AQHWOqPu+5xj7fx2CEmhKaGvaWOLCQ==
Date:   Thu, 4 Jun 2020 19:25:23 +0000
Message-ID: <7ec53b8f30524ffba36bb264c6d023fc@hm.edu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [80.246.32.33]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sorry to ask another question but I don't get this working.

I have this AF_XDP test program which creates an ordinary SOCK_RAW socket and adds a multicast address to it via IP_ADD_MEMBERSHIP.
Then it loads a BPF program and launches an AF_XDP socket which then processes packets of that multicast.

This works fine on my Mellanox ConnectX5 card, but it doesn't work on my Intel 10G 2P X520 (Kernel 5.6.0 and driver ixgbe 5.1.0-k).
I have an array map in the BPF program which counts the amount of packets received on each RX-Queue:

		SEC("xdp_sock") int xdp_sock_prog(struct xdp_md *ctx) {

			const void *data = (void*)(unsigned long)ctx->data;
			const void *data_end = (void*)(unsigned long)ctx->data_end;
			const int rx_queue_idx = ctx->rx_queue_index;

			const struct ethhdr *eth = (struct ethhdr*)(data);

			unsigned long *idx_counter = bpf_map_lookup_elem(&rx_queue_pckt_counter_map, &rx_queue_idx);
			if(idx_counter != NULL) {
				*idx_counter += 1;
			}

I can then look at this map via bpftool. What I found is that almost no packets are received: only like 4 packets on RX-Queues 1, 2, 3, 4 which I assume are random pings in the network or something but nothing significant (the multicast stream would have a packet rate of 270k pps).

The strange thing now is that everything works fine if I just use that generic Linux socket to receive the packets (without any XDP / AF_XDP / BPF involved).

Any ideas why that is?

Best regards

Max

