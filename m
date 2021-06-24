Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F743B378C
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Jun 2021 22:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbhFXUHY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 24 Jun 2021 16:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhFXUHX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 24 Jun 2021 16:07:23 -0400
Received: from telegrapho.inexo.com.br (unknown [IPv6:2001:12c4:f0da:5e:216:3eff:feff:56a4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5FB7C061574
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Jun 2021 13:05:03 -0700 (PDT)
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 3C9AD6690C5B; Thu, 24 Jun 2021 17:05:00 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 3C9AD6690C5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624565100;
        bh=+c2OsDnQOnYel3GdOOwo1lPOmkBgRqCdAJUg2atxhQk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K6XPSKyBEk5eKEpa7P/axKjcQbnEBrx2VoI5YR7/SW2Hs2L4ur4zDU+IqoNQf/lON
         qjJbsbC9W5fmtaGUJDsw4HGnc7RFlt+fasF/yUrtd2mTYoc8bbiq/oMxFNgZu3RBFW
         LH+xIHhonvjRhSSBNTS+jzlP4c002QZzX7s5YZelEC0Xe8LnAYU5/Bka2Q+uyDWRl5
         1ICBXOecfx27+ymq8DxTnC5jTC7u2W6VlV8Y3qYLiuRMhj66HjjOCdAqZYuxyLAKvv
         AQ/foxywqR29yhdTvnkAs7ZYmRwuIEjFoYi61bXX21kvXUyN8xBxOyVEUMT3TPDq/W
         xOixbxP3grgvQ==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 8B6DE6690C58;
        Thu, 24 Jun 2021 17:04:59 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 8B6DE6690C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624565099;
        bh=+c2OsDnQOnYel3GdOOwo1lPOmkBgRqCdAJUg2atxhQk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CULWG43rMxP099o4BJb1djJ6veRTE/1Gkhi/numKluXht3Dh0yVoPLrL/6PK9osk1
         dkQ/Kc/d+jKL5mEyb1Ev4Y99KJfGA2vJMPM1YgAHjMk3HTxebFIi1aUhzrrfhI2EfF
         FBgaNMs6XraImkQuuZWAAJHP1/8XKlo61w1I0is+j5x5hNwSASe0nkSWF0jjy3SjqT
         ug7GN7GJbPcVe6BsItk0XxRss37zvarKTLIrsbjpmz3SN+nIf7s3v6bZNoZtwr7DKj
         QIf+X9JRFS7aPJqrh9SncEF10Y44n5XLaFjZwpJ2C3pYicYL+MD/CxMq1YL7H76W2V
         Mx/HUFL3X8gBg==
Date:   Thu, 24 Jun 2021 17:04:58 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: xdp_iphash_to_cpu_cmdline: Error loading BTF: Invalid
 argument(22)
Message-ID: <20210624170458.5bc55a54@babalu>
In-Reply-To: <20210622172216.79c6b3f2@babalu>
References: <20210622172216.79c6b3f2@babalu>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 22 Jun 2021 17:22:16 -0300
"Ethy"  wrote:

> Hi
> 
> Runing "# ./xdp_iphash_to_cpu --dev eth1 --all-cpus --wan" returns 2 loading errors:
> 
> ----------------------8<----------------------------------
> libbpf: Error loading BTF: Invalid argument(22)
> libbpf: magic: 0xeb9f
> version: 1
> flags: 0x0
> hdr_len: 24
> type_off: 0
> type_len: 492
> str_off: 492
> str_len: 1724
> btf_total_size: 2240
> [1] PTR (anon) type_id=2
> [2] STRUCT xdp_md size=20 vlen=5
> 	data type_id=3 bits_offset=0
> 	data_end type_id=3 bits_offset=32
> 	data_meta type_id=3 bits_offset=64
> 	ingress_ifindex type_id=3 bits_offset=96
> 	rx_queue_index type_id=3 bits_offset=128
> [3] TYPEDEF __u32 type_id=4
> [4] INT unsigned int size=4 bits_offset=0 nr_bits=32 encoding=(none)
> [5] FUNC_PROTO (anon) return=6 args=(1 ctx)
> [6] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> [7] FUNC xdp_program type_id=5 vlen != 0
> 
> libbpf: Error loading ELF section .BTF: -22. Ignored and continue.
> TC workaround for mapname: map_ifindex_type map_fd:5
> Added CPU:0 queue_size:192
> Added CPU:1 queue_size:192
> Added CPU:2 queue_size:192
> Added CPU:3 queue_size:192
> Added CPU:4 queue_size:192
> Added CPU:5 queue_size:192
> Added CPU:6 queue_size:192
> Added CPU:7 queue_size:192
> Added CPU:8 queue_size:192
> Added CPU:9 queue_size:192
> Added CPU:10 queue_size:192
> Added CPU:11 queue_size:192
> Added CPU:12 queue_size:192
> Added CPU:13 queue_size:192
> Added CPU:14 queue_size:192
> Added CPU:15 queue_size:192
> Documentation:
>  XDP: Lookup IPv4 and redirect to CPU hash
> 
> This program loads the XDP eBPF program into the kernel.
> Use the cmdline tool for add/removing dest IPs to the hash
> 
>  - Attached to device:eth1 (ifindex:4) prog_id:73
> ----------------------------------8<-------------------------------
> 
> Since the XDP program was correctly listed by "bpftool net", I continued an added just ONE ip
> 
> # ./xdp_iphash_to_cpu_cmdline --add --ip 1.2.3.4 --classid 1:1234 --cpu 1
> key: 0x4030201
> WARN: Looks like map_txq_config --base-setup is missing
> WARN: Fixing, doing map_txq_config --base-setup
> iphash_modify() IP:1.2.3.4 key:0x4030201 TC-handle:0x11234
> 
> listed the map
> 
> # ./xdp_iphash_to_cpu_cmdline --list
> {
> "1.2.3.4" : { "cpu" : 1, "tc_maj" : "1" , "tc_min" : "1234" }}
> 
> 
> And right after I tried to remove the program from XDP:
> 
> # ./xdp_iphash_to_cpu --dev eth1 --remove
> Removing XDP program on ifindex:4 device:eth1
> ERR: Clear ifindex type failed 
> INFO: not cleanup pinned map file:/sys/fs/bpf/tc/globals/map_ip_hash (use 'rm')
> 
> All seems to be rigth despite the errors.
> Are all these errors and warnings serious problems? Should I worry? 
> 
> Hints??

Hi.

Doesn't anybody know how to answer these?

Regards

Ethy

