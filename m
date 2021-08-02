Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5681B3DCE70
	for <lists+xdp-newbies@lfdr.de>; Mon,  2 Aug 2021 02:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhHBA6O (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 1 Aug 2021 20:58:14 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:54174 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhHBA6N (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 1 Aug 2021 20:58:13 -0400
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 67B447AC664F; Sun,  1 Aug 2021 21:58:03 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 67B447AC664F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1627865883;
        bh=C8jiyR1DLOF9zp3eruvr4X+dAgOvQLkUWstXMqLCdMc=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=aOvRp6Ec7pdMLTDdal4aGs33pENs8oC5v/+/QarOMP1EdjFtxmvyI1eZq8iulT5fe
         aq1jVdA1QVNoSG2VZumc2fpVEash87K9g8rtEzcsv/24uS7JcOLZtlHwXbqg6yrsMg
         5cPaQVuldXcAdsHyi3R92a8Pul4e+RHrhoTVNdNGfCB+00l6sw0NZMkKdX9aIk/fo/
         12ei0deUSfAUOqKslegcnZ1DWgGFNzh9dfKnQ2AQa5OOrU+hkeUqLCOl1q6YbxsKFo
         EpZr5w3vY5WSMMZytEnkk9F3E92ll4ESuI7fb3rZaFmp8CO0LjB7fBYnzZkzyIh5oA
         LwUr+i6Kk5KOw==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id DCF1F7AC664D
        for <xdp-newbies@vger.kernel.org>; Sun,  1 Aug 2021 21:58:02 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br DCF1F7AC664D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1627865882;
        bh=C8jiyR1DLOF9zp3eruvr4X+dAgOvQLkUWstXMqLCdMc=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=c+SiwTYh6Pdij2bzFDAT2m673s/qzHXuUN/wLhnLQuJ/92dH6tqA+jP7CMwLOPfKJ
         UL8a5qhCPZpxvqFs8s1Yf5UZMH8P3h0PqU2SOht8ZkEOqTMrGEJragq7805kQ/BqPF
         nNhwk5sEDTJMt5y+46JsqYzgLeVUVuYjHZkvzvUAjQ20VdTY/Z2rVZCEgmr7l24nwA
         U982JTTr1qVR9H5KI8NUHHVdpQBASRaW/xsX+wF/T6Yb6LRjFHtmTnFyZOz0mCAguV
         fx7RvnkAlfO+fUN+vdnal6t72jN9F77EXFLlgeUhYG6EhEGz0j5guh7j78HaNInMlC
         9/bfanmPDJGIw==
Date:   Sun, 1 Aug 2021 21:57:56 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: watchdog: BUG: soft lockup
Message-ID: <20210801215756.65966bd9@babalu>
In-Reply-To: <20210729010457.680241f7@babalu>
References: <20210729010457.680241f7@babalu>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Hi guys.

Hasn't anybody had any experience with these?

Ethy



On Thu, 29 Jul 2021 01:04:57 -0300
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> Hi everyone.
> 
> Is anyone using MQ+HFSC as a class discipline and xdp-cpumap-tc?
> 
> Today I tried to put this combination in production and got a freezed box with dozens of the 
> messages bellow  in syslog (with three of 48 virtualized cores at 100% load). 
> I could still ping the box thru a management interface however, but that's about it.
> 
> This setup worked nicely in a lab environment, but with no real traffic. 
> Just a few successful, single user, iperf3 100mbps upload and download simulations.
> 
> As I was debugging a vlan issue earlier (solved elsewhere [1]), I left around about 20 bpf_debug messages at 
> xdp_iphash/tc_classify kernel code.
> Could these messages be causing the lockup?
> If not, what could it be?
> 
> The packet rate just before launching the script was as low as 100kpps WAN->LAN.
> 
> Thanks for your time.
> 
> Ethy
> 
> [1]
> https://www.spinics.net/lists/xdp-newbies/msg02085.html
> 
> -----------------------------------------------8<--------------------------------------------------
> 
> 
> Jul 28 02:28:38 quiron kernel: [511672.119473] watchdog: BUG: soft lockup - CPU#7 stuck for 22s! [cpumap/7/map:1:1171030]
> 
> Jul 28 02:28:38 quiron kernel: [511672.127497] Modules linked in: cls_bpf algif_hash af_alg sch_ingress sch_fq_codel sch_hfsc
> cls_u32 sch_sfq sch_htb xt_connt rack xt_nat xt_tcpudp ip_set_list_set ip_set_hash_netport ip_set_hash_ip ip_set_hash_net
> ip_set 8021q garp mrp veth nf_tables nfnetlink bridge stp llc ip6table_filter ip6table_raw ip6_tables iptable_filter
> iptable_raw iptable_nat nf_nat bpfilter dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua intel_rapl_msr intel_rapl_common
> ipmi_ssif isst_if_common skx_edac nfit x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm crct10dif_pclmul
> ghash_clmulni_intel aesni_i ntel crypto_simd cryptd glue_helper mgag200 drm_vram_helper ttm drm_kms_helper dell_smbios
> ipmi_si fb_sys_fops ipmi_devintf mei_me syscopyarea sysfillrect rapl sysimgblt wmi_bmof dcdbas dell_wmi_descriptor mei
> intel_cstate ipmi_msghandler mac_hid acpi_power_meter sch_fq i5500_temp tcp_bbr nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> dummy drm ip_tables x_tables autofs4 raid10 raid456 async_raid6_recov
> 
> Jul 28 02:28:38 quiron kernel: [511672.127531]  async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0
> multipath linear igb i2c_algo_bit ahci i2c_i801 lpc_ich dca crc32_pclmul i40e libahci wmi
> 
> Jul 28 02:28:38 quiron kernel: [511672.127541] CPU: 7 PID: 1171030 Comm: cpumap/7/map:1 Not tainted 5.4.0-66-generic
> #74-Ubuntu
> 
> Jul 28 02:28:38 quiron kernel: [511672.127541] Hardware name: Dell Inc. PowerEdge R640/0X45NX, BIOS 2.10.2 02/24/2021
> 
> Jul 28 02:28:38 quiron kernel: [511672.127548] RIP: 0010:rb_first+0x8/0x20
> 
> Jul 28 02:28:38 quiron kernel: [511672.127550] Code: 10 e9 da fe ff ff 4c 89 e9 4c 89 f2 4d 89 ee 49 89 c5 e9 81 fe ff ff 66
> 66 2e 0f 1f 84 00 00 00 00 00 48 8b 07 48 85 c0 74 10 <49> 89 c0 48 8b 40 10 48 85 c0 75 f4 4c 89 c0 c3 45 31 c0 eb f7 0f
> 
> Jul 28 02:28:38 quiron kernel: [511672.127551] RSP: 0018:ffffba23c4837928 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
> 
> Jul 28 02:28:38 quiron kernel: [511672.127552] RAX: ffff9568749e9090 RBX: ffff9566470a1800 RCX: 0000000000000018
> 
> Jul 28 02:28:38 quiron kernel: [511672.127553] RDX: 000042e5af1e6e28 RSI: 000a7768f6487f18 RDI: ffff9566470a1c40
> 
> Jul 28 02:28:38 quiron kernel: [511672.127553] RBP: ffffba23c4837958 R08: ffff9568749e9090 R09: 0000000000000000
> 
> Jul 28 02:28:38 quiron kernel: [511672.127554] R10: 00000000559e0129 R11: 00000074559e0129 R12: 0000000000000000
> 
> Jul 28 02:28:38 quiron kernel: [511672.127555] R13: 0000074559e01298 R14: ffff9566470a1c40 R15: ffff9566470a1800
> 
> Jul 28 02:28:38 quiron kernel: [511672.127555] FS:  0000000000000000(0000) GS:ffff9568778c0000(0000) knlGS:0000000000000000
> 
> Jul 28 02:28:38 quiron kernel: [511672.127556] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 
> Jul 28 02:28:38 quiron kernel: [511672.127557] CR2: 00007fa33136b290 CR3: 000000039680a001 CR4: 00000000007606e0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127557] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> 
> Jul 28 02:28:38 quiron kernel: [511672.127558] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> Jul 28 02:28:38 quiron kernel: [511672.127558] PKRU: 55555554
> 
> Jul 28 02:28:38 quiron kernel: [511672.127559] Call Trace:
> 
> Jul 28 02:28:38 quiron kernel: [511672.127564]  ? hfsc_dequeue+0x41/0x380 [sch_hfsc]
> 
> Jul 28 02:28:38 quiron kernel: [511672.127569]  __qdisc_run+0x94/0x5b0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127573]  __dev_queue_xmit+0x489/0x8e0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127575]  dev_queue_xmit+0x10/0x20
> 
> Jul 28 02:28:38 quiron kernel: [511672.127578]  vlan_dev_hard_start_xmit+0x97/0x120 [8021q]
> 
> Jul 28 02:28:38 quiron kernel: [511672.127579]  dev_hard_start_xmit+0x91/0x1f0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127580]  __dev_queue_xmit+0x720/0x8e0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127582]  ? eth_header+0x2b/0xc0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127583]  dev_queue_xmit+0x10/0x20
> 
> Jul 28 02:28:38 quiron kernel: [511672.127585]  neigh_connected_output+0xc1/0xf0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127589]  ip_finish_output2+0x19b/0x590
> 
> Jul 28 02:28:38 quiron kernel: [511672.127590]  __ip_finish_output+0xbf/0x1e0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127592]  ip_finish_output+0x2d/0xb0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127593]  ip_output+0x75/0xf0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127595]  ? __ip_finish_output+0x1e0/0x1e0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127596]  ip_forward_finish+0x58/0x90
> 
> Jul 28 02:28:38 quiron kernel: [511672.127597]  ip_forward+0x3a7/0x4b0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127598]  ? ip_frag_queue.cold+0x32/0x32
> 
> Jul 28 02:28:38 quiron kernel: [511672.127600]  ip_rcv_finish+0x85/0xa0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127601]  ip_rcv+0xbc/0xd0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127602]  ? ip_rcv_finish_core.isra.0+0x3c0/0x3c0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127603]  __netif_receive_skb_one_core+0x88/0xa0
> 
> Jul 28 02:28:38 quiron kernel: [511672.127604]  netif_receive_skb_core+0x10/0x20
> 
> Jul 28 02:28:38 quiron kernel: [511672.127608]  cpu_map_kthread_run+0x275/0x540
> 
> Jul 28 02:28:38 quiron kernel: [511672.127612]  ? __schedule+0x2eb/0x740
> 
> Jul 28 02:28:38 quiron kernel: [511672.127616]  kthread+0x104/0x140
> 
> Jul 28 02:28:38 quiron kernel: [511672.127617]  ? __cpu_map_entry_free+0x70/0x70
> 
> Jul 28 02:28:38 quiron kernel: [511672.127618]  ? kthread_park+0x90/0x90
> 
> Jul 28 02:28:38 quiron kernel: [511672.127621]  ret_from_fork+0x1f/0x40
> 
> 


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
