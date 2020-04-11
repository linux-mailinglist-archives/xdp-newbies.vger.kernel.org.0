Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70351A4ECB
	for <lists+xdp-newbies@lfdr.de>; Sat, 11 Apr 2020 09:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgDKH56 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Sat, 11 Apr 2020 03:57:58 -0400
Received: from postout1.mail.lrz.de ([129.187.255.137]:51273 "EHLO
        postout1.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgDKH56 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 11 Apr 2020 03:57:58 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 48znLC3sfMzySd
        for <xdp-newbies@vger.kernel.org>; Sat, 11 Apr 2020 09:57:55 +0200 (CEST)
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
        with LMTP id 6MS9rTzoOQRT for <xdp-newbies@vger.kernel.org>;
        Sat, 11 Apr 2020 09:57:55 +0200 (CEST)
Received: from BADWLRZ-SWMBB04.ads.mwn.de (BADWLRZ-SWMBB04.ads.mwn.de [IPv6:2001:4ca0:0:108::155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBB04", Issuer "BADWLRZ-SWMBB04" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 48znLC22ZnzySY
        for <xdp-newbies@vger.kernel.org>; Sat, 11 Apr 2020 09:57:55 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBB04.ads.mwn.de (2001:4ca0:0:108::155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 11 Apr 2020 09:57:54 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.010; Sat, 11 Apr 2020 09:57:54 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: virtio and XDP: How to do flow steering + shared umem
Thread-Topic: virtio and XDP: How to do flow steering + shared umem
Thread-Index: AQHWD9YMSKN6aVePRUa86ip4t01sjw==
Date:   Sat, 11 Apr 2020 07:57:54 +0000
Message-ID: <d661a87f825d4740b63b2dc5c4b0ca9f@hm.edu>
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

I set up a kvm with virt-manager using Debian buster upgraded to Kernel 5.4 to test my AF-XDP program. I am using the NIC which I usually use on my host-server with macvtap driver set to virtio and passthrough inside the guest system.

The first time I started my program inside the VM I noticed this error message:

	virtio_net virtio0 eth1: request 2 queues but max is 1.

After searching Google I found the solution. Changing my interface config to this (always with just 1 virtual CPU):

   <interface type='direct' trustGuestRxFilters='yes'>
      <mac address='52:54:00:b7:7d:c2'/>
      <source dev='eth20' mode='passthrough'/>
      <model type='virtio'/>
      <driver name='vhost' queues='2'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>

To observe what's happening on which RX-Queue I setup up a BPF_MAP_TYPE_ARRAY in my XDP-program which contains the amount of packets arrived on each RX-Queue (observed with `bpftool map dump id xx`):

	const int rx_queue_idx = ctx->rx_queue_index;
	unsigned long *idx_counter = bpf_map_lookup_elem(&rx_queue_pckt_counter_map, &rx_queue_idx);
	if(idx_counter != NULL) {
		  *idx_counter += 1;
	}

Because I found no way how to do Receive Side Steering with macvtap (KVM/QEMU virtio (macvtap): Is RSS possible?) I am only testing a single RX-Queue with multiple AF-XDP sockets (they are sharing the same umem). Each socket is responsible to process packets from a single multicast-source.

Now what I am observing is that some packets are received on another queue even though I set

	sudo ethtool -L eth1 combined 1

In case I am trying to process one multicast-source (this means `setsockopt(fd, IP_ADD_MULTICAST)`), the bpf-map looks like this:

	$ sudo bpftool map dump id 57
	key: 00 00 00 00  value: 00 00 00 00 00 00 00 00
	key: 01 00 00 00  value: 29 dd 2d 00 00 00 00 00

It's a bit odd that virtio doesn't start with the first RX-Queue but okay, I can adapt my program. Packet loss is around 0.2% total at around 270kpps.

In case I use two multicast streams (again with IP_ADD_MULTICAST), this is the bpf-map:

	$ sudo bpftool map dump id 61
	key: 00 00 00 00  value: 00 00 00 00 00 00 00 00
	key: 01 00 00 00  value: 76 a4 4b 00 00 00 00 00

Packet loss is now at around 16% at 455kpps which is nowhere near the original performance (is this normal??).

In case I add another multicast stream (3 total), this is the bpf-map:

	$ sudo bpftool map dump id 65
	key: 00 00 00 00  value: 2f 6a 0e 00 00 00 00 00
	key: 01 00 00 00  value: 77 d9 20 00 00 00 00 00

As you can see, there are packets on RX-Queue 0 and RX-Queue 1. Why is that and how can I prevent that from happening?

I don't understand why ethtool shows me this: 

	$ sudo ethtool -S eth1
	NIC statistics:
		 rx_queue_0_packets: 80341229
		 rx_queue_0_bytes: 119871244125
		 rx_queue_0_drops: 79419999
		 rx_queue_0_xdp_packets: 80332151
		 rx_queue_0_xdp_tx: 0
		 rx_queue_0_xdp_redirects: 79922548
		 rx_queue_0_xdp_drops: 79419999
		 rx_queue_0_kicks: 1586
		 tx_queue_0_packets: 165
		 tx_queue_0_bytes: 13552
		 tx_queue_0_xdp_tx: 0
		 tx_queue_0_xdp_tx_drops: 0
		 tx_queue_0_kicks: 165

even though I have evidence that there are multiple RX-queues where packets are received on?

To summarize my problem:

- Somehow I have more than one RX-Queue even though I set `ethtool -L eth1 combined 1`.
- Furthermore, I am fine with multiple RX-Queues but not if I am not able to decide where packets arrive via `ethtool -N eth1 flow-type udp4 ...`.
