Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B9D481C07
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Dec 2021 13:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239191AbhL3M1R (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Dec 2021 07:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239239AbhL3M1Q (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Dec 2021 07:27:16 -0500
X-Greylist: delayed 347 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Dec 2021 04:27:15 PST
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAB8C061574
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Dec 2021 04:27:15 -0800 (PST)
Received: from [IPv6:2001:1488:fffe:6:3401:de9e:a364:2ec3] (unknown [IPv6:2001:1488:fffe:6:3401:de9e:a364:2ec3])
        by mail.nic.cz (Postfix) with ESMTPSA id 0778714087E
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Dec 2021 13:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1640866885; bh=dF93fFq+jKrJRCQNP9kY9HXAPb+Odg9DsHKtTDpI9SQ=;
        h=To:From:Date;
        b=uHW98Iw7fC+vfOLuyeNywzch1tBUrBDfSu/BDEZNzzPwTyLuWw5yQGUgMG9WZKx80
         NMm82cEV2CtQ/Ac+CDhm2mG9Hc9mH7frbFndjP4E3Hg7kZRsjG9Cqcbq+rs4CEqtt5
         Z5HsRlXW0r4FaD+kiPIzf+sLPoUxsNOOdsN15X/8=
To:     xdp-newbies@vger.kernel.org
From:   Daniel Salzman <daniel.salzman@nic.cz>
Subject: NIC rx/tx ring size vs XSK rx/tx ring size
Message-ID: <e33c8463-ed31-a2b7-f8d6-5275da05b777@nic.cz>
Date:   Thu, 30 Dec 2021 13:21:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.4 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

Please what is the relation between NIC ring sizes and XDP socket ring sizes?
If my app sets XDP_RX_RING and XDP_TX_RING, what are the optimal values for ethtool -G rx/tx?

Also I don't understand why changing TX ring size changes some XDP ring size for the ice driver (Kernel 5.13):
[  424.542118] ice 0000:41:00.0 enp65s0f0: Changing Tx descriptor count from 256 to 2048
[  424.542176] ice 0000:41:00.0 enp65s0f0: Changing XDP descriptor count from 256 to 2048   <- What is that?

In the case of the i40e driver, there is no XDP ring logged:
[847243.925269] i40e 0000:81:00.0 enp129s0f0: Changing Tx descriptor count from 256 to 2048.

Thank you,
Daniel

