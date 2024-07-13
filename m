Return-Path: <xdp-newbies+bounces-117-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3562930425
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 Jul 2024 08:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4631C20EF4
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 Jul 2024 06:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751CF1CA8D;
	Sat, 13 Jul 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/I9M+Fx"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295581AAD7
	for <xdp-newbies@vger.kernel.org>; Sat, 13 Jul 2024 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720853651; cv=none; b=oP8h9AFz5yn6WAfodTkMHEHToBOKXdvUS0C6jtfzHs/MNTHd3+jJPOz169dlbsdm9Xgiq7Y36xrFj7OeyMXFIORAH1iyCOShNkzkr35LDwny2PUphPXdOkuCmIhZeqenJyyzfq3w06s6P7pXGXeoI7oIpetzqebImfkXEDd52o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720853651; c=relaxed/simple;
	bh=T6CKv/dXkAdYp2h70LFBBXCTNnwLNVLhpxN+M0Glex8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WeXviLjDWQe2ZEj1E++vzgYlRDKzgn422+AvzwJiFwAgP+xxiQp0vnvhX4OjXHMySbkZrbyHF6Yk2ikDmO+SvEPVBH8ewqsGyWyE8jDgoEaRLTxvIz5MfbyS6k3eQ+EoFevZp0EBg7rcywFsY2lzNHeb8eXNQk3zSsioWZVsgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/I9M+Fx; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e03a8955ae3so2706490276.1
        for <xdp-newbies@vger.kernel.org>; Fri, 12 Jul 2024 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720853647; x=1721458447; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T6CKv/dXkAdYp2h70LFBBXCTNnwLNVLhpxN+M0Glex8=;
        b=h/I9M+FxcWuDki1sterFCA4awpZ5gkIloI7bJkLmtIhGIulOWkE5ZF0orashr3/PIP
         a+1dGb9EHhHExc7JWrthVvA41Jtqe9KAUzZLiIvn8JU568U+PJWkDZRRDkNJmhPUcYBb
         uSK9f04EsXAq0xIJGasa3epjkEaCeXjVY292LzdU3XBfVdqdie9Wz5tDsZ4zf2jSO289
         pJY14DrJ/rn27ZTS6oFkZEhwnUOGZe9t1avRBZJ7D3AdXXAxPD+4CuPW9acb9kmS7BMC
         lACfE6tbs2kjosfbzPKSJD+jsK+pcWAz0YVNFMptg+en2qLLLVWJC9yvpNVpJM+58SkP
         fmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720853647; x=1721458447;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6CKv/dXkAdYp2h70LFBBXCTNnwLNVLhpxN+M0Glex8=;
        b=UWRF8lRDPIV/kfUjstvE2Fk3aq9FbF/l4JuIj3yHlI7N1uNr1ba+9QoaYbIqEerFIs
         YZ7Uxd4xAhXlaWnIiDO8MJmkwSzynRSVNYp5lkTJEJQxhviU4QJORza8Fq+3BcGRgXUD
         4zuZHwiXmlJZvt7mcRO3OB76prOv2reiztDHaF9de9l4g3cSUScl+6dzDT2Arju0/9TZ
         +GanlKVdeCMoO4fvSdMiatJAtJb8TaPqIDpFTNkAy7Afv6k1EDQ01gtGF+dSIL00URS5
         ydKDm6SNRf/VftlqeplVo+vw0g8f5iP2jHYeOAWfJXQ5JRTqDUX0NUwyQ+c5i5XzaFth
         cvdA==
X-Gm-Message-State: AOJu0YxBrKOYJOeDDU4sifJ5+CTYvcWuTX8L4doH6gsNVmi6Z9UpBlvJ
	l+uZWaI2lucnbb4bspUESwpKUgRYIDCjbtlHr8ZYsrxcOYai/2qbRj/DJf+k+4mJSCxXbytAmN7
	IoIKsf+lT+7Bna43+4v/+kBx5CHUfxHOu
X-Google-Smtp-Source: AGHT+IEJ/zhVvngCCsMwKsMhoerMF+LNeVAjkNV/VONdMRm3JWXZJCbi0/fZ6YjqsyNIM/xOKyYXfafQAr6oPv6aN+o=
X-Received: by 2002:a81:ad1d:0:b0:65c:703:bd5f with SMTP id
 00721157ae682-65c0713048emr100839077b3.12.1720853646942; Fri, 12 Jul 2024
 23:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srivats P <pstavirs@gmail.com>
Date: Sat, 13 Jul 2024 12:23:31 +0530
Message-ID: <CANzUK58QbpEgQGY-O1ixwZp=6VM92_ZZZcr83o3nomi=S0VArw@mail.gmail.com>
Subject: mlx5 AF_XDP zero-copy queues
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm seeing a behaviour difference between kernel 5.4 and 5.15 wrt the
AF_XDP queues used for zero copy. This is specific to the mlx5.

Assume you have 'n' queues configured on the interface.

In 5.4, you had to use n to 2*n -1 queue numbers for AF_XDP zc. Using
0 to n-1 queues would use copy mode.

In 5.15, you have to use 0 to n-1 for zero copy also. Socket creation
fails if you use queue >=n.

Also, with 5.4 netdev stats would not be incremented for AF_XDP
packets whereas with 5.15 they do get incremented?

Can someone confirm this behaviour change or point me to relevant
mailing list discussions or some other information on the same? My
google-fu is failing me.

When did this change go into the kernel? I can't find anything in the
kernelnewbies.org changelog between 5.4 and 5.15.

Srivats

