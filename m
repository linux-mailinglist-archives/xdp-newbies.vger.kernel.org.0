Return-Path: <xdp-newbies+bounces-6-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E491D800971
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 12:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CC9FB20D52
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 11:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F45210FB;
	Fri,  1 Dec 2023 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCFZOTqM"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6D81A4
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Dec 2023 03:11:15 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-db537948ea0so371180276.2
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Dec 2023 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701429074; x=1702033874; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qps/O2z2PfaTCd8a7jJN7chJotGSpfxADDZdc9TGhkE=;
        b=mCFZOTqM8xAEJaGICSZaJJkLBy69+QvW+SOaVX/i0KUgVre5c2mXxxLNNQORjfNHy1
         lFtmutGVhrVr6PJJQLkgXXi4DjeX4AgerBrpMXMBD8ZTbyP9i/NNtD3TpXlEM18fNnE3
         0FGUlSKmOcS5LEhlzanVlKXZZZDj9HZ5de8YILvy95c70ZwaErrpfl5b8IwnP3XlrS9A
         +9Oe611Dzl8hW7jCHn8ceDuqRsoF6WB0Sp6JynKowO1wBNAP0aEz/y3FS1VU2QZnZb2R
         K4SPkbKEHTgU8bSMDO1I7ksQo0zEhxyU8dZDGmFg+F67c4Lrs3I8UwOe+15kwMIe60a3
         Llvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701429074; x=1702033874;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qps/O2z2PfaTCd8a7jJN7chJotGSpfxADDZdc9TGhkE=;
        b=XNl/kZLYt0Uc4nQJImh4CMgdoC8fZB5SmKKUcX2q5tT3BO24ZyM+RRmxO6dCD0cpe6
         jX2qSQyR0VUpnrKdcSz8O11gga8xueUoIgbQhYMJCp6oK50h6t66C0CCEgfpw0F4pyPD
         WDw32H6bJXVUw3E+t+8Il72narbiT/NJ3MgHyILuRPwtBmDSjLuIUNjmfXZMUajU9TBj
         7AH3vBRbmJmSJiTChVBrU7JMYq80HeSn0bbr/AqhPaf/8V1x1SEV/KyfhXLlp69bLrtI
         xlKHdD8PZGvHSDptil9GRZxmvuFCnHT9bECs3bMtc5vq7oG5hXEdhL7mQ+UhHuGbN+md
         efXg==
X-Gm-Message-State: AOJu0YyIBYmr0++bgNu3AIx4U9JLchryyz4OMPm7WLLUJCk6dlRtvnUz
	1RpQ7mVXpEdS+lugiQW05yVlBYvYoIRPCk1sR96GDtDbysJw0w==
X-Google-Smtp-Source: AGHT+IF/HI7fvs5bDT022j9Y192VMsr1FEeIdWoOV97xWKOH+tatU7M3zCdwUx7ZtiNdHa2+lmn7B4XZz3JcG/vF6h0=
X-Received: by 2002:a25:698b:0:b0:db5:4ef8:540 with SMTP id
 e133-20020a25698b000000b00db54ef80540mr1562894ybc.41.1701429074087; Fri, 01
 Dec 2023 03:11:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srivats P <pstavirs@gmail.com>
Date: Fri, 1 Dec 2023 16:40:38 +0530
Message-ID: <CANzUK587m66mmk+9ZeaWmzhEYS8o-H71QnPypr9Gv+xuXNfebw@mail.gmail.com>
Subject: AF_XDP
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

How can I get a list of NIC drivers that support AF_XDP?

The list at https://github.com/xdp-project/xdp-project/blob/master/areas/drivers/README.org
seems VERY outdated (last updated 4 years ago).

The list at https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md#xdp
seems more recent (updated last year).

But both lists are for XDP, not AF_XDP.

Is there a way I can grep the source to compile a list for AF_XDP?

It would be good to have a list similar to the DPDK supported NICs
list - https://core.dpdk.org/supported/nics/

Srivats

