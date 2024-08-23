Return-Path: <xdp-newbies+bounces-131-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CB95C7DF
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2024 10:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84EA1C2189A
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2024 08:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828E713CF9E;
	Fri, 23 Aug 2024 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDW5ZMT1"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2313D881
	for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2024 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401069; cv=none; b=FB3CQzKrqUqsf9l3pKL/j11YPVyybAm/nD00K+pmLmQSdouwrfeOqw8gIHFq88CWsB5SUvkkDCnRNF4uxf107oXehOjEOMmUJnwLMuYrAZqS05Tgb6Njf4d51EKGoTQ6eosFB0rlgbiY9fnaIofiVoVfc/5NnDCunmWlQomqXGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401069; c=relaxed/simple;
	bh=meBxWEegxbOIz+yfN647DXslnOnChq0qELdHkS8ej1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJnSS3umPL6nFua/oipmAf9iVUYjY4moKtrJOezMKwuod/jhZjqtmv22MrPBVQf33HWHVI4u+pS8HklWY1CDJAJM5q6MvleQXdP079oaTtwYPwY8sEQcgRiKRTshriq4oA8M9Y+Gvk9Xxn2p63QhTjZQVGcQkvF/QRrJbU9YPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDW5ZMT1; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b99988b6ceso18474297b3.0
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2024 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724401066; x=1725005866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHMdRuxi07iuOA+ao20pzFSb7nYQVzPHGksnReojOiA=;
        b=ZDW5ZMT1IsqvUkbJivyMX/am5y6x/2PU85SEWhBtaxYJ+1TVU47tmoyIo/XPBetuQg
         1iRwxYf/8XRquVJW2PMa37+VfwXLvpeN1lzBDM6Ntm39fGcAr5fAVfBGpVejcfj36Pec
         W6dhBZOr79OZdDa48EhnpKWPJ/p/SN/xm5QkxoBLqyc0qmg1zVHyiON8t3Aht86DBQ9+
         Ql11ZYzLG/iWNJA5Fgeqi9LOszFi1xGY/CDfxjrisgjLlCx7dvZzjRmPMT1VcZoQnC6W
         H4tzmaJWOZDQTKDl4Ei1eRJH7trw8z8iyWRPTe+fZCx0L4mn/F4HKQBQEWdRHXTK9ECE
         jOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401066; x=1725005866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHMdRuxi07iuOA+ao20pzFSb7nYQVzPHGksnReojOiA=;
        b=AI0G9j8D8LSsRzT736RvijMBD+sGHZNp3VcrP2SAruEfKejsVU3/u+Puke1Cga0VJX
         /kRvFJExWM4pkTeLrmlO9+lya0Pi4LOuufB2f7s7oitU1IAICogxYoO8dpYxSYlfH+Wj
         FPqGYll9H2RRPd0ZGhNa/UGim62M98jmlpnN3oFSf92CambcwGMYegBuNs8uZapPGl3S
         KZ8iyVkH2nkloabVjHXm5KatUd5J1IAxBP/yzA5t4xkSdpCaAm6+S56GOvTcDYr38bI9
         o0PIVfQ95wXLw4wrn360R5uFgCrfQmfuU41TlgRGlOt8FmyvuPLbpVis8PTRNG0w9Zls
         +Lhg==
X-Gm-Message-State: AOJu0Yy3KU6IpInXSg9P+i7DH+/F82Vp6z8yxN5z0SKq+x/y1Un6m5cE
	Smb8gSnkVSoAeBI5rBkSBx92GtRGfOh7vYWx8Pi4FxBU+KDWzOk+nP1sl+zHNFnowLa7HWz2ko2
	6sj7nNLLyWDLWJu+bRHCmKsMByqs=
X-Google-Smtp-Source: AGHT+IEEE65bVrzb3wWaDVCN2YB9SxrWbsdSxZAR+7XQ1hGc/u8gBH1JarR53uecpD+LivW1gWtHoK9OprXsqkkv0i4=
X-Received: by 2002:a05:690c:2889:b0:6ad:feb0:e6c9 with SMTP id
 00721157ae682-6c625f1e713mr13584067b3.23.1724401066542; Fri, 23 Aug 2024
 01:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Fri, 23 Aug 2024 10:17:35 +0200
Message-ID: <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
To: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>, 
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Aug 2024 at 18:25, Alasdair McWilliam
<alasdair.mcwilliam@outlook.com> wrote:
>
> Hi,
>
> I've been testing apps that use XSK+ZC on ICE with newer builds of the 6.=
1 LTS kernel in preparation for some production upgrades, and I've started =
to notice some instability on newer versions. I can reproduce the issue eas=
ily in the lab.
>
> Config:
> - Known good multi-threaded application (i.e. production grade)
> - Uses eBPF and AF_XDP with zero copy to act as 'bump in wire' in network
> - Xeon's with Intel E810-CQDA2 (firmware: 3.20 0x8000d83e 1.3146.0)
> - Effectively a vanilla rebuild of 6.1 using configs from el-repo project
>
> Scenario:
> - Noticing hard kernel faults when shutting down application
> - Can happen if the process is shut down via systemctl stop
> - Can even happen with a simple kill -9 command to the PID
> - Appears in builds after 6.1.87
>
> Tested kernels:
> - 6.1.84: process exits smoothly
> - 6.1.87: process exits smoothly
> - 6.1.97: BUG: unable to handle page fault for address
> - 6.1.106: BUG: unable to handle page fault for address
>
> Kdump log is below [1] from 6.1.106 but does seem to be the same in the e=
arlier version.
>
> Can anyone advise if this is a known issue?
>
> I don't have any builds between 6.1.87 and 6.1.97 but I can spend some ti=
me trying to pinpoint the exact version things start to go wrong in, if it =
would help anyone better equipped than me to debug!

Hi Alasdair,

It would be of great help if you could pinpoint the exact version for
this breakage. Hopefully we could then find the commit in the ice
driver that breaks your app, since there should be just a handful of
commits in the ice driver for any stable release.

> Kind regards
> Alasdair
>
> [1] kdump log
>
> [  158.666867] BUG: unable to handle page fault for address: ffffa6510e55=
80c0
> [  158.666887] #PF: supervisor read access in kernel mode
> [  158.666896] #PF: error_code(0x0000) - not-present page
> [  158.666903] PGD 100000067 P4D 100000067 PUD 106dc4067 PMD 0
> [  158.666914] Oops: 0000 [#1] PREEMPT SMP PTI
> [  158.666922] CPU: 7 PID: 1808 Comm: tlndd.bin Kdump: loaded Tainted: G =
           E      6.1.106-1.X.el9.x86_64 #1
> [  158.666940] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS 3.2=
 12/16/2019
> [  158.666950] RIP: 0010:xp_free+0x11/0x80
> [  158.666962] Code: 8b 04 d0 48 83 e0 fe 48 01 f0 c3 cc cc cc cc 66 2e 0=
f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 56 41 55 41 54 55 48 8d 6f 58 53 <=
48> 8b 47 58 48 39 c5 74 0d 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc
> [  158.666985] RSP: 0018:ffffa65089e8b760 EFLAGS: 00010202
> [  158.666993] RAX: ffff8fcf077c0000 RBX: 0000000000000001 RCX: 000000000=
0000000
> [  158.667003] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa6510=
e558068
> [  158.667012] RBP: ffffa6510e5580c0 R08: fffff8c50415a108 R09: ffff8fc7c=
ac60000
> [  158.667022] R10: 0000000000000219 R11: ffffffffffffffff R12: 000000000=
0000fff
> [  158.667031] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8fc7c=
139d340
> [  158.667040] FS:  00007f8504996880(0000) GS:ffff8fcedfdc0000(0000) knlG=
S:0000000000000000
> [  158.667050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  158.667058] CR2: ffffa6510e5580c0 CR3: 00000001448e2002 CR4: 000000000=
01706e0
> [  158.667068] Call Trace:
> [  158.667075]  <TASK>
> [  158.667082]  ? show_trace_log_lvl+0x1c4/0x2df
> [  158.667094]  ? show_trace_log_lvl+0x1c4/0x2df
> [  158.667103]  ? ice_xsk_clean_rx_ring+0x39/0x60 [ice]
> [  158.667157]  ? __die_body.cold+0x8/0xd
> [  158.667166]  ? page_fault_oops+0xac/0x150
> [  158.667176]  ? fixup_exception+0x22/0x340
> [  158.667185]  ? exc_page_fault+0xb2/0x150
> [  158.667195]  ? asm_exc_page_fault+0x22/0x30
> [  158.667206]  ? xp_free+0x11/0x80
> [  158.667215]  ice_xsk_clean_rx_ring+0x39/0x60 [ice]
> [  158.667250]  ice_clean_rx_ring+0x157/0x180 [ice]
> [  158.667284]  ice_down+0x172/0x2b0 [ice]
> [  158.667311]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]
> [  158.667337]  ice_xdp_setup_prog+0xe3/0x3b0 [ice]
> [  158.667364]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]
> [  158.667391]  dev_xdp_install+0xc7/0x100
> [  158.667402]  dev_xdp_attach+0x1e0/0x560
> [  158.667412]  do_setlink+0x7a8/0xc10
> [  158.667422]  ? __nla_validate_parse+0x12b/0x1b0
> [  158.667436]  __rtnl_newlink+0x540/0x650
> [  158.667446]  rtnl_newlink+0x44/0x70
> [  158.667454]  rtnetlink_rcv_msg+0x15c/0x3d0
> [  158.667477]  ? rtnl_calcit.isra.0+0x140/0x140
> [  158.667485]  netlink_rcv_skb+0x51/0x100
> [  158.667727]  netlink_unicast+0x246/0x360
> [  158.667953]  netlink_sendmsg+0x24e/0x4b0
> [  158.668173]  __sock_sendmsg+0x62/0x70
> [  158.668389]  ____sys_sendmsg+0x247/0x2d0
> [  158.668602]  ? copy_msghdr_from_user+0x6d/0xa0
> [  158.668815]  ___sys_sendmsg+0x88/0xd0
> [  158.669028]  ? __sk_destruct+0x156/0x230
> [  158.669234]  ? kmem_cache_free+0x134/0x300
> [  158.669437]  ? rcu_nocb_try_bypass+0x4a/0x440
> [  158.669634]  ? __sk_destruct+0x156/0x230
> [  158.669825]  ? _raw_spin_unlock_irqrestore+0x23/0x40
> [  158.670010]  ? mod_objcg_state+0xc9/0x2f0
> [  158.670186]  ? refill_obj_stock+0xae/0x160
> [  158.670359]  ? rseq_get_rseq_cs.isra.0+0x16/0x220
> [  158.670529]  ? rcu_nocb_try_bypass+0x4a/0x440
> [  158.670696]  ? rseq_ip_fixup+0x72/0x1e0
> [  158.670860]  __sys_sendmsg+0x59/0xa0
> [  158.671021]  ? syscall_trace_enter.constprop.0+0x11e/0x190
> [  158.671185]  do_syscall_64+0x35/0x80
> [  158.671345]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [  158.671503] RIP: 0033:0x7f850510f917
> [  158.671658] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 0f 1=
f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
> [  158.671993] RSP: 002b:00007ffcc805f238 EFLAGS: 00000246 ORIG_RAX: 0000=
00000000002e
> [  158.672171] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f850=
510f917
> [  158.672352] RDX: 0000000000000000 RSI: 000000000198e9e8 RDI: 000000000=
0000009
> [  158.672534] RBP: 0000000001933c00 R08: 0000000001935980 R09: 000000000=
0460e48
> [  158.672716] R10: 0000000000000011 R11: 0000000000000246 R12: 000000000=
1933c30
> [  158.672899] R13: 0000000000515fd8 R14: 000000000198e9d0 R15: 000000000=
0513690
> [  158.673086]  </TASK>
> [  158.673269] Modules linked in: bonding(E) tls(E) nft_fib_inet(E) nft_f=
ib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) =
nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_con=
ntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) nf_tables=
(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) ipmi_ssif(E) intel_rapl_msr(E)=
 intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E) intel_powerclamp(E=
) coretemp(E) kvm_intel(E) iTCO_wdt(E) intel_pmc_bxt(E) iTCO_vendor_support=
(E) kvm(E) irqbypass(E) rapl(E) intel_cstate(E) ast(E) intel_uncore(E) drm_=
vram_helper(E) drm_ttm_helper(E) ttm(E) pcspkr(E) mei_me(E) drm_kms_helper(=
E) i2c_i801(E) lpc_ich(E) mei(E) i2c_smbus(E) mxm_wmi(E) ioatdma(E) acpi_ip=
mi(E) ipmi_si(E) ipmi_devintf(E) ipmi_msghandler(E) acpi_pad(E) acpi_power_=
meter(E) joydev(E) drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_=
pi(E) sg(E) ahci(E) crct10dif_pclmul(E) crc32_pclmul(E) libahci(E) crc32c_i=
ntel(E) ice(E)
> [  158.673314]  polyval_clmulni(E) polyval_generic(E) igb(E) libata(E) gh=
ash_clmulni_intel(E) i2c_algo_bit(E) dca(E) wmi(E) dm_mirror(E) dm_region_h=
ash(E) dm_log(E) dm_mod(E)
> [  158.675578] CR2: ffffa6510e5580c0

