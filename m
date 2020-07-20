Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85342259C9
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Jul 2020 10:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgGTIPM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Jul 2020 04:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgGTIPL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Jul 2020 04:15:11 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA903C061794
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Jul 2020 01:15:11 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id v8so16668083iox.2
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Jul 2020 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+W3dcM+CZMU1pwQF1+vDMHSxPIXAvhdCNgxrkS4GOOQ=;
        b=mKlf9YRuNxTSQP7xV01FC9M0BR8mu42XLikU+zuy18opSSPER93Lz/6iCh4ZYu2mvY
         2jcEMtJVeebO5Ig5AQAahBuOwmxFjAXKhAyXsbwzuyvIbUSSzEhrcr4Qfik86SjCgdYP
         KL3WYlEV31i3l4r6AQFm0VahxU9VMBbyYgJZsP4YzR4/VSFFDCK8s7+38sFQnYWrt/cq
         gx9ND3G8FulCh3MCjmtLJbTjV9Qd/PFvKECBYzuH86R5ZX0aHg3R8AVlBQesWaUtvSaR
         D5UhcCG7Y8x1ugGV3hO7LJMIcSHxdawWS1+LAXyDAyTyJMlx0tWK6z0bbCEd172VVFZr
         /nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+W3dcM+CZMU1pwQF1+vDMHSxPIXAvhdCNgxrkS4GOOQ=;
        b=SPh1KMsJ0+L8hBaUiqnsJ0/RQsTtSjck65ynvRyg28grZGW8WacAGxsqoHz30GGLzJ
         lDy4zxAemTEJKNCq1usUEhoj9Kcm3vzdLdzUXXwD54mnxT63GCHhwX7Xre1ZZAMlV+NS
         8ouVhxFHGsRTqMxm01tAGsqEHT5xThUYRqQbJkJJNz0XH3LLkM7ugx2muUgwwa7w3+jr
         Ow4lk+Vwuq4EaEPeLtUt89LHDaGUo84/cwiv+ZKg4VdM9v5dkPf/ORIRgERlF6dQxoP/
         N2Kou9c/Mg7LNIfhpxxz717G29sE+h/A8gFZXf+8BiQUQ6QUy26ZVJOZsKnOCn2g+zmc
         G9Xw==
X-Gm-Message-State: AOAM531jzxLJiZp58tKA2GxUvCibtCVZVnr297ZW6kTIPDk055T1QZCs
        WUbLDwmsADN5CdMusdTaIPeLJid4EFfYkQuqQPMgmqRhcMs=
X-Google-Smtp-Source: ABdhPJxBR4Tt5m2KAt8ChTTsLruEtw1oBsEbY6DuorRQLEAnc5jchpDvlne1pbnkjVleC3kpKFBkmC+YvhGGovS3Msw=
X-Received: by 2002:a05:6602:58a:: with SMTP id v10mr21636569iox.203.1595232910824;
 Mon, 20 Jul 2020 01:15:10 -0700 (PDT)
MIME-Version: 1.0
From:   Alexander Petrovsky <askjuise@gmail.com>
Date:   Mon, 20 Jul 2020 11:15:52 +0300
Message-ID: <CAH57y_Rxm9_eB5jyjJ2OryLd6HB6mXSG8s-MR3BWs-99PVNG0g@mail.gmail.com>
Subject: IP fragmentation
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello!

I have the eBPF/XDP based balancing router, it looks like facebook
katran, but a little bit smarter, we use random based balancing
algorithm, so also we have to learn how to sync connections between
nodes.

But, the main problem for us it's fragmented IP packets. Some times
ago I tried to use for such packets AF_XDP, fast pass them into the
user space, accumulate and after that pass back to the network, it was
a PoC. So, I wonder, is some chance that IP de-fragmentation functions
will be added into XDP?

Also, I have a strange idea, I could store such fragmented packets in
the LRU map, the original fragmented IP packet I could drop. When all
the fragments stored, I could make the decision about the destination
for balancing/routing. But now, here come problems, seems I could
construct a big packet / jumbo frame, but it seems a little bit ugly.
How could I emit all fragments from the map to the network after I've
got the last fragment?

-- 
Alexander Petrovsky
