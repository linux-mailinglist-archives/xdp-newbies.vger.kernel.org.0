Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77657630EA9
	for <lists+xdp-newbies@lfdr.de>; Sat, 19 Nov 2022 13:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbiKSMPy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 19 Nov 2022 07:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiKSMPx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 19 Nov 2022 07:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E75B642A
        for <xdp-newbies@vger.kernel.org>; Sat, 19 Nov 2022 04:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668860096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dkdYhh08D2Xx4yTlV8C0/Ciz5laZqvq+qc6eKvSGuJk=;
        b=AY4RT9iLRTEs/uVs43Y5eDr8y2qWQ81yLbLqAm5hZyzs+lLhqLmtUNr3soDRb4calCE8Xt
        2PGL1DR7kmsxLpsCPMkOVoMS2fjxkrXYy0VKL5Dbc/8/F0j9O/XH3Pgx/2ZCoxuwgJwylo
        SIKhwSP5rGXkjhoEEccTDjquWzdFxds=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-Et_nigVuM0Stjs4ZphH2Tw-1; Sat, 19 Nov 2022 07:14:55 -0500
X-MC-Unique: Et_nigVuM0Stjs4ZphH2Tw-1
Received: by mail-ej1-f71.google.com with SMTP id sc40-20020a1709078a2800b007ae024e5e82so4674505ejc.13
        for <xdp-newbies@vger.kernel.org>; Sat, 19 Nov 2022 04:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkdYhh08D2Xx4yTlV8C0/Ciz5laZqvq+qc6eKvSGuJk=;
        b=VOGBw8SRyzwB9/EYeKKzMBpHlz3ulnc49ODttvHbwOxlpC1rYhJcl7gvjoTkeHA2F0
         Q+D/BOB8wCQVBQsmLSJ+sVTvKi35mrxUv+aaq1cuHoXVhvOIVHEOudkv6mj4tVNrRsts
         F0JARL9RHgYaT04hbctfl2sDxiSz04kobKb9v7YUmSoyndsS1sldXqdZy0u2imvrVBaR
         2CXgPttRSbJU72Hsmq3+aw+jR1vP7wxOgzc1JbSKrPJxm/SFxWidNpgD1pN2sg1BgmJ8
         yPuF+xSlojNqzDHCSnH+s/anLHVmNkm3Sd1f/oXfM52d3r9w01DABrL3DbHr0kH4H5q1
         J3KQ==
X-Gm-Message-State: ANoB5pkFGnyTstPNBO1LoA5pa823Fg/a3pMc0+XJCyxAP2yVhjNeJrHk
        fT/i0wDTqV/8BncQ7m1ltTa+JPPeb5XrVhLWb/pvE3AGUs0L2pTPS/zC98zmz48D4sc+e6/x96B
        nImUn4DUAiExvTwbPaJA3IO8=
X-Received: by 2002:a17:906:4090:b0:7ae:fbe8:a92e with SMTP id u16-20020a170906409000b007aefbe8a92emr8975328ejj.369.1668860091337;
        Sat, 19 Nov 2022 04:14:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5mSQoqkPP7cYCsdftFaiEwOkH5tHCG31LaEubMpRhCUniriyfK8GuCSpL8ZTk0iESZyUJrjQ==
X-Received: by 2002:a17:906:4090:b0:7ae:fbe8:a92e with SMTP id u16-20020a170906409000b007aefbe8a92emr8975285ejj.369.1668860090224;
        Sat, 19 Nov 2022 04:14:50 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090614c600b007826c0a05ecsm2780260ejc.209.2022.11.19.04.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 04:14:49 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 64EB87CDF9B; Sat, 19 Nov 2022 13:14:49 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Benjamin Beckmeyer <beb@eks-engel.de>, xdp-newbies@vger.kernel.org
Subject: Re: static variable in xdp
In-Reply-To: <9b477561-0318-4c2a-e758-63fb4c3ec058@eks-engel.de>
References: <9b477561-0318-4c2a-e758-63fb4c3ec058@eks-engel.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 19 Nov 2022 13:14:49 +0100
Message-ID: <874juvxhs6.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Benjamin Beckmeyer <beb@eks-engel.de> writes:

> Hi all,
>
> I hope you could help me with a static variable problem in xdp.
> Here is my source:
>
> static __u32 last_xid = 0;
>
> static __always_inline int profinet_process_packet(struct xdp_md *ctx, __u64 off) {
>     void *data_end = (void *)(long)ctx->data_end;
>     void *data = (void *)(long)ctx->data;
>     struct profinet_hdr *p_hdr;
>     __u16 profinet_frame_id;
> //  static __u32 last_xid;
>
>     p_hdr = data + off;
>
>     if (p_hdr + 1 > data_end)
>         return XDP_DROP;
>
>     profinet_frame_id = bpf_htons(p_hdr->frame_id);
>
>     if ((profinet_frame_id >= 0x0100 && profinet_frame_id <=0x7fff) ||
>         (profinet_frame_id == 0x0020) ||
>         (profinet_frame_id == 0xbbff) ||
>         (profinet_frame_id == 0xfefc) ||
>         (profinet_frame_id == 0xf7ff))
>             return XDP_DROP;
>
>     if (p_hdr->xid == last_xid)
>         return XDP_DROP;
>     else
>         last_xid = p_hdr->xid;
>
>     return XDP_PASS;
> }
>
> At the moment I'm using kernel version 6.0.2 and iproute2-6.0.0.
> I also tried to load the the filter with xdp_loader (xdp_tools).
>
> Output from ip:
> $ ip link set dev eth0 xdpgeneric obj xdp_prog_kern.o sec
>  eks_filter
>
> Prog section 'eks_filter' rejected: Permission denied (13)!
>  - Type:         6
>  - Instructions: 48 (0 over limit)
>  - License:      GPL
>
> Verifier analysis:
>
> Error fetching program/map!
>
> Output from xdp_loader:
> $ ./xdp_loader -deth0 -A --filename xdp_prog_kern.o --pro
> gsec eks_filter
> libbpf: failed to guess program type based on ELF section name 'eks_filter'
> libbpf: supported section(type) names are: socket kprobe/ uprobe/ 
> kretprobe/ uretprobe/ classifier action tracepoint/ tp/ raw_tracepoint/ 
> raw_tp/ tp_btf/ xdp perf_event lwt_in lwt_out lwt_xmit lwt_seg6local 
> cgroup_skb/ingress cgroup_skb/egress cgroup/skb cgroup/sock 
> cgroup/post_bind4 cgroup/post_bind6 cgroup/dev sockops sk_skb/stream_parser 
> sk_skb/stream_verdict sk_skb sk_msg lirc_mode2 flow_dissector cgroup/bind4 
> cgroup/bind6 cgroup/connect4 cgroup/connect6 cgroup/sendmsg4 
> cgroup/sendmsg6 cgroup/recvmsg4 cgroup/recvmsg6 cgroup/sysctl 
> cgroup/getsockopt cgroup/setsockopt
> Success: Loaded BPF-object(xdp_prog_kern.o) and used section(eks_filter)
>  - XDP prog attached on device:eth0(ifindex:2)
>  - Pinning maps in /sys/fs/bpf/eth0/
> libbpf: failed to pin map: Operation not permitted
> ERR: pinning maps

This does not look like the output of the xdp-loader from xdp-tools; are
you using the code from the xdp-tutorial? Try using the one from
xdp-tools instead...

Also, there's a hint here:

> libbpf: failed to guess program type based on ELF section name 'eks_filter'

You should use SEC("xdp") for XDP programs instead of custom section
names, those are deprecated...

-Toke

