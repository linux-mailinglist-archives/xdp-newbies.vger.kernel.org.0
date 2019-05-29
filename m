Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9BD2E2FE
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2019 19:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfE2RQO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 May 2019 13:16:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52894 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbfE2RQN (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 May 2019 13:16:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C69313D95D;
        Wed, 29 May 2019 17:16:08 +0000 (UTC)
Received: from carbon (ovpn-200-30.brq.redhat.com [10.40.200.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09CFE7A01C;
        Wed, 29 May 2019 17:16:03 +0000 (UTC)
Date:   Wed, 29 May 2019 19:16:02 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Tom Barbette <barbette@kth.se>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Bad XDP performance with mlx5
Message-ID: <20190529191602.71eb6c87@carbon>
In-Reply-To: <d7968b89-7218-1e76-86bf-c452b2f8d0c2@kth.se>
References: <d7968b89-7218-1e76-86bf-c452b2f8d0c2@kth.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 29 May 2019 17:16:13 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 29 May 2019 18:03:08 +0200
Tom Barbette <barbette@kth.se> wrote:

> Hi all,
> 
> I've got a very simple eBPF program that counts packets per queue in a 
> per-cpu map.

Like xdp_rxq_info --dev mlx5p1 --action XDP_PASS ?

> I use IPerf in TCP mode, I limit the CPU cores to 2 so performance is 
> limited by CPU (always at 100%).
> 
> With a XL710 NIC 40G link, with the XDP program loaded, I get 32.5. 
> Without I get ~33.3Gbps. Pretty similar, somehow expected.
> 
> With a ConnectX 5 100G link, I get ~33.3Gbps without the XDP program but 
> ~26 with it. The behavior seems similar with a simple XDP_PASS program.

Are you sure?

My test on a ConnectX 5 100G link show:
 - 33.8 Gbits/sec = with no-XDP prog
 - 34.5 Gbits/sec - with xdp_rxq_info

> Any idea why MLX5 driver behaves like this? perf top is not conclusive 
> at first glance. I'd say check_object_size and 
> copy_user_enhanced_fast_string rise up but the stack is unclear from where.
 
It is possible to get very different and varying TCP bandwidth results,
depending on if TCP-server-process is running on the same CPU as the
NAPI-RX loop.  If they share the CPU then results are worse, as
process-context scheduling is setting a limit.

This is easiest to demonstrate with netperf option -Tn,n:

$ netperf -H 198.18.1.1 -D1 -T2,2 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.1 () port 0 AF_INET : histogram : demo : cpu bind
Interim result: 35344.39 10^6bits/s over 1.002 seconds ending at 1559149724.219
Interim result: 35294.66 10^6bits/s over 1.001 seconds ending at 1559149725.221
Interim result: 36112.09 10^6bits/s over 1.002 seconds ending at 1559149726.222
Interim result: 36301.13 10^6bits/s over 1.000 seconds ending at 1559149727.222
^CInterim result: 36146.78 10^6bits/s over 0.507 seconds ending at 1559149727.730
Recv   Send    Send                          
Socket Socket  Message  Elapsed              
Size   Size    Size     Time     Throughput  
bytes  bytes   bytes    secs.    10^6bits/sec  

131072  16384  16384    4.51     35801.94   


$ netperf -H 198.18.1.1 -D1 -T1,1 -t TCP_STREAM -l 120
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.1 () port 0 AF_INET : histogram : demo : cpu bind
Interim result: 26990.45 10^6bits/s over 1.000 seconds ending at 1559149733.554
Interim result: 27730.35 10^6bits/s over 1.000 seconds ending at 1559149734.554
Interim result: 27725.76 10^6bits/s over 1.000 seconds ending at 1559149735.554
Interim result: 27513.39 10^6bits/s over 1.008 seconds ending at 1559149736.561
Interim result: 27421.46 10^6bits/s over 1.003 seconds ending at 1559149737.565
^CInterim result: 27523.62 10^6bits/s over 0.580 seconds ending at 1559149738.145
Recv   Send    Send                          
Socket Socket  Message  Elapsed              
Size   Size    Size     Time     Throughput  
bytes  bytes   bytes    secs.    10^6bits/sec  

131072  16384  16384    5.59     27473.50   


> I use 5.1-rc3, compiled myself using Ubuntu 18.04's latest .config file.

I use 5.1.0-bpf-next (with some patches on top of commit 35c99ffa20).

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
