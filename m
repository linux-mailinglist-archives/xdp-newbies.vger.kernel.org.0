Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A753C7C6B
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Jul 2021 05:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbhGNDLB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Jul 2021 23:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbhGNDLB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Jul 2021 23:11:01 -0400
Received: from telegrapho.inexo.com.br (unknown [IPv6:2001:12c4:f0da:5e:216:3eff:feff:56a4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3FFF2C0613DD
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Jul 2021 20:08:09 -0700 (PDT)
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 8582D7AC4477; Wed, 14 Jul 2021 00:08:05 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 8582D7AC4477
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1626232085;
        bh=1sBDOFkPtvEGBGBDxGO9vCIY4jkcx5xS3yO8CIjgB1U=;
        h=Date:From:To:Subject:From;
        b=qAvld4NXYPM2Qsz2C5IFmma3ey7+eyyEOk+zyK2y470MIU3hQVPVEGQo7QTTCbuUb
         qry6Z9vMdXm54GfH7/L+M6nlLGAQvJ9l+X7kKLWPFIR9NYC+fmwvXUgZ+Vvsgu+o5W
         tjKxIZ4HUiu4/CN8hksE3s6gkfgr1eUgfHPrqqLxMZuXI9ZoewsMCBfUyReG58IIKL
         RofFKjhX9Zv3uEaisiMTS8xzkOcfxOXm15ZAnRtHwcS+URUVCDY+ywcKb99OSRxPrv
         nv7WfdkCRGnAu3kxYIU9DWCbSO+YdGX+KJHdcazJp0w4SGHqG/2G5v0g1QKHUMD0pt
         6vNFJPv621KFw==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 54FF37AC4475
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Jul 2021 00:08:05 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 54FF37AC4475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1626232085;
        bh=1sBDOFkPtvEGBGBDxGO9vCIY4jkcx5xS3yO8CIjgB1U=;
        h=Date:From:To:Subject:From;
        b=qAvld4NXYPM2Qsz2C5IFmma3ey7+eyyEOk+zyK2y470MIU3hQVPVEGQo7QTTCbuUb
         qry6Z9vMdXm54GfH7/L+M6nlLGAQvJ9l+X7kKLWPFIR9NYC+fmwvXUgZ+Vvsgu+o5W
         tjKxIZ4HUiu4/CN8hksE3s6gkfgr1eUgfHPrqqLxMZuXI9ZoewsMCBfUyReG58IIKL
         RofFKjhX9Zv3uEaisiMTS8xzkOcfxOXm15ZAnRtHwcS+URUVCDY+ywcKb99OSRxPrv
         nv7WfdkCRGnAu3kxYIU9DWCbSO+YdGX+KJHdcazJp0w4SGHqG/2G5v0g1QKHUMD0pt
         6vNFJPv621KFw==
Date:   Wed, 14 Jul 2021 00:08:04 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: bpf_debug output
Message-ID: <20210714000804.426ed1f5@babalu>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Hi! 

I am working on some minor modifications in xdp-cpumap-tc to accommodate NAT at WAN side.
But the things are not working as expected.

How can bpf_debug be used to help debugging?

I read that its output ends-up in /sys/kernel/debug/tracing/trace_pipe.
But how can it be read? 
I tried "cat trace_pipe" but this produced no output whatsoever.

Any hints will be appreciated.

Thanx

Regards

Ethy
