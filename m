Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2FB1EEB84
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 22:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgFDUGl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 4 Jun 2020 16:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgFDUGl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 16:06:41 -0400
X-Greylist: delayed 29235 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 04 Jun 2020 13:06:40 PDT
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [IPv6:2001:4ca0:0:103::81bb:ff89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FDFC08C5C0
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 13:06:40 -0700 (PDT)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49dGy74SxjzyWp
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 22:06:39 +0200 (CEST)
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
        with LMTP id VtJhQzV7H5ky for <xdp-newbies@vger.kernel.org>;
        Thu,  4 Jun 2020 22:06:39 +0200 (CEST)
Received: from BADWLRZ-SWMBB04.ads.mwn.de (BADWLRZ-SWMBB04.ads.mwn.de [IPv6:2001:4ca0:0:108::155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBB04", Issuer "BADWLRZ-SWMBB04" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49dGy72nMJzyWd
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 22:06:39 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBB04.ads.mwn.de (2001:4ca0:0:108::155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Thu, 4 Jun 2020 22:06:38 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Thu, 4 Jun 2020 22:06:39 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: AW: Intel 10G 2P X520 Adapter doesn't receive anything with AF XDP
Thread-Topic: Intel 10G 2P X520 Adapter doesn't receive anything with AF XDP
Thread-Index: AQHWOqPu+5xj7fx2CEmhKaGvaWOLCajI4FEI
Date:   Thu, 4 Jun 2020 20:06:38 +0000
Message-ID: <be214a8beb65491eb69333eb29eca537@hm.edu>
References: <7ec53b8f30524ffba36bb264c6d023fc@hm.edu>
In-Reply-To: <7ec53b8f30524ffba36bb264c6d023fc@hm.edu>
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

> Best regards
> 
> Max

A small update. I disabled the ethtool ntuple rule which steers the multicast packets to a specific RX-Queue and let the program run for 2 minutes.
After 2 minutes or so I looked at the BPF map again and saw this:

		$ sudo bpftool map dump id 41
		key: 00 00 00 00  value: eb 00 00 00 00 00 00 00
		key: 01 00 00 00  value: 6b 00 00 00 00 00 00 00
		key: 02 00 00 00  value: 18 00 00 00 00 00 00 00
		key: 03 00 00 00  value: 01 00 00 00 00 00 00 00
		key: 04 00 00 00  value: 17 00 00 00 00 00 00 00
		key: 05 00 00 00  value: 3a 00 00 00 00 00 00 00
		key: 06 00 00 00  value: 65 00 00 00 00 00 00 00
		key: 07 00 00 00  value: 3c 7a 89 01 00 00 00 00
		key: 08 00 00 00  value: 02 00 00 00 00 00 00 00
		key: 09 00 00 00  value: 12 00 00 00 00 00 00 00
		key: 0a 00 00 00  value: 55 00 00 00 00 00 00 00
		key: 0b 00 00 00  value: 14 00 00 00 00 00 00 00
		key: 0c 00 00 00  value: 2c 00 00 00 00 00 00 00
		key: 0d 00 00 00  value: 00 00 00 00 00 00 00 00
		key: 0e 00 00 00  value: 1b 00 00 00 00 00 00 00

As you can see, the multicast stream is probably landing on RX-Queue 7 (unfortunately my XSK-Program is waiting for packets on RX-Queue 0) but somehow delayed for 1 or 2 minutes.

In case I enable ntuple via

                 ethtool -K eth5 ntuple on

and add the ethtool ntuple rule back, wait for 2 minutes again, I get this:

		$ sudo bpftool map dump id 46
		key: 00 00 00 00  value: 6f 16 00 00 00 00 00 00
		key: 01 00 00 00  value: 43 00 00 00 00 00 00 00
		key: 02 00 00 00  value: 0d 00 00 00 00 00 00 00
		key: 03 00 00 00  value: 00 00 00 00 00 00 00 00
		key: 04 00 00 00  value: 0e 00 00 00 00 00 00 00
		key: 05 00 00 00  value: 24 00 00 00 00 00 00 00
		key: 06 00 00 00  value: 34 00 00 00 00 00 00 00
		key: 07 00 00 00  value: 7d 05 00 00 00 00 00 00
		key: 08 00 00 00  value: 01 00 00 00 00 00 00 00
		key: 09 00 00 00  value: 0a 00 00 00 00 00 00 00
		key: 0a 00 00 00  value: 30 00 00 00 00 00 00 00
		key: 0b 00 00 00  value: 0e 00 00 00 00 00 00 00
		key: 0c 00 00 00  value: 1b 00 00 00 00 00 00 00
		key: 0d 00 00 00  value: 00 00 00 00 00 00 00 00
		key: 0e 00 00 00  value: 0a 00 00 00 00 00 00 00

As you can see, no indicator for a multicast stream with lots of packets :(

Something is wrong here...

    
