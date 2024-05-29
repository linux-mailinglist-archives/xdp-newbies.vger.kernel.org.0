Return-Path: <xdp-newbies+bounces-85-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 882168D378E
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2024 15:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B37F1F2643B
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2024 13:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF1D11718;
	Wed, 29 May 2024 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVMllK58"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCD11184
	for <xdp-newbies@vger.kernel.org>; Wed, 29 May 2024 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989171; cv=none; b=TwW9nrwAO//hz3xt+pqf7mybaiN3m7GgKMBv1HH2CvW2StNVYP08pxVrSpIS2kidxRMBbtkUYRU2DyNa+FzDbH3LYo8P4bryVWet/47FCES65FRoWNWfiCKu9rQqElpLUXaVDFBfY2wWobc1YEyX5QMSBqZnuHj2jVL8oP1nd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989171; c=relaxed/simple;
	bh=jh3OlbZfMV/0/o4Xm8E++nfUm3aHhhqQNEtphV7K1C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIDtTxMZobyPlCRzI2MUKsGOgdgXkKB/ylRgEC73y5tqjg1BP71ccxnJGeLdRnJawjywjRAJK+O9jAODOq4YLdFkAhTWpCU/EdFPnaps0caDi7AFf5d9x9mUnzPWBVTJxTnq6akO8oyhGAgwZz1fWroL97uJACkLZVbfCQgri54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVMllK58; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ab8c5222bdso2081006d6.1
        for <xdp-newbies@vger.kernel.org>; Wed, 29 May 2024 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716989169; x=1717593969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYSJ5gSeSO2n5WDCWHUHYZX1zIW80senTLoFl97dPtM=;
        b=OVMllK58mNaIUZe+2FZOhZ7dN8cxvTXcQLtOUegno3KCST10sF7HCrr3hv90kS6yVI
         UqZv39NDHRm1irjjNhdO0znPTvaqHpuiuyTDDdhUg+SrJJMsWKnUkUVe/zRzjlhWMkmF
         3zxEXxFVPnPcD9iyKJ76wv1lHrJmmKcnxQPxenbQX27TE6Ks/sJYweRfCTktFovx4O7D
         eedfdoML2rZJAvFMJHseZVJ2JSCxl3WKmtdDnvFaw/QBjjqv9GmZ2T4OWPcMRAD6DHrj
         HY/gIiZJbTYUYgFN5tR+xiNuoOcjEu14lI4Bnmwy3q9e9qpCUyy+FPKTKK2nY7jsVbJe
         tePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989169; x=1717593969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYSJ5gSeSO2n5WDCWHUHYZX1zIW80senTLoFl97dPtM=;
        b=THHKWwyAEwac2QjCfABEYpU84Mzd2Zkxp99Qcv+wiseNVLkRwBSO13zLL7Ke6GYS+3
         WMjsJ4sxurWQT7zI7OWCzOs5stXJa4wQ67eE8gZijFpV1eyb0v9h4a+1MXVkxHWcK1l3
         6JiQnNYRknPzMUzUZfO6Yd9DKI9DHs7ohPWea5agjeM8/i8EoUB+4BcBZNX25Ochc1h0
         0jWmvfDTaEzhzUROo0ISQbk8Yx+SgaLrQ3kY4lxDjeSRDKK7AK4uepfDRxmn386MseoL
         KVyPt+ZBz1XL6whKU5N03gJ7rlXFRr4KquHN5EXb6637p+K2z9c8qr1vX7a155vQuQ3h
         EhSQ==
X-Gm-Message-State: AOJu0Yy7dnOzXrm0k7u6ksjx0vqfdLPMnKCtPM0WRsYVHMNTHaOjy4LQ
	TIpHPpSUY9vJTGdyFOjEkA+PBfMFuqIiMNjmFiUYTuDRjrBHjeEmTqd7b8N2TKjU9KsE8vAU47m
	g0NhQKFeZOLTr1oWXUQOnKpAEimop+W6Btk8=
X-Google-Smtp-Source: AGHT+IE2q43lhceuKvhWmgkUudGvGwa+OZlasqLK8bSZZ5yPk5Gk5dM4jBdyqoBXpQmSfS48fOm5xQJQMgiA+3RQrp8=
X-Received: by 2002:ad4:5948:0:b0:6a0:87e5:210c with SMTP id
 6a1803df08f44-6abdfd2d442mr160620226d6.5.1716989168702; Wed, 29 May 2024
 06:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8100DBDC-0B7C-49DB-9995-6027F6E63147@radware.com> <CAJ8uoz26oYyYnSe92i2G7Ab0=s2xF+OG-kQmBTETvW6QtX_4RQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz26oYyYnSe92i2G7Ab0=s2xF+OG-kQmBTETvW6QtX_4RQ@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 29 May 2024 15:25:56 +0200
Message-ID: <CAJ8uoz3Qk=Nk54PbNGz++5mmOqEK6aaff47ndOz=vQ5EH9rWYQ@mail.gmail.com>
Subject: Re: Kernel panic in XDP_REDIRECT
To: Yuval El-Hanany <YuvalE@radware.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 May 2024 at 13:07, Magnus Karlsson <magnus.karlsson@gmail.com> w=
rote:
>
> On Wed, 29 May 2024 at 11:08, Yuval El-Hanany <YuvalE@radware.com> wrote:
> >
> > Hi,
> >         I got kernel panic on Kernel 5.15.117 (with the shared umem ker=
nel patch). The scenario was simple. Instead of redirecting to a different =
cpu using CPUMAP, I=E2=80=99ve tried redirecting traffic from a CPU core to=
 a different CPU core using XSK sockets. I used 2 cores. When each redirect=
ed to the other, all worked well. When redirecting traffic from both cores =
to one core, I got a kernel panic almost immediately under load. The flush_=
list seems to be per cpu, but somehow it=E2=80=99s messed up when two cores=
 access the it?
> >
> >         Thanks,
> >                 Yuval.
>
> Thanks Yuval. Will take a look at it.

I think the sad conclusion here is that I need to revert the patch
that I sent to you. The problem is that the rings between user-space
and kernel-space are single producer / single consumer and allowing
two or more NAPI threads to access the same ring by performing a
redirect to the same socket at the same time will break this. The
flush is likely solvable, but the addition of entries to the same ring
would require introducing locking (or a completely new ring type)
which is going to be way too expensive. With the old code, checking
that the queue_index of the queue it got the packet on being equal to
the socket's queue_index would disallow this and not trigger this
problem.

I have no idea why I did not think about this earlier. My sincere
apologies for that. I will scratch my head for a while more, but I am
not hopeful that I will come up with a good solution for this.

> > Two different dumps.
> >
> > Dump 1:
> >
> > 2024-05-29T01:[  306.997548] BUG: kernel NULL pointer dereference, addr=
ess: 0000000000000008
> > [  307.088372] #PF: supervisor read access in kernel mode
> > [  307.149079] #PF: error_code(0x0000) - not-present page
> > [  307.209774] PGD 10f131067 P4D 10f131067 PUD 102642067 PMD 0
> > [  307.276608] Oops: 0000 [#1] SMP
> > [  307.313712] CPU: 3 PID: 1919 Comm: sp1 Tainted: P           OE     5=
.15.117-1-ULP-NG #1
> > [  307.408219] Hardware name: Radware Radware/Default string, BIOS 5.25=
 (785A.015) 05/11/2023
> > [  307.505779] RIP: 0010:xsk_flush+0xb/0x40
> > [  307.552099] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03=
 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5=
 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> > [  307.773694] RSP: 0000:ffffb7ae01037c80 EFLAGS: 00010287
> > [  307.835401] RAX: 0000000000000000 RBX: ffffa0a88f8ab768 RCX: ffffa0a=
88f8abac0
> > [  307.919670] RDX: ffffa0a88f8abac0 RSI: 0000000000000004 RDI: ffffa0a=
88f8ab768
> > [  308.003922] RBP: ffffb7ae01037c80 R08: ffffa0a10b3e0000 R09: 0000000=
00000769f
> > [  308.088172] R10: ffffa0a1035ca000 R11: 000000000d7f9180 R12: ffffa0a=
88f8ab768
> > [  308.172405] R13: ffffa0a88f8ebac0 R14: ffffa0a2ef135300 R15: 0000000=
000000155
> > [  308.256635] FS:  00007ffff7e97a80(0000) GS:ffffa0a88f8c0000(0000) kn=
lGS:0000000000000000
> > [  308.352186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  308.420043] CR2: 0000000000000008 CR3: 000000010cf6e000 CR4: 0000000=
000750ee0
> > [  308.504309] PKRU: 55555554
> > [  308.536296] Call Trace:
> > [  308.565209]  <TASK>
> > [  308.590026]  ? show_regs+0x56/0x60
> > [  308.630218]  ? __die_body+0x1a/0x60
> > [  308.671433]  ? __die+0x25/0x30
> > [  308.707529]  ? page_fault_oops+0xc0/0x440
> > [  308.754897]  ? do_sys_poll+0x47c/0x5e0
> > [  308.799188]  ? do_user_addr_fault+0x319/0x6e0
> > [  308.850659]  ? exc_page_fault+0x6c/0x130
> > [  308.896992]  ? asm_exc_page_fault+0x27/0x30
> > [  308.946398]  ? xsk_flush+0xb/0x40
> > [  308.985546]  __xsk_map_flush+0x3a/0x80
> > [  309.029824]  xdp_do_flush+0x13/0x20
> > [  309.071043]  i40e_finalize_xdp_rx+0x44/0x50 [i40e]
> > 56:07-08:00 NOTI[  309.127653]  i40e_clean_rx_irq_zc+0x132/0x500 [i40e]
> > [  309.202736]  i40e_napi_poll+0x119/0x1270 [i40e]
> > CE  slb: real se[  309.256285]  ? xsk_sendmsg+0xf4/0x100
> > [  309.315969]  ? sock_sendmsg+0x2e/0x40
> > [  309.359244]  __napi_poll+0x23/0x160
> > [  309.400482]  net_rx_action+0x232/0x290
> > [  309.444778]  __do_softirq+0xd0/0x270
> > [  309.487012]  irq_exit_rcu+0x74/0xa0
> > [  309.528241]  common_interrupt+0x83/0xa0
> > [  309.573577]  asm_common_interrupt+0x27/0x40
> > [  309.623017] RIP: 0033:0x5cb685
> > [  309.659115] Code: b0 fb ff ff 48 8b 8d b8 fb ff ff 44 89 f8 23 44 91=
 08 74 09 31 d2 89 d1 e9 22 fe ff ff 83 85 88 fb ff ff 01 8b 95 88 fb ff ff=
 <39> 15 79 31 1d 04 0f 87 c3 fd ff ff 4c 8b 9d b8 fb ff ff e9 a2 f8
> > [  309.880853] RSP: 002b:00007fffffffd820 EFLAGS: 00000206
> > [  309.942608] RAX: 0000000000000000 RBX: 0000000000000047 RCX: 0000000=
0050912bc
> > [  310.026922] RDX: 0000000000000033 RSI: 0000000000000000 RDI: 0000000=
000000001
> > [  310.111228] RBP: 00007fffffffdd50 R08: 0000000000000001 R09: 0000000=
000000008
> > [  310.195548] R10: 0000000002f68e00 R11: 00000000050912bc R12: 0000000=
000000047
> > [  310.279877] R13: 0000000000000022 R14: 0000000004f08560 R15: 0000000=
0ff55557f
> > [  310.364168]  </TASK>
> > [  310.390014] Modules linked in: uio i40e ec(PO) evdev ncs_acpi(O) bon=
ding sr_mod cdrom usb_storage dwmac_intel stmmac i2c_i801 pcs_xpcs phylink =
i2c_smbus [last unloaded: i40e]
> > rvice r5, IP 4.4[  310.573779] CR2: 0000000000000008
> > [  310.629359] ---[ end trace 78cf9f96f477759d ]---
> > .4.5:80 operational, affected virt 2.2.2.10
> >
> > Dump 2:
> >
> > 2024-05-29T01:56:07-08:00 NOTICE  slb: real serve[  311.250217] RIP: 00=
10:xsk_flush+0xb/0x40
> > [  311.300334] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03=
 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5=
 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> > [  311.522070] RSP: 0000:ffffb7ae01037c80 EFLAGS: 00010287
> > [  311.583811] RAX: 0000000000000000 RBX: ffffa0a88f8ab768 RCX: ffffa0a=
88f8abac0
> > [  311.668118] RDX: ffffa0a88f8abac0 RSI: 0000000000000004 RDI: ffffa0a=
88f8ab768
> > [  311.752405] RBP: ffffb7ae01037c80 R08: ffffa0a10b3e0000 R09: 0000000=
00000769f
> > [  311.836716] R10: ffffa0a1035ca000 R11: 000000000d7f9180 R12: ffffa0a=
88f8ab768
> > [  311.921040] R13: ffffa0a88f8ebac0 R14: ffffa0a2ef135300 R15: 0000000=
000000155
> > [  312.005358] FS:  00007ffff7e97a80(0000) GS:ffffa0a88f8c0000(0000) kn=
lGS:0000000000000000
> > [  312.100975] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  312.168886] CR2: 0000000000000008 CR3: 000000010cf6e000 CR4: 0000000=
000750ee0
> > [  312.253232] PKRU: 55555554
> > [  312.285245] Kernel panic - not syncing: Fatal exception in interrupt
> > [  312.360323] Kernel Offset: 0x3a000000 from 0xffffffff81000000 (reloc=
ation range: 0xffffffff80000000-0xffffffffbfffffff)
> > [  312.570739] ---[ end Kernel panic - not syncing: Fatal exception in =
interrupt ]---
> >
> >
> >
> > 2024-05-29T01:00:47-08:00 NOTICE  slb: real service r16, IP 4.4.4.16:80=
 operational, affected [  390.602501] BUG: kernel NULL pointer dereference,=
 address: 0000000000000008
> > [  390.699875] #PF: supervisor read access in kernel mode
> > [  390.760620] #PF: error_code(0x0000) - not-present page
> > [  390.821361] PGD 10d319067 P4D 10d319067 PUD 10df94067 PMD 0
> > [  390.888266] Oops: 0000 [#1] SMP
> > [  390.925409] CPU: 3 PID: 1922 Comm: sp1 Tainted: P           OE     5=
.15.117-1-ULP-NG #1
> > [  391.020040] Hardware name: Radware Radware/Default string, BIOS 5.25=
 (785A.015) 05/11/2023
> > [  391.117759] RIP: 0010:xsk_flush+0xb/0x40
> > [  391.164147] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03=
 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5=
 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> > [  391.386008] RSP: 0018:ffffae5c80244d48 EFLAGS: 00010287
> > [  391.447793] RAX: 0000000000000000 RBX: ffff8bb80f8ab768 RCX: ffff8bb=
80f8abac0
> > [  391.532161] RDX: ffff8bb80f8abac0 RSI: 0000000000000004 RDI: ffff8bb=
80f8ab768
> > [  391.616518] RBP: ffffae5c80244d48 R08: ffff8bb0845f0000 R09: 0000000=
00000967a
> > [  391.700883] R10: ffff8bb0833fdc00 R11: 000000000ca5a180 R12: ffff8bb=
80f8ab768
> > [  391.785233] R13: ffff8bb80f8ebac0 R14: ffff8bb081571b00 R15: 0000000=
000000132
> > [  391.869615] FS:  00007ffff7e97a80(0000) GS:ffff8bb80f8c0000(0000) kn=
lGS:0000000000000000
> > [  391.965273] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  392.033224] CR2: 0000000000000008 CR3: 000000010d84b000 CR4: 0000000=
000750ee0
> > [  392.117580] PKRU: 55555554
> > [  392.149594] Call Trace:
> > [  392.178536]  <IRQ>
> > [  392.202345]  ? show_regs+0x56/0x60
> > [  392.242571]  ? __die_body+0x1a/0x60
> > [  392.283806]  ? __die+0x25/0x30
> > [  392.319919]  ? page_fault_oops+0xc0/0x440
> > [  392.367315]  ? i40e_msix_clean_rings+0x27/0x40 [i40e]
> > [  392.427035]  ? do_user_addr_fault+0x319/0x6e0
> > [  392.478538]  ? handle_irq_event+0x41/0x60
> > [  392.525934]  ? exc_page_fault+0x6c/0x130
> > [  392.572304]  ? asm_exc_page_fault+0x27/0x30
> > [  392.621771]  ? xsk_flush+0xb/0x40
> > [  392.660954]  ? xsk_flush+0x34/0x40
> > [  392.701174]  __xsk_map_flush+0x3a/0x80
> > [  392.745497]  xdp_do_flush+0x13/0x20
> > [  392.786749]  i40e_finalize_xdp_rx+0x44/0x50 [i40e]
> > virt 2.2.2.10
> > [  392.843370]  i40e_clean_rx_irq_zc+0x132/0x500 [i40e]
> > [  392.918465]  i40e_napi_poll+0x119/0x1270 [i40e]
> >
> > 2024-05-29T01:0[  392.972027]  ? scheduler_tick+0x9f/0xd0
> > [  393.033806]  ? tick_sched_do_timer+0x40/0x40
> > [  393.084300]  __napi_poll+0x23/0x160
> > [  393.125556]  net_rx_action+0x232/0x290
> > [  393.169869]  __do_softirq+0xd0/0x270
> > [  393.212141]  irq_exit_rcu+0x74/0xa0
> > [  393.253387]  common_interrupt+0x62/0xa0
> > [  393.298734]  </IRQ>
> > [  393.323571]  <TASK>
> > [  393.348409]  asm_common_interrupt+0x27/0x40
> > [  393.397871] RIP: 0010:__fget_light+0x43/0x100
> > [  393.449396] Code: b0 0b 00 00 8b 08 83 f9 01 75 36 48 8b 40 20 8b 18=
 39 df 73 1f 89 fa 48 39 da 48 19 db 48 8b 40 08 21 df 48 8d 04 f8 48 8b 00=
 <48> 85 c0 74 05 85 70 44 74 02 31 c0 5b 41 5c 41 5d 41 5e 41 5f 5d
> > [  393.671279] RSP: 0018:ffffae5c81057a98 EFLAGS: 00000202
> > [  393.733054] RAX: ffff8bb083541100 RBX: ffffffffffffffff RCX: 0000000=
000000001
> > [  393.817413] RDX: 000000000000002f RSI: 0000000000004000 RDI: 0000000=
00000002f
> > [  393.901777] RBP: ffffae5c81057ac0 R08: 000000010000002f R09: 0000000=
000000000
> > [  393.986133] R10: ffffae5c81057f08 R11: 0000000000000000 R12: 0000000=
000000000
> > [  394.070506] R13: ffffae5c81057b54 R14: ffffae5c81057b4c R15: ffffae5=
c81057b4c
> > [  394.154884]  __fdget+0xe/0x10
> > [  394.189993]  do_sys_poll+0x1fd/0x5e0
> > [  394.232287]  ? step_into+0x11f/0x750
> > [  394.274570]  ? common_interrupt+0x8e/0xa0
> > [  394.321987]  ? common_interrupt+0x8e/0xa0
> > [  394.369406]  ? asm_common_interrupt+0x27/0x40
> > [  394.420929]  ? xsk_flush+0x34/0x40
> > [  394.461166]  ? xsk_tx_peek_release_desc_batch+0x24c/0x2e0
> > [  394.525014]  ? i40e_clean_rx_irq_zc+0x342/0x500 [i40e]
> > [  394.585763]  ? i40e_xsk_wakeup+0xa2/0xc0 [i40e]
> > [  394.639332]  ? xsk_xmit+0x6d/0x6c0
> > [  394.679569]  ? i40e_napi_poll+0xc39/0x1270 [i40e]
> > [  394.735202]  ? xsk_sendmsg+0xf4/0x100
> > [  394.778498]  ? sock_sendmsg+0x2e/0x40
> > [  394.821808]  ? __sys_sendto+0x13a/0x170
> > [  394.867166]  ? __snd_timer_user_ioctl+0x9e0/0xaa0
> > [  394.922812]  ? net_rx_action+0x232/0x290
> > [  394.969206]  __x64_sys_poll+0xa0/0x130
> > [  395.013534]  ? __x64_sys_poll+0xa0/0x130
> > [  395.059930]  do_syscall_64+0x34/0xb0
> > [  395.102213]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > [  395.161948] RIP: 0033:0x7ffff76f0d47
> > [  395.204222] Code: 00 00 00 5b 49 8b 45 10 5d 41 5c 41 5d 41 5e c3 0f=
 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 07 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
> > [  395.426119] RSP: 002b:00007fffffffe6c8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000007
> > [  395.515625] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff=
ff76f0d47
> > [  395.599996] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 00007ff=
fffffe6f8
> > [  395.684371] RBP: 00007ffff7e85f80 R08: 00000000173eed80 R09: 0000000=
000000051
> > [  395.768741] R10: 000001193c2583df R11: 0000000000000246 R12: 0000000=
000000000
> > [  395.853108] R13: 00007ffff7e85fb0 R14: 0000000000000000 R15: 0000000=
000000000
> > [  395.937488]  </TASK>
> > [  395.963347] Modules linked in: uio i40e ec(PO) evdev ncs_acpi(O) bon=
ding sr_mod cdrom usb_storage dwmac_intel stmmac i2c_i801 pcs_xpcs phylink =
i2c_smbus [last unloaded: i40e]
> > 0:47-08:00 NOTIC[  396.147236] CR2: 0000000000000008
> > [  396.202839] ---[ end trace 9b309a97c006510f ]---
> > E  slb: real server r16, IP 4.4.4.16 operational
> >
> > 2024-05-29T01:00:47-08:00 NOTICE  slb: real [  396.344228] RIP: 0010:xs=
k_flush+0xb/0x40
> > [  396.406975] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03=
 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5=
 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> > [  396.628859] RSP: 0018:ffffae5c80244d48 EFLAGS: 00010287
> > [  396.690632] RAX: 0000000000000000 RBX: ffff8bb80f8ab768 RCX: ffff8bb=
80f8abac0
> > [  396.774985] RDX: ffff8bb80f8abac0 RSI: 0000000000000004 RDI: ffff8bb=
80f8ab768
> > [  396.859346] RBP: ffffae5c80244d48 R08: ffff8bb0845f0000 R09: 0000000=
00000967a
> > [  396.943694] R10: ffff8bb0833fdc00 R11: 000000000ca5a180 R12: ffff8bb=
80f8ab768
> > [  397.028064] R13: ffff8bb80f8ebac0 R14: ffff8bb081571b00 R15: 0000000=
000000132
> > [  397.112433] FS:  00007ffff7e97a80(0000) GS:ffff8bb80f8c0000(0000) kn=
lGS:0000000000000000
> > [  397.208103] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  397.276061] CR2: 0000000000000008 CR3: 000000010d84b000 CR4: 0000000=
000750ee0
> > [  397.360414] PKRU: 55555554
> > [  397.392419] Kernel panic - not syncing: Fatal exception in interrupt
> > [  397.467554] Kernel Offset: 0x34600000 from 0xffffffff81000000 (reloc=
ation range: 0xffffffff80000000-0xffffffffbfffffff)
> > [  397.678387] ---[ end Kernel panic - not syncing: Fatal exception in =
interrupt ]---

