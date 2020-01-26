Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4841E1498CA
	for <lists+xdp-newbies@lfdr.de>; Sun, 26 Jan 2020 05:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgAZExG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 25 Jan 2020 23:53:06 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46204 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgAZExG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 25 Jan 2020 23:53:06 -0500
Received: by mail-pg1-f193.google.com with SMTP id z124so3376456pgb.13
        for <xdp-newbies@vger.kernel.org>; Sat, 25 Jan 2020 20:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DrDjRKmQTgaDuxM6u3yhfD1/TvcyHpt5emIdpC4AZSM=;
        b=huZ5hvIH/mv2zmIaVrXuNcMO8B7IDpfzrkldr9qwULm0JyNy6vP4LPvQ98s/Twed7I
         zzGccnpjyJFMayJXqlgb/0/dZ2jN8Drz986yv915+jYa7g9eyELfPLENpDJgDFyGuGYm
         QrEq9aJinBLBI1j38wGW0mYnpqNZvE0NV4/iaf+7SgjU9sZTCFg68fFFO2V/ncjdlpg5
         0MnDvk8vgK5RkNW6V7BJh8OVwDWlLDTOfLeKuj05RZweoyRu/7RgMihAbwYoYUH8CJQH
         eNhORxUjloLSbBUtlTxJKT0Ktli88MtrvdnfawrlYbsevLUrs+t/79YMEEF3Zm6bO2nm
         eGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DrDjRKmQTgaDuxM6u3yhfD1/TvcyHpt5emIdpC4AZSM=;
        b=Q+QXehpJT/uUrl8/QrG3irm/bHa6JXoLkABSLlPsPXmZd9RscIYxRFiBfWyaX3q31i
         7Jku1Zn2jhNv4hD4/arPTmQQULw0FhbG/RSEzoNjsi8rEHmuOQmHhTvPJXG6tOkWG8Sl
         4MlDEl0PNC8kjz6oFnlMK7gb/0bqhuhsDPX0dbl2CQzclvtUWbs6NbtCKmLGSx6qbCkQ
         zwqGP4EDNJ8zCUn5Y5yiwu6X2fxj4LgXrxKewXhR+mDz+Bh3CsN3ni78aCGC/uKVwfil
         HWUURqzRc8fxK3AelYDZPc98ae1+gNq+ddtO6rkOHffRjVdaKIeFgPs3E2HVwkj6a7b+
         At7g==
X-Gm-Message-State: APjAAAWh9FQt4VHcgZHW7/8PAsc6t0ohdKon1NXeigQ4z7v5Yxez+8Wr
        eq2j9wzwAY5586b6sRyZ9EH4rw==
X-Google-Smtp-Source: APXvYqx+K0atA6KTnWro5nCZvEZ9hLO7XgJUUlr0ysC0o1lAbrDAcjxtRwzpltTY64xfWD86+YTfxg==
X-Received: by 2002:a65:5bc3:: with SMTP id o3mr12551018pgr.226.1580014385933;
        Sat, 25 Jan 2020 20:53:05 -0800 (PST)
Received: from neptune.home ([203.97.87.169])
        by smtp.gmail.com with ESMTPSA id 72sm7450381pfw.7.2020.01.25.20.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2020 20:53:05 -0800 (PST)
Message-ID: <03dce571f7c17726938daaf0fa576d75b2a5f90f.camel@coverfire.com>
Subject: Re: zero-copy between interfaces
From:   Dan Siemon <dan@coverfire.com>
To:     Ryan Goodfellow <rgoodfel@isi.edu>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Date:   Sat, 25 Jan 2020 23:53:00 -0500
In-Reply-To: <20200118140857.GA9363@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
         <20200113124134.3974cbed@carbon> <20200113152759.GD68570@smtp.ads.isi.edu>
         <20200113180411.24d8bd40@carbon> <20200117175409.GC69024@smtp.ads.isi.edu>
         <20200118111405.28fd1c75@carbon> <20200118140857.GA9363@smtp.ads.isi.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, 2020-01-18 at 09:08 -0500, Ryan Goodfellow wrote:
> On Sat, Jan 18, 2020 at 11:14:05AM +0100, Jesper Dangaard
> Brouerwrote:
> > 
> > I'm wondering why did you choose/need AF_XDP technology for doing
> > forwarding?
> 
> This is just a sample program used to demonstrate moving packets
> between
> different interfaces efficiently using AF_XDP.
> 
> Our actual use case is performing network emulation in userspace. For
> example,
> representing impaired links or entire networks with link-by-link
> shaping
> specifications. We are using AF_XDP to get packets to/from our
> network emulation
> software as quickly as possible without having to go through the
> entire network
> stack, as the emulation host's network configuration does not
> influence the
> networks it's emulating.
> 
> Traditionally we've used DPDK for this, but are porting to AF_XDP for
> the 
> relative simplicity and flexibility it provides. Some specific
> benefits for us
> are:
> 
> - Can attach to VTEPs which allows us to hook into some EVPN/VXLAN
> based
>   networks we have easily. Alternatively with the BPF program
> flexibility, we
>   also have the option to split out BGP control plane traffic from
> overlay
>   traffic when attaching to the physical interface and pass it
> through to the 
>   kernel. Both of these approaches let the kernel manage the FDB for
> VTEPs as 
>   well as taking care of encap/decap (potentially offloaded to the
> NIC itself) 
>   and let our software focus on emulation.
> 
> - Using XDP in virtual machines in our testing environment is
> straightforward,
>   while this is possible with DPDK and virtio, the setup was rather
> convoluted.

I'm in a very similar situation. The per-packet work we do is
complicated. Doing it all in BPF would be much more painful if even
possible. For us, AF_XDP is a nice, simple DPDK. We have no need for
BPF in the AF_XDP path.


