Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41A927B0E2
	for <lists+xdp-newbies@lfdr.de>; Mon, 28 Sep 2020 17:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgI1PZW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 28 Sep 2020 11:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26129 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726716AbgI1PZT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 28 Sep 2020 11:25:19 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601306718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Z3LDaOJB556mNdnYqLMmB/vOKHZUuSYoVPJERvS9AY=;
        b=JRi95pdUYydZCa26YfoA9nkWjkZqXTOJ/f4zTRrzZc+r3si83oXOjFRsjQrPSU6abn/06+
        91GzKD12zr26NbQLjAMPHTtvFrTIK48NDTG9u3lZL/S5xmYdSreQ6C6bH0kGjiMI83kvzw
        WHReDs02SwK/bky4SztvrE8K8VmfBb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-PbjdKbOMOPqHw65r-iHUTg-1; Mon, 28 Sep 2020 11:25:00 -0400
X-MC-Unique: PbjdKbOMOPqHw65r-iHUTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E467E1005513;
        Mon, 28 Sep 2020 15:24:58 +0000 (UTC)
Received: from carbon (unknown [10.36.110.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC765576E;
        Mon, 28 Sep 2020 15:24:50 +0000 (UTC)
Date:   Mon, 28 Sep 2020 17:24:49 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     David Ahern <dsahern@gmail.com>,
        Sven Auhagen <sven.auhagen@voleatech.de>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        intel-wired-lan@lists.osuosl.org
Cc:     brouer@redhat.com, ThomasPtacek@gmail.com,
        Toke =?UTF-8?B?SMO4aWxhbmQt?= =?UTF-8?B?SsO4cmdlbnNlbg==?= 
        <toke@redhat.com>, xdp-newbies@vger.kernel.org
Subject: Re: bpf_redirect and xdpgeneric
Message-ID: <20200928172449.50a3e755@carbon>
In-Reply-To: <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
        <87lfh7fkqs.fsf@toke.dk>
        <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
        <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 18 Sep 2020 14:27:45 -0600
David Ahern <dsahern@gmail.com> wrote:

> On 9/18/20 12:42 PM, Thomas Ptacek wrote:
> > The setup is pretty simple. There's an eno1 (igb driver), to which our
> > default route points. On the same box are several VMs. There's a tap
> > interface (for each VM, call it tapX). Traffic for a VM flows in from
> > the Internet on eno1 and is directed to tapX; the response traffic
> > flows in the other direction.
> > 
> > I'm deliberately simplifying here:
> > 
> > eno1 runs an XDP program that does some lightweight IP rewriting from
> > anycast addresses to internal VM addresses on ingress. eno1's XDP
> > program currently XDP_PASS's rewritten packets to the IP stack, where
> > they're routed to the VM's tap. This works fine.
> > 
> > tapX runs an XDP program that does the same rewriting in reverse.
> > Right now, it also XDP_PASS's packets to the stack, which also works
> > --- the stack routes response traffic out eno1.
> > 
> > I'm playing with XDP_REDIRECT'ing instead of XDP_PASS'ing.
> > 
> > I have the ifindexes and MAC addresses (and those of IP neighbors) in
> > a map --- a normal HASH map, not a DEVMAP. Using that map, I can
> > successfully redirect traffic from tapX to arbitrary other tap
> > interfaces. What I can't do is redirect packets from tapX to eno1,
> > which is what the system actually needs to do.
> >   
> 
> XDP_REDIRECT sends the packet to a devices ndo_xdp_xmit function. tap
> implements it hence eno1 -> tap works; igb does not meaning tap -> eno1
> fails.

There is clearly a real-life use-case for adding native-XDP support for
igb driver.  Sven (cc) have implemented this (v6[1]), but something is
causing this patch to not move forward, what is stalling Intel maintainers?

To Thomas, you could try out the patch[2] and report back if it works
for you?  (I think it will help moving patch forward...)

[1] https://lore.kernel.org/netdev/20200902054509.23jbv5fyj3otziq2@svensmacbookair.sven.lan/
[2] http://patchwork.ozlabs.org/project/netdev/patch/20200902054509.23jbv5fyj3otziq2@svensmacbookair.sven.lan/
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

