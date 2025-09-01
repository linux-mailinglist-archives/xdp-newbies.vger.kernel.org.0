Return-Path: <xdp-newbies+bounces-186-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC4B3ED92
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 19:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0E51A88172
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 17:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA1320A04;
	Mon,  1 Sep 2025 17:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCHf8S2V"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF2202997;
	Mon,  1 Sep 2025 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756749393; cv=none; b=rpACMZ7edo7/wCbT21j+em4BeiuNjuVkjLu9mWnRhjh8qJ8Puhn1mc7pUvH1rYrNznJzDg5n78FfOa54O2qXW+TOk78FI1PkopN14ml4HYS+aYwte9EwdU4maSz8iOtHN+ZX/3pRSrvGmkZ1YWED5nIISvbW2/18IzNIc+s/PlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756749393; c=relaxed/simple;
	bh=DYpFntNPAR+obqGi5aSm6BSs9ssU3funEyEBMYtzoDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hheQz8GcDrIAQaKdQR36aW+o5wGQhOUMtkpB1+7f9p+lnbgUmqkJz2b+3zRbLkRvcixW4uiwa5KaITVNmYDW8XXE/HSeXFtRTxsqfkfCZo/JO0/Cj8aSVjf4CvOnZOp2F6572mE7qaUkQymsUnoj3c+Y69b2JlodMW+tzJ84lA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCHf8S2V; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b32ce93e30so10019271cf.2;
        Mon, 01 Sep 2025 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756749391; x=1757354191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnkAB5cjJB/R+P8pJuGvQ/Ck6icctDlkqx/Ms+/RQUA=;
        b=KCHf8S2V9lYYF2v0lb/Kt3XVD/Z9UF6u7tDKwEA234uIu5OW6QkEGZaQWXvNpdTg7T
         Fa5TPvCk49djfwQvHm0sUBqKtQT0K7mAyPpH/UAUeWvKUXbivQsAznTuFpF2jQUn6iB1
         BY46hJdmGD+/vaAVVzC2wdiIfSIAC8YCgygXDolNl9gUOC1zY6LRIlq5oMxpy+Awv/oz
         VyTsnAWFCV77OMDh4ziCG5gSHTiXmHyyrUs2k4b5DVKtznYwUZ0rBmQyZVK52B5LUH5G
         5Ltuj6WTOGob1U+ocRUNlpjkeGnNaro3xmprGFbYh1uYEG9aPpRwltHmHbps2WO9nJEo
         YC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756749391; x=1757354191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnkAB5cjJB/R+P8pJuGvQ/Ck6icctDlkqx/Ms+/RQUA=;
        b=MwGLV6gYbcBL3hnRg0MfA9xDbpgxouLnReTrPIHdD0dOM/05erJSGy35/vdnHw/JaB
         dDWcD0kcLM28aCl2DXP1ikCZZ10aE6WvuOgRfudNK88lS7XAoiKjQCyAMibf2T+S7hpp
         VA0HSXI9wMLAT7PSzhmk7fUewPjQ9cv3GmvLu6nOf8nE+Mr02aNqeHfOpDF5VFZZa/62
         9GGnHYUQn4VJx9yhXMsdP5lLgpHwK/LJM0lt4a5DU+pbJ/y17Ap4ojYnu/jpM963VnDe
         R9+sGMrstNhSJOVRsX5pZZKL7L2uVI7rJMY36FuyLjEKhDW1vAwV8lgOyi6lbju6Ai80
         k3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPYWxq3s17ACZfyS817021tVGDdqlLqZobq5uwXMSsvSmP9uv2fvUx1eeW8jJPxirVwJIS5rZ+aEQA5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrlLArjqJCEVjMXYJw0lPNtQW79RNjnqvNjnwhESmXGQ/uFPj
	G5EqkTmNNcoWKsOAlcviynBGXxejlmQUN1xc6ykwZnaJYphUK0SrPh9kvzcl7vE57uBChOJvxkc
	My52lmZO9XtNJbAudKubl/wfQszA6NI0=
X-Gm-Gg: ASbGnct/1anp20DS+f9JRW796X9GkBBCfXsg9hIO4qW5hIVvZNGwluHkMGyOSWH/S3q
	3oKFmNzpT4yDLFs6yVONdTtGrdr8Rj/Y0hicnmyeNb8Ima4+Ar3OByH8SlPqj16TT9ONURYXXbJ
	EGwrEk12M67G3SBbFnIVIZMpKuTMghZ9U4kygprdmazkVWpFyoThg+srxxbtAz/lFztPfphLuKq
	gtEYUQ=
X-Google-Smtp-Source: AGHT+IHh4BmlsttCHv0N0gZK2324nRO8udlfVr+tHCAiOQFrdFdh6+l76M391QLvZecs93WY8fx7RWthAX3+++BNSqo=
X-Received: by 2002:a05:622a:5e19:b0:4b3:455b:b4b9 with SMTP id
 d75a77b69052e-4b3455bb706mr2784311cf.66.1756749390593; Mon, 01 Sep 2025
 10:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
 <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org>
In-Reply-To: <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 1 Sep 2025 10:56:19 -0700
X-Gm-Features: Ac12FXzpgsR4yymdIQqhgQkjRWpJAw3KS08yLTJlsk_0XoHk2VwLhIWMHf7Zi-E
Message-ID: <CAK3+h2xQFeVtkPb+Sr1k+E0Fre+8hi_QfWYd3ueK-2B1FgJmGA@mail.gmail.com>
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

Hi Jesper,

Thank you for your input!

On Mon, Sep 1, 2025 at 2:23=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel.=
org> wrote:
>
> Hi Vincent,
>
> Thanks for reporting.
> Please see my instruction inlined below.
> Will appreciate if you reply inline below to my questions.
>
>
> On 01/09/2025 04.47, Vincent Li wrote:
> > Hi,
> >
> > I noticed once I attached a XDP program to a dwmac-loongson-pci
> > network device on a loongarch PC, the kernel logs stalled pool message
> > below every minute, it seems  not to affect network traffic though. it
> > does not seem to be architecture dependent, so I decided to report
> > this to netdev and XDP mailing list in case there is a bug in stmmac
> > related network device with XDP.
> >
>
> Dragos (Cc'ed) gave a very detailed talk[1] about debugging page_pool
> leaks, that I highly recommend:
>   [1]
> https://netdevconf.info/0x19/sessions/tutorial/diagnosing-page-pool-leaks=
.html
>
> Before doing kernel debugging with drgn, I have some easier steps, I
> want you to perform on your hardware (I cannot reproduce given I don't
> have this hardware).

I watched the video and slide, I would have difficulty running drgn
since the loongfire OS [0] I am running does not have proper python
support. loongfire is a port of IPFire for LoongArch architecture. The
kernel is upstream stable release 6.15.9  with a backport of LoongArch
BPF trampoline for supporting xdp-tools. I run loongfire on a
LoongArch PC for my home Internet. I tried to reproduce this issue on
the LoongArch PC with a Fedora desktop OS release with the same kernel
6.15.9, I can't reproduce the issue, not sure if this is only
reproducible for firewall/router like Linux OS with stmmac device.

>
> First step is to check is a socket have unprocessed packets stalled in
> it receive-queue (Recv-Q).  Use command 'netstat -tapenu' and look at
> column "Recv-Q".  If any socket/application have not emptied it's Recv-Q
> try to restart this service and see if the "stalled pool shutdown" goes
> away.

the Recv-Q shows 0 from  'netstat -tapenu'

 [root@loongfire ~]#  netstat -tapenu
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address
State       User       Inode      PID/Program name
tcp        0      0 127.0.0.1:8953          0.0.0.0:*
LISTEN      0          10283      1896/unbound
tcp        0      0 0.0.0.0:53              0.0.0.0:*
LISTEN      0          10281      1896/unbound
tcp        0      0 0.0.0.0:22              0.0.0.0:*
LISTEN      0          8708       2823/sshd: /usr/sbi
tcp        0    272 192.168.9.1:22          192.168.9.13:58660
ESTABLISHED 0          8754       3004/sshd-session:
tcp6       0      0 :::81                   :::*
LISTEN      0          7828       2841/httpd
tcp6       0      0 :::444                  :::*
LISTEN      0          7832       2841/httpd
tcp6       0      0 :::1013                 :::*
LISTEN      0          7836       2841/httpd
tcp6       0      0 10.0.0.229:444          192.168.9.13:58762
TIME_WAIT   0          0          -
udp        0      0 0.0.0.0:53              0.0.0.0:*
         0          10280      1896/unbound
udp        0      0 0.0.0.0:67              0.0.0.0:*
         0          10647      2803/dhcpd
udp        0      0 10.0.0.229:68           0.0.0.0:*
         0          8644       2659/dhcpcd: [BOOTP
udp        0      0 10.0.0.229:123          0.0.0.0:*
         0          8679       2757/ntpd
udp        0      0 192.168.9.1:123         0.0.0.0:*
         0          8678       2757/ntpd
udp        0      0 127.0.0.1:123           0.0.0.0:*
         0          8677       2757/ntpd
udp        0      0 0.0.0.0:123             0.0.0.0:*
         0          8670       2757/ntpd
udp        0      0 0.0.0.0:514             0.0.0.0:*
         0          5689       1864/syslogd
udp6       0      0 :::123                  :::*
         0          8667       2757/ntpd

> Second step is compiling kernel with CONFIG_DEBUG_VM enabled. This will
> warn us if the driver leaked the a page_pool controlled page, without
> first "releasing" is correctly.  See commit dba1b8a7ab68 ("mm/page_pool:
> catch page_pool memory leaks") for how the warning will look like.
>   (p.s. this CONFIG_DEBUG_VM have surprisingly low-overhead, as long as
> you don't select any sub-options, so we choose to run with this in
> production).
>

I added CONFIG_DEBUG_VM and recompiled the kernel, but no kernel
warning message about page leak, maybe false positive?

[root@loongfire ~]# grep 'CONFIG_DEBUG_VM=3Dy' /boot/config-6.15.9-ipfire

CONFIG_DEBUG_VM=3Dy

[root@loongfire ~]# grep -E 'MEM_TYPE_PAGE_POOL|stalled' /var/log/kern.log

Sep  1 10:23:19 loongfire kernel: [    7.484986] dwmac-loongson-pci
0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
Sep  1 10:26:44 loongfire kernel: [  212.514302] dwmac-loongson-pci
0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
Sep  1 10:27:44 loongfire kernel: [  272.911878]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 60
sec
Sep  1 10:28:44 loongfire kernel: [  333.327876]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 120
sec
Sep  1 10:29:45 loongfire kernel: [  393.743877]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 181
sec

> Third step is doing kernel debugging like Dragos did in [1].
>
> What kernel version are you using?

kernel 6.15.9

>
> In kernel v6.8 we (Kuba) silenced some of the cases.  See commit
> be0096676e23 ("net: page_pool: mute the periodic warning for visible
> page pools").
> To Jakub/kuba can you remind us how to use the netlink tools that can
> help us inspect the page_pools active on the system?
>
>
> > xdp-filter load green0
> >
>
> Most drivers change memory model and reset the RX rings, when attaching
> XDP.  So, it makes sense that the existing page_pool instances (per RXq)
> are freed and new allocated.  Revealing any leaked or unprocessed
> page_pool pages.
>
>
> > Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci 00=
00:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > Aug 31 19:19:07 loongfire kernel: [200872.810587] page_pool_release_ret=
ry() stalled pool shutdown: id 9, 1 inflight 200399 sec
>
> It is very weird that a stall time of 200399 sec is reported. This
> indicate that this have been happening *before* the xdp-filter was
> attached. The uptime "200871.855044" indicate leak happened 472 sec
> after booting this system.
>

Not sure if I pasted the previous log message correctly, but this time
the log I pasted should be correct,

> Have you seen these dmesg logs before attaching XDP?

I didn't see such a log before attaching XDP.

>
> This will help us know if this page_pool became "invisible" according to
> Kuba's change, if you run kernel >=3D v6.8.
>
>
> > Aug 31 19:20:07 loongfire kernel: [200933.226488] page_pool_release_ret=
ry() stalled pool shutdown: id 9, 1 inflight 200460 sec
> > Aug 31 19:21:08 loongfire kernel: [200993.642391]
> > page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> > 200520 sec
> > Aug 31 19:22:08 loongfire kernel: [201054.058292]
> > page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> > 200581 sec
> >
>
> Cc'ed some people that might have access to this hardware, can any of
> you reproduce?
>
> --Jesper

[0]: https://github.com/vincentmli/loongfire

