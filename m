Return-Path: <xdp-newbies+bounces-176-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A677DAADDC1
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 May 2025 13:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7064E56DF
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 May 2025 11:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1D7233145;
	Wed,  7 May 2025 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzCoFM24"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC80257421
	for <xdp-newbies@vger.kernel.org>; Wed,  7 May 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618744; cv=none; b=eWCBoA2aA8VwMAOca+pHyuOeK+KqAjQndGIbLcBeuaCkCSUemUUnmp53PAxftYS3WxXCxO4+5TOL9BL7pfOSiGldmvqMnUsxQTfJMQNyLJNCgp4vdjohXBN4DrljIc8LxMlVoRr+qO2k0IKkkx/y1T/Ho47HYe9p9fAIbJNkdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618744; c=relaxed/simple;
	bh=EhIr96WiezobWn5kYnownzh6VF8bVpCVy/BpQW+riKo=;
	h=MIME-Version:From:To:Subject:Message-ID:Date:Content-Type; b=ebeu29K9xvU1Ye3yifKxTJQQEaqjtWp0EAy14Gp0kWOlMGCOtpG6sty+uQ169xEDCcSphMBY37GBWRxpi5Tmtj42mYprDncDRutztPCc3FnvDX1iGUaCtlxLXvkHHmMGPhb4MzLYmujYOh5i0RR2DonhUog8KLClkY2gcrTtm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzCoFM24; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e4d235811so21537485ad.2
        for <xdp-newbies@vger.kernel.org>; Wed, 07 May 2025 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746618742; x=1747223542; darn=vger.kernel.org;
        h=content-transfer-encoding:date:message-id:subject:to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oSm3LBcjNoChS6G3tbC/vdmSi12kSJKgrGypCnFqb00=;
        b=ZzCoFM24k6uddxnzR4KWT7q2Vw4512J3eMh5NvheOBxVcczfud6rqIF7XKBOEM1Sld
         LiiPDNGDUaNKIySwWWEmOyot054g4RAYLQnSsv+MyhOKDQnwuVZj28c4KHdIVIVJ+XZB
         fVfyySRdH9OOrOlYg+KNNrxO/+6J2imoiBUbcxxSeB+qmMxu04Wkd9nkn53Hv0GxKnoi
         iWqoh2mj2vs30d1LR0m+KiUaTz86PZglFtcEY0Wo+xEQGUAdckqKhfQmPK8+U7/xkfHK
         p4PIbj9tCzoudrzGXVKRpKdYJT9/Yhul0gZLt4tZy7GCSO5p9j8pRnBccrhau7rhIY1Q
         Bp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618742; x=1747223542;
        h=content-transfer-encoding:date:message-id:subject:to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSm3LBcjNoChS6G3tbC/vdmSi12kSJKgrGypCnFqb00=;
        b=hfiRHfz4jjy5y8KRS1biM7wAoGA+fWw77yNwL2pQt0hTr3ifTpXnTRlgRPWi/giS7k
         hawyaeCYqUUsV5KcOp5A11ZY/jG8/bH2dJhFRVp65J6JUHMK1/4g3rDc5jCbCthcx4U4
         rvFH9S29kvkQa/gWRusaoxPjTk2JayUPdBswkvUmDKkPWxdvlP25SMkhdiO44o2MuVvN
         DmrhlfBSfO8hA2lCXgthQNCPHdbnTyODhYBYrVdt5O0koTtKKobJQl40X1srqVdMM1t3
         zAorlhzFcqt1nqKNWq8/aJyN0qjMd5kvra9aMN/guiupWx4tgnmaeTspq1EttBwAtdkJ
         b+Zw==
X-Gm-Message-State: AOJu0Yyom3o3CbufcvXCeDu3myLknjcGq4uSRvktdrl4hzJobVB/dl18
	EQPnRChcMX2fRJ+09V8pJbAGvi51sy2sfp/eNZjZvZDZGJdoZyedePoD1hZQ1ng=
X-Gm-Gg: ASbGncvDTBJJx1Vp/uHVuLWCszRn/wnQ+JryaRjyAgInrRxfGCqQChkyDqHqmcHSgSe
	K34tkFX/pdS5+Rrt+/IwjcdZ9reQKLjxEshxl71IZ+RnQprTQB+FoJx3V7LyadGxiR4AqPT0LcC
	Ay+Y4iX3u9GA7PjpMQkYF2/6M7Hp0v1/ReZ75ru+Wj+h3dY3W/9y89LoDl9yLCD1EQMfOXbZpnz
	U7S8Nox2TWW+l/uH/g79Fsg29RBmkdEbQxV9jlO5+byTdwpwCko5skTz/YZ6wismWam/5+yYa30
	HzIwo6CefGpiPHaPaJLaj974T+ukQnRRyjRqswee6SxInMvF1luVKjlpSwVjHPtFBlU=
X-Google-Smtp-Source: AGHT+IH3WAMCaFUn54Pju4S6zBXMI8am37DRVyf49F1vMdR9iNvT3HjsuLjrCu3ksgDb50VE8qXboQ==
X-Received: by 2002:a17:903:18b:b0:224:24d5:f20a with SMTP id d9443c01a7336-22e5edf9b8dmr43935705ad.48.1746618742555;
        Wed, 07 May 2025 04:52:22 -0700 (PDT)
Received: from mulp (140.140.5.103.wi-fi.wi2.ne.jp. [103.5.140.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aaead24c8sm1795538a91.34.2025.05.07.04.52.21
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Ye Zhengnan" <zhengnan.ye.11@gmail.com>
To: <xdp-newbies@vger.kernel.org>
Subject: [RFC] xdp: Multi-Return Value Support For XDP
Message-ID: <183d3c7dd7e5c1de.576ea80cc02721fa.fe043bcc144c6691@mulp>
Date: Wed, 7 May 2025 11:52:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm proposing support for multiple return values in XDP programs to
enable combined actions like XDP_TX/XDP_REDIRECT with XDP_PASS. Please
review this design proposal and share your feedback.

=3D=3D Motivation =3D=3D

Current mutually exclusive return values prevent scenarios like:
- Fast forwarding (XDP_TX/XDP_REDIRECT) and ack by kernel network=20
stack (XDP_PASS)
- Traffic balancing while maintaining normal processing

=3D=3D Design Proposal =3D=3D

Option 1: True Tail Call Implementation

For Generic XDP:
  1. Parent XDP program:
    - Specify child XDP program using new helper functions
    - Return combined flags such as XDP_CALL | XDP_TX
  2. In net/core/dev.c:
    - After XDP_TX or XDP_REDIRECT, check XDP_CALL flag
      * Get child XDP program via bpf_tail_call
      * Goto netif_receive_generic_xdp()
    - Before bpf_net_ctx_set(), two approaches:
      a. Synchronous: ensure skb not recycled, run child XDP program
      b. Cloning: copy skb before driver uses it

For Native XDP:
  - Synchronization cost of TX operation is unclear
  - Cloning skb may be necessary
  - Offload XDP support is not considered for now

Challenges:=20
  - Conflicting packet modifications between parent/child programs
  - Potential need for packet cloning (performance impact)
  - Safe skb management when combining actions

Option 2: bpf_clone_redirect() for XDP

- Clone skb before return via bpf_clone_redirect()
- Send cloned skb to ingress path via backlog
- Prepare child XDP on target networker

Current Limitations:=20
- Redirect to ingress path not fully supported
- Memory copy overhead in XDP fast path

I'm new to Linux kernel development and would greatly appreciate
any feedback, suggestions, or corrections regarding this proposal or
the process.

Thank you for your time and consideration.

Best regards


