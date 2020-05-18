Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB9B1D73BD
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 May 2020 11:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgERJRO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Mon, 18 May 2020 05:17:14 -0400
Received: from postout1.mail.lrz.de ([129.187.255.137]:38999 "EHLO
        postout1.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgERJRO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 18 May 2020 05:17:14 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49QYLc0073zyTC;
        Mon, 18 May 2020 11:17:11 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -0.585
X-Spam-Level: 
X-Spam-Status: No, score=-0.585 tagged_above=-999 required=5
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, LRZ_CT_PLAIN_ISO8859_1=0.001,
        LRZ_DATE_TZ_0000=0.001, LRZ_DKIM_DESTROY_MTA=0.001,
        LRZ_DMARC_OVERWRITE=0.001, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
        LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_FROM_AP_PHRASE=0.001,
        LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
        LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
        LRZ_FROM_PHRASE=0.001, LRZ_FWD_MS_EX=0.001, LRZ_HAS_CLANG=0.001,
        LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_THREAD_INDEX=0.001,
        LRZ_HAS_X_ORIG_IP=0.001, LRZ_MSGID_HL32=0.001,
        LRZ_RCVD_BADWLRZ_EXCH=0.001, LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5,
        RDNS_NONE=0.793, SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
        by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id p1LUhxi2PGEx; Mon, 18 May 2020 11:17:11 +0200 (CEST)
Received: from BADWLRZ-SWMBB04.ads.mwn.de (BADWLRZ-SWMBB04.ads.mwn.de [IPv6:2001:4ca0:0:108::155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBB04", Issuer "BADWLRZ-SWMBB04" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49QYLb5Ms4zyRf;
        Mon, 18 May 2020 11:17:11 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBB04.ads.mwn.de (2001:4ca0:0:108::155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Mon, 18 May 2020 11:17:06 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Mon, 18 May 2020 11:17:06 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     Xdp <xdp-newbies@vger.kernel.org>
Subject: AW: How does the Kernel decide which Umem frame to choose for the
 next packet?
Thread-Topic: How does the Kernel decide which Umem frame to choose for the
 next packet?
Thread-Index: AQHWLO9U7O2WHQ+3+k6Y+F2inJ0qdqitZ4+AgAAh0gU=
Date:   Mon, 18 May 2020 09:17:06 +0000
Message-ID: <0f2212ea98c74001b5c0282bfb6718d7@hm.edu>
References: <ba88e0ff11b940fe8855a0dd43c947ae@hm.edu>,<CAJ8uoz1wQcCN6N_NPQhG5OFOyBp-a2Mqwh+nqeTGYqOeL_dCLw@mail.gmail.com>
In-Reply-To: <CAJ8uoz1wQcCN6N_NPQhG5OFOyBp-a2Mqwh+nqeTGYqOeL_dCLw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [79.201.59.10]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> User-space decides this by what frames it enters into the fill ring.
> Kernel-space uses the frames in order from that ring.
> 
> /Magnus

Thank you for your reply Magnus,

I am sorry to ask again but I am not so sure when this happens.
So I first check my socket RX-ring for new packets:

		xsk_ring_cons__peek(&xsk_socket->rx, 1024, &idx_rx)

which looks like this:

		static inline size_t xsk_ring_cons__peek(struct xsk_ring_cons *cons,
							 size_t nb, __u32 *idx)
		{
			size_t entries = xsk_cons_nb_avail(cons, nb);

			if (entries > 0) {
				/* Make sure we do not speculatively read the data before
				 * we have received the packet buffers from the ring.
				 */
				libbpf_smp_rmb();

				*idx = cons->cached_cons;
				cons->cached_cons += entries;
			}

			return entries;
		}

where `idx_rx` is the starting position of descriptors for the new packets in the RX-ring.

My first question here is: How can there already be descriptors of packets in my RX-ring if I didn't enter any frames into the fill ring of the umem yet?
So I assume libbpf did this for me already?

After this call I know how many packets are waiting. So I reserve exactly as many Umem frames:

		xsk_ring_prod__reserve(&umem_info->fq, rx_rcvd_amnt, &idx_fq);

which looks like this:

		static inline size_t xsk_ring_prod__reserve(struct xsk_ring_prod *prod,
								size_t nb, __u32 *idx)
		{
			if (xsk_prod_nb_free(prod, nb) < nb)
				return 0;

			*idx = prod->cached_prod;
			prod->cached_prod += nb;

			return nb;
		}

But what am I exactly reserving here? How can I reserve anything from the Umem without telling it the RX-ring of my socket?

After  this, I extract the RX-ring packet descriptors, starting at `idx_rx`:

		const struct xdp_desc *desc = xsk_ring_cons__rx_desc(&xsk_socket->rx, idx_rx + i);

I am also not entirely certain with the zero-copy aspect of AF-XDP. As far as I know the NIC writes incoming packets via DMA directly into system memory. But this time system memory means the Umem area - right? Where with non-zero-copy this would be any position in memory and the Kernel first has to copy the packets into the Umem area?

I am also a bit confused what the size of a RX-queue means in this context. Assuming the output of ethtool:

		$ ethtool -g eth20
		Ring parameters for eth20:
		Pre-set maximums:
		RX:             8192
		RX Mini:        0
		RX Jumbo:       0
		TX:             8192
		Current hardware settings:
		RX:             1024
		RX Mini:        0
		RX Jumbo:       0
		TX:             1024

Does this mean that at the moment my NIC can store 1024 incoming packets inside its own memory? So there is no connection between the RX-queue size of the NIC and the Umem area?

Sorry for this wall of text. Maybe you can answer a few of my questions, I hope they are not too confusing.

Thank you so much

Max
