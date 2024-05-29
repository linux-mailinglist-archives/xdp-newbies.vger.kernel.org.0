Return-Path: <xdp-newbies+bounces-84-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D88D3520
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2024 13:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E991F2509D
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2024 11:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6362D168C03;
	Wed, 29 May 2024 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xzazo7XE"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610DE167D9C
	for <xdp-newbies@vger.kernel.org>; Wed, 29 May 2024 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716980843; cv=none; b=uG7xG5Z6z+5Ckqocdpd1IsLFAEgs/lGwrndlQ61eFPJ2hJnu5vluklBCxzt8jbr2cXDRW94vkuWZALRbLpXIcZdMgc+1Js8xvYjN11xUzKZIoqYsYQwphOcXHy4++YN6Y2EAA31Yuiefy3nXzuRDibzzgZgr+5ueHS8fK/1Il5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716980843; c=relaxed/simple;
	bh=yDO8pZke6aIb1LjAUmgINmTerjj6rvX6MdbkwxhEUyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQ6d+Stuop/lZwl5t0gNZMbU2JMcpKViE1xKHbxFeKnxBcFa4R2i4qc9CUs7g+Jbek4sMxoq9CpvUZQ1feSI/1+JpJ5akiW9QqMqOMPak1G4/Ztqccqb+v7nj33iBFEWqII9tuu0cLG17ksfziOD5BEzBdRY71j7OOPWwCM4XS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xzazo7XE; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df78af3bdbcso232804276.1
        for <xdp-newbies@vger.kernel.org>; Wed, 29 May 2024 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716980840; x=1717585640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcvbuT2r5t6vUKYqRj2dM5bYP+jjCCWFzYvmE2jvz9k=;
        b=Xzazo7XEZhAC/cYqWjDJ4msaHiR0tFfTw7Dcjpdx9DlPNogxtAH5Y729uLnNLfUTKT
         HWsMwmPJOIdzzNcheEfmN0iBKob4a0sVVvEsUCvSNdi3EhLmfI1JJBIay9kmkdI0QQKZ
         U72vPeDCWWHC21YaF5eY+dPJp6Lws112pUCvs2FXFlmVxi+23LApCPDQc/DUbjuobgcc
         KXM8PaQhJfKFz8MzAtfTNpy55DVPDCsc12JyRnHkn+CtyoZntG3aiq9LWeiXvUhKcj5o
         QpJmjSokcFjZLInBEdYJ3r/DJgdCri9FHW9R2FP3p7zCIlaftD9VUQhgwkGa5F5CcKag
         /NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716980840; x=1717585640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcvbuT2r5t6vUKYqRj2dM5bYP+jjCCWFzYvmE2jvz9k=;
        b=C0IXjD8AMQ6uqx8jj+9F2pfkythLgEGHxPY2CeRUOBqjexxf67e+8YcQta8BBWPVpR
         b1+bYfoT2rHum99dR2mkTReL3tHn/Mx+LBQ3Iab+qm9aeIpSEULTbR5PRQb0GwKFGBgi
         8+ezZwGiEdxIsQI9P7KUtdnhVYBSvO/cz/kFCkc/nKTQqgsao/9CIoca6aptwGYY82u9
         gjUREkDO1pUL4alHMpUqT5dB+FPMoy+Y+HFQCmKIZJ+2mKKig8DAk1nvCvASJSDHv5at
         yaXAuN2IrB1a6p9s2qH3+H4AAdvGNNzvQhWV6jmTactYGE39a0LQ98QY/0yAtWecR1l8
         E8tQ==
X-Gm-Message-State: AOJu0YzJvw8+H2gne+qk5DNEJpK9iQD2gBy3GQ3DoMutaqW/Vwbn/VHX
	MY2v+A9HDnKNgcualZ3L7GkndkppU72FMem+MAdqMdGzy70PxLEX/cqwvMwBty+QkCqzdBpRnbn
	uZx/7ClQbEKaA5yZyrWMZNyEmGN+ZoQg5BGE=
X-Google-Smtp-Source: AGHT+IEO5boI+etxxKUO5xa5+3IuKn/TIsT6WFmrFTnIMeXcq+RaSQUTJyaTrPK+u0b2Vh5+qNcDNMENJrhzbjUmri8=
X-Received: by 2002:a05:6902:2806:b0:df7:a3c6:c849 with SMTP id
 3f1490d57ef6-df7a3c6cb69mr7459076276.4.1716980840086; Wed, 29 May 2024
 04:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8100DBDC-0B7C-49DB-9995-6027F6E63147@radware.com>
In-Reply-To: <8100DBDC-0B7C-49DB-9995-6027F6E63147@radware.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 29 May 2024 13:07:09 +0200
Message-ID: <CAJ8uoz26oYyYnSe92i2G7Ab0=s2xF+OG-kQmBTETvW6QtX_4RQ@mail.gmail.com>
Subject: Re: Kernel panic in XDP_REDIRECT
To: Yuval El-Hanany <YuvalE@radware.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 May 2024 at 11:08, Yuval El-Hanany <YuvalE@radware.com> wrote:
>
> Hi,
>         I got kernel panic on Kernel 5.15.117 (with the shared umem kerne=
l patch). The scenario was simple. Instead of redirecting to a different cp=
u using CPUMAP, I=E2=80=99ve tried redirecting traffic from a CPU core to a=
 different CPU core using XSK sockets. I used 2 cores. When each redirected=
 to the other, all worked well. When redirecting traffic from both cores to=
 one core, I got a kernel panic almost immediately under load. The flush_li=
st seems to be per cpu, but somehow it=E2=80=99s messed up when two cores a=
ccess the it?
>
>         Thanks,
>                 Yuval.

Thanks Yuval. Will take a look at it.

> Two different dumps.
>
> Dump 1:
>
> 2024-05-29T01:[  306.997548] BUG: kernel NULL pointer dereference, addres=
s: 0000000000000008
> [  307.088372] #PF: supervisor read access in kernel mode
> [  307.149079] #PF: error_code(0x0000) - not-present page
> [  307.209774] PGD 10f131067 P4D 10f131067 PUD 102642067 PMD 0
> [  307.276608] Oops: 0000 [#1] SMP
> [  307.313712] CPU: 3 PID: 1919 Comm: sp1 Tainted: P           OE     5.1=
5.117-1-ULP-NG #1
> [  307.408219] Hardware name: Radware Radware/Default string, BIOS 5.25 (=
785A.015) 05/11/2023
> [  307.505779] RIP: 0010:xsk_flush+0xb/0x40
> [  307.552099] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03 0=
0 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5 <=
8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> [  307.773694] RSP: 0000:ffffb7ae01037c80 EFLAGS: 00010287
> [  307.835401] RAX: 0000000000000000 RBX: ffffa0a88f8ab768 RCX: ffffa0a88=
f8abac0
> [  307.919670] RDX: ffffa0a88f8abac0 RSI: 0000000000000004 RDI: ffffa0a88=
f8ab768
> [  308.003922] RBP: ffffb7ae01037c80 R08: ffffa0a10b3e0000 R09: 000000000=
000769f
> [  308.088172] R10: ffffa0a1035ca000 R11: 000000000d7f9180 R12: ffffa0a88=
f8ab768
> [  308.172405] R13: ffffa0a88f8ebac0 R14: ffffa0a2ef135300 R15: 000000000=
0000155
> [  308.256635] FS:  00007ffff7e97a80(0000) GS:ffffa0a88f8c0000(0000) knlG=
S:0000000000000000
> [  308.352186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  308.420043] CR2: 0000000000000008 CR3: 000000010cf6e000 CR4: 000000000=
0750ee0
> [  308.504309] PKRU: 55555554
> [  308.536296] Call Trace:
> [  308.565209]  <TASK>
> [  308.590026]  ? show_regs+0x56/0x60
> [  308.630218]  ? __die_body+0x1a/0x60
> [  308.671433]  ? __die+0x25/0x30
> [  308.707529]  ? page_fault_oops+0xc0/0x440
> [  308.754897]  ? do_sys_poll+0x47c/0x5e0
> [  308.799188]  ? do_user_addr_fault+0x319/0x6e0
> [  308.850659]  ? exc_page_fault+0x6c/0x130
> [  308.896992]  ? asm_exc_page_fault+0x27/0x30
> [  308.946398]  ? xsk_flush+0xb/0x40
> [  308.985546]  __xsk_map_flush+0x3a/0x80
> [  309.029824]  xdp_do_flush+0x13/0x20
> [  309.071043]  i40e_finalize_xdp_rx+0x44/0x50 [i40e]
> 56:07-08:00 NOTI[  309.127653]  i40e_clean_rx_irq_zc+0x132/0x500 [i40e]
> [  309.202736]  i40e_napi_poll+0x119/0x1270 [i40e]
> CE  slb: real se[  309.256285]  ? xsk_sendmsg+0xf4/0x100
> [  309.315969]  ? sock_sendmsg+0x2e/0x40
> [  309.359244]  __napi_poll+0x23/0x160
> [  309.400482]  net_rx_action+0x232/0x290
> [  309.444778]  __do_softirq+0xd0/0x270
> [  309.487012]  irq_exit_rcu+0x74/0xa0
> [  309.528241]  common_interrupt+0x83/0xa0
> [  309.573577]  asm_common_interrupt+0x27/0x40
> [  309.623017] RIP: 0033:0x5cb685
> [  309.659115] Code: b0 fb ff ff 48 8b 8d b8 fb ff ff 44 89 f8 23 44 91 0=
8 74 09 31 d2 89 d1 e9 22 fe ff ff 83 85 88 fb ff ff 01 8b 95 88 fb ff ff <=
39> 15 79 31 1d 04 0f 87 c3 fd ff ff 4c 8b 9d b8 fb ff ff e9 a2 f8
> [  309.880853] RSP: 002b:00007fffffffd820 EFLAGS: 00000206
> [  309.942608] RAX: 0000000000000000 RBX: 0000000000000047 RCX: 000000000=
50912bc
> [  310.026922] RDX: 0000000000000033 RSI: 0000000000000000 RDI: 000000000=
0000001
> [  310.111228] RBP: 00007fffffffdd50 R08: 0000000000000001 R09: 000000000=
0000008
> [  310.195548] R10: 0000000002f68e00 R11: 00000000050912bc R12: 000000000=
0000047
> [  310.279877] R13: 0000000000000022 R14: 0000000004f08560 R15: 00000000f=
f55557f
> [  310.364168]  </TASK>
> [  310.390014] Modules linked in: uio i40e ec(PO) evdev ncs_acpi(O) bondi=
ng sr_mod cdrom usb_storage dwmac_intel stmmac i2c_i801 pcs_xpcs phylink i2=
c_smbus [last unloaded: i40e]
> rvice r5, IP 4.4[  310.573779] CR2: 0000000000000008
> [  310.629359] ---[ end trace 78cf9f96f477759d ]---
> .4.5:80 operational, affected virt 2.2.2.10
>
> Dump 2:
>
> 2024-05-29T01:56:07-08:00 NOTICE  slb: real serve[  311.250217] RIP: 0010=
:xsk_flush+0xb/0x40
> [  311.300334] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03 0=
0 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5 <=
8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> [  311.522070] RSP: 0000:ffffb7ae01037c80 EFLAGS: 00010287
> [  311.583811] RAX: 0000000000000000 RBX: ffffa0a88f8ab768 RCX: ffffa0a88=
f8abac0
> [  311.668118] RDX: ffffa0a88f8abac0 RSI: 0000000000000004 RDI: ffffa0a88=
f8ab768
> [  311.752405] RBP: ffffb7ae01037c80 R08: ffffa0a10b3e0000 R09: 000000000=
000769f
> [  311.836716] R10: ffffa0a1035ca000 R11: 000000000d7f9180 R12: ffffa0a88=
f8ab768
> [  311.921040] R13: ffffa0a88f8ebac0 R14: ffffa0a2ef135300 R15: 000000000=
0000155
> [  312.005358] FS:  00007ffff7e97a80(0000) GS:ffffa0a88f8c0000(0000) knlG=
S:0000000000000000
> [  312.100975] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  312.168886] CR2: 0000000000000008 CR3: 000000010cf6e000 CR4: 000000000=
0750ee0
> [  312.253232] PKRU: 55555554
> [  312.285245] Kernel panic - not syncing: Fatal exception in interrupt
> [  312.360323] Kernel Offset: 0x3a000000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
> [  312.570739] ---[ end Kernel panic - not syncing: Fatal exception in in=
terrupt ]---
>
>
>
> 2024-05-29T01:00:47-08:00 NOTICE  slb: real service r16, IP 4.4.4.16:80 o=
perational, affected [  390.602501] BUG: kernel NULL pointer dereference, a=
ddress: 0000000000000008
> [  390.699875] #PF: supervisor read access in kernel mode
> [  390.760620] #PF: error_code(0x0000) - not-present page
> [  390.821361] PGD 10d319067 P4D 10d319067 PUD 10df94067 PMD 0
> [  390.888266] Oops: 0000 [#1] SMP
> [  390.925409] CPU: 3 PID: 1922 Comm: sp1 Tainted: P           OE     5.1=
5.117-1-ULP-NG #1
> [  391.020040] Hardware name: Radware Radware/Default string, BIOS 5.25 (=
785A.015) 05/11/2023
> [  391.117759] RIP: 0010:xsk_flush+0xb/0x40
> [  391.164147] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03 0=
0 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5 <=
8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> [  391.386008] RSP: 0018:ffffae5c80244d48 EFLAGS: 00010287
> [  391.447793] RAX: 0000000000000000 RBX: ffff8bb80f8ab768 RCX: ffff8bb80=
f8abac0
> [  391.532161] RDX: ffff8bb80f8abac0 RSI: 0000000000000004 RDI: ffff8bb80=
f8ab768
> [  391.616518] RBP: ffffae5c80244d48 R08: ffff8bb0845f0000 R09: 000000000=
000967a
> [  391.700883] R10: ffff8bb0833fdc00 R11: 000000000ca5a180 R12: ffff8bb80=
f8ab768
> [  391.785233] R13: ffff8bb80f8ebac0 R14: ffff8bb081571b00 R15: 000000000=
0000132
> [  391.869615] FS:  00007ffff7e97a80(0000) GS:ffff8bb80f8c0000(0000) knlG=
S:0000000000000000
> [  391.965273] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  392.033224] CR2: 0000000000000008 CR3: 000000010d84b000 CR4: 000000000=
0750ee0
> [  392.117580] PKRU: 55555554
> [  392.149594] Call Trace:
> [  392.178536]  <IRQ>
> [  392.202345]  ? show_regs+0x56/0x60
> [  392.242571]  ? __die_body+0x1a/0x60
> [  392.283806]  ? __die+0x25/0x30
> [  392.319919]  ? page_fault_oops+0xc0/0x440
> [  392.367315]  ? i40e_msix_clean_rings+0x27/0x40 [i40e]
> [  392.427035]  ? do_user_addr_fault+0x319/0x6e0
> [  392.478538]  ? handle_irq_event+0x41/0x60
> [  392.525934]  ? exc_page_fault+0x6c/0x130
> [  392.572304]  ? asm_exc_page_fault+0x27/0x30
> [  392.621771]  ? xsk_flush+0xb/0x40
> [  392.660954]  ? xsk_flush+0x34/0x40
> [  392.701174]  __xsk_map_flush+0x3a/0x80
> [  392.745497]  xdp_do_flush+0x13/0x20
> [  392.786749]  i40e_finalize_xdp_rx+0x44/0x50 [i40e]
> virt 2.2.2.10
> [  392.843370]  i40e_clean_rx_irq_zc+0x132/0x500 [i40e]
> [  392.918465]  i40e_napi_poll+0x119/0x1270 [i40e]
>
> 2024-05-29T01:0[  392.972027]  ? scheduler_tick+0x9f/0xd0
> [  393.033806]  ? tick_sched_do_timer+0x40/0x40
> [  393.084300]  __napi_poll+0x23/0x160
> [  393.125556]  net_rx_action+0x232/0x290
> [  393.169869]  __do_softirq+0xd0/0x270
> [  393.212141]  irq_exit_rcu+0x74/0xa0
> [  393.253387]  common_interrupt+0x62/0xa0
> [  393.298734]  </IRQ>
> [  393.323571]  <TASK>
> [  393.348409]  asm_common_interrupt+0x27/0x40
> [  393.397871] RIP: 0010:__fget_light+0x43/0x100
> [  393.449396] Code: b0 0b 00 00 8b 08 83 f9 01 75 36 48 8b 40 20 8b 18 3=
9 df 73 1f 89 fa 48 39 da 48 19 db 48 8b 40 08 21 df 48 8d 04 f8 48 8b 00 <=
48> 85 c0 74 05 85 70 44 74 02 31 c0 5b 41 5c 41 5d 41 5e 41 5f 5d
> [  393.671279] RSP: 0018:ffffae5c81057a98 EFLAGS: 00000202
> [  393.733054] RAX: ffff8bb083541100 RBX: ffffffffffffffff RCX: 000000000=
0000001
> [  393.817413] RDX: 000000000000002f RSI: 0000000000004000 RDI: 000000000=
000002f
> [  393.901777] RBP: ffffae5c81057ac0 R08: 000000010000002f R09: 000000000=
0000000
> [  393.986133] R10: ffffae5c81057f08 R11: 0000000000000000 R12: 000000000=
0000000
> [  394.070506] R13: ffffae5c81057b54 R14: ffffae5c81057b4c R15: ffffae5c8=
1057b4c
> [  394.154884]  __fdget+0xe/0x10
> [  394.189993]  do_sys_poll+0x1fd/0x5e0
> [  394.232287]  ? step_into+0x11f/0x750
> [  394.274570]  ? common_interrupt+0x8e/0xa0
> [  394.321987]  ? common_interrupt+0x8e/0xa0
> [  394.369406]  ? asm_common_interrupt+0x27/0x40
> [  394.420929]  ? xsk_flush+0x34/0x40
> [  394.461166]  ? xsk_tx_peek_release_desc_batch+0x24c/0x2e0
> [  394.525014]  ? i40e_clean_rx_irq_zc+0x342/0x500 [i40e]
> [  394.585763]  ? i40e_xsk_wakeup+0xa2/0xc0 [i40e]
> [  394.639332]  ? xsk_xmit+0x6d/0x6c0
> [  394.679569]  ? i40e_napi_poll+0xc39/0x1270 [i40e]
> [  394.735202]  ? xsk_sendmsg+0xf4/0x100
> [  394.778498]  ? sock_sendmsg+0x2e/0x40
> [  394.821808]  ? __sys_sendto+0x13a/0x170
> [  394.867166]  ? __snd_timer_user_ioctl+0x9e0/0xaa0
> [  394.922812]  ? net_rx_action+0x232/0x290
> [  394.969206]  __x64_sys_poll+0xa0/0x130
> [  395.013534]  ? __x64_sys_poll+0xa0/0x130
> [  395.059930]  do_syscall_64+0x34/0xb0
> [  395.102213]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  395.161948] RIP: 0033:0x7ffff76f0d47
> [  395.204222] Code: 00 00 00 5b 49 8b 45 10 5d 41 5c 41 5d 41 5e c3 0f 1=
f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 07 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
> [  395.426119] RSP: 002b:00007fffffffe6c8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000007
> [  395.515625] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ffff=
76f0d47
> [  395.599996] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 00007ffff=
fffe6f8
> [  395.684371] RBP: 00007ffff7e85f80 R08: 00000000173eed80 R09: 000000000=
0000051
> [  395.768741] R10: 000001193c2583df R11: 0000000000000246 R12: 000000000=
0000000
> [  395.853108] R13: 00007ffff7e85fb0 R14: 0000000000000000 R15: 000000000=
0000000
> [  395.937488]  </TASK>
> [  395.963347] Modules linked in: uio i40e ec(PO) evdev ncs_acpi(O) bondi=
ng sr_mod cdrom usb_storage dwmac_intel stmmac i2c_i801 pcs_xpcs phylink i2=
c_smbus [last unloaded: i40e]
> 0:47-08:00 NOTIC[  396.147236] CR2: 0000000000000008
> [  396.202839] ---[ end trace 9b309a97c006510f ]---
> E  slb: real server r16, IP 4.4.4.16 operational
>
> 2024-05-29T01:00:47-08:00 NOTICE  slb: real [  396.344228] RIP: 0010:xsk_=
flush+0xb/0x40
> [  396.406975] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 85 a0 03 0=
0 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 48 89 e5 <=
8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 00
> [  396.628859] RSP: 0018:ffffae5c80244d48 EFLAGS: 00010287
> [  396.690632] RAX: 0000000000000000 RBX: ffff8bb80f8ab768 RCX: ffff8bb80=
f8abac0
> [  396.774985] RDX: ffff8bb80f8abac0 RSI: 0000000000000004 RDI: ffff8bb80=
f8ab768
> [  396.859346] RBP: ffffae5c80244d48 R08: ffff8bb0845f0000 R09: 000000000=
000967a
> [  396.943694] R10: ffff8bb0833fdc00 R11: 000000000ca5a180 R12: ffff8bb80=
f8ab768
> [  397.028064] R13: ffff8bb80f8ebac0 R14: ffff8bb081571b00 R15: 000000000=
0000132
> [  397.112433] FS:  00007ffff7e97a80(0000) GS:ffff8bb80f8c0000(0000) knlG=
S:0000000000000000
> [  397.208103] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  397.276061] CR2: 0000000000000008 CR3: 000000010d84b000 CR4: 000000000=
0750ee0
> [  397.360414] PKRU: 55555554
> [  397.392419] Kernel panic - not syncing: Fatal exception in interrupt
> [  397.467554] Kernel Offset: 0x34600000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
> [  397.678387] ---[ end Kernel panic - not syncing: Fatal exception in in=
terrupt ]---

