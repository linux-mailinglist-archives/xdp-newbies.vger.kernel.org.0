Return-Path: <xdp-newbies+bounces-7-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C68009C8
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 12:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF3FEB20DD8
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 11:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB3821346;
	Fri,  1 Dec 2023 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSyW0DIj"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7B010DE
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Dec 2023 03:19:21 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-67182a5300eso740196d6.0
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Dec 2023 03:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701429560; x=1702034360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=672WbvhZRNXef4ubRJmSPCUHRKc2jLPAKsEOM8S7Oqk=;
        b=VSyW0DIjTN3wevYC/YKu6IrDqdutwPHmxkHF6nFzKGzZ+i2bh7rvJwXGA6QgdepFeE
         2b5o+l75HSsNHb3LpFShfmS8FqZaA6tPMdeOJiyyDlpqJ5aiJVt849PMY3vY29cDQh3H
         6iaXP13ryqzhsHASE9t3AOE+++41hKYSevFlKMgwouAkvHCkC8qbL3ioFFMaHKUc3cSO
         PC59QO2GV//duxmyb11VmJKU+5q3w+Q4I+5hC8/MI6UdK5aa8zcMz8Mtjt+jx4n2gi/B
         dRRb1fQhfTG80jGPvwawSpDB5uwxX084tfxuQ1nKwtHXyan3nRAdiU0mN6tdn7WyPWB5
         Oncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701429560; x=1702034360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=672WbvhZRNXef4ubRJmSPCUHRKc2jLPAKsEOM8S7Oqk=;
        b=bPgnI3VFMKPyHJsi4fRF5E0iBNbT1PTGpOe0V4KC+Qp0ywESwuDzDuHdoCx4iU3Neq
         CuoseXOlfWNGoT6M2+aDaTalurPiYVMhJwfNR7HK94VeQeaC7zapufQXQ1U7YNmMYY47
         mhaR84n9NJa9HyHf36OGKQpEeuqm8yaw+5zJVQbqpblyXQmB9UFWaxVZ7OKLFvq8bFZQ
         WmvMs4rC1g+A1cVDiaK/d6KfWXm6XM2yopetKcy/+RozdpG2nLhwNUPElX48hZKyTU5/
         O4UcfXko/7mYQHbvREIoR6ef9/PAv+V7iPRW7j+i6xH67us2SwkUczQ4VaZY1Bix3hGn
         t5Kw==
X-Gm-Message-State: AOJu0YxKxPUhUtb+x6uwywwviK+za8fWXARppI+YQG8I567ZiEXdT0CV
	xYSss74sAPFHdAIHRShit8Rld8EznTJ2n76f66E=
X-Google-Smtp-Source: AGHT+IF6ULi4WNvUfcjJLV7mj0c6Xz60btUSmnLJ2XvxAzLdWWfMe7cZqPd+zv1EwSQwQhX8pw/4BCWhFvfzYwM0tqk=
X-Received: by 2002:ad4:58ae:0:b0:67a:29c7:98cd with SMTP id
 ea14-20020ad458ae000000b0067a29c798cdmr20786576qvb.4.1701429560393; Fri, 01
 Dec 2023 03:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK587m66mmk+9ZeaWmzhEYS8o-H71QnPypr9Gv+xuXNfebw@mail.gmail.com>
In-Reply-To: <CANzUK587m66mmk+9ZeaWmzhEYS8o-H71QnPypr9Gv+xuXNfebw@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Fri, 1 Dec 2023 12:19:09 +0100
Message-ID: <CAJ8uoz0=LQdUAyYKdRN0ytxU_hzdwLYQY7KDsAz6MpS8bRyYyw@mail.gmail.com>
Subject: Re: AF_XDP
To: Srivats P <pstavirs@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 12:11, Srivats P <pstavirs@gmail.com> wrote:
>
> Hi,
>
> How can I get a list of NIC drivers that support AF_XDP?
>
> The list at https://github.com/xdp-project/xdp-project/blob/master/areas/drivers/README.org
> seems VERY outdated (last updated 4 years ago).
>
> The list at https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md#xdp
> seems more recent (updated last year).
>
> But both lists are for XDP, not AF_XDP.
>
> Is there a way I can grep the source to compile a list for AF_XDP?

For the ones that support AF_XDP in XDP_DRV copy-mode: grep for ndo_bpf

For zero-copy support: grep for ndo_xsk_wakeup

> It would be good to have a list similar to the DPDK supported NICs
> list - https://core.dpdk.org/supported/nics/
>
> Srivats
>

