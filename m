Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07E716501A
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Feb 2020 21:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgBSUgc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Feb 2020 15:36:32 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:39304 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgBSUgc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Feb 2020 15:36:32 -0500
Received: by mail-pg1-f173.google.com with SMTP id j15so679490pgm.6;
        Wed, 19 Feb 2020 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tSDIGLfqY03aYQMUY+XzgKjwIxukL008QXJQGYWNi5A=;
        b=g7nJJvh/OY0i9pnJlDRmVlV3OcTZGhvrjImio+dIeklaMcAKK0ByRDEL7PT1NwRBqa
         p/acTuo54zBrw9VU/LOaP+KU7AtEG05B1eMzOi4kDWyGLIbmt/GS7iEWcKheDAqSdQdC
         ktY9kcdweangyk6eS06I61tBwYvqbZtjHbf42RJLOfbAVe6oto2wiqGWRy99t7vsDZp3
         3ohogpo7fQHtR9suvn3qaL4lFfAsU0EJC9pCQ5SNflytQ7yR/h5IR4NPq6aFd6ZN5fg0
         NWqWbJmK3GriBf0Ve2/o+Zqd2G2z6tIZTGnlOw0Odgy5N00vxiqTvL0DGI1RAOV5KV44
         7IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tSDIGLfqY03aYQMUY+XzgKjwIxukL008QXJQGYWNi5A=;
        b=P6R5r7QeFVgDF1CQ5uleY+38zlgkGNU5wkM3PxgqTT6/qS9ugZ6cLXRxmGhns/jtVi
         mXXAY0NTA9LmbAfOY/HbML4OrbMDOqvjEkdCvR93PBqDFLweR6dr81Ohkle6wQg+tMjT
         SXJIfhg5grhuQ8zmL+ex+tjb7Lr2R9+X7wXHfAzTng0znJAZdK4M6VUzEEO5r3GQ2PPj
         VygWUwA1xUY2zg5QXCDw2zssBbOdbwfBfpPOri5HnaeVLGMQ3cKt14DopxsENxGZincr
         r7IQkTbSGo+CFAnl8fLOOIfzeAIyHB+5/JpptCQK+0LiMzXbKJdVcQWW2HCP0ZMnsxYc
         yOFw==
X-Gm-Message-State: APjAAAVZRuILGhtaKabDmINpjhiRCfl1XYPwwsGMWhxy3222+BEAPgZ+
        9/PyEDK3ObgsoiaG7uejw3w=
X-Google-Smtp-Source: APXvYqzJjOb53sH0zFs7r3QHWUn6n0O3B0Ku8PmI0y3hqoFFhF0NIuHRTbYuG/KezQ0JUzH62YPYOA==
X-Received: by 2002:a63:1555:: with SMTP id 21mr3087909pgv.348.1582144591618;
        Wed, 19 Feb 2020 12:36:31 -0800 (PST)
Received: from ast-mbp ([2620:10d:c090:400::5:1b18])
        by smtp.gmail.com with ESMTPSA id r9sm495403pfl.136.2020.02.19.12.36.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 12:36:30 -0800 (PST)
Date:   Wed, 19 Feb 2020 12:36:28 -0800
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Capture xdp packets in an fentry BPF hook
Message-ID: <20200219203626.ozkdoyhyexwxwbbt@ast-mbp>
References: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com>
User-Agent: NeoMutt/20180223
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Feb 19, 2020 at 03:38:40PM +0100, Eelco Chaudron wrote:
> Hi Alexei at al.,
> 
> I'm getting closer to finally have an xdpdump tool that uses the bpf
> fentry/fexit tracepoints, but I ran into a final hurdle...
> 
> To stuff the packet into a perf ring I'll need to use the
> bpf_perf_event_output(), but unfortunately, this is a program of trace type,
> and not XDP so the packet data is not added automatically :(
> 
> Secondly even trying to pass the actual packet data as a reference to
> bpf_perf_event_output() will not work as the verifier wants the data to be
> on the fp.
> 
> Even worse, the trace program gets the XDP info not thought the ctx, but
> trough the fentry/fexit input value, i.e.:
> 
> 	SEC("fentry/func")
> 	int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)...
> 
> 	struct net_device {
> 	    int ifindex;
> 	} __attribute__((preserve_access_index));
> 
> 	struct xdp_rxq_info {
> 	    struct net_device *dev;
> 	    __u32 queue_index;
> 	} __attribute__((preserve_access_index));
> 
> 	struct xdp_buff {
> 	    void *data;
> 	    void *data_end;
> 	    void *data_meta;
> 	    void *data_hard_start;
> 	    unsigned long handle;
> 	    struct xdp_rxq_info *rxq;
> 	} __attribute__((preserve_access_index));
> 
> Hence even trying to copy in bytes to a local buffer is not allowed by the
> verifier, i.e. __u8 *data = (u8 *)(long)xdp->data;
> 
> Can you let me know how you envisioned a BPF entry hook to capture packets
> from XDP. Am I missing something, or is there something missing from the
> infrastructure?

Tracing of XDP is missing a helper similar to bpf_skb_output() for skb.
Its first arg will be 'struct xdp_buff *' and .arg1_type = ARG_PTR_TO_BTF_ID
then it will work similar to bpf_skb_output() in progs/kfree_skb.c.
