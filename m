Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64403B37A8
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Jun 2021 22:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhFXUTG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 24 Jun 2021 16:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35633 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232120AbhFXUTG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 24 Jun 2021 16:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624565806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XwhiffSeqogzW4eSOR3/Jx0hAS66/jq96Qd/fe8M6fc=;
        b=b1yU13fdCQ6KDZB3TxyyiMFnGIrk9ZRnyXq887ZC8Te5C9mGkRfrpvJ4OzKne/UkEmLrF9
        hThwLLvi7HZ0DRbKgMAHMRlKDewU4wOBfzf8pJ2OpESiDwa8qBVR+IbwsIrW6JIxGGgkBg
        wBfFpPh8I5tYs1fdY9bgYIbCj7toYYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-TmmzgaCNN925T0fF1CfHsw-1; Thu, 24 Jun 2021 16:16:44 -0400
X-MC-Unique: TmmzgaCNN925T0fF1CfHsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8208C18D6A2C;
        Thu, 24 Jun 2021 20:16:43 +0000 (UTC)
Received: from carbon (unknown [10.36.110.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D6F06090F;
        Thu, 24 Jun 2021 20:16:38 +0000 (UTC)
Date:   Thu, 24 Jun 2021 22:16:37 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        brouer@redhat.com
Subject: Re: xdp_iphash_to_cpu_cmdline: Error loading BTF: Invalid
 argument(22)
Message-ID: <20210624221637.4353b844@carbon>
In-Reply-To: <20210624170458.5bc55a54@babalu>
References: <20210622172216.79c6b3f2@babalu>
        <20210624170458.5bc55a54@babalu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 24 Jun 2021 17:04:58 -0300
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> On Tue, 22 Jun 2021 17:22:16 -0300
> "Ethy"  wrote:
> 
> > Hi
> > 
> > Runing "# ./xdp_iphash_to_cpu --dev eth1 --all-cpus --wan" returns 2 loading errors:
> > 
> > ----------------------8<----------------------------------
> > libbpf: Error loading BTF: Invalid argument(22)
> > libbpf: magic: 0xeb9f
> > version: 1
> > flags: 0x0
> > hdr_len: 24
> > type_off: 0
> > type_len: 492
> > str_off: 492
> > str_len: 1724
> > btf_total_size: 2240
> > [1] PTR (anon) type_id=2
> > [2] STRUCT xdp_md size=20 vlen=5
> > 	data type_id=3 bits_offset=0
> > 	data_end type_id=3 bits_offset=32
> > 	data_meta type_id=3 bits_offset=64
> > 	ingress_ifindex type_id=3 bits_offset=96
> > 	rx_queue_index type_id=3 bits_offset=128
> > [3] TYPEDEF __u32 type_id=4
> > [4] INT unsigned int size=4 bits_offset=0 nr_bits=32 encoding=(none)
> > [5] FUNC_PROTO (anon) return=6 args=(1 ctx)
> > [6] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> > [7] FUNC xdp_program type_id=5 vlen != 0
> > 
> > libbpf: Error loading ELF section .BTF: -22. Ignored and continue.

NOTICE above: "Ignored and continue".

Thus, this is not a real *error*, instead this is just a (very) verbose
*warning* that your system (kernel version? / compile options?) doesn't
support BTF correctly.  The BTF info is not really needed by
xdp-cpuma-tc, so you can safely ignore this "warning".


> > TC workaround for mapname: map_ifindex_type map_fd:5
> > Added CPU:0 queue_size:192
> > Added CPU:1 queue_size:192
> > Added CPU:2 queue_size:192
> > Added CPU:3 queue_size:192
> > Added CPU:4 queue_size:192
> > Added CPU:5 queue_size:192
> > Added CPU:6 queue_size:192
> > Added CPU:7 queue_size:192
> > Added CPU:8 queue_size:192
> > Added CPU:9 queue_size:192
> > Added CPU:10 queue_size:192
> > Added CPU:11 queue_size:192
> > Added CPU:12 queue_size:192
> > Added CPU:13 queue_size:192
> > Added CPU:14 queue_size:192
> > Added CPU:15 queue_size:192
> > Documentation:
> >  XDP: Lookup IPv4 and redirect to CPU hash
> > 
> > This program loads the XDP eBPF program into the kernel.
> > Use the cmdline tool for add/removing dest IPs to the hash
> > 
> >  - Attached to device:eth1 (ifindex:4) prog_id:73
> > ----------------------------------8<-------------------------------
> > 
> > Since the XDP program was correctly listed by "bpftool net", I continued an added just ONE ip
> > 
> > # ./xdp_iphash_to_cpu_cmdline --add --ip 1.2.3.4 --classid 1:1234 --cpu 1
> > key: 0x4030201
> > WARN: Looks like map_txq_config --base-setup is missing
> > WARN: Fixing, doing map_txq_config --base-setup
> > iphash_modify() IP:1.2.3.4 key:0x4030201 TC-handle:0x11234
> > 
> > listed the map
> > 
> > # ./xdp_iphash_to_cpu_cmdline --list
> > {
> > "1.2.3.4" : { "cpu" : 1, "tc_maj" : "1" , "tc_min" : "1234" }}
> > 
> > 
> > And right after I tried to remove the program from XDP:
> > 
> > # ./xdp_iphash_to_cpu --dev eth1 --remove
> > Removing XDP program on ifindex:4 device:eth1
> > ERR: Clear ifindex type failed 
> > INFO: not cleanup pinned map file:/sys/fs/bpf/tc/globals/map_ip_hash (use 'rm')
> > 
> > All seems to be rigth despite the errors.
> > Are all these errors and warnings serious problems? Should I worry? 
> > 
> > Hints??  
> 
> Hi.
> 
> Doesn't anybody know how to answer these?

This is just a warning you can ignore.
It looks like it works...

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

