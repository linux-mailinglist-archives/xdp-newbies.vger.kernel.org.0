Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A305B18D647
	for <lists+xdp-newbies@lfdr.de>; Fri, 20 Mar 2020 18:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgCTRyV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Fri, 20 Mar 2020 13:54:21 -0400
Received: from postout1.mail.lrz.de ([129.187.255.137]:35539 "EHLO
        postout1.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgCTRyV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 20 Mar 2020 13:54:21 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 48kWcT6vSSzycD
        for <xdp-newbies@vger.kernel.org>; Fri, 20 Mar 2020 18:54:17 +0100 (CET)
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
        with LMTP id TJwXKI1kCe0Q for <xdp-newbies@vger.kernel.org>;
        Fri, 20 Mar 2020 18:54:17 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (BADWLRZ-SWMBX03.ads.mwn.de [IPv6:2001:4ca0:0:108::159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX03", Issuer "BADWLRZ-SWMBX03" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 48kWcT2zRtzycC
        for <xdp-newbies@vger.kernel.org>; Fri, 20 Mar 2020 18:54:17 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 20 Mar 2020 18:54:17 +0100
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.010; Fri, 20 Mar 2020 18:54:17 +0100
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Is there a problem with UDP-packets of size 371 bytes and less?
Thread-Topic: Is there a problem with UDP-packets of size 371 bytes and less?
Thread-Index: AQHV/t9yUD9C3ScIK0CmN/4cCby4bw==
Date:   Fri, 20 Mar 2020 17:54:17 +0000
Message-ID: <f9c9f8d39ddf4f6ba915b3e6e087c63c@hm.edu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2003:c6:4f25:4bbf:801c:6db5:405:327c]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This question is related to: https://marc.info/?l=xdp-newbies&m=158462735008364&w=2

Is there a known (or maybe unknown) bug regarding the size of packets in the AF-XDP socket framework (+ libbpf)?

I am experiencing a strange packet loss for my application:

IPv4/UDP/RTP packet stream with all packets being the same size (1442 bytes): no packet loss
IPv4/UDP/RTP packet stream where pretty much all packets are the same size (1492 bytes) except a special "marker" packet (only 357 bytes but they are also IPv4/UDP-packets): all marker packets get lost
I added a bpf_printk statement in my XDP-Kernelprogram for further validation:

const int len = bpf_ntohs(iph->tot_len);
if(len < 400) {
    bpf_printk("FOUND PACKET LEN < 400: %d.\n", len);
}

This output is never observed via *cat /sys/kernel/debug/tracing/trace_pipe*. So these small RTP-marker packets aren't even received by my kernel filter - no wonder why I don't receive them in userspace.

ethtool -S <if> shows me this number: rx_256_to_511_bytes_phy. This number is increasing in a similar rate as marker-packets should come in (about 30/s). So this means that my NIC does receive the packets (and so does a generic Linux socket), but my XDP-program doesn't - why?

I made further testing with *nping* which is able to generate packets with arbitrary sizes:

nping --udp -p <port> --dest-ip <ip> --data-length 372 -c 50000000 --rate 250 -N

Packets of size *372 bytes* are received but anything less is not received (ordinary linux socket does receive those packets as I said though).

The only idea that came to my mind was UMEM chunk size alignment related (option *XDP_UMEM_UNALIGNED_CHUNK_FLAG* with *MAP_HUGETLB*) - but this didn't change anything (I also don't know if changing UMEM-settings changes anything on the XDP-Kernelside).

Any idea what could be the cause of this problem?
