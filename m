Return-Path: <xdp-newbies+bounces-187-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFDDB3F155
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Sep 2025 01:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 848992051DA
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 23:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9462874F9;
	Mon,  1 Sep 2025 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4+VCrCH"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E0286883;
	Mon,  1 Sep 2025 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756769251; cv=none; b=lY4Uwk7HlwZLI21eAcyPbkDvl97KNOHLat3jnsqRm+UD4TUSoa+aEO0aV4PHqSWa1bSxw1L6W0Zb7RXjdRUlw+SxhnV/3t8pJhsrBtOgi+RaBIm/szWa2a9sNj5FgwVye2+yvXd+wmTgxOtJog9UWbnjHB5l8k+mlLNElljvCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756769251; c=relaxed/simple;
	bh=obBRTLvYMUh/TOZC1s5sb1QgLlLUVOONYMyMBoiPmOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ+dHBsNp9+BUq8AQIjCkKsFkXakAJYda4YYwM6nFx7eFPUvh/Lp5djZSRNIS7eDFVoSNZDBnytvQryfsfe+fxhlS1E57D/hKB/Dp1yILp6bAvX+vEBig0I1XdxFW17f+Mmsona3ccSVYjb5m5+AYp6zJoAEae4U7sjpmm4Hbds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4+VCrCH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b32c1fdcb4so21415571cf.1;
        Mon, 01 Sep 2025 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756769249; x=1757374049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ2QTozUDWc/zun8UnPCcGElVo6aVMb9VlHViJiivi8=;
        b=e4+VCrCHOLi2GLJaMkwlp9r2RJrVN/IVENu4b2vfHR84IHGc+aKmmTMoUEcPfu0afZ
         fGb685y63tbFyUQRSZ0eClB46bI+87GKChhteXFIf+T1Gi2PWNgTmYu4Uq6aUsuiVFKL
         5W3/8ZOJasignImLF727IHEPu/Kaz6Q/lfvmzt9W4wDCx0X/1hUR1RnIyTIRJqMh2har
         MfvrDlw6b+wD5un1W8jf8U3Vj8CYwzB0I7UYRkIOF07m0PN54t/gjWrv04IROyOgO1J1
         8atCqI4Ig2DDfKkXbqYvI++NkRyXFRhePhPE1MjMt6dqvhPgS/8rVtJFH2kR3SjCRLQy
         O0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756769249; x=1757374049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZ2QTozUDWc/zun8UnPCcGElVo6aVMb9VlHViJiivi8=;
        b=bDVbvE+GrJGpcvw6byH9pU2L8UG2e3Hv4U7AvNaPOhpp2bR+w/07w3rMGg/O9VZjar
         EI3yI9jr9M6IBNdgO6imVVdb6Gb40/SGoUAG01++fiYSqjVkYzeWs1uioqgd7udZs/9p
         dBRSIUE0TlK4RxMXebN6NTwUCxXuUXyO49JBYfeLqklspuPxPMATPGHdDye8JRnvInh6
         fNeJoVlivNPMZ2AvxXIeUHeWumuqh/KuaZQ0/1cOCK0Rxs+mV0A1QOA/YJBknCWTgMmK
         M3Zh6yRA6+KtOGX7UofMnhPOROELBPEAAHsoPRn8BsWSq2pfgZ3G9ElXq9GGCSSwI/Y6
         NMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+iiw1QUG86XIrP1Xhea0mVTbIgfcuGPsr27+z02yAOawv9IFj0w8/cVXeVJM/kfxvowK5szgIEdyPrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ywJRZO0IDszxVhZ143unByBZlYXTg++xoZBWev5saFOFD2bR
	C6Zvpdbfjll79HPpwuGV1Ato+cZ+vpj2z0tYy7lhdCcLX20byDR4U6z4zfq9U1QSLb84NY9wh4W
	VKbX8eu0b/kJIH4x9nWJgh8steg+OldI=
X-Gm-Gg: ASbGncvFfAzwLYbt+NicVAsmLyO2tnlXlzolJ7rqMzfI2f8JVsX1uTS+qn27sF6YjOI
	ebnZPh6qYonBRIRIfYwPrJPNX4wnKSX5djud+xQa3X/LnVQFMHZly1oz4zRnxQEX+khXDf4iiks
	LVHYrZ3isVSwAGJaO0PY0zg6yGeH19f4++bTTpblnuBHkv4tWlVnBKUDN3UbfC7MgQg//Yskr9/
	mQB/BI=
X-Google-Smtp-Source: AGHT+IFQ12a6RhGp/P1laDJ1LF2SriPmii/bKlXx05+YkrxSMCsJlILmWtOAzdEhs6k43q0sv5/I8NqkXuhQVvlPGRI=
X-Received: by 2002:a05:622a:1111:b0:4b3:7ec:d238 with SMTP id
 d75a77b69052e-4b31b85ed4fmr112249201cf.4.1756769248492; Mon, 01 Sep 2025
 16:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
 <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org> <CAK3+h2xQFeVtkPb+Sr1k+E0Fre+8hi_QfWYd3ueK-2B1FgJmGA@mail.gmail.com>
In-Reply-To: <CAK3+h2xQFeVtkPb+Sr1k+E0Fre+8hi_QfWYd3ueK-2B1FgJmGA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 1 Sep 2025 16:27:17 -0700
X-Gm-Features: Ac12FXyPqVkziXnwECapRN0epMCTg39WZ_0Z85NBVF2zmpusWCp5QziMpcl1FlE
Message-ID: <CAK3+h2xx8Zp-tRvw7rG4XjBWd_2D=TqZ=+cRYp9tzuyva0qeXA@mail.gmail.com>
Subject: Re: [BUG?] driver stmmac reports page_pool_release_retry() stalled
 pool shutdown every minute
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, xdp-newbies@vger.kernel.org, 
	loongarch@lists.linux.dev, Dragos Tatulea <dtatulea@nvidia.com>, 
	Furong Xu <0x1207@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Philipp Stanner <phasta@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	Andrew Lunn <andrew+netdev@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 10:56=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> Hi Jesper,
>
> Thank you for your input!
>
> On Mon, Sep 1, 2025 at 2:23=E2=80=AFAM Jesper Dangaard Brouer <hawk@kerne=
l.org> wrote:
> >
> > Hi Vincent,
> >
> > Thanks for reporting.
> > Please see my instruction inlined below.
> > Will appreciate if you reply inline below to my questions.
> >
> >
> > On 01/09/2025 04.47, Vincent Li wrote:
> > > Hi,
> > >
> > > I noticed once I attached a XDP program to a dwmac-loongson-pci
> > > network device on a loongarch PC, the kernel logs stalled pool messag=
e
> > > below every minute, it seems  not to affect network traffic though. i=
t
> > > does not seem to be architecture dependent, so I decided to report
> > > this to netdev and XDP mailing list in case there is a bug in stmmac
> > > related network device with XDP.
> > >
> >
> > Dragos (Cc'ed) gave a very detailed talk[1] about debugging page_pool
> > leaks, that I highly recommend:
> >   [1]
> > https://netdevconf.info/0x19/sessions/tutorial/diagnosing-page-pool-lea=
ks.html
> >
> > Before doing kernel debugging with drgn, I have some easier steps, I
> > want you to perform on your hardware (I cannot reproduce given I don't
> > have this hardware).
>
> I watched the video and slide, I would have difficulty running drgn
> since the loongfire OS [0] I am running does not have proper python
> support. loongfire is a port of IPFire for LoongArch architecture. The
> kernel is upstream stable release 6.15.9  with a backport of LoongArch
> BPF trampoline for supporting xdp-tools. I run loongfire on a
> LoongArch PC for my home Internet. I tried to reproduce this issue on
> the LoongArch PC with a Fedora desktop OS release with the same kernel
> 6.15.9, I can't reproduce the issue, not sure if this is only
> reproducible for firewall/router like Linux OS with stmmac device.
>
> >
> > First step is to check is a socket have unprocessed packets stalled in
> > it receive-queue (Recv-Q).  Use command 'netstat -tapenu' and look at
> > column "Recv-Q".  If any socket/application have not emptied it's Recv-=
Q
> > try to restart this service and see if the "stalled pool shutdown" goes
> > away.
>
> the Recv-Q shows 0 from  'netstat -tapenu'
>
>  [root@loongfire ~]#  netstat -tapenu
> Active Internet connections (servers and established)
> Proto Recv-Q Send-Q Local Address           Foreign Address
> State       User       Inode      PID/Program name
> tcp        0      0 127.0.0.1:8953          0.0.0.0:*
> LISTEN      0          10283      1896/unbound
> tcp        0      0 0.0.0.0:53              0.0.0.0:*
> LISTEN      0          10281      1896/unbound
> tcp        0      0 0.0.0.0:22              0.0.0.0:*
> LISTEN      0          8708       2823/sshd: /usr/sbi
> tcp        0    272 192.168.9.1:22          192.168.9.13:58660
> ESTABLISHED 0          8754       3004/sshd-session:
> tcp6       0      0 :::81                   :::*
> LISTEN      0          7828       2841/httpd
> tcp6       0      0 :::444                  :::*
> LISTEN      0          7832       2841/httpd
> tcp6       0      0 :::1013                 :::*
> LISTEN      0          7836       2841/httpd
> tcp6       0      0 10.0.0.229:444          192.168.9.13:58762
> TIME_WAIT   0          0          -
> udp        0      0 0.0.0.0:53              0.0.0.0:*
>          0          10280      1896/unbound
> udp        0      0 0.0.0.0:67              0.0.0.0:*
>          0          10647      2803/dhcpd
> udp        0      0 10.0.0.229:68           0.0.0.0:*
>          0          8644       2659/dhcpcd: [BOOTP
> udp        0      0 10.0.0.229:123          0.0.0.0:*
>          0          8679       2757/ntpd
> udp        0      0 192.168.9.1:123         0.0.0.0:*
>          0          8678       2757/ntpd
> udp        0      0 127.0.0.1:123           0.0.0.0:*
>          0          8677       2757/ntpd
> udp        0      0 0.0.0.0:123             0.0.0.0:*
>          0          8670       2757/ntpd
> udp        0      0 0.0.0.0:514             0.0.0.0:*
>          0          5689       1864/syslogd
> udp6       0      0 :::123                  :::*
>          0          8667       2757/ntpd
>
> > Second step is compiling kernel with CONFIG_DEBUG_VM enabled. This will
> > warn us if the driver leaked the a page_pool controlled page, without
> > first "releasing" is correctly.  See commit dba1b8a7ab68 ("mm/page_pool=
:
> > catch page_pool memory leaks") for how the warning will look like.
> >   (p.s. this CONFIG_DEBUG_VM have surprisingly low-overhead, as long as
> > you don't select any sub-options, so we choose to run with this in
> > production).
> >
>
> I added CONFIG_DEBUG_VM and recompiled the kernel, but no kernel
> warning message about page leak, maybe false positive?
>
> [root@loongfire ~]# grep 'CONFIG_DEBUG_VM=3Dy' /boot/config-6.15.9-ipfire
>
> CONFIG_DEBUG_VM=3Dy
>
> [root@loongfire ~]# grep -E 'MEM_TYPE_PAGE_POOL|stalled' /var/log/kern.lo=
g
>
> Sep  1 10:23:19 loongfire kernel: [    7.484986] dwmac-loongson-pci
> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> Sep  1 10:26:44 loongfire kernel: [  212.514302] dwmac-loongson-pci
> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> Sep  1 10:27:44 loongfire kernel: [  272.911878]
> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 60
> sec
> Sep  1 10:28:44 loongfire kernel: [  333.327876]
> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 120
> sec
> Sep  1 10:29:45 loongfire kernel: [  393.743877]
> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 181
> sec
>

I came up a fentry bpf program [0]
https://github.com/vincentmli/loongfire/issues/3 to trace the netdev
value in page_pool_release_retry():

        /* Periodic warning for page pools the user can't see */
        netdev =3D READ_ONCE(pool->slow.netdev);
        if (time_after_eq(jiffies, pool->defer_warn) &&
            (!netdev || netdev =3D=3D NET_PTR_POISON)) {
                int sec =3D (s32)((u32)jiffies - (u32)pool->defer_start) / =
HZ;

                pr_warn("%s() stalled pool shutdown: id %u, %d
inflight %d sec\n",
                        __func__, pool->user.id, inflight, sec);
                pool->defer_warn =3D jiffies + DEFER_WARN_INTERVAL;
        }

The bpf program prints netdev  NULL, I wonder if there is left over
page pool allocated initially by the stmmac driver, and  after
attaching XDP program, the page pool allocated initially had netdev
changed to NULL?

Page Pool: 0x900000010b54f000
  netdev pointer: 0x0
  is NULL: YES
  is NET_PTR_POISON: NO
  condition (!netdev || netdev =3D=3D NET_PTR_POISON): TRUE

Page Pool: 0x900000010b54f000
  netdev pointer: 0x0
  is NULL: YES
  is NET_PTR_POISON: NO
  condition (!netdev || netdev =3D=3D NET_PTR_POISON): TRUE

> > Third step is doing kernel debugging like Dragos did in [1].
> >
> > What kernel version are you using?
>
> kernel 6.15.9
>
> >
> > In kernel v6.8 we (Kuba) silenced some of the cases.  See commit
> > be0096676e23 ("net: page_pool: mute the periodic warning for visible
> > page pools").
> > To Jakub/kuba can you remind us how to use the netlink tools that can
> > help us inspect the page_pools active on the system?
> >
> >
> > > xdp-filter load green0
> > >
> >
> > Most drivers change memory model and reset the RX rings, when attaching
> > XDP.  So, it makes sense that the existing page_pool instances (per RXq=
)
> > are freed and new allocated.  Revealing any leaked or unprocessed
> > page_pool pages.
> >
> >
> > > Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci =
0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > Aug 31 19:19:07 loongfire kernel: [200872.810587] page_pool_release_r=
etry() stalled pool shutdown: id 9, 1 inflight 200399 sec
> >
> > It is very weird that a stall time of 200399 sec is reported. This
> > indicate that this have been happening *before* the xdp-filter was
> > attached. The uptime "200871.855044" indicate leak happened 472 sec
> > after booting this system.
> >
>
> Not sure if I pasted the previous log message correctly, but this time
> the log I pasted should be correct,
>
> > Have you seen these dmesg logs before attaching XDP?
>
> I didn't see such a log before attaching XDP.
>
> >
> > This will help us know if this page_pool became "invisible" according t=
o
> > Kuba's change, if you run kernel >=3D v6.8.
> >
> >
> > > Aug 31 19:20:07 loongfire kernel: [200933.226488] page_pool_release_r=
etry() stalled pool shutdown: id 9, 1 inflight 200460 sec
> > > Aug 31 19:21:08 loongfire kernel: [200993.642391]
> > > page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> > > 200520 sec
> > > Aug 31 19:22:08 loongfire kernel: [201054.058292]
> > > page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> > > 200581 sec
> > >
> >
> > Cc'ed some people that might have access to this hardware, can any of
> > you reproduce?
> >
> > --Jesper
>
> [0]: https://github.com/vincentmli/loongfire

