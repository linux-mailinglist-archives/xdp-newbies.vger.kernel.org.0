Return-Path: <xdp-newbies+bounces-164-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C99CD5C8
	for <lists+xdp-newbies@lfdr.de>; Fri, 15 Nov 2024 04:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC1F1F22142
	for <lists+xdp-newbies@lfdr.de>; Fri, 15 Nov 2024 03:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC5514A627;
	Fri, 15 Nov 2024 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSTCawuO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3872D052;
	Fri, 15 Nov 2024 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731640671; cv=none; b=DKKmTM9VvQZ+kPG+iN8xDg3pQEGudXeNhgvRoXXoBK+hkiqEPWVzJS0h+p9HAu+boWg62Q+PTXNStxIhpqrypi+sHVqedoNGxINXobtTose+7y6+vl+0aZrCcFDi8Ob/1odn20Cg8mX5LEH/Du95hUDgPjUScANvZMF3FXGtBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731640671; c=relaxed/simple;
	bh=H10YB5TG9yKbyc4cZjMzNMGpqPypCnlP4klBS4hN0u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAP0LoD1blfTPG4HxOFOIAHMIY/MLK50o5tEGmTnj1emBTBGPeelLT/5PrSgV+NRYHBoiTwn7wVV1tuQtZ59+kvJVKZXJHAVnDXOo+z0rtWv6SJ5i7xozP6BYhpqW3G3TPrSYKeaAniWTP2f4n98zHYmevSqa0jYvVCl2TOntE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSTCawuO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38221c82827so612999f8f.3;
        Thu, 14 Nov 2024 19:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731640668; x=1732245468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFvAs8uN23uHm61FySfxQfnGVf/qFB+acZJKDr5ZJcM=;
        b=OSTCawuO7pgzZfIf5nAXr4Jl6eFR8TzLzrHdoFjiWnr5SGSi20ShT9nDwoKbKDGzxD
         7U98ax8LGmvOnxeiaDGqqW9STpdTMl/LJImWyL8ojkOuZIw+QhK+R2KielKpJOOsF8Kl
         6PVXT+oVFSHpuDGcifpY8yAFkjaZnufeEoAXtQmLTlY6dv0kV2xTPGqAcHaGoGd4Nssr
         +Opveacd483F9DG9MiiP6OfNkLWEQ++U5K3r1MCrDEqYEm1GqF+NIODVj3ZS5FiATT/0
         ydtbCZuhIN5VxRG1c8bHysmbBjLn9kjxHzkqmCvD+T+d8CCIUztGRKDoTWglk3cE+mbw
         QXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731640668; x=1732245468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFvAs8uN23uHm61FySfxQfnGVf/qFB+acZJKDr5ZJcM=;
        b=m2woFe5DsUvkprKtpFGcc11Z8Fd90mlPLZvSXz200KHZ6zxMoGcdr+tsiTsKrqZBmg
         FqqcajH3/STImhNjwIBuBY5Q04rtTS7KSPiIlEdWtuQezKA9VXnb5ZtPy5HB/0pvrI3s
         DkySq7Ttr0LuWcuOkKcRV8KquUQYuIwv+e3jNArFlRWp8Lcis+Dd+AAH2301FRdQ1YDu
         KHq1eOh+fgqz8d2J1GB/Y2MHiLtNs1Xn/fdgW1P5akb5SA9yxOjSMn+cI2jwqgmQxN8v
         cmYQ0gssNe6srFEn3Onk/ox5V1nVTgkxDfHUpk1sBG5wtl/5GXwTQbfKezM1xKbhWzS4
         fkMA==
X-Forwarded-Encrypted: i=1; AJvYcCWqgHtzFVdfyLO7K6bK0tdGhrtxO23X4/B6nh4uUWnWZT4SNtLFBs0z/mI7/KwjmtFsWZgVAf8q@vger.kernel.org, AJvYcCXH02Ad5s6Y2PVOBprRYNAdXineykyqgQCKJz/9N12t6P7JdinD1YTbPacziQ5ETp3xrOLiCpbQIi+wj+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM03c/MBlCHq5GmIIjKAoYeYjbmQ1kK1Yon4FH9frt+Ov9Hdgm
	KIs9LucrR+uNLmA6T7ch9JGNFA37sR7bWS7dlhhLt9EkTObBXgubfI0Czy/m/TXk5M3u4dg22Lu
	hemloQ6l88WAek7/A16jPDDSguz8OmA==
X-Google-Smtp-Source: AGHT+IEUBraF53kORdvzfKw/uGdn43ON0vQTpHFm+/f0NjvWsN64gNE0je1uc3i1cfj8jED+i79Bvi6UnC8ybKOUbDM=
X-Received: by 2002:a05:6000:1543:b0:382:228b:4c34 with SMTP id
 ffacd0b85a97d-382258f0863mr650512f8f.2.1731640667467; Thu, 14 Nov 2024
 19:17:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12b6a2f7-a677-449d-b4f3-e2c29046229a@kernel.org>
In-Reply-To: <12b6a2f7-a677-449d-b4f3-e2c29046229a@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 14 Nov 2024 19:17:36 -0800
Message-ID: <CAADnVQK+zZDHZhoF0g-uLt-r6EN1e6OY=Tmm7nP47P4+bXkv4Q@mail.gmail.com>
Subject: Re: FOSDEM 2025 eBPF Devroom Call for Participation
To: bpf <bpf@vger.kernel.org>
Cc: xdp-newbies <xdp-newbies@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf@ietf.org, "Jose E. Marchesi" <jemarch@gnu.org>, 
	Quentin Monnet <qmo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The CFP for BPF devroom at FOSDEM closes on Dec 1st.

Please submit your proposal,

and/or forward to the folks that might be interested in attending or speaki=
ng.


On Fri, Oct 25, 2024 at 3:32=E2=80=AFPM Quentin Monnet <qmo@kernel.org> wro=
te:
>
> We are delighted to announce the Call for Participation (CFP) for the
> very first eBPF Devroom at FOSDEM!
>
> Mark the Dates
> --------------
>
> - December 1st, 2024: Submission deadline
> - December 15th, 2024: Announcement of accepted talks and schedule
> - February 1st, 2025 (Saturday afternoon): eBPF Devroom at FOSDEM
>
> eBPF at FOSDEM
> --------------
>
> FOSDEM is a free, community-organized event focusing on open source, and
> aiming at gathering open source software developers and communities to
> meet, learn, and share. It takes place annually in Brussels, Belgium.
> After hosting a number of eBPF-related talks in various devrooms over
> the years, FOSDEM 2025 welcomes a devroom dedicated to eBPF for the
> first time! This devroom aims at gathering talks about various aspects
> of eBPF, ideally on multiple platforms.
>
> Topics of Interest
> ------------------
>
> If you have something to present about eBPF, we would love for you to
> consider submitting a proposal to the Devroom.
>
> The projects or technologies discussed in the talks MUST be open-source.
>
> Topics of interest for the Devroom include (but are not limited to):
>
> - eBPF development: recent or proposed features (on Linux, on other
>   platforms, or even cross-platform), such as:
>     - eBPF program signing and supply chain security
>     - Profiling eBPF with eBPF
>     - eBPF-based process schedulers
>     - eBPF in storage devices
>     - eBPF verifier improvements or alternative implementations
>     - Memory management for eBPF
> - Deep-dives on existing eBPF features
> - Working with eBPF: best practices, common mistakes, debugging, etc.
> - eBPF toolchain, for compiling, managing, debugging, packaging, and
>   deploying eBPF programs and related objects
> - eBPF libraries, in C/C++, Go, Rust, or other languages
> - eBPF in the real world, production use cases and their impact
> - eBPF community efforts (documentation, standardization, cross-platform
>   initiatives)
>
> The list is not exhaustive, don't hesitate to submit your proposal!
>
> Format
> ------
>
> FOSDEM 2025 will be an in-person event in Brussels, Belgium.
> We do not accept remote presentations.
>
> We're looking for presentations in one of the following sizes:
>
> - 10 minutes (for example, a short demo)
> - 20 minutes (for example, a project update)
> - 30 minutes (for example, an introduction to a new technology or a deep
>   dive on a complex feature)
>
> The durations above include time for questions: allow at least 5 to 10
> minutes, depending on the total length, to answer questions from the
> public.
>
> How to Submit
> -------------
>
> Please submit your proposals on Pretalx, FOSDEM's submissions tool, at
> https://pretalx.fosdem.org/fosdem-2025/cfp
>
> Make sure to select "eBPF" as the track.
>
> The official communication channel for the Devroom is the dedicated
> FOSDEM mailing list, ebpf-devroom@lists.fosdem.org. If you submit a
> talk, please make sure to join the list:
> https://lists.fosdem.org/listinfo/ebpf-devroom
>
> Code of Conduct
> ---------------
>
> All participants at FOSDEM are expected to abide by the FOSDEM's Code of
> Conduct. If your proposal is accepted, you will be required to confirm
> that you accept this Code of Conduct. You can find this code at
> https://fosdem.org/2025/practical/conduct/
>
> Devroom Organisers
> ------------------
>
> - Alan Jowett
> - Alexei Starovoitov
> - Andrii Nakryiko
> - Bill Mulligan
> - Daniel Borkmann
> - Dimitar Kanaliev
> - Quentin Monnet
> - Yusheng Zheng
>
> If you have questions about any aspects of this Call for Participation,
> please email us at ebpf-devroom-manager@fosdem.org, and we will do our
> best to assist you.
>
> We keep an up-to-date version of this Call for Participation at
> https://ebpf.io/fosdem-2025.html
>

