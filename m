Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A431359B8D
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 12:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhDIKNM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 06:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44623 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234313AbhDIKLM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 9 Apr 2021 06:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617963058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=poq/49iDjFBMSxZIVlplRabjXJ5+rKd/44MNSr6a8hM=;
        b=Vf/K3QhQpwF70GBNEO7twO2fnRw3K0jT80cvRVtZ42wFZ9Pgb01W10G+NUZYXNdyxh78rH
        tmEGnF0xqIzx2MoZE8RKdqwtlsL+NzF+cO1XTyGuEDiJX7YURH6N7fRNVVfN0FLbcN3ITp
        JkyP4IhSe65FHi2FY9Bvjr8lYFtIXrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-pZLiqESJO-CcWtAvMIjmWQ-1; Fri, 09 Apr 2021 06:10:53 -0400
X-MC-Unique: pZLiqESJO-CcWtAvMIjmWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72AB2A0CAB;
        Fri,  9 Apr 2021 10:10:52 +0000 (UTC)
Received: from carbon (unknown [10.36.110.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D4ED19C66;
        Fri,  9 Apr 2021 10:10:50 +0000 (UTC)
Date:   Fri, 9 Apr 2021 12:10:49 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Neal Shukla <nshukla@riotgames.com>,
        Zvi Effron <zeffron@riotgames.com>,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>, brouer@redhat.com
Subject: Re: Profiling XDP programs for performance issues
Message-ID: <20210409121049.18c9ea47@carbon>
In-Reply-To: <CAJ8uoz2tsbpD1OvLLThC=a8O1KNMhHqwWGG9QOUJ0MMKHnzkSg@mail.gmail.com>
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
        <8735w112yx.fsf@toke.dk>
        <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
        <CAC1LvL3g-VT+uwPjv3ArQiVnDAL8ydcrAnbWgrZT-_wk4DLLVA@mail.gmail.com>
        <CAJwr_MfPOzpdaM+MhkYVcLdQyc+XWvm=PChrRTrZXATL_X1pbw@mail.gmail.com>
        <CAJ8uoz2tsbpD1OvLLThC=a8O1KNMhHqwWGG9QOUJ0MMKHnzkSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 9 Apr 2021 08:40:51 +0200
Magnus Karlsson <magnus.karlsson@gmail.com> wrote:

> On Fri, Apr 9, 2021 at 1:06 AM Neal Shukla <nshukla@riotgames.com> wrote:
> >
> > Using perf, we've confirmed that the line mentioned has a 25.58% cache miss
> > rate.  
> 
> Do these hit in the LLC or in DRAM? In any case, your best bet is
> likely to prefetch this into your L1/L2. In my experience, the best
> way to do this is not to use an explicit prefetch instruction but to
> touch/fetch the cache lines you need in the beginning of your
> computation and let the fetch latency and the usage of the first cache
> line hide the latencies of fetching the others. In your case, touch
> both metadata and packet at the same time. Work with the metadata and
> other things then come back to the packet data and hopefully the
> relevant part will reside in the cache or registers by now. If that
> does not work, touch packet number N+1 just before starting with
> packet N.
> 
> Very general recommendations but hope it helps anyway. How exactly to
> do this efficiently is very application dependent.

I see you use driver i40e and that driver does a net_prefetch(xdp->data)
*AFTER* the XDP hook.  Thus, that could explain why you are seeing this.

Can you try the patch below, and see if it solves your observed issue?

> > On Thu, Apr 8, 2021 at 2:38 PM Zvi Effron <zeffron@riotgames.com> wrote:  
> > >
> > > Apologies for the spam to anyone who received my first response, but
> > > it was accidentally sent as HTML and rejected by the mailing list.
> > >
> > > On Thu, Apr 8, 2021 at 11:20 AM Neal Shukla <nshukla@riotgames.com> wrote:  
> > > >
> > > > System Info:
> > > > CPU: Intel(R) Xeon(R) Gold 6150 CPU @ 2.70GHz
> > > > Network Adapter/NIC: Intel X710
> > > > Driver: i40e
> > > > Kernel version: 5.8.15
> > > > OS: Fedora 33
> > > >  
> > >
> > > Slight correction, we're actually on the 5.10.10 kernel.

[PATCH] i40e: Move net_prefetch to benefit XDP

From: Jesper Dangaard Brouer <brouer@redhat.com>

DEBUG PATCH WITH XXX comments

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 drivers/net/ethernet/intel/i40e/i40e_txrx.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_txrx.c b/drivers/net/ethernet/intel/i40e/i40e_txrx.c
index e398b8ac2a85..c09b8a5e6a2a 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_txrx.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_txrx.c
@@ -2121,7 +2121,7 @@ static struct sk_buff *i40e_construct_skb(struct i40e_ring *rx_ring,
 	struct sk_buff *skb;
 
 	/* prefetch first cache line of first page */
-	net_prefetch(xdp->data);
+	net_prefetch(xdp->data); // XXX: Too late for XDP
 
 	/* Note, we get here by enabling legacy-rx via:
 	 *
@@ -2205,7 +2205,7 @@ static struct sk_buff *i40e_build_skb(struct i40e_ring *rx_ring,
 	 * likely have a consumer accessing first few bytes of meta
 	 * data, and then actual data.
 	 */
-	net_prefetch(xdp->data_meta);
+//	net_prefetch(xdp->data_meta); //XXX: too late for XDP
 
 	/* build an skb around the page buffer */
 	skb = build_skb(xdp->data_hard_start, truesize);
@@ -2513,6 +2513,7 @@ static int i40e_clean_rx_irq(struct i40e_ring *rx_ring, int budget)
 			/* At larger PAGE_SIZE, frame_sz depend on len size */
 			xdp.frame_sz = i40e_rx_frame_truesize(rx_ring, size);
 #endif
+			net_prefetch(xdp->data);
 			skb = i40e_run_xdp(rx_ring, &xdp);
 		}
 
@@ -2530,6 +2531,7 @@ static int i40e_clean_rx_irq(struct i40e_ring *rx_ring, int budget)
 		} else if (skb) {
 			i40e_add_rx_frag(rx_ring, rx_buffer, skb, size);
 		} else if (ring_uses_build_skb(rx_ring)) {
+			// XXX: net_prefetch called after i40e_run_xdp()
 			skb = i40e_build_skb(rx_ring, rx_buffer, &xdp);
 		} else {
 			skb = i40e_construct_skb(rx_ring, rx_buffer, &xdp);

