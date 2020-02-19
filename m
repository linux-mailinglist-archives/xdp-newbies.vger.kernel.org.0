Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 172BB16472A
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Feb 2020 15:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgBSOix (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Feb 2020 09:38:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22069 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgBSOix (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Feb 2020 09:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582123131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bZrSi5zlYelhhln3YVdj6GttxSHJSX9JvDG2NaZdgeA=;
        b=GgpC2in9q+8tDtb7BmOTm1AMjZkcvZQUw34Z4boowNtQiEHBvxit5dER0e1sD9qO1r1XEI
        uJfOBOnZuPlMPv+woxoEktR3HivKMUyky2XeIiOEpJUWLfsC0bdxE0Rs66+mygTrfSJyaX
        1wDjM9HfN9zE2W1+9+9epVbhU5brFqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-GXJ7BLpvMNq1XtW27h6ZjQ-1; Wed, 19 Feb 2020 09:38:50 -0500
X-MC-Unique: GXJ7BLpvMNq1XtW27h6ZjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF73A800D5F;
        Wed, 19 Feb 2020 14:38:48 +0000 (UTC)
Received: from [10.36.116.231] (ovpn-116-231.ams2.redhat.com [10.36.116.231])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C801B5C28D;
        Wed, 19 Feb 2020 14:38:42 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <ast@kernel.org>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "Toke =?utf-8?b?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=" <toke@redhat.com>,
        "Jesper Dangaard Brouer" <brouer@redhat.com>
Subject: Capture xdp packets in an fentry BPF hook
Date:   Wed, 19 Feb 2020 15:38:40 +0100
Message-ID: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Alexei at al.,

I'm getting closer to finally have an xdpdump tool that uses the bpf 
fentry/fexit tracepoints, but I ran into a final hurdle...

To stuff the packet into a perf ring I'll need to use the 
bpf_perf_event_output(), but unfortunately, this is a program of trace 
type, and not XDP so the packet data is not added automatically :(

Secondly even trying to pass the actual packet data as a reference to 
bpf_perf_event_output() will not work as the verifier wants the data to 
be on the fp.

Even worse, the trace program gets the XDP info not thought the ctx, but 
trough the fentry/fexit input value, i.e.:

	SEC("fentry/func")
	int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)...

	struct net_device {
	    int ifindex;
	} __attribute__((preserve_access_index));

	struct xdp_rxq_info {
	    struct net_device *dev;
	    __u32 queue_index;
	} __attribute__((preserve_access_index));

	struct xdp_buff {
	    void *data;
	    void *data_end;
	    void *data_meta;
	    void *data_hard_start;
	    unsigned long handle;
	    struct xdp_rxq_info *rxq;
	} __attribute__((preserve_access_index));

Hence even trying to copy in bytes to a local buffer is not allowed by 
the verifier, i.e. __u8 *data = (u8 *)(long)xdp->data;

Can you let me know how you envisioned a BPF entry hook to capture 
packets from XDP. Am I missing something, or is there something missing 
from the infrastructure?

Thanks,

Eelco

