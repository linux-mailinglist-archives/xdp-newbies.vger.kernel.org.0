Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6E81EF656
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jun 2020 13:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgFELRg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Fri, 5 Jun 2020 07:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgFELRf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jun 2020 07:17:35 -0400
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [IPv6:2001:4ca0:0:103::81bb:ff89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04369C08C5C2
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 04:17:35 -0700 (PDT)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
        by postout1.mail.lrz.de (Postfix) with ESMTP id 49dg9960T3zyZG
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 13:17:33 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
        by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id x2dHLChTK6el for <xdp-newbies@vger.kernel.org>;
        Fri,  5 Jun 2020 13:17:33 +0200 (CEST)
Received: from BADWLRZ-SWMBX04.ads.mwn.de (BADWLRZ-SWMBX04.ads.mwn.de [IPv6:2001:4ca0:0:108::160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX04", Issuer "BADWLRZ-SWMBX04" (not verified))
        by postout1.mail.lrz.de (Postfix) with ESMTPS id 49dg994ML8zyZ5
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 13:17:33 +0200 (CEST)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX04.ads.mwn.de (2001:4ca0:0:108::160) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Fri, 5 Jun 2020 13:17:33 +0200
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1979.003; Fri, 5 Jun 2020 13:17:33 +0200
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Intel X520 looses ethtool flow-type rule the moment a BPF / XDP
 program is loaded
Thread-Topic: Intel X520 looses ethtool flow-type rule the moment a BPF / XDP
 program is loaded
Thread-Index: AQHWOyon4hZVPYvzk0ifXX+vh3PLTg==
Date:   Fri, 5 Jun 2020 11:17:33 +0000
Message-ID: <a5741e0f3b90422f8c53a8bd54f06d8a@hm.edu>
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

I have an Intel X520 10Gbit/s NIC with driver:

		$ sudo ethtool -i eth5
		driver: ixgbe
		version: 5.7.1
		firmware-version: 0x80000827, 16.5.19
		expansion-rom-version: 
		bus-info: 0000:04:00.1
		supports-statistics: yes
		supports-test: yes
		supports-eeprom-access: yes
		supports-register-dump: yes
		supports-priv-flags: yes

and Kernel:

		$ uname -a
		Linux 5.6.0-2-amd64

I tried this tutorial before hand: https://software.intel.com/content/www/us/en/develop/articles/setting-up-intel-ethernet-flow-director.html

Unfortunately I am experiencing some strange behavior in combination with AF_XDP.

For example, I am adding an ethtool flow-type rule like this:

		$ sudo ethtool -N eth5 flow-type udp4 dst-ip 239.0.1.1 dst-port 5500 action 0
		Added rule with ID 4093

Checking it is there:

		$ sudo ethtool -n eth5
		16 RX rings available
		Total 1 rules

		Filter: 4093
				Rule Type: UDP over IPv4
				Src IP addr: 0.0.0.0 mask: 255.255.255.255
				Dest IP addr: 239.0.1.1 mask: 0.0.0.0
				TOS: 0x0 mask: 0xff
				Src port: 0 mask: 0xffff
				Dest port: 5500 mask: 0x0
				VLAN EtherType: 0x0 mask: 0xffff
				VLAN: 0x0 mask: 0xffff
				User-defined: 0x0 mask: 0xffffffffffffffff
				Action: Direct to queue 0

After that I am launching my AF_XDP program which firsts loads a compiled BPF-object file into the kernel (without any errors).
I am checking ethtool again:

		$ sudo ethtool -n eth5
		16 RX rings available
		Total 0 rules

Any ideas why that is? I am not saying that my program is bug-free but it worked fine in combination with Mellannox ConnectX5 and Broadcom 1Gbit/s NIC (without zcopy on the broadcom though).

Thank you

Max
