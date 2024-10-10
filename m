Return-Path: <xdp-newbies+bounces-149-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FB998DF0
	for <lists+xdp-newbies@lfdr.de>; Thu, 10 Oct 2024 19:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20070B24275
	for <lists+xdp-newbies@lfdr.de>; Thu, 10 Oct 2024 16:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F4C198A24;
	Thu, 10 Oct 2024 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTaR5ohA"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB761957E4
	for <xdp-newbies@vger.kernel.org>; Thu, 10 Oct 2024 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578750; cv=none; b=BvXuD6y01vIIyT4UCxy767vH/U57XJP2Uqg0uiYEhUksVhP4uG7NTBZTIcdDo6afLaXkv+gL5bHlOIdZuUM6plDGZjrxg4pgAvg1BFqJ8va7f+ZOdbc9qzmUjleYYA/1H2GACL7+AWUjduJcMq2iPZzRx95EkR8x5Y8/ChHChqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578750; c=relaxed/simple;
	bh=Ad2gWHqcU6SoASPNqqdUbr1GqjxY2e2f6FY0xerOblM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=XPurDM6Tw88q3S8bGQyO/ocK4H7PyRCzTvtoA9x1IMXqClojtvpcPTZFGNM0aRQm2d5dufkrXh/byWhODq6kUVfsqR95l158OAG6b0YaSSGMtz/BTw5LnD+srwamByhjTu6U0oH8JT6uhn7QHzVkwa8KQz5EXhszLmr382eZKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTaR5ohA; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539908f238fso1435509e87.2
        for <xdp-newbies@vger.kernel.org>; Thu, 10 Oct 2024 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728578746; x=1729183546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc+Ec5BWD0Lmm6JZu7KaiPIjr6AnsGMR83RPBOUTmr8=;
        b=QTaR5ohAhj3vEAxCcFb9sTyRI53KWltN81rHyb8wzFO2RDf+zss0FXItWFJvpUGS2u
         B9dBO/tIzwWIgDqP6BSp/GFr3xLN4zMr9UD2D9gP3ZkSWsXMC/EOl5tbXpLkHQWIDXn2
         IYji7jFMBd2vj0AGXBKIcB6te2Wnm9lHKlnkexT1TE4Amm9BkzjXQQg7/m8nO/bDdUm6
         bxPCExk1nX6r+fW2BXcdNw2zxQvGHOj6/4+XhQw2gPKnaSU7LwfRkHxVDAlub3N29tX3
         7oHkOiP3TyAlvszRG5ww2rYPSgSmYNpb2uJQqO7TBI3OYF1Pv4AHU1e1qfUKyuov7UW2
         gnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728578746; x=1729183546;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc+Ec5BWD0Lmm6JZu7KaiPIjr6AnsGMR83RPBOUTmr8=;
        b=lAUcVsGH8H5se5j3kq+JpO36LnJ95q0JdAjhlvRPSaVBQAF26IS6wZh11CGwkg3S5P
         cDJefmpneabqhM1xEOn5YwFEVxiRV9NR8GnvcgUH6/S+TLvUvMUb4y10/9n89Gr5S2g1
         D7mUXTZvpusEjuglsfH5o4NNnSUN31e2soEGh5vVvujt1y2VbrOnQ7lVbclMbaOYCOn/
         sjSK8gBSN6ZjdWVSun5MTc7N8yAhI1S2z4o8r7Gldqd4kjON9Y8OcRfVdq0OMijKhwlk
         jTADyzuIFkCbg9iYQCX4Q4VwESxXDp4oaR5+ARZiZaZAfoG44kL1UP1j5bDzMy7fHCjO
         Iuuw==
X-Gm-Message-State: AOJu0Yx8+88UmYoPdc7NnDBH2wMMsb0mv3sKP3rDhu+TMvzMcCg6BRWz
	0uDFiRUVxFTiGqJ+9Xdxb1Gc9lpfH6cv4v6dJWONqXscBCxQox6UUf7znQ==
X-Google-Smtp-Source: AGHT+IEGtHD2lRGTe4lA1wR67sbnayXqTGb6kFk7sdUoBy0XW7JhsEesxlzHaCNopsQ2AbkiX7dOkg==
X-Received: by 2002:a05:6512:3f15:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-539c4967ee9mr4958372e87.58.1728578745798;
        Thu, 10 Oct 2024 09:45:45 -0700 (PDT)
Received: from nuclight.lan ([37.204.254.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb9053cdsm313787e87.280.2024.10.10.09.45.44
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 09:45:45 -0700 (PDT)
Date: Thu, 10 Oct 2024 19:45:42 +0300
From: Vadim Goncharov <vadimnuclight@gmail.com>
To: xdp-newbies@vger.kernel.org
Subject: map records expiration problem / multi-references (conntrack)
Message-ID: <20241010194542.03ae9f34@nuclight.lan>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; amd64-portbld-freebsd12.4)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I am trying to implement in XDP/eBPF a somewhat relaxed version of TCP
connection tracking (defend against DDos attacks). To do it correctly,
an expiration by different timeout values is needed - e.g. 20 seconds
for SYN state, 1 minute for established state, 10 seconds for FIN/RST.

Using *_LRU map variants is NOT an option - as it is anti-DDoS, an
attacker may evict legitimate connections by fresh ones, because those
maps do not offer explicit control on expiration policy.

In a classic programming environment, it's simple: a conntrack record,
in addition to `when_expire_unixtime` field, would have a LIST_ENTRY
and whenever time changes, be relinked from a previous time's list to
new list, under locks held on record and both list's heads. Then a
per-second timer will cleanup entire lists whose time is in past.

But not in XDP/eBPF. I've encountered multiple problems in tries of
different ideas.

First, let's assume 100 million conntrack records. We can't have
a `bpf_timer` instance in every record - it would not scale to 100M.
So still need one timer as in classic variant.

And there are no linked lists in eBPF, and no pointers from
multiplemaps to same object, so I came to idea to (ab)use LPM_TRIE as an
"index" by time and 4-tuple with value be bitset of in which main maps
to expire records (TCP, UDP, ...). Then I found that:

* can't `bpf_spin_lock` for several maps, and values could be modified
  by several threads in parallel (modify old and new LPM values)
* `bpf_map_get_next_key()` is unavailable to kernel! So single BPF timer
  callback can't get just needed records in a loop.
* kernel helper `bpf_for_each_map_elem` is unavailable for LPM_TRIE,
  only for array/hash - very strange, as availability of get_next_key
  implementation makes it trivial to implement for_each for *any* map
  type.

So this leads to *userland* must clean up those records, but for
syscall this will lead to much worse performance; and
`BPF_MAP_TYPE_RINGBUF` is also of no help here...

The question is, how do I implement expiration properly in eBPF/XDP?
Anything I missed?..

-- 
WBR, @nuclight

