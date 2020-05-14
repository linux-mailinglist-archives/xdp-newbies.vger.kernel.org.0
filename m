Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E71D2F1E
	for <lists+xdp-newbies@lfdr.de>; Thu, 14 May 2020 14:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgENMEF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 14 May 2020 08:04:05 -0400
Received: from postout1.mail.lrz.de ([129.187.255.137]:38729 "EHLO
        postout1.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENMEE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 14 May 2020 08:04:04 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49N9Dt3p7FzyWF
        for <xdp-newbies@vger.kernel.org>; Thu, 14 May 2020 14:03:58 +0200 (CEST)
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
        LRZ_HAS_SPF=0.001, LRZ_HAS_THREAD_INDEX=0.001,
        LRZ_HAS_X_ORIG_IP=0.001, LRZ_MSGID_HL32=0.001,
        LRZ_RCVD_BADWLRZ_EXCH=0.001, LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5,
        RDNS_NONE=0.793, SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
        by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id PA99BqxOz5QE for <xdp-newbies@vger.kernel.org>;
        Thu, 14 May 2020 14:03:58 +0200 (CEST)
Received: from BADWLRZ-SWMBB04.ads.mwn.de (BADWLRZ-SWMBB04.ads.mwn.de [IPv6:2001:4ca0:0:108::155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBB04", Issuer "BADWLRZ-SWMBB04" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49N9Dt2GgTzyRs
        for <xdp-newbies@vger.kernel.org>; Thu, 14 May 2020 14:03:58 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBB04.ads.mwn.de (2001:4ca0:0:108::155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Thu, 14 May 2020 14:03:57 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Thu, 14 May 2020 14:03:57 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Under which circumstances does `xsk_ring_prod__reserve` return 0?
Thread-Topic: Under which circumstances does `xsk_ring_prod__reserve` return
 0?
Thread-Index: AQHWKeNWeSHDRZhDOEaLrf8LLyjllw==
Date:   Thu, 14 May 2020 12:03:57 +0000
Message-ID: <ca3de1dca95241dda545c032a42b0152@hm.edu>
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

Hello,

I have this system which handles multiple multicast-streams at once where the user can choose the amount of RX-Queues of the NIC he wants to utilize.

I am testing the scenario where only one RX-Queue is used. Thus, shared umem is used.

At the time a user decides to receive the first multicast-stream, a program ("AF-XDP") is launched by another program ("handler") which handles the user inputs.
This AF-XDP program receives information about a Linux System V message queue through command line arguments.
The first thing the AF-XDP program does is to map a shared memory segment and configuring a umem with it.
After the program launched successfully, the handler sends a message to said queue telling the AF-XDP program to create a new XSK and place its file descriptor into a certain index in the XDP map.
The XSK runs in a separate thread checking every millisecond for packets and sending information about those packet addresses in umem to the handler-program.

To this point, everything works fine. But as soon as the user decides to receive another multicast-stream on the same RX-Queue, `xsk_ring_prod__reserve` suddenly starts to return 0 (e.g. it wasn't able to reserve any packets) even if I call this function a hundred times.
So of course to create another XSK, I have to call `xsk_socket__create` which also takes the umem as an argument.
As this system is running in parallel I was wondering if this problem can occur because suddenly another XSK is registered at the same time as the first XSK tries to register umem frames for its packets?

Best regards

Max
