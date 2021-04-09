Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D109359951
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 11:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhDIJgk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 05:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhDIJgj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 05:36:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD38C061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 02:36:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id v140so8698407lfa.4
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 02:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=FKzeaG5Z2CTl9hfNnoQjaFKHx/op9GREXiIsSrxAo3k=;
        b=d9RAyx0NUGEaEABJNafgIIpA3kFHSGJfh9p1nFcQc4olVQWglD9DRM5/pz/GqMKLRX
         17Ra+axzMy6xgq8FS74ZKAnCJSno+ko24a37bbC569SNLzFgw3mM4HXBqnD6YvrNvfTL
         uChFWLBLIDSuti1msdm5HAjeKsvIrU9FDw1uNNLfSyRXwXEfxvnu/ZQpX1Ob1ginES2y
         KoNdbwhRjOTen52Wj5UpolV3rcd4RsKW0QPqX4mSlNw0apqzLb/K8zH34ydOuajR6UC4
         +XngvUs+9jWjqsmBW7JF+mDSU5cEoXn1obwGZcBxfcOqTwZmUQtQkz7yqmq09b14ynqo
         QFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=FKzeaG5Z2CTl9hfNnoQjaFKHx/op9GREXiIsSrxAo3k=;
        b=UksjhXstIgHYO2ZJkIhoHMbbXnISuOR+q0GSG7QoSp2dwU0rutNJR7sDRYZEr4CYUx
         5rjKVCYcHp2MxIaOcLeD7Q3AgauQxaN6W33Y0dMRyDghcG/U9n1qjtD914zqpHfZKQBD
         kaq3IQs4Kkb/jF76fGlrCdpigBqsR8nOLWLSrp7cFNjqikddxWNjgbbUH37gSt4C1CM9
         lBp76K1CmIeTEb6InAmQJDDgl+eWi0YyQiL127+qXGXXnSO/6AHSiupQbWAWKq+S+fOs
         oTv5y1DJcs7Co0HF0HEbXDYVXsCpYncZk8Hg3In6FlatEroMwdILDL7qJX22xZB8m8th
         pIzQ==
X-Gm-Message-State: AOAM533fOD7Krefa3G0FTbWoaMstvyTMR00/RYihNApmuIxOYPfS5E1+
        wB+yL99t85dU1By6vP1iW7xH+EonUkS9dP2+BAEVDZJ2Ox8=
X-Google-Smtp-Source: ABdhPJwGlrQviYT8/8jBWM7g6PlmvuBgcTIc0Zguqxzi06G6OwqqFnr11PcYz8SEkTuXPQwFQgmXH3C0mHBHYGvkgw0=
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr9641263lfu.465.1617960983572;
 Fri, 09 Apr 2021 02:36:23 -0700 (PDT)
MIME-Version: 1.0
From:   ratheesh kannoth <ratheesh.ksz@gmail.com>
Date:   Fri, 9 Apr 2021 15:06:11 +0530
Message-ID: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
Subject: AF_XDP and dma
To:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi List,

Could you help with the below query ?

if userspace allocates UMEM memory in non contiguous physical memory
 (contiguous in virual address space),  how can i configure DMA ?

https://github.com/xdp-project/xdp-tutorial  AF_XDP example uses
posix_memalign(). will it ensure each buffer chunk is in contiguous
physical address space ?

-Ratheesh
