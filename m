Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4FB145E67
	for <lists+xdp-newbies@lfdr.de>; Wed, 22 Jan 2020 23:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgAVWLK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 22 Jan 2020 17:11:10 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36101 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgAVWLK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 22 Jan 2020 17:11:10 -0500
Received: by mail-pl1-f193.google.com with SMTP id a6so413257plm.3
        for <xdp-newbies@vger.kernel.org>; Wed, 22 Jan 2020 14:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=rZfDq/DHrDuW8PlSBWxmRGFO6BP8xzqBn2K5wcB3pH8=;
        b=pWfe/yjshwKFdxHWolX/AVSMBf6pXoephLHT6yeFf9NbNpYdV10UIHrz/UHKZbefP4
         /a5TMAKiIbX+UqLTURTWt4eMjHOwVLfDfarpG8wM4viObq3jCiTdLtDlqVKylKISvH/4
         PrcbmzyS8Dkq7QUhpZVPhz6ZoN74hmcnPAbDIeFc26kzYVguYToJDEhXLnZw2QWupQCo
         FA85d+QJ+dF+b45ODk1uhbNM8c9Aa2/dKEUTKVpI4mV1O6gveihihGc4TCOLdczAgKYy
         imIoyTl9r6Xi06ewi9pcXZlA/UPEWoNk/HyNvatcTPN6s2685Ob2s0h44LDh8plmsgBp
         YEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=rZfDq/DHrDuW8PlSBWxmRGFO6BP8xzqBn2K5wcB3pH8=;
        b=adx29XvBkELM6KQr7VG0M69Wrdst2RJnSS8c4PUBFrLy8bEhMM7X3F5oeywr8MZr89
         FHUUUe8RMneOc9QRyKliPe8rlWTbI7CYLtA1UWOrsNkj6fhSExWsS5ltmsGkyxkfAlN4
         madN+zbyAINXDOQRBUn1FSsVDwLJtdAbZtePAWsRB1nSBWoxvqbxACTXEN7Mw5NE25Z1
         wjDpJS1Jrpo39Yt3PaFFtoe2scYi7V21VsV9FThbBMs2iQtIqLcRtpQFjGHbaGLhBStW
         v9Xr0PF75BZhxgD1hnWXu4+bhPAH3JTu0klVndQRvNl4A7BcJvyd4xe89TdoA1N1oLFL
         ePVQ==
X-Gm-Message-State: APjAAAXer0L3nU0DQRZSzhIBggjM3YFbnsXbp+dAXKrcAKYdDvi+k8RS
        YwPrZVfkEpVBclKyzpsg0cw=
X-Google-Smtp-Source: APXvYqzWIOfBtIKsrMGxZ1jE7e+pINNIgsz/2I36/zt9W+yn2R5JO2A2A23b9WgNZIGvUN1fm4RAhQ==
X-Received: by 2002:a17:90a:d081:: with SMTP id k1mr737368pju.57.1579731069999;
        Wed, 22 Jan 2020 14:11:09 -0800 (PST)
Received: from [192.168.1.25] (c-71-231-121-172.hsd1.wa.comcast.net. [71.231.121.172])
        by smtp.gmail.com with ESMTPSA id n188sm45741pga.84.2020.01.22.14.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 14:11:09 -0800 (PST)
From:   Vincent Li <mchun.li@gmail.com>
X-Google-Original-From: Vincent Li <guzheng@gmail.com>
Date:   Wed, 22 Jan 2020 14:11:07 -0800 (PST)
X-X-Sender: guzheng@jiadeimac.local
To:     Christian Deacon <gamemann@gflclan.com>
cc:     xdp-newbies@vger.kernel.org
Subject: Re: Measuring/Debugging XDP Performance
In-Reply-To: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
Message-ID: <alpine.OSX.2.21.2001221405250.1261@jiadeimac.local>
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On Wed, 22 Jan 2020, Christian Deacon wrote:

> Hey everyone,
> 
> I am new to XDP + AF_XDP (along with C programming in general), but I am very
> interested in it and I've been learning a lot recently. I own an Anycast
> network and our POP servers are running custom software our developer created
> that processes packets using XDP. This software basically forwards specific
> traffic to another machine via an IPIP tunnel. One issue I've been noticing is
> the packets our software is processing and forwarding to another machine keep
> dropping at higher traffic loads. I can't tell if this is dropping at the POP
> level or if the machine the software is forwarding this specific traffic to
> is. I've even tried upgrading the POP server from a two-core VPS (2.5 GHz
> CPUs) to a dedicated server (Intel E3-1230v6 @ 3.5 GHz, 4 cores, and 8
> threads). If this is being dropped at the POP level, I'm wondering if the
> software is being limited to one core on this specific POP (other POPs are
> able to use more than one core specifically). However, I have no way to
> confirm that. To my understanding XDP programs should be able to use more than
> one core.
> 
> My questions are the following:
> 
> 1. Is there a way to see how much CPU the XDP program is using or the load of
> the NIC? To my understanding, you cannot tell the XDP program's CPU usage
> based off of something like `top` or `htop` due to that being in the user
> space (XDP happens at the NIC driver level in the kernel IIRC).

I am newbie in XDP too, maybe Linux 
Perf http://www.brendangregg.com/perf.html tool could help you figuring 
out which part of the code in your XDP app consuming CPU cycles (debug 
symbol needed)
