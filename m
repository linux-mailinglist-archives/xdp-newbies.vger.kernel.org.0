Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166393AFA97
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Jun 2021 03:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFVBab (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Jun 2021 21:30:31 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:50718 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFVBaa (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Jun 2021 21:30:30 -0400
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id CD1236690B13; Mon, 21 Jun 2021 22:28:09 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br CD1236690B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624325289;
        bh=wO7Re+BKEbrOpSE+3p2J2p2Kc/HHTyCaAhlLklM4B4A=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=a+nNBnNOBqLkWW5x9j7GOHIeSIj3XkLZH8ZksDCdabGJbcmSl/+PYdxXSOd+T8h06
         Q/cRsQBDOdsCUElJx5I/TtuV8d5Z1P0cj3r/RtU2mlQD7IXkBVKZ9CBudcyADhHyAb
         kmIJq0AkW0J6R8ylFzC3a8YrZ4NPB5MW8wuKDH1VYjXgeDp8rYW0s+hb8Egy7vcgzb
         vM7zcHAVdTOkUzPUPU66hchHIXsfD61aRpWP4DpLsWQvkZCE892SKr1kpP1kCttpYP
         exnmJFY+pVlCYpMQehgcQZ5LONOLIZH9LlTTaHrBZYCyOXV31Gcaw01ZEeeyH4HgLG
         8jXeHOxmVwU0g==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 785476690B05;
        Mon, 21 Jun 2021 22:28:09 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 785476690B05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624325289;
        bh=wO7Re+BKEbrOpSE+3p2J2p2Kc/HHTyCaAhlLklM4B4A=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=a+nNBnNOBqLkWW5x9j7GOHIeSIj3XkLZH8ZksDCdabGJbcmSl/+PYdxXSOd+T8h06
         Q/cRsQBDOdsCUElJx5I/TtuV8d5Z1P0cj3r/RtU2mlQD7IXkBVKZ9CBudcyADhHyAb
         kmIJq0AkW0J6R8ylFzC3a8YrZ4NPB5MW8wuKDH1VYjXgeDp8rYW0s+hb8Egy7vcgzb
         vM7zcHAVdTOkUzPUPU66hchHIXsfD61aRpWP4DpLsWQvkZCE892SKr1kpP1kCttpYP
         exnmJFY+pVlCYpMQehgcQZ5LONOLIZH9LlTTaHrBZYCyOXV31Gcaw01ZEeeyH4HgLG
         8jXeHOxmVwU0g==
Date:   Mon, 21 Jun 2021 22:28:09 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Newbie questions
Message-ID: <20210621222809.2d7633cc@babalu>
In-Reply-To: <20210618173717.581e1058@babalu>
References: <20210618133106.01f2129b@babalu>
        <20210618194007.4dfb838b@carbon>
        <20210618173717.581e1058@babalu>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 18 Jun 2021 17:37:17 -0300
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> On Fri, 18 Jun 2021 19:40:17 +0200
> Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> 
> > On Fri, 18 Jun 2021 13:31:06 -0300
> > "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> >   
> > > Hi All.
> > > 
> > > I've been doing some home work reading the docs and some doubts have raised.
> > > For reference, my environment is 
> > > 	Ubuntu 20.04
> > > 	kernel 5.4.0-66 
> > > 	tc utility, iproute2-ss200127.
> > > 
> > > 1) https://xdp-project.net/areas/cpumap.html#cpumap--Create-script-MQ-HTB-silo-setup says that: 
> > > 	"XPS (Transmit Packet Steering) will take precedence over any changes to 
> > > 	skb->queue_mapping. You need to disable *XDP* via mask=00 in files 
> > > 	/sys/class/net/DEV/queues/tx-*/xps_cpus"
> > > 
> > > Shouldn't it say I need to disable *XPS* (not XDP) using mask=00??    
> > 
> > You are absolutely right it is a typo. Can I ask you to fix that and
> > send a GitHub PR?
> > 
> > The file you need to change is:
> >  https://github.com/xdp-project/xdp-project/blob/master/areas/cpumap.org

File edited. PR sent.

> 
> > 
> >   
> > > How to set that CPU-0 will deal with mq queue 7FFF:1, CPU-1 will deal
> > > with 7FFF:2, and so on?    
> > 
> > That is the role of the XDP program that redirect into a cpumap, and
> > the key in the cpumap is the CPU number.  

OK. I see that in source code.
But I am still pretty in the dark here to start using XDP.
More newbie questions are necessary.

My goal is simple: to control the bandwidth of a few (or a lot) thousands users using an of-the-shelf (almost) box. Two 10Gbps ether interface. One internal, one external.
What come in thru eth0 goes out to eth0 or eth1 and what comes in thru eth1 comes out to eth0. 

Is there a road map about what to execute and in what order to achieve this task using xdp-cpumap-tc?

I have cloned xdp-cpumap-tc to try figuring it out reading the source code. 
But things did not get together.

For instance, tc_classify_kern.c (as tc_queue_mapping_kern.c)  "talks" about a "manuel" (sic)
setup:

	tc qdisc  add dev ixgbe2 clsact
	tc filter add dev ixgbe2 egress bpf da obj tc_classify_kern.o sec tc_classify

At what point these commands are to be executed?
They are not mentioned anywhere else. (tc_mq_htb_setup_example.sh forgot these perhaps?)

Which one is be to loaded tc_classify_kern or tc_queue_mapping_kern?
Or both? None? After and before what?

In the file tc_classify_kern.c, map_ifindex_type is defined differently from xdp_iphash_to_cpu_kern.c. 
	".size_value = sizeof(struct txq_config)" in the former
and  
	".size_value = sizeof(__u32)" int the later.
Is this a "Cut and paste" typo? Are they really meant to be two different maps?

Anyway, a step by step guide would be appreciated.
Maybe it is time to start populating that BNG-router repo I was told about.
How can I start helping with that? Worth doing it?

Regards 

Ethy
