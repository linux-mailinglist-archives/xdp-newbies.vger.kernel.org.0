Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393136AC50F
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 Mar 2023 16:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjCFPcM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 6 Mar 2023 10:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjCFPb7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 6 Mar 2023 10:31:59 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0CE5255
        for <xdp-newbies@vger.kernel.org>; Mon,  6 Mar 2023 07:31:39 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cy23so40105223edb.12
        for <xdp-newbies@vger.kernel.org>; Mon, 06 Mar 2023 07:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1678116697;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5i47TZN2w+eTPHAn8wymPBMRCCZeBAKAme0MeZ8NGs=;
        b=HmOJzxdTsJVdSL4zadEU5+R2URwttEE82Dk+lWY+oXCjM+UztsijD71lx85toZ3FKv
         osdMIKybIrFwM/qpIhzT0T2AHDndK2/abZvtTRfASYPMqL1FfySRYuDR9gveg2zC6tO7
         MJLDzUulRX7GjnReJBT5DOWb42kk95N5sG4v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678116697;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5i47TZN2w+eTPHAn8wymPBMRCCZeBAKAme0MeZ8NGs=;
        b=Piy08E7EghAMpJ0LBjNz1dAK+zZTnO6QXq0TFwOmpsiBf2kjnUCWvctBbprFzybxFr
         5oJrmBwuPNSIvZKwZZITiaqxBoe62p1R+5MeIsym9XvwGwXC+lt3QdjnPskNyKyyiztT
         mzbzwnKbW3bAbmGITWNzoToXLjM1cheZPvI2ybD+I1OIBeSYH0RTzzhggWIZPzujrfxb
         S3ljxWEZSGtjTKKKQuVqUmsMhiKVaLcSwIpPNf/3jy+pLKu56wurrlt4XRQv3GH61bE/
         P4i/EKL/wptNsrrWRzQ6x2oexWI++xhjVwqGgeROZB0KO2yBg0le5mO7TBiRliQMp+z4
         NACA==
X-Gm-Message-State: AO0yUKVGJG7+kdlvMj8KxqjVRcrsXIoHE74uQWU8T0i83IUEMImM7rCw
        cPVeRw6GVjFWV1YYT8xgGnc8PFGqqyT0LaHmXAi7/8tc0k3tzUaJ
X-Google-Smtp-Source: AK7set8juHVjHpkSsOdjabL46LvIjYzjPULCpIG6GjfENiz8ufpWgNYqc62KJPC2JX7/4ItRgu3M063mR7CsU3O+YfU=
X-Received: by 2002:a17:906:310d:b0:87b:d50f:6981 with SMTP id
 13-20020a170906310d00b0087bd50f6981mr4811474ejx.14.1678116697376; Mon, 06 Mar
 2023 07:31:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHApi-kjcGOcKuat3fjW_RVLLONT4Vw=60NvgOgBve-d_RgeCg@mail.gmail.com>
 <CAHApi-k8gexhi=jiuHarbB3Key4d7_CigKSj5CZH6cf0B_bbQg@mail.gmail.com> <CAHApi-kp-jsQxu7XEAxEodhjb_oCJgpVEbbia2wMD0qdZ9bK6A@mail.gmail.com>
In-Reply-To: <CAHApi-kp-jsQxu7XEAxEodhjb_oCJgpVEbbia2wMD0qdZ9bK6A@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Mon, 6 Mar 2023 16:36:03 +0100
Message-ID: <CAHApi-nUAs4TeFWUDV915CZJo07XVg2Vp63-no7UDfj6wur9nQ@mail.gmail.com>
Subject: Re: Crash in mlx5e_dealloc_rx_wqe [mlx5_core]
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

The log was written this time. Below is the error:

Mar 06 14:26:57 fedora kernel: mlx5_core 0000:99:00.0 det1: Link up
Mar 06 14:26:58 fedora kernel: mlx5_core 0000:ed:00.0 det2: Link up
Mar 06 14:26:58 fedora kernel: mlx5_core 0000:33:00.1 user2p2: Link up
Mar 06 14:26:59 fedora kernel: IPv6: ADDRCONF(NETDEV_CHANGE): user2p2:
link becomes ready
Mar 06 14:28:04 fedora kernel: megaraid_sas 0000:18:00.0: 2786
(731424485s/0x0004/CRIT) - Enclosure PD 20(c None/p1) phy bad for slot
1
Mar 06 15:03:07 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3480): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:03:07 fedora kernel: mlx5_core 0000:99:00.0 det1: XDP is not
allowed with striding RQ and MTU(9000) > 3498
Mar 06 15:03:35 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3487): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:03:48 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3493): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:04:00 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3495): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:06:05 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3498): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:06:10 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3500): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:06:14 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3502): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:06:18 fedora kernel: mlx5_core 0000:99:00.0:
mlx5e_xsk_enable_locked:107:(pid 3504): Expected slowdown with XSK
frame size 2048. Upgrade firmware for better performance.
Mar 06 15:29:13 fedora kernel: mlx5_core 0000:33:00.1 user2p2: Link down
Mar 06 15:29:37 fedora kernel: mlx5_core 0000:33:00.1 user2p2: Link up
Mar 06 15:38:48 fedora kernel: device user2p2 entered promiscuous mode
Mar 06 15:38:48 fedora kernel: mlx5_core 0000:33:00.1:
mlx5e_fs_set_rx_mode_work:836:(pid 3644): S-tagged traffic will be
dropped while C-tag vlan stripping is enabled
Mar 06 15:38:54 fedora kernel: device user2p2 left promiscuous mode
Mar 06 15:40:19 fedora kernel: mlx5_core 0000:33:00.1:
cq_err_event_notifier:505:(pid 0): CQ error on CQN 0x954, syndrome 0x1
Mar 06 15:40:19 fedora kernel: mlx5_core 0000:33:00.1 user2p2:
mlx5e_cq_error_event: cqn=0x000954 event=0x04
Mar 06 15:40:26 fedora kernel: page:00000000427919b7 refcount:0
mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x19a269
Mar 06 15:40:26 fedora kernel: flags:
0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
Mar 06 15:40:26 fedora kernel: raw: 0017ffffc0000000 0000000000000000
0000000000000000 0000000000000000
Mar 06 15:40:26 fedora kernel: raw: 0000000000000000 0000000000000000
00000000ffffffff 0000000000000000
Mar 06 15:40:26 fedora kernel: page dumped because:
VM_BUG_ON_PAGE(page_ref_count(page) == 0)
Mar 06 15:40:26 fedora kernel: ------------[ cut here ]------------
Mar 06 15:40:26 fedora kernel: kernel BUG at include/linux/mm.h:763!
Mar 06 15:40:26 fedora kernel: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
Mar 06 15:40:26 fedora kernel: CPU: 1 PID: 3771 Comm: xdpsock Not
tainted 6.1.14-100.fc36.x86_64 #1
Mar 06 15:40:26 fedora kernel: Hardware name: Dell Inc. PowerEdge
R940/0D41HC, BIOS 2.15.1 06/15/2022
Mar 06 15:40:26 fedora kernel: RIP:
0010:mlx5e_page_release_dynamic+0x1ad/0x1b0 [mlx5_core]
Mar 06 15:40:26 fedora kernel: Code: 45 48 48 8d 50 ff a8 01 48 0f 45
ea eb 99 0f 0b e9 c3 fe ff ff 48 8d 68 ff eb 8c 48 c7 c6 78 18 23 c1
48 89 ef e8 73 86 19 c9 <0f> 0b 90 0f 1f 44 00 00 41 57 4c 8d 7e 08 41
56 41 55 41 54 49 89
Mar 06 15:40:26 fedora kernel: RSP: 0018:ffffb0f9dd7a3c98 EFLAGS: 00010296
Mar 06 15:40:26 fedora kernel: RAX: 000000000000003e RBX:
ffff9f9675e68000 RCX: 0000000000000000
Mar 06 15:40:26 fedora kernel: RDX: 0000000000000001 RSI:
ffffffff8b749b33 RDI: 00000000ffffffff
Mar 06 15:40:26 fedora kernel: RBP: ffffe5ed86689a40 R08:
0000000000000000 R09: ffffb0f9dd7a3af8
Mar 06 15:40:26 fedora kernel: R10: 0000000000000003 R11:
ffffa054bf1fffe8 R12: ffff9f9675e68000
Mar 06 15:40:26 fedora kernel: R13: 0000000000000000 R14:
ffff9f96aaaf0a38 R15: ffff9f9675e68000
Mar 06 15:40:26 fedora kernel: FS:  00007f92a4458000(0000)
GS:ffff9ff4bf200000(0000) knlGS:0000000000000000
Mar 06 15:40:26 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Mar 06 15:40:26 fedora kernel: CR2: 00000000008eb008 CR3:
00000030722ee001 CR4: 00000000007706e0
Mar 06 15:40:26 fedora kernel: DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Mar 06 15:40:26 fedora kernel: DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Mar 06 15:40:26 fedora kernel: PKRU: 55555554
Mar 06 15:40:26 fedora kernel: Call Trace:
Mar 06 15:40:26 fedora kernel:  <TASK>
Mar 06 15:40:26 fedora kernel:  mlx5e_dealloc_rx_wqe+0x5b/0x80 [mlx5_core]
Mar 06 15:40:26 fedora kernel:  mlx5e_free_rx_descs+0x37/0xf0 [mlx5_core]
Mar 06 15:40:26 fedora kernel:  mlx5e_flush_rq+0x17/0x60 [mlx5_core]
Mar 06 15:40:26 fedora kernel:  mlx5e_xsk_setup_pool+0x1e3/0x3d0 [mlx5_core]
Mar 06 15:40:26 fedora kernel:  xp_assign_dev+0x10f/0x1e0
Mar 06 15:40:26 fedora kernel:  xsk_bind+0x119/0x3d0
Mar 06 15:40:26 fedora kernel:  __sys_bind+0xe1/0xf0
Mar 06 15:40:26 fedora kernel:  __x64_sys_bind+0x14/0x20
Mar 06 15:40:26 fedora kernel:  do_syscall_64+0x58/0x80
Mar 06 15:40:26 fedora kernel:  ? syscall_exit_to_user_mode+0x17/0x40
Mar 06 15:40:26 fedora kernel:  ? do_syscall_64+0x67/0x80
