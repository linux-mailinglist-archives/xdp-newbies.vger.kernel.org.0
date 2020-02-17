Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D77B1613E5
	for <lists+xdp-newbies@lfdr.de>; Mon, 17 Feb 2020 14:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgBQNsg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 17 Feb 2020 08:48:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20941 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726707AbgBQNsg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 17 Feb 2020 08:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581947315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YdNQlRms2FMU1CSjhspmCEsgBbtL+YdaLjdwb/ghKMI=;
        b=ad3zz9DPVzEWzLFE6qssXNI0Lculy7ky98TomKJhKPGJ+8PerShGhBbkU6vkSZ/5DrXLz2
        PbXSB6F63KH79+HyKs+1uDTQi0/fgawFyN3HFXQmyriZz7EvoZMXiNjtWovjPpQFzaIReG
        JoEIYMkZWIpFhI/S4BhHghvDD3Il++s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-IPDr-jC1PZO1z0g9YWAFYw-1; Mon, 17 Feb 2020 08:48:31 -0500
X-MC-Unique: IPDr-jC1PZO1z0g9YWAFYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EEBD107ACCD;
        Mon, 17 Feb 2020 13:48:30 +0000 (UTC)
Received: from [10.36.117.112] (ovpn-117-112.ams2.redhat.com [10.36.117.112])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C541E10013A1;
        Mon, 17 Feb 2020 13:48:29 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     Xdp <xdp-newbies@vger.kernel.org>
Cc:     "Alexei Starovoitov" <ast@kernel.org>
Subject: Re: Doing a bpf trace of an XDP bpf program using
 bpf_perf_event_output()
Date:   Mon, 17 Feb 2020 14:48:27 +0100
Message-ID: <0B4AECED-C783-465B-9A7D-0335CF775CE7@redhat.com>
In-Reply-To: <8768549E-2139-4CB0-ACDC-024AF14E2C3C@redhat.com>
References: <8768549E-2139-4CB0-ACDC-024AF14E2C3C@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 10 Feb 2020, at 15:41, Eelco Chaudron wrote:

<SNIP<

> SEC("fentry/xdpfilt_blk_all")
> int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)
> {
>     trace_to_perf_buffer(xdp);
>     bpf_debug("fentry: [ifindex = %u, queue =  %u]\n",
>           xdp->rxq->dev->ifindex, xdp->rxq->queue_index);
>     return 0;
> }

Ignore this email, as I totally missed the ctx hidden in the BPF_PROG() 
macro :(

> The verifier does not like the context I pass:
>
> ...
> from 9 to 13: R1=ptr_xdp_buff(id=0,off=0,imm=0) R2=inv(id=0) 
> R3=inv(id=0) R4=ptr_xdp_buff(id=0,off=8,imm=0) R10=fp0
> ; metadata.pkt_len = (__u16)(data_end - data);
> 13: (1f) r2 -= r3
> ...
> ...
> ; bpf_perf_event_output((void *)xdp, &capture_map, flags,
> 42: (18) r2 = 0xffff9a55f047c000
> 44: (b7) r5 = 12
> 45: (85) call bpf_perf_event_output#25
> R1 type=ptr_ expected=ctx
>
>
> What context should I pass, or do I even have it in the bpf trace 
> program?
>
> Thanks,
>
> Eelco

