Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A89F6311FD
	for <lists+xdp-newbies@lfdr.de>; Sun, 20 Nov 2022 00:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiKSX7r (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 19 Nov 2022 18:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiKSX7q (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 19 Nov 2022 18:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF96A13DEF
        for <xdp-newbies@vger.kernel.org>; Sat, 19 Nov 2022 15:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668902334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=J7SjCiaLvMRqdbVFzjpG8U/NCiIlkWYVUOgYKsEkyPc=;
        b=cSGAFuZ2QsgmqUI4YTTYemXTkHfBVR5+l2JaaaUkA9jBDknx48/2zXNW52EEABf0gZyPma
        QKBfy8wl4q5+k8g5YnvPZ/AA04M+SDQog9liQlOJ46wLaFYdGw2aA01ppi9e1sZKa1593v
        bXwZxwqES8HNIcLu3U3SRhIfhX9g0fc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-FEairnDFPhWtczprxd44vQ-1; Sat, 19 Nov 2022 18:58:40 -0500
X-MC-Unique: FEairnDFPhWtczprxd44vQ-1
Received: by mail-ej1-f70.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so5225761ejc.7
        for <xdp-newbies@vger.kernel.org>; Sat, 19 Nov 2022 15:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7SjCiaLvMRqdbVFzjpG8U/NCiIlkWYVUOgYKsEkyPc=;
        b=xSTdapAIoTkXYgb24N2P4embMgTQrMotUJmA08mpaz89DeWnwASMagp6blGQg0l4+7
         sCByRJJvNZB66rcOoi/oea3PWk4bt8ewF7C4zqfNXtX4PioeXkAfIRWqBYKeos1qVvHw
         krmvCgJnptV+s+EgYKqZdiXtjFNMCyHn7WPyMyyCL9p4rLCSO7dXF5dZaIAzsYNbfX/9
         y7P4AasW6dzg5uWDh+cAM21qFoxS3p2Tk0vda0ZMdn21/1qpsVTVWkjqO9WY8rWvKxM9
         ve4JLjAn3nCF+NJul4EHYVceb3sRWQUrKhegk7WZk9uE/P64WZWmIDJK8c9KNJDuFqAQ
         iD9A==
X-Gm-Message-State: ANoB5pmbn+hijASmbBaolj+fSfA1lxOzM9nklQansdTxZfwMZ4aZdOPk
        edTUZI0JC5zl43OcPjByCt4RKZ0kQOURkK1D96dBZjdhA6p2VhAE/cCP0a4gzXCwl0C6LH0worH
        rfO0iF6JVWZ4H7TBsqGyIciY=
X-Received: by 2002:a17:906:6153:b0:7ad:b51d:39d0 with SMTP id p19-20020a170906615300b007adb51d39d0mr10445799ejl.571.1668902318548;
        Sat, 19 Nov 2022 15:58:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5zVp7c0aabvg8kuFwmjPVAka4HIHG97X+WA9DZh99GvStzoXnAdPnbXd9gZsbE2e5qxt8sMw==
X-Received: by 2002:a17:906:6153:b0:7ad:b51d:39d0 with SMTP id p19-20020a170906615300b007adb51d39d0mr10445791ejl.571.1668902318104;
        Sat, 19 Nov 2022 15:58:38 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090632cb00b0078d3f96d293sm3381052ejk.30.2022.11.19.15.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 15:58:37 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 8473D7D4A68; Sun, 20 Nov 2022 00:58:36 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Benjamin Beckmeyer <beb@eks-engel.de>, xdp-newbies@vger.kernel.org
Subject: Re: static variable in xdp
In-Reply-To: <35f6717a-c032-444c-f3e4-a479b1f91a3c@eks-engel.de>
References: <9b477561-0318-4c2a-e758-63fb4c3ec058@eks-engel.de>
 <874juvxhs6.fsf@toke.dk>
 <35f6717a-c032-444c-f3e4-a479b1f91a3c@eks-engel.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sun, 20 Nov 2022 00:58:36 +0100
Message-ID: <87y1s6wl77.fsf@toke.dk>
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

> Hi Toke,
>
>>> Hi all,
>>>
>>> I hope you could help me with a static variable problem in xdp.
>>> Here is my source:
>>>
>>> static __u32 last_xid = 0;
>>>
>>> static __always_inline int profinet_process_packet(struct xdp_md *ctx, __u64 off) {
>>>     void *data_end = (void *)(long)ctx->data_end;
>>>     void *data = (void *)(long)ctx->data;
>>>     struct profinet_hdr *p_hdr;
>>>     __u16 profinet_frame_id;
>>> //  static __u32 last_xid;
>>>
>>>     p_hdr = data + off;
>>>
>>>     if (p_hdr + 1 > data_end)
>>>         return XDP_DROP;
>>>
>>>     profinet_frame_id = bpf_htons(p_hdr->frame_id);
>>>
>>>     if ((profinet_frame_id >= 0x0100 && profinet_frame_id <=0x7fff) ||
>>>         (profinet_frame_id == 0x0020) ||
>>>         (profinet_frame_id == 0xbbff) ||
>>>         (profinet_frame_id == 0xfefc) ||
>>>         (profinet_frame_id == 0xf7ff))
>>>             return XDP_DROP;
>>>
>>>     if (p_hdr->xid == last_xid)
>>>         return XDP_DROP;
>>>     else
>>>         last_xid = p_hdr->xid;
>>>
>>>     return XDP_PASS;
>>> }
>>>
>>> At the moment I'm using kernel version 6.0.2 and iproute2-6.0.0.
>>> I also tried to load the the filter with xdp_loader (xdp_tools).
>>>
>>> Output from ip:
>>> $ ip link set dev eth0 xdpgeneric obj xdp_prog_kern.o sec
>>>  eks_filter
>>>
>>> Prog section 'eks_filter' rejected: Permission denied (13)!
>>>  - Type:         6
>>>  - Instructions: 48 (0 over limit)
>>>  - License:      GPL
>>>
>>> Verifier analysis:
>>>
>>> Error fetching program/map!
>>>
>>> Output from xdp_loader:
>>> $ ./xdp_loader -deth0 -A --filename xdp_prog_kern.o --pro
>>> gsec eks_filter
>>> libbpf: failed to guess program type based on ELF section name 'eks_filter'
>>> libbpf: supported section(type) names are: socket kprobe/ uprobe/ 
>>> kretprobe/ uretprobe/ classifier action tracepoint/ tp/ raw_tracepoint/ 
>>> raw_tp/ tp_btf/ xdp perf_event lwt_in lwt_out lwt_xmit lwt_seg6local 
>>> cgroup_skb/ingress cgroup_skb/egress cgroup/skb cgroup/sock 
>>> cgroup/post_bind4 cgroup/post_bind6 cgroup/dev sockops sk_skb/stream_parser 
>>> sk_skb/stream_verdict sk_skb sk_msg lirc_mode2 flow_dissector cgroup/bind4 
>>> cgroup/bind6 cgroup/connect4 cgroup/connect6 cgroup/sendmsg4 
>>> cgroup/sendmsg6 cgroup/recvmsg4 cgroup/recvmsg6 cgroup/sysctl 
>>> cgroup/getsockopt cgroup/setsockopt
>>> Success: Loaded BPF-object(xdp_prog_kern.o) and used section(eks_filter)
>>>  - XDP prog attached on device:eth0(ifindex:2)
>>>  - Pinning maps in /sys/fs/bpf/eth0/
>>> libbpf: failed to pin map: Operation not permitted
>>> ERR: pinning maps
>> This does not look like the output of the xdp-loader from xdp-tools; are
>> you using the code from the xdp-tutorial? Try using the one from
>> xdp-tools instead...
>>
>> Also, there's a hint here:
>>
>>> libbpf: failed to guess program type based on ELF section name 'eks_filter'
>> You should use SEC("xdp") for XDP programs instead of custom section
>> names, those are deprecated...
>>
>> -Toke
>
> thanks for your reply. I forget about one thing. I'm cross compiling the xdp-loader 
> for armv7. So far it looks good. I had a little fight with the xdp-loader but it 
> seems to work now. The hint with SEC was really good.
>
> It seems that not the xdp program was the problem, it was more the problem which 
> tool you use to load it. 
>
> xdp-loader no problem, while ip throws still this output.
>
> Anyways, it works. Thanks for your help.

Cool! You're welcome! :)

-Toke

