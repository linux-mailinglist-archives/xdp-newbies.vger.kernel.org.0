Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F01198308
	for <lists+xdp-newbies@lfdr.de>; Mon, 30 Mar 2020 20:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgC3SKu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 30 Mar 2020 14:10:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:58850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726312AbgC3SKu (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 30 Mar 2020 14:10:50 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CE2F20771;
        Mon, 30 Mar 2020 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585591850;
        bh=eczrMp829xZkDRffIH4Tnw1hWH7HbM7J1DsN8j+6PgE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YCoOqXD/ExDzD0UiwgCpb3cm0AARbTobYhwUqqGmC3F/L/q7oliwHK7T/JqIPl9/7
         0V0FQT+x4KhFgxzVxGKtoBBq/5dqPHnepg52x927mQ5MDrS2bkKdKxESCoF0Ln6Itg
         XlC1lG77gwDoeA4SGkKNZcgK3HpeoJDLVkkEvaKM=
Date:   Mon, 30 Mar 2020 11:10:48 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Using AF_XDP To Modify Outgoing Packets
Message-ID: <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 30 Mar 2020 11:11:49 -0500 Christian Deacon wrote:
> Hey everyone,
> 
> 
> I am fairly new to XDP and AF_XDP programming. Therefore, I apologize if 
> this question sounds silly.
> 
> 
> To my understanding, an XDP program cannot process outgoing packets 
> since it doesn't support the TX path. However, I read that AF_XDP 
> sockets support both receiving and transmitting packets inside the user 
> space while achieving zero-copy. I am trying to create a C program that 
> modifies outgoing packets on an interface and trying to do this the 
> fastest way possible. Unfortunately, I cannot use IPTables for this.
> 
> 
> I wanted to know if there is any way to use AF_XDP sockets to modify 
> outgoing packets on an interface. I wasn't sure if the AF_XDP sockets 
> only support receiving traffic from the XDP program when using the 
> redirect function or not.
> 
> 
> If this isn't possible, are there any plans to add TX path support into 
> XDP in the future? I'm also not sure what else I can do to achieve fast 
> packet processing for this. I looked into using standard AF_PACKET 
> sockets. However, since that makes a copy of the packet from the kernel, 
> I'd assume that's pretty slow and I'd have to find a way to block the 
> original packets (probably doing something with IPTables). I might also 
> look into DPDK, but I want to see if using AF_XDP sockets for outgoing 
> packet processing is possible first because it looks like it's going to 
> take a while to learn DPDK.
> 
> 
> Any help is highly appreciated and thank you for your time!

Could you give us some more info on the use case? Where do the packets
originate? The main advantage of XDP is that it processes packets
before the metadata needed by the networking stack is allocated (skb).
This is only possible for RX or when packets are redirected from
another interface with XDP. All packets which pass through the stack
anyway can be efficiently modified using cls_bpf.

