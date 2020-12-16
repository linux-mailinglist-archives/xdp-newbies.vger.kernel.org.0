Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256362DC8F8
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Dec 2020 23:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730213AbgLPW35 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Dec 2020 17:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbgLPW35 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Dec 2020 17:29:57 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DC6C061794
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Dec 2020 14:29:17 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id p126so29665533oif.7
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Dec 2020 14:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=qG3/5CVhxoJU91VBPn8I+ZJH689JgpVUq9PglysW37Y=;
        b=idqGlZUvREiEi+sDd81kq+5HyuqXV+s59GG0ihI18+CfRVyrDFWekSR1hHZPWf+9Uz
         nGbVNjoOFWWuZDj2I7ypUUMrskf2QUHb35FxIEO2jtYPv/LU1ankwTgJA7rByM+IY5gR
         MhsQy/Gx2YPfbqdueKUbSgmI1rPMs6RP0Ek5CD+5eWAsXF3JSKro1i7uB0XPMH6QrEL8
         WI2Mu/2gNrmKd6WMMMc5MUHghptJ/zTa6kHkHdl4keUladSXpuq5UlzkTI1eTfpxUB99
         ErZAZW+SM+X2dR7XgSA5WYR8yurpTnoCVxfgWP3F4zdiNg38grZIAywjybqOtRtI+UvT
         l3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=qG3/5CVhxoJU91VBPn8I+ZJH689JgpVUq9PglysW37Y=;
        b=HUj9MDn36gGYT6BWsdIVuyVpXHVgIhT9v6XTB1T46s7r1e4NWPAauBboA4eVpTiYCL
         hrIikxpXE8CEt88xAM8ZobrlJQ8ea/eW4YfA+FiI0u0pLpqo4E514TdWw85IGr/OuwI4
         qFJgz/hFHaGsXDCocxef6GEBPtGUK/B/0SSKhqm0ObVqjmZt+o7cxDgM4Bi3yeVrYLYw
         jDOoi9mgY8LSRPtQIX1sXL0amP50we6zD5llIQ1PAcbK71ECrbIeACCkwTTGIN64IUyz
         /un0uj+Fi7JR8fviNA9sy68+8sbJlfBkQF149EyYkzc+QGxqhiAZHO6Uul08qQD2g+Kb
         vxwQ==
X-Gm-Message-State: AOAM5334imZVu28Y2WeZet1dW114I3pkMQ4U2YjBUVpwBsOaKnZoP4C1
        +NJ5pdWBNzt/sTNkULQNVVIGzxf3N8k=
X-Google-Smtp-Source: ABdhPJx88DJkWUaE6ESjfmgUk7fI4JcTmELhoCQrC83cAAPCoFM0RD4OOE4hieuC87SEmsyqk2tzAg==
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr3088121oib.107.1608157756589;
        Wed, 16 Dec 2020 14:29:16 -0800 (PST)
Received: from localhost ([216.207.42.140])
        by smtp.gmail.com with ESMTPSA id 11sm763318oty.65.2020.12.16.14.29.15
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:29:16 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:29:14 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     xdp-newbies@vger.kernel.org
Subject: libxdp with bpf_stats_enabled question
Message-ID: <20201216222914.ugxw3kuajficsebc@snout.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I've been playing around with the new xdp-loader to chain xdp programs
with kernel.bpf_stats_enabled set. This is what I see (from bpftool
prog):

22: xdp  name xdp_dispatcher  tag d51e469e988d81da  gpl run_time_ns 105086 run_cnt 24
        loaded_at 2020-12-15T07:52:27+0000  uid 0
        xlated 720B  jited 535B  memlock 4096B  map_ids 5
        btf_id 8
24: ext  name xdp_pass  tag 3b185187f1855c4c  gpl
        loaded_at 2020-12-15T07:52:27+0000  uid 0
        xlated 16B  jited 18B  memlock 4096B
        btf_id 9
26: ext  name xdp_drop  tag 57cd311f2e27366b  gpl
        loaded_at 2020-12-15T07:52:27+0000  uid 0
        xlated 16B  jited 18B  memlock 4096B
        btf_id 10

You'll notice that the run_time_ns and run_cnt stats are only populated
for the xdp_dispatcher. This is basically the same behavior we see today
with bpf_tail_call chaining, so it's not a regression or anything. It
would be really nice, though, if we could see those stats for each
individual xdp program in the chain. Does anyone know what it would take
for that to happen? Would it be more feasible for xdplib to optionally
report separate runtime stats itself for chained programs?

Thanks,
Brian
