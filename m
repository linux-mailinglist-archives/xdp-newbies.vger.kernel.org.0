Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702C3157D8F
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Feb 2020 15:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgBJOl2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Feb 2020 09:41:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25523 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726961AbgBJOl2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Feb 2020 09:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581345687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=/ulRQWVDUHn3KYR3IT2RX9/AIDTy1OY9HyHNMnsPl8s=;
        b=DhIyc/7zkVXa0BKROPN7O26d9dFo2JPL67PIt7KtLkSyjU2yiy2Vh0mLcoYpRVz/jQIOxs
        BhZjWAwBzB5hDEEPoQW+9uOBWYRyBOop/CiGqj5YnQYD8twcl0njcKqYRKaW/RA6zJCDx/
        TBPEALQUPuDfsSQTlfitGdWutusgmFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-EiMN_oyCMwuR46840g68xQ-1; Mon, 10 Feb 2020 09:41:23 -0500
X-MC-Unique: EiMN_oyCMwuR46840g68xQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE109107ACC9;
        Mon, 10 Feb 2020 14:41:22 +0000 (UTC)
Received: from [10.36.116.181] (ovpn-116-181.ams2.redhat.com [10.36.116.181])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A291001B28;
        Mon, 10 Feb 2020 14:41:22 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     Xdp <xdp-newbies@vger.kernel.org>
Cc:     "Alexei Starovoitov" <ast@kernel.org>
Subject: Doing a bpf trace of an XDP bpf program using bpf_perf_event_output()
Date:   Mon, 10 Feb 2020 15:41:20 +0100
Message-ID: <8768549E-2139-4CB0-ACDC-024AF14E2C3C@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I'm trying to send a packet capture to user space using 
bpf_perf_event_output(). However, the verifier is not liking the context 
I pass to it.

Code looks something like this (note this is an fentry bpf type trace):

static inline void trace_to_perf_buffer(struct xdp_buff *xdp)
{
...
...
     bpf_perf_event_output(xdp, &capture_map, flags,
                   &metadata, sizeof(metadata));
}

SEC("fentry/xdpfilt_blk_all")
int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)
{
     trace_to_perf_buffer(xdp);
     bpf_debug("fentry: [ifindex = %u, queue =  %u]\n",
           xdp->rxq->dev->ifindex, xdp->rxq->queue_index);
     return 0;
}

The verifier does not like the context I pass:

...
from 9 to 13: R1=ptr_xdp_buff(id=0,off=0,imm=0) R2=inv(id=0) 
R3=inv(id=0) R4=ptr_xdp_buff(id=0,off=8,imm=0) R10=fp0
; metadata.pkt_len = (__u16)(data_end - data);
13: (1f) r2 -= r3
...
...
; bpf_perf_event_output((void *)xdp, &capture_map, flags,
42: (18) r2 = 0xffff9a55f047c000
44: (b7) r5 = 12
45: (85) call bpf_perf_event_output#25
R1 type=ptr_ expected=ctx


What context should I pass, or do I even have it in the bpf trace 
program?

Thanks,

Eelco

