Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A6628D26C
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Oct 2020 18:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgJMQlL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Oct 2020 12:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34429 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727976AbgJMQlL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Oct 2020 12:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602607269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bEmLSocy7JsEJzw7NbheB131gn6fKrCxti6N+vIu4DY=;
        b=jAi6ELwyEqSFohqQpy0qZGK23lBGH7OhrHyGkEEMUaIR20vgoiiHq0fSaeErDUpQKulxN6
        ufi5dI0VPA2Exr2bCajIiJJ3XOlr/INtUQRmm6Y2+zkyqXD+/Q/RQm1/le2oFQvkEyoC2g
        NARsEVUlmtnnEZkdCOVyRpbmSzcZrZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-A-v9A5FxPFO-zs_3FkZolg-1; Tue, 13 Oct 2020 12:41:06 -0400
X-MC-Unique: A-v9A5FxPFO-zs_3FkZolg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3823879521;
        Tue, 13 Oct 2020 16:41:05 +0000 (UTC)
Received: from carbon (unknown [10.40.208.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A70407665A;
        Tue, 13 Oct 2020 16:41:01 +0000 (UTC)
Date:   Tue, 13 Oct 2020 18:41:00 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org
Subject: Re: Multi-core scalability problems
Message-ID: <20201013184100.0704963d@carbon>
In-Reply-To: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 13 Oct 2020 15:49:03 +0200
Federico Parola <fede.parola@hotmail.it> wrote:

> Hello,
> I'm testing the performance of XDP when dropping packets using multiple 
> cores and I'm getting unexpected results.
> My machine is equipped with a dual port Intel XL710 40 GbE and an Intel 
> Xeon Gold 5120 CPU @ 2.20GHz with 14 cores (HyperThreading disabled), 
> running Ubuntu server 18.04 with kernel 5.8.12.
> I'm using the xdp_rxq_info program from the kernel tree samples to drop 
> packets.
> I generate 64 bytes UDP packets with MoonGen for a total of 42 Mpps. 
> Packets are uniformly distributed in different flows (different src 
> port) and I use flow direction rules on the rx NIC to send these flows 
> to different queues/cores.
> Here are my results:
> 
> 1 FLOW:
> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       17784270    0
> XDP-RX CPU      total   17784270
> 
> RXQ stats       RXQ:CPU pps         issue-pps
> rx_queue_index    0:0   17784270    0
> rx_queue_index    0:sum 17784270
> ---
> 
> 2 FLOWS:
> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       7016363     0
> XDP-RX CPU      1       7017291     0
> XDP-RX CPU      total   14033655
> 
> RXQ stats       RXQ:CPU pps         issue-pps
> rx_queue_index    0:0   7016366     0
> rx_queue_index    0:sum 7016366
> rx_queue_index    1:1   7017294     0
> rx_queue_index    1:sum 7017294
> ---
> 
> 4 FLOWS:
> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       2359478     0
> XDP-RX CPU      1       2358508     0
> XDP-RX CPU      2       2357042     0
> XDP-RX CPU      3       2355396     0
> XDP-RX CPU      total   9430425
> 
> RXQ stats       RXQ:CPU pps         issue-pps
> rx_queue_index    0:0   2359474     0
> rx_queue_index    0:sum 2359474
> rx_queue_index    1:1   2358504     0
> rx_queue_index    1:sum 2358504
> rx_queue_index    2:2   2357040     0
> rx_queue_index    2:sum 2357040
> rx_queue_index    3:3   2355392     0
> rx_queue_index    3:sum 2355392
> 

This is what I see with i40e:

unning XDP on dev:i40e2 (ifindex:6) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      1       8,411,547   0          
XDP-RX CPU      2       2,804,016   0          
XDP-RX CPU      3       2,803,600   0          
XDP-RX CPU      4       5,608,380   0          
XDP-RX CPU      5       13,999,125  0          
XDP-RX CPU      total   33,626,671 

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:3   2,803,600   0          
rx_queue_index    0:sum 2,803,600  
rx_queue_index    1:1   8,411,540   0          
rx_queue_index    1:sum 8,411,540  
rx_queue_index    2:2   2,804,015   0          
rx_queue_index    2:sum 2,804,015  
rx_queue_index    3:5   8,399,326   0          
rx_queue_index    3:sum 8,399,326  
rx_queue_index    4:4   5,608,372   0          
rx_queue_index    4:sum 5,608,372  
rx_queue_index    5:5   5,599,809   0          
rx_queue_index    5:sum 5,599,809  


> I don't understand why overall performance is reducing with the number 
> of cores, according to [1] I would expect it to increase until reaching 
> a maximum value. Is there any parameter I should tune to overcome the 
> problem?

That is strange, as my results above show that it does scale on my
testlab on same NIC i40e (Intel Corporation Ethernet Controller XL710
for 40GbE QSFP+ (rev 02)).

Can you try to use this[2] tool:
 ethtool_stats.pl --dev enp101s0f0

And notice if there are any strange counters.


[2] https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
 
> [1] 
> https://github.com/tohojo/xdp-paper/blob/master/benchmarks/bench02_xdp_drop.org

My best guess is that you have Ethernet flow-control enabled.
Some ethtool counter might show if that is the case. 

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

