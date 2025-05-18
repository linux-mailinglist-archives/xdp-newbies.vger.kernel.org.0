Return-Path: <xdp-newbies+bounces-177-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85CABB084
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 May 2025 16:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B687F3BBB98
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 May 2025 14:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2341B6CE4;
	Sun, 18 May 2025 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCiVvx0T"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AF1E4AB
	for <xdp-newbies@vger.kernel.org>; Sun, 18 May 2025 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747578510; cv=none; b=SxIQWMDp1KhAxedxT+pNDkc7/DRMnrt/uvTOdSNXM+R2QMwjPFuUbJ3ZhSN+XD3c1XUapljyCUiP8sl+YVGMP2hJtrTPPyMlpWYi8+lx5uccVZECl9CoS3qAUyCHP1uO/HvzVCjNasWu+LS1nA0YpiEza6cd6mR6aXkbQrms9js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747578510; c=relaxed/simple;
	bh=6YEJnx+GWaebBZhtXu7MWV4vViCJk0swpTazfpSmvXc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kzKkQP1fUiWURdwPAFFlvz9vo5Gne1XHAehjPJEWv8PfuPaJbM3m5B2nK7vyHmVszg9VdKC3VLAdyAbkq4ZgOcyKTpcvcrJb4rB7p/RPxn2IfIjEEHymhS+za3/6f8utlnnPJ/+bUm1ZUyfUi5a7IhisFEGgaHvNeKq1fehZj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCiVvx0T; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a365a6804eso689754f8f.3
        for <xdp-newbies@vger.kernel.org>; Sun, 18 May 2025 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747578506; x=1748183306; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vkCayGDt/Hztgm+woojGocsBhdQdxwIze+HOxeaM2YY=;
        b=FCiVvx0TZdl7pfparEk7H4Wk3mKHmuj8jcXpdAenXxKsmvvJW73DGtjfj/QKJoMKcl
         aszuMRH+RXDMA/sYSjVKT632aV+VwMFkMJcXYsO5P60UUUAUHF0r+KsiWZAX6zuuj3HG
         R5LbkuDv78UCPceQFcr21qeQEdcywrsjfJW1XPotlEwjk3bPb7TNa8+J7wY9lQKoB7cl
         66LA5yG/qzZEhq4eG/mryXs+bNtT4TTvd/4fLpPM+RaCuYR0Jsepi8COLGG58VC2aHTm
         0PijvAohzexhWMdboiNhbEGmh5/Kx+xSR2sy75uU+TjkcE3XVPmndFa0MuauPdTJZOS8
         ASiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747578506; x=1748183306;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkCayGDt/Hztgm+woojGocsBhdQdxwIze+HOxeaM2YY=;
        b=k3oKKhN8K2sGSvzy4Tqkcpx7iHEERDOg6HnNU3ft9EiBXQwiHHyapkEM3EHwO6FIS/
         VwmVk1ehgFzSRDVAklqtPJEwUopMRPnWwc+X5s9xnIZ/hFU/WxHgwGTB/SjQ0TRSBfSm
         DjRf9vXGZ5Xh/3YjWh4eLmyJnoVlALEL1rwJqZhn8zltfL1nH8jAStn3FKQpEaBlJjNB
         BjOA5BpUD/7mt2y0ttAJBsiOZGaIVYA953iXEUfCDsCmJfY6xOXlVINoO4UKLPQj7m9V
         4u5ISTozpdrUuGl43Gc6s+0tmeMZ4elGivRRSH14UtbF/r2Nh5zoaFGLhk2a5Xebu+GI
         RgEQ==
X-Gm-Message-State: AOJu0YytEh0oc6mOEt2RoEG7hikd4nrIGic1Bq7/c2RWjcda58NbfH/x
	XHtB+icMR6JrxiQA88iIWf5tFuOP7tREjKMwAJKHiVGEBocG1S6ocpvEMW5v4GzOBXkGJJMcYgI
	Gbo1oSZdMxNmfizkrIJNMjbaSKuTn5dJm4TFUMoo=
X-Gm-Gg: ASbGncsLyFrgny1RzC+GKEXFqLMTr/3ABKHifkqzVC2AdpPFeg1R93YTr97SNB5YMpo
	8rJoekhhs///DihKwNtMSjyWBHezJQnf2ohPlNg6IU9FuD9SM0mj8xc8aZRmUzXrphxG6nmCjFq
	xMd27ESsWZELU2T+kFwJ8NNu+wltuqFt3FFg==
X-Google-Smtp-Source: AGHT+IEuDNzCv0tXXY8rPwFmX4LWR+52PvLfwwwMp0rxdvIxbVSeZJp+Bp1V6QlKNnrro4t5YgAL+piNu1SbHxWIXK0=
X-Received: by 2002:a5d:5f46:0:b0:3a0:7017:61f6 with SMTP id
 ffacd0b85a97d-3a35c825eefmr9846383f8f.14.1747578506397; Sun, 18 May 2025
 07:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Edvard Fagerholm <edvard.fagerholm@gmail.com>
Date: Sun, 18 May 2025 17:28:15 +0300
X-Gm-Features: AX0GCFtgq4Wg6AtQL886QEfJHoa9QPho-c-OoXFIq7j0WbGfnrqUhe6stfsCTW0
Message-ID: <CAMF0iZ4tUEsoVj3ZTYwUxEONj-9n61qw4N-Owp_ZQC4Qp3dE1Q@mail.gmail.com>
Subject: Expiring flows in an XDP based router
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm working on an in-house router and I'm looking for some advice on
whether to try to implement some functionality directly in an XDP
program or instead use AF_XDP sockets with the additional flexibility
provided by userspace.

We basically have a flow table, which contains entries of the form:

  (source ip, source port) -> (action, timestamp)

Every time we see a packet belonging to a flow, the timestamp is
updated and if the flow has been inactive for e.g. 10 seconds, the
flow is considered inactive and should be deleted. Actions are of the
form:

  "forward packet to a.b.c.d port X using source port Y"

The challenge that I have is how to clean up expired flows. Built-in
options would be BPF_MAP_TYPE_LRU_PERCPU_HASH. However, dropping an
active flow would be unacceptable.

I'm looking at at most 10k new flow entries being added per second per
router with a maximum number of concurrent flows at around 256k. Each
flow sends a packet at least every 5 seconds, but most every 50ms.
Does this allow me to tune the table size in such a way that no active
flows can be evicted? If not, are there any other reasonable
approaches for cleaning up the flows?

Our current system uses packet headers and is fully stateless, but
adds 16 bytes to every packet.

Best,
Edvard

