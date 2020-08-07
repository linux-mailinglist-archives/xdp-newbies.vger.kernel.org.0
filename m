Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6263723F033
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 Aug 2020 17:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgHGPvm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 Aug 2020 11:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGPvm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 7 Aug 2020 11:51:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B11C061756
        for <xdp-newbies@vger.kernel.org>; Fri,  7 Aug 2020 08:51:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id i10so2726989ljn.2
        for <xdp-newbies@vger.kernel.org>; Fri, 07 Aug 2020 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khomp.com; s=google;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ES22QVb3KlePZnKvODvrN8ZcL74DalCDITHG3zOTeWU=;
        b=x9N1K9r4EeDAg9AnkdbxlMJZaXK94X0JOivTkWYsB+/eyl+FtPul2y4RfnTbuRIqBP
         dqCCsjtm89uTUskHcKctcVwGD3R2PtIWtnQQPaVtvH9K8OOJ2FXINO0aAIF4XH1rp6Ej
         hh5UQmuom//o8Y/1qhTcKlG0KU8Sw00ehvGO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ES22QVb3KlePZnKvODvrN8ZcL74DalCDITHG3zOTeWU=;
        b=fWcC//e8e9VAHVZbRuxATxZeEjojVE5R5noaRlVUBn/ygp0BvjXwWV+P0BZ//tJ6HD
         AXgvz8DVSQpSs19plCreS0Hhy7N4mQDuIS6cTg9k7mGYc/WL/44lmcM+2Jw6IPevta3L
         HgQeJU0wrs1bmCfeKeqdPOvFGNNMxWkSy5q825BesVjKcgo8Sl3n7jde5m/Ew4kTaRYY
         cVEKAfCgXbPmM2LuZQThWXi+2jWx/1J6k+HL7Dwgtk91uMpbttm39SW8No5PfhTRPVKc
         Ccy+LcvpQTm/TamQHlGJ/IuMnGw7NQVhKBetNFSq3qbG/p02GK+c5U/8Rjvh02QgFBFS
         suyw==
X-Gm-Message-State: AOAM530h+aiWhB1v7yThMyKheGUuPlIkBqBoO34BXrgqnYM7DacCuqw2
        zwu1wsgXRSMZvynaoddzUamyzH85ASADN8Jni/AaWKb71h0=
X-Google-Smtp-Source: ABdhPJw1fNb9pYgByNx8oOaStDSCtAe9ChhRWsU4Z/uuNpLEfKEhD1N5nq6aKUWnnz3NqO152McBwt+q5xCVO6HYVLM=
X-Received: by 2002:a2e:8717:: with SMTP id m23mr6797819lji.245.1596815499109;
 Fri, 07 Aug 2020 08:51:39 -0700 (PDT)
MIME-Version: 1.0
From:   Rafael Vargas <vargas@khomp.com>
Date:   Fri, 7 Aug 2020 12:51:36 -0300
Message-ID: <CAEaYoca34NU43BK9VQdpM5W-j4uHSix4VW=G9Ja8iNRVZ5Zsjg@mail.gmail.com>
Subject: Kernel Panic when loading XDP on i40e driver
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I've been using XDP for some time and now I've encountered this Kernel
Panic that is puzzling me.

Using kernel 5.8 (mainline from kernel.org) and a Lenovo Intel X722
controller (using the i40e driver). Loading any XDP program to this
driver will immediately crash with a Kernel Panic.

I've seen 3 different machines getting the same problem, all with the
i40e driver. Tried getting the 2.12.6 driver version from the Intel
(kernel ships with 2.8.20-k) site and it worked on 2 machines.

The Kernel crash dump (using kdump) in the third one pointed me to
this point in the code:

i40e_xdp_setup:
...
for (i =3D 0; i < vsi->num_queue_pairs; i++)
     WRITE_ONCE(vsi->rx_rings[i]->xdp_prog, vsi->xdp_prog);

And found this note from Bj=C3=B6rn T=C3=B6pel in an old email:

On 2020-01-20 18:04 Bj=C3=B6rn T=C3=B6pel wrote:
[...]
> Long story short, the i40e crash is that the drivers tries to allocate 25=
6 queues, but the HW is short on queues. The drivers enters a broken state,=
 which triggers the crash.


The machine that didn't work has 72 cpus, setting maxcpus=3D64 in the
kernel cmdline made it work (but only with the 2.12.6 driver). Tried
this as ethtool showed that the device has 128 channels. Using the
kernel-5.8 i40e default driver (2.8.20-k) it crashes with any number
of cpus.

Is there anything I can do to make it work (as I've seen a lot of
people using XDP with the i40e driver in this mailing list). Or any
more data that I can provide so we can patch it?

This is the kernel log from the dump (using the i40e driver from the
5.8.0 kernel):

=3D=3D=3D=3D=3D=3D=3D Log start =3D=3D=3D=3D=3D
[61064.083688] i40e 0000:08:00.0: DCB is not supported or FW LLDP is disabl=
ed
[61064.083690] i40e 0000:08:00.0: DCB init failed -64, disabled
[61064.084062] i40e 0000:08:00.0: failed to get tracking for 256
queues for VSI 0 err -12
[61064.084064] i40e 0000:08:00.0: setup of MAIN VSI failed
[61064.084091] i40e 0000:08:00.0: can't remove VEB 160 with 0 VSIs left
[61064.084096] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[61064.084717] #PF: supervisor read access in kernel mode
[61064.085323] #PF: error_code(0x0000) - not-present page
[61064.085930] PGD 0 P4D 0
[61064.086533] Oops: 0000 [#1] SMP PTI
[61064.087124] CPU: 40 PID: 5000 Comm: xdprouter_cli Kdump: loaded Not
tainted 5.8.0 #1
[61064.087722] Hardware name: Lenovo ThinkSystem SR630
-[7X02CTO1WW]-/-[7X02CTO1WW]-, BIOS -[IVE152L-2.51]- 01/14/2020
[61064.088342] RIP: 0010:i40e_xdp+0x13c/0x1e0 [i40e]
[61064.088962] Code: 01 00 00 00 be 01 00 00 00 48 89 cf e8 2d dc ff
ff 31 c0 66 83 bb f6 0c 00 00 00 74 27 48 8b 93 90 0c 00 00 48 63 c8
83 c0 01 <48> 8b 14 ca 48 8b 8b d0 0c 00 00 48 89 4a 20 0f b7 93 f6 0c
00 00
[61064.090293] RSP: 0018:ffffb222e0357850 EFLAGS: 00010202
[61064.090960] RAX: 0000000000000001 RBX: ffff92240fc3a000 RCX: 00000000000=
00000
[61064.091628] RDX: 0000000000000000 RSI: ffff92241fd98a20 RDI: ffff92241fd=
98a28
[61064.092289] RBP: 000000001fca8301 R08: 0000000000000001 R09: 00000000000=
00630
[61064.092945] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[61064.093590] R13: ffffb222e0357c01 R14: ffffb222c698e000 R15: 00000000fff=
fff00
[61064.094230] FS:  00007fe85289cb40(0000) GS:ffff92241fd80000(0000)
knlGS:0000000000000000
[61064.094868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[61064.095498] CR2: 0000000000000000 CR3: 00000007fa00c005 CR4: 00000000007=
606e0
[61064.096131] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[61064.096769] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[61064.097390] PKRU: 55555554
[61064.097993] Call Trace:
[61064.098601]  ? i40e_reconfig_rss_queues+0x160/0x160 [i40e]
[61064.099212]  dev_xdp_install+0x12e/0x150
[61064.099825]  ? i40e_reconfig_rss_queues+0x160/0x160 [i40e]
[61064.100446]  dev_change_xdp_fd+0x1a6/0x310
[61064.101073]  do_setlink+0xdf5/0xe50
[61064.101703]  ? rtnl_dump_ifinfo+0x31e/0x5c0
[61064.102335]  ? __nla_validate_parse.part.6+0x57/0xa20
[61064.102957]  rtnl_setlink+0x107/0x160
[61064.103580]  rtnetlink_rcv_msg+0x291/0x360
[61064.104201]  ? __check_object_size+0x40/0x1b0
[61064.104831]  ? _cond_resched+0x16/0x40
[61064.105440]  ? kmem_cache_alloc_node+0x192/0x640
[61064.106047]  ? __alloc_skb+0x57/0x1b0
[61064.106649]  ? rtnl_calcit.isra.33+0x120/0x120
[61064.107249]  netlink_rcv_skb+0xd1/0x110
[61064.107845]  netlink_unicast+0x21d/0x300
[61064.108439]  netlink_sendmsg+0x323/0x460
[61064.109024]  sock_sendmsg+0x5b/0x60
[61064.109602]  __sys_sendto+0xd8/0x150
[61064.110176]  ? __sys_getsockname+0xb2/0xc0
[61064.110756]  ? syscall_trace_enter+0x1ad/0x2b0
[61064.111339]  ? __audit_syscall_exit+0x1e4/0x290
[61064.111927]  ? __prepare_exit_to_usermode+0x7e/0x1d0
[61064.112522]  __x64_sys_sendto+0x24/0x30
[61064.113123]  do_syscall_64+0x44/0xb0
[61064.113722]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[61064.114320] RIP: 0033:0x7fe8522615dd
[61064.114921] Code: 79 20 00 f7 d8 64 89 01 48 83 c8 ff c3 8b 05 fa
bd 20 00 85 c0 75 3e 48 63 ff 45 31 c9 45 31 c0 4c 63 d1 b8 2c 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 0b c3 66 2e 0f 1f 84 00 00 00 00 00 48
8b 15
[61064.116244] RSP: 002b:00007ffe67117248 EFLAGS: 00000246 ORIG_RAX:
000000000000002c
[61064.116942] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fe8522=
615dd
[61064.117629] RDX: 000000000000002c RSI: 00007ffe67117270 RDI: 00000000000=
00009
[61064.118325] RBP: 00007ffe67118310 R08: 0000000000000000 R09: 00000000000=
00000
[61064.119024] R10: 0000000000000000 R11: 0000000000000246 R12: 00005608352=
36cc0
[61064.119731] R13: 0000560835233bf0 R14: 00005608368aa890 R15: 00000000000=
00000
[61064.120439] Modules linked in: intel_rapl_msr intel_rapl_common
skx_edac nfit libnvdimm ip6t_REJECT nf_reject_ipv6 cbc encrypted_keys
ip6table_filter ip6table_mangle ip6table_raw ip6_tables joydev
x86_pkg_temp_thermal coretemp ipt_REJECT nf_reject_ipv4 kvm_intel
xt_tcpudp xt_recent xt_conntrack iptable_filter iptable_mangle
iptable_raw iptable_nat kvm nf_nat nf_conntrack_ftp nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c cdc_ether usbnet mii irqbypass
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel
crypto_simd cryptd glue_helper binfmt_misc rapl mgag200 intel_cstate
drm_vram_helper nls_ascii drm_ttm_helper snd_pcm nls_cp437 snd_timer
ttm vfat snd soundcore fat drm_kms_helper efi_pstore intel_uncore drm
mei_me lpc_ichioatdma ipmi_si iTCO_wdt efivars pcspkr sg i2c_algo_bit
iTCO_vendor_support mfd_core ipmi_devintf dca mei hid_generic
ipmi_msghandler evdev acpi_power_meter button usbhid hid loop efivarfs
ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2
[61064.120472]  ses enclosure sd_mod t10_pi scsi_transport_sas
xhci_pci i40e ahci xhci_hcd libahci ptp crc32c_intel megaraid_sas
libata i2c_i801 pps_core i2c_smbus usbcore scsi_mod wmi
[61064.125520] CR2: 0000000000000000


crash> bt
PID: 5000   TASK: ffff9223fd64c2c0  CPU: 40  COMMAND: "xdp_cli"
 #0 [ffffb222e0357570] machine_kexec at ffffffffa4a5dbbb
 #1 [ffffb222e03575c8] __crash_kexec at ffffffffa4b33ded
 #2 [ffffb222e0357690] crash_kexec at ffffffffa4b34d38
 #3 [ffffb222e03576a8] oops_end at ffffffffa4a2d7f8
 #4 [ffffb222e03576c8] no_context at ffffffffa4a6b1f2
 #5 [ffffb222e0357738] exc_page_fault at ffffffffa51bc93f
 #6 [ffffb222e03577a0] asm_exc_page_fault at ffffffffa5200ade
 #7 [ffffb222e0357828] i40e_xdp at ffffffffc05e98ec [i40e]
 #8 [ffffb222e0357888] dev_xdp_install at ffffffffa505925e
 #9 [ffffb222e03578e8] dev_change_xdp_fd at ffffffffa5059ca6
#10 [ffffb222e0357938] do_setlink at ffffffffa506c425
#11 [ffffb222e0357a60] rtnl_setlink at ffffffffa506c587
#12 [ffffb222e0357c70] rtnetlink_rcv_msg at ffffffffa50662f1
#13 [ffffb222e0357cf0] netlink_rcv_skb at ffffffffa50b9bf1
#14 [ffffb222e0357d40] netlink_unicast at ffffffffa50b930d
#15 [ffffb222e0357d80] netlink_sendmsg at ffffffffa50b9713
#16 [ffffb222e0357df0] sock_sendmsg at ffffffffa502f40b
#17 [ffffb222e0357e08] __sys_sendto at ffffffffa50305a8
#18 [ffffb222e0357f38] __x64_sys_sendto at ffffffffa5030644
#19 [ffffb222e0357f40] do_syscall_64 at ffffffffa51b9614
#20 [ffffb222e0357f50] entry_SYSCALL_64_after_hwframe at ffffffffa520008c
    RIP: 00007fe8522615dd  RSP: 00007ffe67117248  RFLAGS: 00000246
    RAX: ffffffffffffffda  RBX: 0000000000000002  RCX: 00007fe8522615dd
    RDX: 000000000000002c  RSI: 00007ffe67117270  RDI: 0000000000000009
    RBP: 00007ffe67118310   R8: 0000000000000000   R9: 0000000000000000
    R10: 0000000000000000  R11: 0000000000000246  R12: 0000560835236cc0
    R13: 0000560835233bf0  R14: 00005608368aa890  R15: 0000000000000000
    ORIG_RAX: 000000000000002c  CS: 0033  SS: 002b
=3D=3D=3D=3D=3D=3D=3D Log end =3D=3D=3D=3D=3D

Best regards

--=20
Rafael Vargas
