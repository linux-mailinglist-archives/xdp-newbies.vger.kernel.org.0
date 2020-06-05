Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D261EF7B4
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jun 2020 14:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgFEM2x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Fri, 5 Jun 2020 08:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgFEM0B (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jun 2020 08:26:01 -0400
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [IPv6:2001:4ca0:0:103::81bb:ff89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEE4C08C5C3
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 05:26:00 -0700 (PDT)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49dhh512vLzyYl;
        Fri,  5 Jun 2020 14:25:57 +0200 (CEST)
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
        with LMTP id mHRmHI2tDk6X; Fri,  5 Jun 2020 14:25:56 +0200 (CEST)
Received: from BADWLRZ-SWMBX06.ads.mwn.de (BADWLRZ-SWMBX06.ads.mwn.de [IPv6:2001:4ca0:0:108::162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX06", Issuer "BADWLRZ-SWMBX06" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49dhh46bfpzyWW;
        Fri,  5 Jun 2020 14:25:56 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX06.ads.mwn.de (2001:4ca0:0:108::162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Fri, 5 Jun 2020 14:25:56 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Fri, 5 Jun 2020 14:25:56 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "Raczynski, Piotr" <piotr.raczynski@intel.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "lihong.yang@intel.com" <lihong.yang@intel.com>
CC:     Xdp <xdp-newbies@vger.kernel.org>
Subject: AW: Intel X520 looses ethtool flow-type rule the moment a BPF / XDP
 program is loaded
Thread-Topic: Intel X520 looses ethtool flow-type rule the moment a BPF / XDP
 program is loaded
Thread-Index: AQHWOyon4hZVPYvzk0ifXX+vh3PLTqjJyS8AgAAicRX//+JzAIAAJCet
Date:   Fri, 5 Jun 2020 12:25:56 +0000
Message-ID: <bf2f8889ebd343edaf44a43f0d1f4c8b@hm.edu>
References: <a5741e0f3b90422f8c53a8bd54f06d8a@hm.edu>
 <CAJ8uoz3V1F4MB9yprixAReFqPCW9bE4SbV58Gs-D7qdSXtz6sg@mail.gmail.com>
 <0d6aad4ae9f9484cb158845d73c37f5d@hm.edu>,<CAJ8uoz3d3u0MxVAFxpRjZzVTR41aHBu879FPFA0Z4uUL=6sQqg@mail.gmail.com>
In-Reply-To: <CAJ8uoz3d3u0MxVAFxpRjZzVTR41aHBu879FPFA0Z4uUL=6sQqg@mail.gmail.com>
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

> I do not use this card in my AF_XDP lab setup, so unforuately I do not
> know. I have included some persons from the networking division at
> Intel. They might know of a "known issues" page or somewhere where you
> can bug report this.
> 
> /Magnus

Thank you so much!

One more question: Does the 82599ES 10Gbit/s NIC have similiar issues with XDP and ethtool?

Best regards

Max
