Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7B941B8E4
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Sep 2021 23:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbhI1VEt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Sep 2021 17:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242839AbhI1VEr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Sep 2021 17:04:47 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0029C06161C
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Sep 2021 14:03:07 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h12so11246pjj.1
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Sep 2021 14:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxhpCQ+uUlCDOUQXiRQOvKP9dFVkv9GYubxJTskvPXw=;
        b=I4UF7i1cPA8UTRSjTyuHI9bmtvysItCMrolcc+iuhctU0O0ji6BKA9tGrzdDhpInMP
         83J9qjK4naqExRYdcR6+4PZjYvspLVnJt51A8L75ojqZgWhWSOenarB+pFSLTM2zEWJv
         cBusQ43BlO5vBea7Np7MPrBclSAtqWlmx0lrFUx6CCf1J98FHbXk5TTh8K5AAYXaSJ+u
         nHt8EdA58cdKCN+g282m5VviDVggBn/1VWzfX/X4qqJIfB9QVgZXxg/sDV8oAFS9k5Jc
         J2KH2rJmBsEcxa1r2qA/ue8Y3hBrlXYNi+jy/EYVFu2ZYlvgHdE4nrosyBbSpz/Yxvtq
         6gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxhpCQ+uUlCDOUQXiRQOvKP9dFVkv9GYubxJTskvPXw=;
        b=uLFYBgkDebnc8TZikORua6a/j92QIgMtVyO9bHf+bW11aAZtS67Z0wFCMuUJ9fmDNh
         lkbMlhyDtghJnSX/iEolpmvqJ7Wb3/e4bBqUrhyZTpE4PsF0wX87zB4/TgtnrPXKXfl+
         xSE39Al+Xx4YGAQD8gxqczR2Fqr+PzkDFQy9nSC97XZ0zHcKwDB8kH+LMT7Cd3VQo7Rg
         shVAmhgMAIrscGGqmu+kRL7gyUmyQg5XKsz2R5TMmrvkdF6t3iD4EunOrOYUq+8o9YrV
         8imqzDAWBHLaHEwOBHLPhaOAGwPYRYBra6h4rCbh7+6UU6Od3jmhp8u7hlKimmjGTsQU
         zxiA==
X-Gm-Message-State: AOAM532s4xxDcNpFj9U+zz4E09N/gEzI2E31RYFgjsqQ+O9a3LK1/7c+
        5XW+l5nbhgzUBXOsHW60HDv5YKq+jry2joyURenmEfY6
X-Google-Smtp-Source: ABdhPJztujFb1/0NJE8khtA8DGrzt8CoVhFv02SFbfhLMFTv3DaOmBl/QLADjWaeAn0bJZflGr1CMm/HGYz3XWV8ptI=
X-Received: by 2002:a17:903:32c6:b0:13b:9cd4:908d with SMTP id
 i6-20020a17090332c600b0013b9cd4908dmr7007113plr.20.1632862987084; Tue, 28 Sep
 2021 14:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwr_MfAwrWu1XiSQoEVR-vRs0jbLXi9G4HBsxeRFQDJi0V6Eg@mail.gmail.com>
In-Reply-To: <CAJwr_MfAwrWu1XiSQoEVR-vRs0jbLXi9G4HBsxeRFQDJi0V6Eg@mail.gmail.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Tue, 28 Sep 2021 14:02:56 -0700
Message-ID: <CAADnVQJrwCVZP65HiyCJu9t7mToMOOP5undP7EqUpONF2GwMoA@mail.gmail.com>
Subject: Re: Issue with verifier error
To:     Neal Shukla <nshukla@riotgames.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Lisa Watanabe <lwatanabe@riotgames.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Sep 17, 2021 at 12:18 AM Neal Shukla <nshukla@riotgames.com> wrote:
>
> Hi all,
>
> We've encountered a compiler issue which leads to issues with the
> verifier. We compile with clang using the O2 optimization level. When we
> have a call to bpf_ntohs(udp_header->dest) and attempt to load the debug version
> we get a verifier error. Removing the bpf_ntohs(udp_header->dest) call and
> loading the debug version results in no errors, as does loading the
> non-debug version of our code.
...
> Any insight into the issue would be much appreciated. Thank you!

It could be related to optimizations that llvm was doing.
Could you please try the latest llvm trunk and the latest bpf-next?
Do you still see this issue?
If so, we will investigate. Pls provide full .c reproducer.

Thanks!
