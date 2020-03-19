Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3870118B923
	for <lists+xdp-newbies@lfdr.de>; Thu, 19 Mar 2020 15:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgCSOPt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 19 Mar 2020 10:15:49 -0400
Received: from postout2.mail.lrz.de ([129.187.255.138]:58001 "EHLO
        postout2.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgCSOPt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 19 Mar 2020 10:15:49 -0400
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
        by postout2.mail.lrz.de (Postfix) with ESMTP id 48jppn5d8kzynR;
        Thu, 19 Mar 2020 15:15:45 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
        LRZ_HAS_SPF=0.001, LRZ_HAS_THREAD_INDEX=0.001,
        LRZ_HAS_X_ORIG_IP=0.001, LRZ_MSGID_HL32=0.001,
        LRZ_RCVD_BADWLRZ_EXCH=0.001, LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5,
        RDNS_NONE=0.793, SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
        by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id LxBZ3XBct5hh; Thu, 19 Mar 2020 15:15:45 +0100 (CET)
Received: from BADWLRZ-SWMBX05.ads.mwn.de (BADWLRZ-SWMBX05.ads.mwn.de [IPv6:2001:4ca0:0:108::161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX05", Issuer "BADWLRZ-SWMBX05" (not verified))
        by postout2.mail.lrz.de (Postfix) with ESMTPS id 48jppn0hvzzynF;
        Thu, 19 Mar 2020 15:15:45 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX05.ads.mwn.de (2001:4ca0:0:108::161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 19 Mar 2020 15:15:44 +0100
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.010; Thu, 19 Mar 2020 15:15:44 +0100
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
CC:     Xdp <xdp-newbies@vger.kernel.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Subject: AW: Why does my AF-XDP Socket lose packets whereas a generic linux
 socket doesn't?
Thread-Topic: Why does my AF-XDP Socket lose packets whereas a generic linux
 socket doesn't?
Thread-Index: AQHV+t9JHNkA4/KZDEuYHjwHshnQ1ahK1fqAgAUgAcQ=
Date:   Thu, 19 Mar 2020 14:15:44 +0000
Message-ID: <bd692ff951cb41cfbd5397203f3a3ef0@hm.edu>
References: <27adfa9b069242a3a0d8e9ccd64e308a@hm.edu>,<20200316093819.65c24cdd@carbon>
In-Reply-To: <20200316093819.65c24cdd@carbon>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2003:c6:4f25:4bf6:801c:6db5:405:327c]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 16 Mar 2020 09:38, <brouer@redhat.com> wrote:

>On Sun, 15 Mar 2020 15:36:13 +0000
>"Gaul, Maximilian" <maximilian.gaul@hm.edu> wrote:
>
>
>You say that you are sleeping for a specified time around 1 - 2ms.
>
>Have you considered if in the time your programs sleeps, if the
>RX-queue can be overflowed?
>
>You say at 390,000 pps drops happen.  At this speed a packets arrive
>every 2.564 usec (1/390000*10^9 = 2564 ns = 2.564 usec).
>
>What NIC hardware/driver are you using?
>And what is the RX-queue size? (ethtool -g)
>On Intel's XL710 driver i40e, the default RX-ring size is 512.
>
>The "good-queue" effect is that a queue functions as a shock absorber,
>to handle that the OS/CPU is busy doing something else.  If I have 512
>RX-queue slots, and packets arriving every 2.564 usec, then I must
>return and empty the queue (and re-fill slots) every 1.3 ms
>(512 * 2.564 usec = 1312.768 usec = 1.3127 ms).
>

Thank you so much for your answer Jesper!

regarding the size of the RX-Queue: it is 1024.
I am able to increase it up to 8192 but my tests are showing that the RX-Queue size doesn't change anything on the lost packet rate unless it is lower than 512 (lost packets increase very minimally if set to 512 from 1024).
I also decreased the sleeping time of the process from 1ms to 500µs - this also didn't change anything.
I am using a *Mellanox Technologies MT27800 Family [ConnectX-5]*. I did some further tests with the generic linux socket and it worked fine without any packet loss (but of course I want to use the extended packet processing capability by AF-XDP).
I am not sure but is it possible that some "side traffic" comes up to userspace (for example some ping-packages or IGMP-queries) thus messing up my RTP-Sequencenumber tracking? Even though I am filtering packets by whether they are all four: IP, UDP, have valid dest-ip and valid dest-port:

                            const struct pckt_idntfy_raw raw = {
                                .src_ip = 0, /*not used at the moment */
                                .dst_ip = iph->daddr,
                                .dst_port = udh->dest,
                                .pad = 0
                            };

                            const int *idx = bpf_map_lookup_elem(&xdp_packet_mapping, &raw);
                            
                            if(idx != NULL) {
                                if (bpf_map_lookup_elem(&xsks_map, idx)) {
                                    return bpf_redirect_map(&xsks_map, *idx, 0);
                                }
                            }

Best regards

Max
