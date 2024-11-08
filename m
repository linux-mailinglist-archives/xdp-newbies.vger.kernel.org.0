Return-Path: <xdp-newbies+bounces-163-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A25479C25ED
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Nov 2024 20:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C08283425
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Nov 2024 19:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BBC1AA1EF;
	Fri,  8 Nov 2024 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSoO88yy"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599D1990B3
	for <xdp-newbies@vger.kernel.org>; Fri,  8 Nov 2024 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731095759; cv=none; b=sbFBaWD98GO3TGBTvbFR3o8nwaeBKTd+KDzOywF4hkFurP0ObBxIUIBUWq/iP9/bWtwqArvBQHcBEeB/SOYe6XNXGDlUAfnKuXm8bkD3PkqSBJIp8cf27fXcskL1xkwl802iXppdOhsmy9BXEr3xkCNmyUZ1fSE8hqPDwz/ZRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731095759; c=relaxed/simple;
	bh=P1kZeyYuqXTxXCI/cyVpke0XmBrGZem5URHmibJDMCs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=sEmx0f0YOeZU2A12VcaqZONjPnZ3fB+ZmkzeenbicaXuC3kfpexRPy3OJxhV62/Aoi4RPTVvV7uPnNPyfIUneQRvS8/60vvB3SN5s1YAMzIxLuuaMWdIA2nLEAow2W8bl8vr2aFTikqkJnr3eqcXLKwvWmpM4eRhOzqLUHuvEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSoO88yy; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a5e0a3ac48so10236165ab.1
        for <xdp-newbies@vger.kernel.org>; Fri, 08 Nov 2024 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731095756; x=1731700556; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NLvCTozLmGOqy51bIQqVx9AxrQmKQgYEONGQVH9rhT4=;
        b=OSoO88yydjmy6GxOpWZ7mcI4QdLhDWzMJUmWx+mmmf3yiE5vF2elG+TtYzOvWHTuxz
         H1QRaiUEpAxUQ0haiH2zid1eERKO4DGTrAEd1aWx2TV75pXL+P6nZxi9cPmcayar88P+
         QZ0kko59/nuUCqR9GJy77jx8MjIRBVhib08kvZFpgsLvYJvgHauyW7rFlQXb6DKGzQTM
         pfLPd7wSC3b4+blGLqZHrBe3ND3A7LrZR7CvEa/BShEc/sokTZaPyECiMnJHdh1/13Rb
         QlqUqYuGbH1JmtlU/aWRGnQ/gsR2ZrWFiOYMU1OeGDTO566VEJv635BNPdSAJlWqVNm2
         bdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095756; x=1731700556;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLvCTozLmGOqy51bIQqVx9AxrQmKQgYEONGQVH9rhT4=;
        b=qzFe+1OiU7XppPHal2In5EfzHVYRxPC4hkesClqWve/bcRNpjLDxJigVfAqnIfIZP/
         WLOCZSftafbff/q/pnJPjOdaqq1T+kaapiTCXdzY4OJdywcJIEKdbQmt43Ss+jqHIITL
         q+YFo32U+mWjlg0YVTPem/4I2YpoTanqzJRQ4MqNViZD8xY7nzh2QUG77wg7TMtPGBEo
         dvBlw5hI9WhNxs6oZp4QzWDq5fQw+6o3yErrd6m0+2N9Ls4txt7ZfeoWIahKCyhNzv/Z
         2Um/QuZ22SdesN3gAsJoJfsk0X11iAuZ7yElIsZ/6LCG5cHedZnO7F0fHMTGPnNiMIxx
         QrPw==
X-Gm-Message-State: AOJu0YxctHjEFTDZZJi8UyXrOe6XkoEOTKRQxym9eo2XXzj5krv6jHx5
	6AZDWVSjXoatjD0b/EiKIcS7LAmXtBROKuJuzuJSoHkKczZC1bvQ3wmR7uUYg2zrfIs3JUpoAqd
	HiFdjPHuQ17fKGlIo4Gjg91pyoL/yW/43
X-Google-Smtp-Source: AGHT+IHuyBDjs2aR8kwf9pvWDh/o/ATzFuPKc7ROgIVNGGkDDDfxsM9d4VEhQ2qWsbsEgo/V/zdZwePcHcnBkxt4tqI=
X-Received: by 2002:a05:6e02:1385:b0:3a3:e58d:cfe3 with SMTP id
 e9e14a558f8ab-3a6f19edd46mr48466235ab.8.1731095756530; Fri, 08 Nov 2024
 11:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vincent Li <mchun.li@gmail.com>
Date: Fri, 8 Nov 2024 11:55:45 -0800
Message-ID: <CAK86TEc1hc-KYcmFjyTfsmxDLH9QLL=+=wZSkvGTE-A0fFLiug@mail.gmail.com>
Subject: XDP synproxy cause packet delay?
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have ported kernel XDP synproxy selftest
https://elixir.bootlin.com/linux/v6.11.6/source/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
to https://github.com/vincentmli/xdp-tools/tree/master/xdp-synproxy,
barely make any changes functionally. one user reported to me after
attaching the XDP synproxy to their server hosting website, they
observed slow website page loading.

I somehow could reproduce the issue by testing a simple one page
website https://check-host.net/check-http?host=https://www.bpfire.net,
some random country locations would report 5 - 6 seconds delay. I have
capture screenshot  here
https://github.com/vincentmli/xdp-tools/issues/7#issuecomment-2465554843,
it looks to me for some reason server split the SSL server hello with
small packet size according to client's advertised receive window, tcp
window scaling is not in effect for some reason, I suspect the small
packet size sent from server caused the delay, the  strange part is
this does not alway happen since majority of other country locations
seems fine.

with XDP detached, no such problem.

Any clue to troubleshooting this issue?

Thanks

Vincent

