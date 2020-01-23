Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4489A1467FE
	for <lists+xdp-newbies@lfdr.de>; Thu, 23 Jan 2020 13:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAWMav (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 23 Jan 2020 07:30:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59566 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726260AbgAWMau (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 23 Jan 2020 07:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579782649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vhBtyZmvpPK2xhaKWFf+/5yVVIbhIBI+yDmYpVXLPvM=;
        b=gv5W0D/H7S6H1vMr8NXMUnbo2BZ5eVVDeDqHPcgrSLp8jXm/MKJD7PvosWi/AmdowCrtJy
        3DNTdCxtu4W2/tr8NNZBLKVP4ECbBbtQzrh5Q5t1EFIC1kiCKDvCRkMQNa2mpNJBGa+Yss
        ovrZJPlV9ahafzyj2ImIvAz0VmGe684=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-H8NNRiaDO_maIPCIqWyxIw-1; Thu, 23 Jan 2020 07:30:40 -0500
X-MC-Unique: H8NNRiaDO_maIPCIqWyxIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A430FDBAA;
        Thu, 23 Jan 2020 12:30:39 +0000 (UTC)
Received: from carbon (ovpn-200-37.brq.redhat.com [10.40.200.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3755A60FC4;
        Thu, 23 Jan 2020 12:30:37 +0000 (UTC)
Date:   Thu, 23 Jan 2020 13:30:33 +0100
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
To:     Vincent Li <mchun.li@gmail.com>
Cc:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: Measuring/Debugging XDP Performance
Message-ID: <20200123133033.5398e848@carbon>
In-Reply-To: <alpine.OSX.2.21.2001221405250.1261@jiadeimac.local>
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
        <alpine.OSX.2.21.2001221405250.1261@jiadeimac.local>
Organization: Red Hat Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 22 Jan 2020 14:11:07 -0800 (PST)
Vincent Li <mchun.li@gmail.com> wrote:

> On Wed, 22 Jan 2020, Christian Deacon wrote:
> 
> > Hey everyone,
> > 
> > I am new to XDP + AF_XDP (along with C programming in general), but I am very
> > interested in it and I've been learning a lot recently. I own an Anycast
> > network and our POP servers are running custom software our developer created
> > that processes packets using XDP. This software basically forwards specific
> > traffic to another machine via an IPIP tunnel. One issue I've been noticing is
> > the packets our software is processing and forwarding to another machine keep
> > dropping at higher traffic loads. I can't tell if this is dropping at the POP
> > level or if the machine the software is forwarding this specific traffic to
> > is. I've even tried upgrading the POP server from a two-core VPS (2.5 GHz
> > CPUs) to a dedicated server (Intel E3-1230v6 @ 3.5 GHz, 4 cores, and 8
> > threads). If this is being dropped at the POP level, I'm wondering if the
> > software is being limited to one core on this specific POP (other POPs are
> > able to use more than one core specifically). However, I have no way to
> > confirm that. To my understanding XDP programs should be able to use more than
> > one core.
> > 
> > My questions are the following:
> > 
> > 1. Is there a way to see how much CPU the XDP program is using or the load of
> > the NIC? To my understanding, you cannot tell the XDP program's CPU usage
> > based off of something like `top` or `htop` due to that being in the user
> > space (XDP happens at the NIC driver level in the kernel IIRC).  
> 
> I am newbie in XDP too, maybe Linux 
> Perf http://www.brendangregg.com/perf.html tool could help you figuring 
> out which part of the code in your XDP app consuming CPU cycles (debug 
> symbol needed)


I agree start with the 'perf' command line tool to look at the issue. 
As this is likely a CPU load distribution issue, let me give you are
couple of perf commands to use.

First record system wide (-a) entire system for 10 sec:

  perf record -g -a sleep 10

Look at what happened:

  perf report --no-children

Now you also want to look at this per CPU:

  perf report --no-children --sort cpu,comm,dso,symbol

If you want to send some info about your perf report results via email,
you can use the --stdio parameter to get the plain text output.

Once you have completed this quest, I'll help you with some more
advanced commands... does you distro have 'bpftrace' ?

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

