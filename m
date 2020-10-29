Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDA029F0A3
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Oct 2020 16:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgJ2P7M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 29 Oct 2020 11:59:12 -0400
Received: from lists.nic.cz ([217.31.204.67]:59508 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727290AbgJ2P7L (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Oct 2020 11:59:11 -0400
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Oct 2020 11:59:11 EDT
Received: from [IPv6:2a02:768:2d1c:226::a2e] (unknown [IPv6:2a02:768:2d1c:226::a2e])
        by mail.nic.cz (Postfix) with ESMTPSA id DF0BB140837
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Oct 2020 16:50:10 +0100 (CET)
To:     xdp-newbies@vger.kernel.org
From:   =?UTF-8?B?VmxhZGltw61yIMSMdW7DoXQ=?= <vladimir.cunat@nic.cz>
Subject: Kernel crashes with AF_XDP on localhost interface
Message-ID: <207d6feb-2a04-cf90-4fbc-3273e8d218a2@nic.cz>
Date:   Thu, 29 Oct 2020 16:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello.

On some machines we're getting into problems when using AF_XDP on the
localhost interface.  For example a repeated kernel panic on
5.9.1.arch1-1: https://imgur.com/a/1APC10C

The code seems to work even on localhost on another machine (some 5.4
kernel, different distro) and previous testing on more realistic cases
also didn't have this problem (i40e and ixgbe, different kernels
again)... though that's no _real_ proof that that our code doesn't do
something "weird".

Any suggestion what to do next?  (We certainly don't have resources to
understand the kernel-side code.)


BTW, AF_XDP seems to work out great for our Knot DNS
https://www.knot-dns.cz/benchmark/ (even in .cz TLD production) and
we're now finishing the same for Knot Resolver.

--Vladimir


