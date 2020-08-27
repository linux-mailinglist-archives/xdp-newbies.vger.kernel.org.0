Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9C7254C5F
	for <lists+xdp-newbies@lfdr.de>; Thu, 27 Aug 2020 19:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgH0Rpo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 27 Aug 2020 13:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgH0Rpo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 27 Aug 2020 13:45:44 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65889C061264
        for <xdp-newbies@vger.kernel.org>; Thu, 27 Aug 2020 10:45:44 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id h10so2227127ioq.6
        for <xdp-newbies@vger.kernel.org>; Thu, 27 Aug 2020 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ik4DJ0C0vGiW5f0afYnXuYn5R2HyvRYN+AIfC5e1lto=;
        b=Da5Vpdo9eFBoJSsCRunZ1DdgN1T4vNjcRs1QMLneW2HToI/LR1RiSgux0MnccWb6pj
         W44kAvCLhiJsBObu+NEk8Fp555b6nMRyxBn3f32dLqu1svEFxD8SArTinaefMDTBFuRk
         b/wU3xEkGBrndDZprFjEh77OE4tIGwEGNhGXSFFDy7dRQaky/4qJmqWamcs4QCKg5/Cz
         o2j+57c3FbqVCczVN07773K9HNG/TBjkjQx4a4U97mlTj0I5hu25JtxIJpmWfu6LTSgy
         8KMno0dInFjjBig7sFLmPOHHxk7TMaZOfoJCdJ/Bx+OppfpprNB0DwQmlZKgsRuBCM2Q
         ybcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ik4DJ0C0vGiW5f0afYnXuYn5R2HyvRYN+AIfC5e1lto=;
        b=j+3MjA/GLXvwmzm8intB24lllA3QaDnAh+LX+xzHNsBKdp5fjaMJjzyMjBw3ub7XAA
         1TAicDPV6De6nytiioLqT02lDkO9ViBpwPSFIdb5E0dY901yQArUpguQm0EyLOM1gyyq
         AiTQ/RAMvsi1LpmLr7Ut87e07mP5vdCFiI3Xii8DSIb6qcwsbB3xH6F694xgziOn/5Cn
         NDLUVE1F9kfl6xoUQvmT8WaP96sWFa1TnxgOG4naatM3Zxw9xetYuHeC+AjjL8usts8a
         ymS8EK7xF+rEaP1oWpagzZZpoHy8NeEPQKc8hLU5sffS8xr0YznJUDw7kZ4wT95j8swd
         Rgbg==
X-Gm-Message-State: AOAM532QtYkaV8phcxJ0LG7LVGDBwb4I4ovymgTIEYBOUW2FqY1LJM5g
        zID3fUQy4sBeUaDMFgly3DMOPsfBkTBgiit5PoNMYM6D128BXQ==
X-Google-Smtp-Source: ABdhPJwGY5w/oPVfKtv5cRXkXuhTDFZ4AO6kxYOTISO7YRDlb6ljg/q1oge6/LsJ7B9ywOPQ2gcVPurxzvds17QKvHY=
X-Received: by 2002:a05:6602:1589:: with SMTP id e9mr17732656iow.85.1598550342801;
 Thu, 27 Aug 2020 10:45:42 -0700 (PDT)
MIME-Version: 1.0
From:   Alexander Petrovsky <askjuise@gmail.com>
Date:   Thu, 27 Aug 2020 20:45:32 +0300
Message-ID: <CAH57y_TE5qa5iVnvYQ9GJ3NNYkkzUAt7fLUeZ=iucrwmOYgVmw@mail.gmail.com>
Subject: Another IP fragmentation question
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello!

As well known the XDP doesn't have any mechanism to handle IP
fragmented packets and do IP defrag. It's a big problem for L4 routers
implemented using XDP. There are some hacks and workarounds such a
using AF_XDP to handle such packets in userspace, or the hack like the
cilium did (https://github.com/cilium/cilium/commit/e65adc058d851c8aac864e7ac5c7e50f7f46104f)
which is absolutely bad, but we don't have anything better.

There is a first try to do about three years ago -
https://lists.linuxfoundation.org/pipermail/iovisor-dev/2017-September/001023.html
but without success.

Now, we have a hash of maps and ignore some specific we could store
the IP fragments there till the first IP fragment comes in... We still
need the way how to evict old accumulated fragments. We still need the
mechanism which lets us emit such fragments to the network interface
when we ready to do it.

So, my question is:
1. If we will have such hash of lru maps?
2. Is the way how to safely store IP fragments in the maps?
3. could we try to solve the next problem, emit the fragments/data
from the maps to the network interface on demand?

Is it could sound like a plan? Or there are some better ways to solve
this problem?

Thanks!

--
Alexander Petrovsky
