Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376F61EE336
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 13:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgFDLRP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 4 Jun 2020 07:17:15 -0400
Received: from postout1.mail.lrz.de ([129.187.255.137]:59695 "EHLO
        postout1.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgFDLRO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 07:17:14 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49d3CC758vzyWL
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 13:17:11 +0200 (CEST)
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
        with LMTP id IXU_sW5OOy-F for <xdp-newbies@vger.kernel.org>;
        Thu,  4 Jun 2020 13:17:11 +0200 (CEST)
Received: from BADWLRZ-SWMBX06.ads.mwn.de (BADWLRZ-SWMBX06.ads.mwn.de [IPv6:2001:4ca0:0:108::162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX06", Issuer "BADWLRZ-SWMBX06" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49d3CC5YvPzySZ
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 13:17:11 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX06.ads.mwn.de (2001:4ca0:0:108::162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Thu, 4 Jun 2020 13:17:11 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Thu, 4 Jun 2020 13:17:11 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Dynamically adding new multicast streams
Thread-Topic: Dynamically adding new multicast streams
Thread-Index: AQHWOmDSFeau4eh55ECLStnDR/CCmw==
Date:   Thu, 4 Jun 2020 11:17:11 +0000
Message-ID: <dd7946c400c544feac167dab0ff4f974@hm.edu>
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

Hello everyone,

I try to dynamically add new multicast streams by creating a new AF-XDP socket bound to a RX-Queue.
I also create a new ethtool-rule to steer the flow of the multicast stream towards that RX-Queue.

My BPF program has a Hash-Map which maps a struct consisting of { src-ip, dst-ip, dst-port } to an index in the XSKMap (which is then used to redirect an incoming packet).
So adding a new AF-XDP socket also means adding a new entry to that Hash-Map (and to the XSKMap).

Now what I am experiencing is that the moment I add a new XSK, other already running sockets are loosing some packets (around 10ms worth of packets).
I don't experience any packet loss afterwards.

My question is: Is there something happening inside the XSK- or HashMap which could cause other packet streams to drop packets?

I am not using Shared Umem, just launching a new process which starts that XSK.

Best regards

Max
