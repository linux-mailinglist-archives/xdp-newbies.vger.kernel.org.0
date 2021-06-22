Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685ED3B0011
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Jun 2021 11:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhFVJUi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 22 Jun 2021 05:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55029 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229486AbhFVJUh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 22 Jun 2021 05:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624353501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QLYOCWxAJut0V/mM/uo1z/01I1eh8rO4CJDveX9mcoQ=;
        b=Ebk+ivdqUWk9uTSd7e6mHKYMjA2HL9Et0LZnmf993t7HzBKIVziFb6Xe2JH2LaoI6a7P5o
        gR4UQ74uj8RYKwzup8z+aahmcdFHJiZY8FRgZCCDr1MNATAClCZyDeXTNt0W7UL6+7EwQe
        cwHmuo5J1u1FpX4vG4bz5eNbYsgDDKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-vqkEt497O-i67LV0ltkWPQ-1; Tue, 22 Jun 2021 05:18:16 -0400
X-MC-Unique: vqkEt497O-i67LV0ltkWPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C5AF1835AC3;
        Tue, 22 Jun 2021 09:18:15 +0000 (UTC)
Received: from carbon (unknown [10.36.110.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C01A719C46;
        Tue, 22 Jun 2021 09:18:10 +0000 (UTC)
Date:   Tue, 22 Jun 2021 11:18:09 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        brouer@redhat.com,
        Robert Chacon <robert.chacon@jackrabbitwireless.com>,
        Yoel Caspersen <yoel@kviknet.dk>
Subject: Re: Newbie questions
Message-ID: <20210622111809.16a1431e@carbon>
In-Reply-To: <20210621222809.2d7633cc@babalu>
References: <20210618133106.01f2129b@babalu>
        <20210618194007.4dfb838b@carbon>
        <20210618173717.581e1058@babalu>
        <20210621222809.2d7633cc@babalu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 21 Jun 2021 22:28:09 -0300
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> On Fri, 18 Jun 2021 17:37:17 -0300
> "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> 
> > On Fri, 18 Jun 2021 19:40:17 +0200
> > Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> >   
> > > On Fri, 18 Jun 2021 13:31:06 -0300
> > > "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> > >     
> > > > Hi All.
> > > > 
> > > > I've been doing some home work reading the docs and some doubts have raised.
> > > > For reference, my environment is 
> > > > 	Ubuntu 20.04
> > > > 	kernel 5.4.0-66 
> > > > 	tc utility, iproute2-ss200127.
> > > > 
> > > > 1) https://xdp-project.net/areas/cpumap.html#cpumap--Create-script-MQ-HTB-silo-setup says that: 
> > > > 	"XPS (Transmit Packet Steering) will take precedence over any changes to 
> > > > 	skb->queue_mapping. You need to disable *XDP* via mask=00 in files 
> > > > 	/sys/class/net/DEV/queues/tx-*/xps_cpus"
> > > > 
> > > > Shouldn't it say I need to disable *XPS* (not XDP) using mask=00??      
> > > 
> > > You are absolutely right it is a typo. Can I ask you to fix that and
> > > send a GitHub PR?
> > > 
> > > The file you need to change is:
> > >  https://github.com/xdp-project/xdp-project/blob/master/areas/cpumap.org  
> 
> File edited. PR sent.

Thanks merged it.

> > >     
> > > > How to set that CPU-0 will deal with mq queue 7FFF:1, CPU-1 will deal
> > > > with 7FFF:2, and so on?      
> > > 
> > > That is the role of the XDP program that redirect into a cpumap, and
> > > the key in the cpumap is the CPU number.    
> 
> OK. I see that in source code.

Yes, see the explanation in the source code.
Also read: https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/howto_debug.org

The "tc_queue_mapping_kern.c" program[1] is the simplest solution,
which only does the skb->queue_mapping, and you have to configure Linux
to set the correct TC minor:major number on a per packet basis (e.g.
via iptables see comment in code).

The "tc_classify_kern.c" program[2] is more advanced and have
implemented a IP-lookup map that have this[3] config per entry:

  struct ip_hash_info {
	/* lookup key: __u32 IPv4-address */
	__u32 cpu;
	__u32 tc_handle; /* TC handle MAJOR:MINOR combined in __u32 */
  };

 [1] https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/tc_queue_mapping_kern.c#L40-L76
 [2] https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/tc_classify_kern.c#L277
 [3] https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/common_kern_user.h#L29-L33

> But I am still pretty in the dark here to start using XDP.

Okay, then let me explain some basic concepts for xdp-cpumap-tc.

 1. XDP need to run on physical NIC with driver that supports (native) XDP.

 2. XDP is a layer before network stack, before the "SKB" is created.

 3. XDP redirect the raw frame to another CPU via XDP_REDIRECT'ing into a cpumap.

 4. The cpumap (kthread) running on remote CPU will create the SKB and
    call normal network stack on this CPU.

 5. The TC-BPF program running on remote CPU update skb->queue_mapping
    (and possibly skb->priority) to map packet into the TC-queue of
    your choosing.

Notice for you scenario there are 4 BPF-progs running, two XDP and two
TC-BPF.  See what is running via cmdline: "bpftool net"

 # bpftool net
 xdp:
 eno49(4) driver id 22
 eno50(5) driver id 26

 tc:
 eno49(4) clsact/egress tc_classify_kern.o:[tc_classify] id 42
 eno50(5) clsact/egress tc_classify_kern.o:[tc_classify] id 43

All the BPF-programs share BPF-maps to have the same config.

Maps pinned:
 # ls -1 /sys/fs/bpf/tc/globals/
 map_ifindex_type
 map_ip_hash
 map_txq_config


> More newbie questions are necessary.
> 
> My goal is simple: to control the bandwidth of a few (or a lot)
> thousands users using an of-the-shelf (almost) box. Two 10Gbps ether
> interface. One internal, one external.

I have access to a production system, that have 2x 25Gbit/s NIC (plus
VLANs for each apartment building), let me check how many customers
they have added.  They are using[2] "tc_classify_kern.c" and their
IP-map contains 6086 entries (more than I expected actually).

> What come in thru eth0 goes out to eth0 or eth1 and what comes in
> thru eth1 comes out to eth0. 
> 
> Is there a road map about what to execute and in what order to
> achieve this task using xdp-cpumap-tc?

This is already available today, and running in production at an ISP.
Sorry for the lack of documentation on how to use it, but it is done.

> I have cloned xdp-cpumap-tc to try figuring it out reading the source code. 
> But things did not get together.
> 
> For instance, tc_classify_kern.c (as tc_queue_mapping_kern.c)  "talks" about a "manuel" (sic)
> setup:
> 
> 	tc qdisc  add dev ixgbe2 clsact
> 	tc filter add dev ixgbe2 egress bpf da obj tc_classify_kern.o sec tc_classify
> 
> At what point these commands are to be executed?
> They are not mentioned anywhere else. (tc_mq_htb_setup_example.sh forgot these perhaps?)

This is handled by: tc_classify_user
 https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/tc_classify_user.c

The TC commands are called from C-code in this file:
 https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/common_user.c

The roadmap is to convert this to use the new libbpf TC API instead, as
it is a mess to have a dependency on the right iproute2 version.

 
> Which one is be to loaded tc_classify_kern or tc_queue_mapping_kern?
> Or both? None? After and before what?

Actually due to limitation in iproute2 loader, you should load
XDP-programs first (as it will create maps with BTF info).

You cannot load tc_classify_kern and tc_queue_mapping_kern simultaneously.

> 
> In the file tc_classify_kern.c, map_ifindex_type is defined
> differently from xdp_iphash_to_cpu_kern.c.
>
> 	".size_value = sizeof(struct txq_config)" in the former
> and  
> 	".size_value = sizeof(__u32)" int the later.
>
> Is this a "Cut and paste" typo? Are they really meant to be two
> different maps?

Hmm... this looks like a copy-paste error.  The tc_classify_kern.c
map_ifindex_type should have size_value = sizeof(__u32). It happens to
work because sizeof(struct txq_config) is also 4 bytes.


> Anyway, a step by step guide would be appreciated.

I'm hoping you will create/document that once you learn howto use these
programs ;-)

> Maybe it is time to start populating that BNG-router repo I was told about.
> How can I start helping with that? Worth doing it?

I think we need to convince other ISP's to join in...
... let me CC those guys again.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

