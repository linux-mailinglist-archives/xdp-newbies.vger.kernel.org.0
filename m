Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E18F409B26
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Sep 2021 19:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242962AbhIMRpK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Sep 2021 13:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243584AbhIMRpK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Sep 2021 13:45:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541B9C061574
        for <xdp-newbies@vger.kernel.org>; Mon, 13 Sep 2021 10:43:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c21so7727277edj.0
        for <xdp-newbies@vger.kernel.org>; Mon, 13 Sep 2021 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to;
        bh=xs1AR8qXJkXp/E9SxEXohj+zkgvV47Icuwmy75VCyTk=;
        b=a9MR/0Ov1rr+PQxstAgvkZpOqqUXYUD+9XsPXYFkCKKA8x/VhXaYMRArs1y7fzrrcn
         jtdVr0NhgUaagK7vASR944JyYGjDC18SqQlI/2oNhndyg5N9Xv5er6hSGhoH1sF9jFtB
         2/VohLvT1Zx+SusI9vrq6ue5CL2Ge59/ib0aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xs1AR8qXJkXp/E9SxEXohj+zkgvV47Icuwmy75VCyTk=;
        b=TEZBlFfFwXiXLpq+TYuT+NSS/yNO/AHKv+fWid8xR2uul2UCK3+zTlToQxQkEyQidU
         q8A5eVFZ3yjiPgj92pk3etgi0fMMt/T1LTkzZb3uHCB8S2KKyx+PpDfOge1+0efuD6O/
         BaKbxmELG4s2KWuIpUMf8l3Ydw40TNu6OqtcV8H6Qv0KnwVdF8lD8IiQy/MluYJBLXpr
         wv+haS7IX+X4cGgqMumjuG08EvhD5TR5uBYhmGqE+LRtvhcsh+F3wuGp+GnklIQxAvfq
         DT5tFQ8Vy1sZxRKnjop/7TdDkWMm8uMfnx/vKVgbygbM3FEQojon4JCI85yJYbgdbW26
         jmLg==
X-Gm-Message-State: AOAM531P4UproS6nveBfH3S8r85Ss5EhOabY+Edwhd3oYLc6Zme7Wg7k
        zB5j4YVduK3K/nL4cJ1YW5FFdh6Gcc3aRnNyZCmx/xM2MKsOUQ==
X-Google-Smtp-Source: ABdhPJzc4IyMuXRDgLIoEc2pI4d/JBEAHapBg8DLhALqh7bt6TTitI5EdivEu7p9XZlXQrwHqznZAqRyUbweuMa5B0M=
X-Received: by 2002:aa7:c3cb:: with SMTP id l11mr14450174edr.310.1631555032727;
 Mon, 13 Sep 2021 10:43:52 -0700 (PDT)
MIME-Version: 1.0
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Mon, 13 Sep 2021 10:43:41 -0700
Message-ID: <CAC1LvL0670CWq183g54w3HGsByjcBaBL2rrTP1PyTbbYfm76iw@mail.gmail.com>
Subject: Pass a map to a global BPF function
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all,

We have some map-of-arrays that we use for tracking labeled metrics in
our XDP code. The inner map tracks the metrics for a given label,
which is the key in the outer map.

Our XDP code calls several global BPF functions (freplaced, so can't
be inlined). Currently, each global function has to make a lookup to
get the inner map to record its metrics. Now that non-context pointers
can be passed to global BPF functions, is it possible to pass maps to
these global functions?

That would allow the primary function to do the lookup once, and the
helpers would be able to skip their lookup saving considerable time.
Using this map-of-maps approach for labeled metrics has produced a
noticeable performance degradation that profiling indicates is because
of the extra lookups, which is why we're interested in reducing the
number of lookups.

Thanks!
--Zvi
