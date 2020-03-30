Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D47A1980C0
	for <lists+xdp-newbies@lfdr.de>; Mon, 30 Mar 2020 18:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbgC3QQ4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 30 Mar 2020 12:16:56 -0400
Received: from relay0141.mxlogin.com ([199.181.239.141]:44643 "EHLO
        relay0141.mxlogin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729431AbgC3QQ4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 30 Mar 2020 12:16:56 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Mar 2020 12:16:56 EDT
Received: from filter004.mxroute.com ([149.28.56.236] 149.28.56.236.vultr.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by relay0141.mxlogin.com (ZoneMTA) with ESMTPSA id 1712c36a4a40000766.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 30 Mar 2020 16:11:50 +0000
X-Zone-Loop: 301d8b49c785929f38d8fccb3c2175100c12b189269e
X-Originating-IP: [149.28.56.236]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter004.mxroute.com (Postfix) with ESMTPS id A816F3EDAB
        for <xdp-newbies@vger.kernel.org>; Mon, 30 Mar 2020 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=84ZQ9H/H8nSkwKFgEPYC6+vZfadrqG2hjDD8shBfmRA=; b=Ijx8Brb4Zya7oG2dfX3mmcOHEc
        Y7zw4jZjZY3Jsd7l/8XZbIePyhatiDBXHzLr3zLX3NspgdoGLBsVdOfIUhIDm5Rb6/HX4jxZ4WTuB
        MRC661NgzFfqeD6umJS5FDsNlvIcdl2b0EmfcVXriOeS4yqwur0ZAmxM56HIB71olg2TUBdECZIfb
        5LXrVSNWqX2Xt04Gm/czlojkKFv6LR4eZChy7dkoMoUK6fiIOahXkpF8Hpucw6F+u03K12s0NRqFt
        NFCxxzzHaebkLhfuUFz+t+q+m8aVHePREEOscbaAjQsvtOAzaR1gXZLVthSMpxEGE5dxnef6DU1X0
        XVA9Edpw==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: Using AF_XDP To Modify Outgoing Packets
Message-ID: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
Date:   Mon, 30 Mar 2020 11:11:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,


I am fairly new to XDP and AF_XDP programming. Therefore, I apologize if 
this question sounds silly.


To my understanding, an XDP program cannot process outgoing packets 
since it doesn't support the TX path. However, I read that AF_XDP 
sockets support both receiving and transmitting packets inside the user 
space while achieving zero-copy. I am trying to create a C program that 
modifies outgoing packets on an interface and trying to do this the 
fastest way possible. Unfortunately, I cannot use IPTables for this.


I wanted to know if there is any way to use AF_XDP sockets to modify 
outgoing packets on an interface. I wasn't sure if the AF_XDP sockets 
only support receiving traffic from the XDP program when using the 
redirect function or not.


If this isn't possible, are there any plans to add TX path support into 
XDP in the future? I'm also not sure what else I can do to achieve fast 
packet processing for this. I looked into using standard AF_PACKET 
sockets. However, since that makes a copy of the packet from the kernel, 
I'd assume that's pretty slow and I'd have to find a way to block the 
original packets (probably doing something with IPTables). I might also 
look into DPDK, but I want to see if using AF_XDP sockets for outgoing 
packet processing is possible first because it looks like it's going to 
take a while to learn DPDK.


Any help is highly appreciated and thank you for your time!



