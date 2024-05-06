Return-Path: <xdp-newbies+bounces-65-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B68BD175
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 May 2024 17:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 463DF1C219C6
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 May 2024 15:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B1D1552FE;
	Mon,  6 May 2024 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=path.net header.i=@path.net header.b="QlC7ywtR"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574F13DDC1
	for <xdp-newbies@vger.kernel.org>; Mon,  6 May 2024 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008786; cv=none; b=oWD+VJQWaPhHRWwG/lu2g2iAB0FL7SysSgkiOk8PcFIjdOt5g1ylNoNnTYAAcxRhtg/LjcIgzRTCw8jSVbmXKOi//9Hh4Vkdi2IY/6nDNq1bIc+5AGuDVwZz0C4DYlidBY78klhqIqHC4jq+baVP8mJTlPYZvrY+Jp9Put13dI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008786; c=relaxed/simple;
	bh=hbyr6oGVTXr09QlKUHvuj1iVVzi5m2Bi/lGjAGlrOWs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bfZZRvwXvfZdwFJnj10skNUXwKNx9fGkpXJJX3EuGm3QcFE1dN6bzNx7HD2Q2vrl2jPs03gZJ82AdKH6Vzj3InNYaEtVE49Z2jWslSw3mPIApcSRCyv6tN8xg+aLuror2M9NP1/EhUI9fC1VDza21QA/FBKNibdUDV9XZxJk62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=path.net; spf=pass smtp.mailfrom=path.net; dkim=pass (2048-bit key) header.d=path.net header.i=@path.net header.b=QlC7ywtR; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=path.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=path.net
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a0e69caf90so3271896d6.2
        for <xdp-newbies@vger.kernel.org>; Mon, 06 May 2024 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=path.net; s=google; t=1715008783; x=1715613583; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KNB8umskk/yJowobT9Ka61I0DSf6r6rHjIrYfckFc0k=;
        b=QlC7ywtRKSxbHm06aCH3uHdZm6jOykQNzz8vkiN6AWzBdaeFmT5xUBGIUe/zUfzNhC
         V0A0rUtRYAURJN6Ix62l83KH7UlvouLCSX4wJ1B+ouq1FXv4KNqKyombJdgRJn/VOtU9
         WkGx/5WhMJI4zjLnoaZaK862UvSlRXxe0fX/ah7Mmlyo3gLoNOTCyIEmHNHrTML3D3J/
         ts6Ts3Sm52SzDG8bmpHUrxa+63OULPi7BFIYGJjT+nxWiiHg8RsbrtQyga733G/SzeDX
         ztTnUz6KELeyuFY0jJvPabgJN/8BCp0QsuhpZ43it/3yocYvloXj9Az0S8JzGvYEmqG0
         fI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715008783; x=1715613583;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNB8umskk/yJowobT9Ka61I0DSf6r6rHjIrYfckFc0k=;
        b=LXUkJafa6co1+SVl4NhH1/F2+mjFaab7ixMwCm0GkSxpMMfcMObI6+FJm0BhCpkw10
         mywzrA7d+4zhlS9f/atFx/+xId4f0r0xTyXlzEl4bYhiV7Svnw76Xq2uIEEZ9zVnKspP
         CPZ4wfYeatGRMH5Gf0JQKXqYH+JUZcc6Fbuwcug5ZzCgrsKDgBlbtXItpm3JOxeNjbNH
         HXpMBDZNYY0xVcLoY03BVRtBEkRE7JESzSmds5ngpihUBr9QdGVlFptumx0GAaMEo+fI
         5d9v9kaWITAov0s4mvmXvPyFplSVMDgjkudwhqon/R4bek74Po42Dni1scV7SzN0+uwW
         DECg==
X-Gm-Message-State: AOJu0YxFmK1xGa1OB3EKOgO0qDgGUtsnOHPoH3IrOYJjO6NzLNSGYrEY
	PXGHbuvKb2NhPMOX2m5lvk1sbP5GX6FFiBHDigcYEYOwO9pQQVCsfh8BAK3SsP848H7UjjDgEsC
	UJLSqyHJbTGjXKsVRMpGCqp7RqMkfoskHl81I5CV5TuxUxe7B3QGNbA==
X-Google-Smtp-Source: AGHT+IED77OPKmLJIXD83SSSDIZzjj7sGgSkKk9H2n2mnvcgbsg4Va3QdL7d4AhR479W5f+kUuf/xDI1HHTwfJ4T0fk=
X-Received: by 2002:a05:6214:e8b:b0:6a0:a44e:c59c with SMTP id
 hf11-20020a0562140e8b00b006a0a44ec59cmr12951800qvb.1.1715008783089; Mon, 06
 May 2024 08:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chase Hiltz <chase@path.net>
Date: Mon, 6 May 2024 11:19:29 -0400
Message-ID: <CAOAiysedBwajcFQwuPrtn5bbdk_5zrNq=oY91j5mWyKdc+06uw@mail.gmail.com>
Subject: bpf_map_update_elem returns -ENOMEM
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm writing regarding a rather bizarre scenario that I'm hoping
someone could provide insight on. I have a map defined as follows:
```
struct {
    __uint(type, BPF_MAP_TYPE_LRU_HASH);
    __uint(max_entries, 1000000);
    __type(key, struct my_map_key);
    __type(value, struct my_map_val);
    __uint(map_flags, BPF_F_NO_COMMON_LRU);
    __uint(pinning, LIBBPF_PIN_BY_NAME);
} my_map SEC(".maps");
```
I have several fentry/fexit programs that need to perform updates in
this map. After a certain number of map entries has been reached,
calls to bpf_map_update_elem start returning `-ENOMEM`. As one
example, I'm observing a program deployment where we have 816032
entries on a 64 CPU machine, and a certain portion of updates are
failing. I'm puzzled as to why this is occurring given that:
- The 1M entries should be preallocated upon map creation (since I'm
not using `BPF_F_NO_PREALLOC`)
- The host machine has over 120G of unused memory available at any given time

I've previously reduced max_entries by 25% under the assumption that
this would prevent the problem from occurring, but this only caused
map updates to start failing at a lower threshold. I believe that this
is a problem with maps using the `BPF_F_NO_COMMON_LRU` flag, my
reasoning being that when map updates fail, it occurs consistently for
specific CPUs.
At this time, all machines experiencing the problem are running kernel
version 5.15, however I'm not currently able to try out any newer
kernels to confirm whether or not the same problem occurs there. Any
ideas on what could be responsible for this would be greatly
appreciated!

Thanks,
Chase Hiltz

