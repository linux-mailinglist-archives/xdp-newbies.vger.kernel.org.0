Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481A73B3813
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Jun 2021 22:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhFXUqn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 24 Jun 2021 16:46:43 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:58814 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhFXUqn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 24 Jun 2021 16:46:43 -0400
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 06DF36690C30; Thu, 24 Jun 2021 17:44:22 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 06DF36690C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624567462;
        bh=gtwSqh6+/2NAQ7sg5IcOwBc98TlTJ3S1siOfzcfn5vk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RIG1v8djx1NMSQvSWZPFaoUDYggtPJNgcWmRz+HtVQ7NmrpdrkJzzSVjISJIZTnwA
         GnO21LwabT0Yb7Op902rRQQnnpKFjzCLtltQ6nuMNEce7KievYxSxbATJ8mqSSmlPO
         51TV2XtTgTxKxN3VbDGY/f5P1csSvQ6amCpDgiVMtZhDX+MRIjYl9ETeMYWzH5378T
         r+E81fafa26xm1vXIoS6bzi7pPn5SJm03qtVIb/bIu/1FiIdPcSwDRCSagmMlKZmVB
         hibaRW6WlU9pGdyxifcfay17YEHkjoQu4tX/ceMJHO9evLEKnv35bMRUFyc1NRTgus
         yu331xsHrzx2A==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 926216690C30;
        Thu, 24 Jun 2021 17:44:21 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 926216690C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624567461;
        bh=gtwSqh6+/2NAQ7sg5IcOwBc98TlTJ3S1siOfzcfn5vk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jPG7gbZU1HBoaC2g7xlysR8Vu4pYd9wghM3wlAJBW8YkkwieOWV5Xz5dVFS+aOMb7
         95RfL8TNhTlu0C2+V4xc6s2MChyRmo+pPTBXubKP/rwiXHml55KlerRuACWgFENej+
         i21E4zpr4WqdLzM5wKfoN4s30bGLvmLAkZIcKn809158ldmpS53sNZr112hnIL6pWx
         /6sKQd/6cSzOlee/zjQZcytQLo8EHevzRIWDXdVvdsEISlIK9HUiF6x0lLKQ2UYUpl
         Yy8l9cnzkJ7anpcwo1OKQP0c/yp27h9YXOM5Egbs5ZuuiCSbgHhwbhYRyKeksjwNwW
         TdCsmBixu3NkQ==
Date:   Thu, 24 Jun 2021 17:44:21 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: xdp_iphash_to_cpu_cmdline: Error loading BTF: Invalid
 argument(22)
Message-ID: <20210624174421.35864a09@babalu>
In-Reply-To: <20210624221637.4353b844@carbon>
References: <20210622172216.79c6b3f2@babalu>
        <20210624170458.5bc55a54@babalu>
        <20210624221637.4353b844@carbon>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 24 Jun 2021 22:16:37 +0200
Jesper Dangaard Brouer <brouer@redhat.com> wrote:

> On Thu, 24 Jun 2021 17:04:58 -0300
> "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> 
> > On Tue, 22 Jun 2021 17:22:16 -0300
> > "Ethy"  wrote:
> >   
> > > Hi
> > > 
> > > Runing "# ./xdp_iphash_to_cpu --dev eth1 --all-cpus --wan" returns 2 loading errors:
> > > 
> > > ----------------------8<----------------------------------
> > > libbpf: Error loading BTF: Invalid argument(22)
> > > libbpf: magic: 0xeb9f
> > > version: 1
> > > flags: 0x0
> > > hdr_len: 24
> > > type_off: 0
> > > type_len: 492
> > > str_off: 492
> > > str_len: 1724
> > > btf_total_size: 2240
> > > [1] PTR (anon) type_id=2
> > > [2] STRUCT xdp_md size=20 vlen=5
> > > 	data type_id=3 bits_offset=0
> > > 	data_end type_id=3 bits_offset=32
> > > 	data_meta type_id=3 bits_offset=64
> > > 	ingress_ifindex type_id=3 bits_offset=96
> > > 	rx_queue_index type_id=3 bits_offset=128
> > > [3] TYPEDEF __u32 type_id=4
> > > [4] INT unsigned int size=4 bits_offset=0 nr_bits=32 encoding=(none)
> > > [5] FUNC_PROTO (anon) return=6 args=(1 ctx)
> > > [6] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> > > [7] FUNC xdp_program type_id=5 vlen != 0
> > > 
> > > libbpf: Error loading ELF section .BTF: -22. Ignored and continue.  
> 
> NOTICE above: "Ignored and continue".
> 
> Thus, this is not a real *error*, instead this is just a (very) verbose
> *warning* that your system (kernel version? / compile options?) doesn't
> support BTF correctly.  The BTF info is not really needed by
> xdp-cpuma-tc, so you can safely ignore this "warning".

Noticed!

> 
> 
> > > TC workaround for mapname: map_ifindex_type map_fd:5
> > > Added CPU:0 queue_size:192
> > > Added CPU:1 queue_size:192
> > > Added CPU:2 queue_size:192
> > > Added CPU:3 queue_size:192
> > > Added CPU:4 queue_size:192
> > > Added CPU:5 queue_size:192
> > > Added CPU:6 queue_size:192
> > > Added CPU:7 queue_size:192
> > > Added CPU:8 queue_size:192
> > > Added CPU:9 queue_size:192
> > > Added CPU:10 queue_size:192
> > > Added CPU:11 queue_size:192
> > > Added CPU:12 queue_size:192
> > > Added CPU:13 queue_size:192
> > > Added CPU:14 queue_size:192
> > > Added CPU:15 queue_size:192
> > > Documentation:
> > >  XDP: Lookup IPv4 and redirect to CPU hash
> > > 
> > > This program loads the XDP eBPF program into the kernel.
> > > Use the cmdline tool for add/removing dest IPs to the hash
> > > 
> > >  - Attached to device:eth1 (ifindex:4) prog_id:73
> > > ----------------------------------8<-------------------------------
> > > 
> > > Since the XDP program was correctly listed by "bpftool net", I continued an added just ONE ip
> > > 
> > > # ./xdp_iphash_to_cpu_cmdline --add --ip 1.2.3.4 --classid 1:1234 --cpu 1
> > > key: 0x4030201
> > > WARN: Looks like map_txq_config --base-setup is missing
> > > WARN: Fixing, doing map_txq_config --base-setup
> > > iphash_modify() IP:1.2.3.4 key:0x4030201 TC-handle:0x11234
> > > 
> > > listed the map
> > > 
> > > # ./xdp_iphash_to_cpu_cmdline --list
> > > {
> > > "1.2.3.4" : { "cpu" : 1, "tc_maj" : "1" , "tc_min" : "1234" }}
> > > 
> > > 
> > > And right after I tried to remove the program from XDP:
> > > 
> > > # ./xdp_iphash_to_cpu --dev eth1 --remove
> > > Removing XDP program on ifindex:4 device:eth1
> > > ERR: Clear ifindex type failed 
> > > INFO: not cleanup pinned map file:/sys/fs/bpf/tc/globals/map_ip_hash (use 'rm')


What about this one?
"--revove" could not do its job.
None of the three map files were erased. 
And not only this one that the error message states.
Won't this cause a memory leak??


> > > 
> > > All seems to be rigth despite the errors.
> > > Are all these errors and warnings serious problems? Should I worry? 
> > > 
> > > Hints??    
> > 
> > Hi.
> > 
> > Doesn't anybody know how to answer these?  
> 
> This is just a warning you can ignore.

Ignoring them.

> It looks like it works...


Thank you for your reply. Ignoring them.

I am running tests at a test environment. Things seem to be Ok.
Just some doubts of a fist time user. 

Regards

Ethy
