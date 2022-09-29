Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489065EF84C
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Sep 2022 17:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbiI2PFU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Sep 2022 11:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbiI2PFS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Sep 2022 11:05:18 -0400
X-Greylist: delayed 527 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 29 Sep 2022 08:05:14 PDT
Received: from umail2.aei.mpg.de (umail2.aei.mpg.de [194.94.224.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE1661722
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Sep 2022 08:05:12 -0700 (PDT)
Received: from mephisto.aei.uni-hannover.de (ahgate1.aei.uni-hannover.de [130.75.117.49])
        by umail2.aei.mpg.de (Postfix) with ESMTPSA id 0538139223BD
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Sep 2022 16:56:22 +0200 (CEST)
Date:   Thu, 29 Sep 2022 16:56:21 +0200
From:   Henning Fehrmann <henning.fehrmann@aei.mpg.de>
To:     xdp-newbies@vger.kernel.org
Subject: traffic redirection and tapping
Message-ID: <YzWyFYccrHxKGsrQ@mephisto.aei.uni-hannover.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey folks,

we have a node with 4 dual-port MT28908 Mellanox cards installed. We want to
redirect the incoming traffic from an ingress port to an egress port on
the same NIC using the bpf_redirect() helper function.

Each ingress port redirects traffic of ca 25Gibps with a packet size of ca
1500Bytes. It is almost solely UDP multicast traffic. There are four
multicast groups per bridge coming from 64 different source IPs.

I raised the rx ring buffer size of the ingress ports to 8192
and aggregated the interrupts:
ethtool -C ingress_port_i rx-frames 512
ethtool -C ingress_port_i rx-usecs 16

I still need to check whether these numbers make sense.

The CPU utilization is moderate around 20-30%.

On top of it we'd like to record the traffic streams using
the bpf_ringbuf_output function.
For now I write only into the ringbuffer to make the data available in
user space. I have 16 different ringbuffer, one for each CPU. I am
currently not sure how to enforce that the ringbuffer sits in the right NUMA
node. Is there a way?

numastat tells me that I have zero numa misses so that is possibly OK.

In user land I start 16 threads pinned to the cores running a handler to process the
ringbuffer content. Currently I only count packets.

Doing it all cores are entirely utilized and I lose packets.

perf top tells me (only CPU 8):

   PerfTop:    3868 irqs/sec  kernel:95.9%  exact: 97.6% lost: 0/0 drop: 0/0 [4000Hz cycles],  (all, CPU: 8)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    25.72%         11804  [kernel]                                        [k] xdp_do_redirect
     8.73%          4008  [kernel]                                        [k] memcpy
     7.19%          3297  [kernel]                                        [k] bq_enqueue
     7.16%          3287  [kernel]                                        [k] check_preemption_disabled
     4.28%          1959  [kernel]                                        [k] bpf_ringbuf_output
     4.20%          1925  [kernel]                                        [k] mlx5e_xdp_handle

and in perf record I indeed find the memcopy issue + some load for mlx5e_napi_poll:


--45.35%--__napi_poll
          mlx5e_napi_poll
          |
          |--36.80%--mlx5e_poll_rx_cq
          |          |
          |          |--35.64%--mlx5e_handle_rx_cqe_mpwrq
          |          |          |
          |          |           --35.56%--mlx5e_skb_from_cqe_mpwrq_linear
          |          |                     |
          |          |                      --34.57%--mlx5e_xdp_handle
          |          |                                |
          |          |                                |--32.15%--bpf_prog_82775e2abf7feec0_xdp_tap_ingress_prog
          |          |                                |          |
          |          |                                |           --31.20%--bpf_ringbuf_output
          |          |                                |                     |
          |          |                                |                      --30.69%--memcpy
          |          |                                |                                |
          |          |                                |                                 --0.77%--asm_common_interrupt
          |          |                                |                                           common_interrupt
          |          |                                |                                           |
          |          |                                |                                            --0.72%--__common_interrupt
          |          |                                |                                                      handle_edge_irq
          |          |                                |                                                      |


Is there any chance to improve the ringbuffer output?
Or could I get the packets onto disks in any other way using bpf helper
functions? Do I need to gather more or other information?

Thank you for your help.

Cheers,
Henning
