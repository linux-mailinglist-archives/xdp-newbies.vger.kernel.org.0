Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 276D91866A1
	for <lists+xdp-newbies@lfdr.de>; Mon, 16 Mar 2020 09:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbgCPIid (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 16 Mar 2020 04:38:33 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49439 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730048AbgCPIid (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 16 Mar 2020 04:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584347911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7uu8ZglRcxpl1RvABSTsu6DnS9ic/goMU1QnbnHDbOk=;
        b=EsDt0Apuk8+gR2F8eKf/vvVl5sJC9b8e64SSbOoU/+vLzBxxD8mcFMgn9Rb0aYfzVEzEox
        kOtX8SBzM0+AXB9o7pkQGb/FGUxbx8hvr8IcB04CZvAuHdxK5tgiSCXeZlYSqBVFgCWJ8N
        lkMSHGCJWqrHVY+94eIu8ghcjsRVXEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-mmsqzYicOQmcU9XlIea8uA-1; Mon, 16 Mar 2020 04:38:27 -0400
X-MC-Unique: mmsqzYicOQmcU9XlIea8uA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16F8F13F5;
        Mon, 16 Mar 2020 08:38:26 +0000 (UTC)
Received: from carbon (ovpn-200-32.brq.redhat.com [10.40.200.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3133610021B2;
        Mon, 16 Mar 2020 08:38:21 +0000 (UTC)
Date:   Mon, 16 Mar 2020 09:38:19 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     brouer@redhat.com, Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?Qmo=?= =?UTF-8?B?w7ZybiBUw7ZwZWw=?= 
        <bjorn.topel@intel.com>
Subject: Re: Why does my AF-XDP Socket lose packets whereas a generic linux
 socket doesn't?
Message-ID: <20200316093819.65c24cdd@carbon>
In-Reply-To: <27adfa9b069242a3a0d8e9ccd64e308a@hm.edu>
References: <27adfa9b069242a3a0d8e9ccd64e308a@hm.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, 15 Mar 2020 15:36:13 +0000
"Gaul, Maximilian" <maximilian.gaul@hm.edu> wrote:

> I am comparing AF-XDP sockets vs Linux Sockets in terms of how many
> packets they can process without packet-loss (packet-loss is defined
> as the RTP-sequence number of the current packet is not equal to the
> RTP-sequence number of the previous packet `+ 1`).
> 
> I noticed that my AF-XDP socket program (I can't determine if this
> problem is related to the kernel program or the user-space program)
> is losing around `~25` packets per second at around `390.000` packets
> per second whereas an equivalent program with generic linux sockets
> doesn't lose any packets.
> 
[...]

> Because I figured I don't need maximum latency for this application,
> I send the process to sleep for a specified time (around `1 - 2ms`)
> after which it loops through every AF-XDP socket (most of the time it
> is only one socket) and processes every received packet for that
> socket, verifying that no packets have been missed:
> 
> 	while(!global_exit) {
> 	    nanosleep(&spec, &remaining);
> 
> 		for(int i = 0; i < cfg.ip_addrs_len; i++) {
> 			struct xsk_socket_info *socket = xsk_sockets[i];
> 			if(atomic_exchange(&socket->stats_sync.lock, 1) == 0) {
> 				handle_receive_packets(socket);
> 				atomic_fetch_xor(&socket->stats_sync.lock, 1); /* release socket-lock */
> 			}
> 		}
> 	}

You say that you are sleeping for a specified time around 1 - 2ms.

Have you considered if in the time your programs sleeps, if the
RX-queue can be overflowed?

You say at 390,000 pps drops happen.  At this speed a packets arrive
every 2.564 usec (1/390000*10^9 = 2564 ns = 2.564 usec).

What NIC hardware/driver are you using?
And what is the RX-queue size? (ethtool -g)
On Intel's XL710 driver i40e, the default RX-ring size is 512.

The "good-queue" effect is that a queue functions as a shock absorber,
to handle that the OS/CPU is busy doing something else.  If I have 512
RX-queue slots, and packets arriving every 2.564 usec, then I must
return and empty the queue (and re-fill slots) every 1.3 ms
(512 * 2.564 usec = 1312.768 usec = 1.3127 ms).

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

