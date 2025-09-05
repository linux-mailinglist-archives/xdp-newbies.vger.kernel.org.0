Return-Path: <xdp-newbies+bounces-189-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A5B45921
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Sep 2025 15:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CCF45837AD
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Sep 2025 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296F4356912;
	Fri,  5 Sep 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk0qEOrJ"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB077352FE8;
	Fri,  5 Sep 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079114; cv=none; b=oaZ6ADfU1RIsdqwmCXuPAQquKQkfmjQh6DROb1VYfiS1R0G1Hw1z0veHFLrFiNUiGsPnze9jMasmk6pBY/Fb9I2r89frBkKIdvqzsm6PpMYJQugZFUEaHgpwluId80x5fHd2qsKrxamyg0ekQujNV1Qf01cE4jUqzQopum+Z7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079114; c=relaxed/simple;
	bh=dD2pWAomXulcS3/+dPx3Yrf7QGxwFE4KGaN50EHM08Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbhilQGlkP44GCAR+duVaoYuHrD4ebJdALSFS7rx0QuqrI4h+QH0o4HjXujIUu+NR2VHamR+EMbwNb6AifGWFcpsXMA+QrNKa4vjlPgu3Q+UXD1Fodkvi7t0y1b43c0p6LobKv54cd/bgi21bhrc9NkjCTAXrTi+Pa2amloh65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk0qEOrJ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b2f4ac4786so20793951cf.1;
        Fri, 05 Sep 2025 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757079112; x=1757683912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30AUT6oybHIq18kHlQCSnYEHacbfTx4Cddlh71/sjbo=;
        b=gk0qEOrJVv30ADalj4Tbl/PJv67ZunHE05Qi/jdkQg+lfy4fV9lEXjS7F6rthQ0KdR
         iniBRQjkLL3HmnvBVxD6Gn7riOm6Ebs5AGmqDgnvon6ARl5q0bqxL6O5Ut9TsQZZCtlc
         XC3SPLrZzn6uZncoplRWoNQij+8Ff6MNm8rffn2xoqvhZrVO3sasQjhM9dzM8yWWsph6
         +SfTaPkfFUBmK1G62JaAjhRxKFtHLZfvhhMmgcgfnKOtxILQSBhYNyRj8wJmdb1XwkCY
         cb0ifseFG4DXUXXx+T385M8dTekrVmPtwyV3LJ/sXo55YKEOZBx46VK9pVqEQlbWIJgV
         LiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079112; x=1757683912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30AUT6oybHIq18kHlQCSnYEHacbfTx4Cddlh71/sjbo=;
        b=vXLLFliYwMtlK7xFBx3KuVngun6ya2t21jVlm125NRZGJUyL4sRctAla/UO39vEo1m
         k4+xfrqnVUOJEjZ16TTHsgXINUnTVB7ZDsfYx7/6s0q1h7poVVJ/gg1hRALQIiXZqIX7
         d4AfFSfTJfl8uY9jVeU14ihgT88YcCuREbvYxSlWFvYWiZmOjpsBoHHV1f5BT91bzfhA
         dtFgTpyLC0BbkgDold7qtGTHjXNg+A0mwHsYv27QRxn+tmpmGpgLUb5RHQPefYSbF1Zt
         gW2ir490a0oquS38b9k5vqj2J4t26KVz1x40o/SQt+KY0mcH6kqrxBMDU+oPChdZu1xO
         sxig==
X-Forwarded-Encrypted: i=1; AJvYcCUHbLOJOtfOqLmZP36JUTNxa/PUDuISiVQsjZ/ghi2CN3T82NGYqVzylH3OeUZXyvgbNKtlYFU=@vger.kernel.org, AJvYcCWV5UUeCCLq9ewF3G/ecfvy3lDjIrtFUtNaKmovsMh9gNjsEHMWuh7Gqiek8OXPUQ0fS/2ypjKuIHz4mU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/F7CFVinjncaFb3FwDUz/yaomtwSPWa0tRhOh25KIu7U/lQG
	rf4j+Byvh6ET2VRSaUhJTYv+BDwzGFv4HxH/GUyze8k3yjBvmuaif/MkuqAZRPnjW2TeaVRRkUM
	W88hDzYKvwsjNuT8JpGp+J6w8rS7qsN0=
X-Gm-Gg: ASbGncuUpsS0jkcPFaF8qTV38T7RBHU6EphZnImq7uryG0NcetqWJQii27fVUlwe/Nc
	xWjICibhgjL1CdZM1EWW76aedvy/ceTHqDINQi65PZtIJzczsyCjnqCdBtrH4MBjlksngKaeqmj
	tBNyZK8OSl54c0tDkHvb9NluKDSAjSlM1f1pM0U9aWdU0Q2QXQJaZVuz2/JPdk1PNY4b25UC1On
	jx7vcOktfrdWtfgMg==
X-Google-Smtp-Source: AGHT+IEt6aCtE8z5vPljz9s1TGZ8eDMB2c9LDTFXBPOSMZ/UIHmGnDL3XVycTV3DZ3PXIBt5JcrAQzNoByZBWTQLU+E=
X-Received: by 2002:ac8:5890:0:b0:4b2:9510:79ab with SMTP id
 d75a77b69052e-4b31d80cc5emr293434341cf.13.1757079111458; Fri, 05 Sep 2025
 06:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
 <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org> <CAK3+h2xQFeVtkPb+Sr1k+E0Fre+8hi_QfWYd3ueK-2B1FgJmGA@mail.gmail.com>
 <CAK3+h2xx8Zp-tRvw7rG4XjBWd_2D=TqZ=+cRYp9tzuyva0qeXA@mail.gmail.com> <04169545-c40d-4ae1-8fd9-39e4c47472a4@kernel.org>
In-Reply-To: <04169545-c40d-4ae1-8fd9-39e4c47472a4@kernel.org>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 5 Sep 2025 06:31:37 -0700
X-Gm-Features: Ac12FXz4IDRp9hRggNiMHykOx-iCTzezR5-1gzmeqpGsdE6JG1FJG7O_K5ykTVA
Message-ID: <CAK3+h2y84g=GDnWgFzNc_pLZQEZDPWxuR0YFsbNqsx5u_YoU5w@mail.gmail.com>
Subject: Re: [BUG?] driver stmmac reports page_pool_release_retry() stalled
 pool shutdown every minute
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Dragos Tatulea <dtatulea@nvidia.com>, netdev@vger.kernel.org, 
	xdp-newbies@vger.kernel.org, loongarch@lists.linux.dev, 
	Furong Xu <0x1207@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Philipp Stanner <phasta@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:59=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel=
.org> wrote:
>
>
>
> On 02/09/2025 01.27, Vincent Li wrote:
> > On Mon, Sep 1, 2025 at 10:56=E2=80=AFAM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> >>
> >> On Mon, Sep 1, 2025 at 2:23=E2=80=AFAM Jesper Dangaard Brouer <hawk@ke=
rnel.org> wrote:
> >>>
> >>> On 01/09/2025 04.47, Vincent Li wrote:
> >>>> Hi,
> >>>>
> >>>> I noticed once I attached a XDP program to a dwmac-loongson-pci
> >>>> network device on a loongarch PC, the kernel logs stalled pool messa=
ge
> >>>> below every minute, it seems  not to affect network traffic though. =
it
> >>>> does not seem to be architecture dependent, so I decided to report
> >>>> this to netdev and XDP mailing list in case there is a bug in stmmac
> >>>> related network device with XDP.
> >>>>
> >>>
> >>> Dragos (Cc'ed) gave a very detailed talk[1] about debugging page_pool
> >>> leaks, that I highly recommend:
> >>>    [1]
> >>> https://netdevconf.info/0x19/sessions/tutorial/diagnosing-page-pool-l=
eaks.html
> >>>
> >>> Before doing kernel debugging with drgn, I have some easier steps, I
> >>> want you to perform on your hardware (I cannot reproduce given I don'=
t
> >>> have this hardware).
> >>
> >> I watched the video and slide, I would have difficulty running drgn
> >> since the loongfire OS [0] I am running does not have proper python
> >> support. loongfire is a port of IPFire for LoongArch architecture. The
> >> kernel is upstream stable release 6.15.9  with a backport of LoongArch
> >> BPF trampoline for supporting xdp-tools. I run loongfire on a
> >> LoongArch PC for my home Internet. I tried to reproduce this issue on
> >> the LoongArch PC with a Fedora desktop OS release with the same kernel
> >> 6.15.9, I can't reproduce the issue, not sure if this is only
> >> reproducible for firewall/router like Linux OS with stmmac device.
> >>
> >>>
> >>> First step is to check is a socket have unprocessed packets stalled i=
n
> >>> it receive-queue (Recv-Q).  Use command 'netstat -tapenu' and look at
> >>> column "Recv-Q".  If any socket/application have not emptied it's Rec=
v-Q
> >>> try to restart this service and see if the "stalled pool shutdown" go=
es
> >>> away.
> >>
> >> the Recv-Q shows 0 from  'netstat -tapenu'
> >>
>
> This tell us that is wasn't an easy case of packets waiting in a socket
> queue.  Indicating a higher probability of a driver issue.
>
> >>   [root@loongfire ~]#  netstat -tapenu
> >> Active Internet connections (servers and established)
> >> Proto Recv-Q Send-Q Local Address           Foreign Address
> >> State       User       Inode      PID/Program name
> >> tcp        0      0 127.0.0.1:8953          0.0.0.0:*
> >> LISTEN      0          10283      1896/unbound
> >> tcp        0      0 0.0.0.0:53              0.0.0.0:*
> >> LISTEN      0          10281      1896/unbound
> >> tcp        0      0 0.0.0.0:22              0.0.0.0:*
> >> LISTEN      0          8708       2823/sshd: /usr/sbi
> >> tcp        0    272 192.168.9.1:22          192.168.9.13:58660
> >> ESTABLISHED 0          8754       3004/sshd-session:
> >> tcp6       0      0 :::81                   :::*
> >> LISTEN      0          7828       2841/httpd
> >> tcp6       0      0 :::444                  :::*
> >> LISTEN      0          7832       2841/httpd
> >> tcp6       0      0 :::1013                 :::*
> >> LISTEN      0          7836       2841/httpd
> >> tcp6       0      0 10.0.0.229:444          192.168.9.13:58762
> >> TIME_WAIT   0          0          -
> >> udp        0      0 0.0.0.0:53              0.0.0.0:*
> >>           0          10280      1896/unbound
> >> udp        0      0 0.0.0.0:67              0.0.0.0:*
> >>           0          10647      2803/dhcpd
> >> udp        0      0 10.0.0.229:68           0.0.0.0:*
> >>           0          8644       2659/dhcpcd: [BOOTP
> >> udp        0      0 10.0.0.229:123          0.0.0.0:*
> >>           0          8679       2757/ntpd
> >> udp        0      0 192.168.9.1:123         0.0.0.0:*
> >>           0          8678       2757/ntpd
> >> udp        0      0 127.0.0.1:123           0.0.0.0:*
> >>           0          8677       2757/ntpd
> >> udp        0      0 0.0.0.0:123             0.0.0.0:*
> >>           0          8670       2757/ntpd
> >> udp        0      0 0.0.0.0:514             0.0.0.0:*
> >>           0          5689       1864/syslogd
> >> udp6       0      0 :::123                  :::*
> >>           0          8667       2757/ntpd
> >>
> >>> Second step is compiling kernel with CONFIG_DEBUG_VM enabled. This wi=
ll
> >>> warn us if the driver leaked the a page_pool controlled page, without
> >>> first "releasing" is correctly.  See commit dba1b8a7ab68 ("mm/page_po=
ol:
> >>> catch page_pool memory leaks") for how the warning will look like.
> >>>    (p.s. this CONFIG_DEBUG_VM have surprisingly low-overhead, as long=
 as
> >>> you don't select any sub-options, so we choose to run with this in
> >>> production).
> >>>
> >>
> >> I added CONFIG_DEBUG_VM and recompiled the kernel, but no kernel
> >> warning message about page leak, maybe false positive?
> >>
>
> This just tells us that the inflight page_pool page wasn't "illegality"
> returned to the MM-subsystem.  So, this page is stuck somewhere in the
> system, still "registered" to a page_pool instance. This is even more
> indication of a driver bug.
>
> We are almost out of easy options to try.  The last attempt I want you
> to try is to unload the NIC drivers kernel module (via rmmod).  And then
> wait to see if the "stalled pool shutdown" messages disappears. I hope
> you have some serial console, so you can still observe the kernel log.
>

rmmod the driver kernel module while the XDP program is attached? if I
detach the XDP program, the message disappears.

> If the "stalled pool shutdown" messages continue, then we have to use
> the techniques as Dragos did.
>
> Basically scanning all page's in memory looking for PP_SIGNATURE bit.
> Here is some example[1] code that walks all memory pages from the kernel
> side.  This doesn't actually work as a kernel module... if I was you, I
> would just copy-paste this into the driver or page_pool, and call it
> when we see the stalled messages.  This will help us identify the
> page_pool page. (After which I would use Drgn to investigate the state).
>
> [1]
> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/mm/be=
nch/page_bench06_walk_all.c#L68-L97
>
can I insert the code in page_pool_release_retry() below right after
the pr_warn() message line 1187?  What should I print or do in the
above code if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE) block?

1164 static void page_pool_release_retry(struct work_struct *wq)
1165 {
1166         struct delayed_work *dwq =3D to_delayed_work(wq);
1167         struct page_pool *pool =3D container_of(dwq, typeof(*pool),
release_dw);
1168         void *netdev;
1169         int inflight;
1170
1171         inflight =3D page_pool_release(pool);
1172         /* In rare cases, a driver bug may cause inflight to go negati=
ve.
1173          * Don't reschedule release if inflight is 0 or negative.
1174          * - If 0, the page_pool has been destroyed
1175          * - if negative, we will never recover
1176          * in both cases no reschedule is necessary.
1177          */
1178         if (inflight <=3D 0)
1179                 return;
1180
1181         /* Periodic warning for page pools the user can't see */
1182         netdev =3D READ_ONCE(pool->slow.netdev);
1183         if (time_after_eq(jiffies, pool->defer_warn) &&
1184             (!netdev || netdev =3D=3D NET_PTR_POISON)) {
1185                 int sec =3D (s32)((u32)jiffies -
(u32)pool->defer_start) / HZ;
1186
1187                 pr_warn("%s() stalled pool shutdown: id %u, %d
inflight %d sec\n",
1188                         __func__, pool->user.id, inflight, sec);
1189                 pool->defer_warn =3D jiffies + DEFER_WARN_INTERVAL;
1190         }
1191
1192         /* Still not ready to be disconnected, retry later */
1193         schedule_delayed_work(&pool->release_dw, DEFER_TIME);
1194 }

>
> >> [root@loongfire ~]# grep 'CONFIG_DEBUG_VM=3Dy' /boot/config-6.15.9-ipf=
ire
> >>
> >> CONFIG_DEBUG_VM=3Dy
> >>
> >> [root@loongfire ~]# grep -E 'MEM_TYPE_PAGE_POOL|stalled' /var/log/kern=
.log
> >>
> >> Sep  1 10:23:19 loongfire kernel: [    7.484986] dwmac-loongson-pci
> >> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >> Sep  1 10:26:44 loongfire kernel: [  212.514302] dwmac-loongson-pci
> >> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >> Sep  1 10:27:44 loongfire kernel: [  272.911878]
> >> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 60
> >> sec
> >> Sep  1 10:28:44 loongfire kernel: [  333.327876]
> >> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 120
> >> sec
> >> Sep  1 10:29:45 loongfire kernel: [  393.743877]
> >> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 181
> >> sec
> >>
> >
> > I came up a fentry bpf program [0]
> > https://github.com/vincentmli/loongfire/issues/3 to trace the netdev
> > value in page_pool_release_retry():
> >
> >          /* Periodic warning for page pools the user can't see */
> >          netdev =3D READ_ONCE(pool->slow.netdev);
> >          if (time_after_eq(jiffies, pool->defer_warn) &&
> >              (!netdev || netdev =3D=3D NET_PTR_POISON)) {
> >                  int sec =3D (s32)((u32)jiffies - (u32)pool->defer_star=
t) / HZ;
> >
> >                  pr_warn("%s() stalled pool shutdown: id %u, %d
> > inflight %d sec\n",
> >                          __func__, pool->user.id, inflight, sec);
> >                  pool->defer_warn =3D jiffies + DEFER_WARN_INTERVAL;
> >          }
> >
> > The bpf program prints netdev  NULL, I wonder if there is left over
> > page pool allocated initially by the stmmac driver, and  after
> > attaching XDP program, the page pool allocated initially had netdev
> > changed to NULL?
> >
> > Page Pool: 0x900000010b54f000
> >    netdev pointer: 0x0
> >    is NULL: YES
> >    is NET_PTR_POISON: NO
> >    condition (!netdev || netdev =3D=3D NET_PTR_POISON): TRUE
> >
> > Page Pool: 0x900000010b54f000
> >    netdev pointer: 0x0
> >    is NULL: YES
> >    is NET_PTR_POISON: NO
> >    condition (!netdev || netdev =3D=3D NET_PTR_POISON): TRUE
> >
> >>> Third step is doing kernel debugging like Dragos did in [1].
> >>>
> >>> What kernel version are you using?
> >>
> >> kernel 6.15.9
> >>
>
> Nice, that is a very recent kernel.
> The above shows us that we are indeed hitting the issue of a "hidden"
> page_pool instance (related to the page_pool commit Jakub/Kuba added).
>
>
> >>>
> >>> In kernel v6.8 we (Kuba) silenced some of the cases.  See commit
> >>> be0096676e23 ("net: page_pool: mute the periodic warning for visible
> >>> page pools").
> >>> To Jakub/kuba can you remind us how to use the netlink tools that can
> >>> help us inspect the page_pools active on the system?
> >>>
> >>>
> >>>> xdp-filter load green0
> >>>>
> >>>
> >>> Most drivers change memory model and reset the RX rings, when attachi=
ng
> >>> XDP.  So, it makes sense that the existing page_pool instances (per R=
Xq)
> >>> are freed and new allocated.  Revealing any leaked or unprocessed
> >>> page_pool pages.
> >>>
> >>>
> >>>> Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci=
 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >>>> Aug 31 19:19:07 loongfire kernel: [200872.810587] page_pool_release_=
retry() stalled pool shutdown: id 9, 1 inflight 200399 sec
> >>>
> >>> It is very weird that a stall time of 200399 sec is reported. This
> >>> indicate that this have been happening *before* the xdp-filter was
> >>> attached. The uptime "200871.855044" indicate leak happened 472 sec
> >>> after booting this system.
> >>>
> >>
> >> Not sure if I pasted the previous log message correctly, but this time
> >> the log I pasted should be correct,
> >>
> >>> Have you seen these dmesg logs before attaching XDP?
> >>
> >> I didn't see such a log before attaching XDP.
> >>
>
>  From above we have established, that it makes sense, as the mentioned
> commit would have "blocked it" from being printed.
>
> >>>
> >>> This will help us know if this page_pool became "invisible" according=
 to
> >>> Kuba's change, if you run kernel >=3D v6.8.
> >>>
> >>>
> >>>> Aug 31 19:20:07 loongfire kernel: [200933.226488] page_pool_release_=
retry() stalled pool shutdown: id 9, 1 inflight 200460 sec
> >>>> Aug 31 19:21:08 loongfire kernel: [200993.642391]
> >>>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> >>>> 200520 sec
> >>>> Aug 31 19:22:08 loongfire kernel: [201054.058292]
> >>>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> >>>> 200581 sec
> >>>>
> >>>
> >>> Cc'ed some people that might have access to this hardware, can any of
> >>> you reproduce?
> >>>
>
> Anyone with this hardware?
>
> >>
> >> [0]: https://github.com/vincentmli/loongfire
>
> --Jesper

