Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E906E3595AD
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 08:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhDIGlR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 02:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhDIGlQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 02:41:16 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281F8C061760
        for <xdp-newbies@vger.kernel.org>; Thu,  8 Apr 2021 23:41:03 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id m18so46303plc.13
        for <xdp-newbies@vger.kernel.org>; Thu, 08 Apr 2021 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJNup7Vxsz6+On4yIRXvh6HCKLeXykOWPkgZdQe58ec=;
        b=lLKv6MDQmKEnPiddMTRBM5jFK0u1cNAqeIn2ZDkrVtIvqoudgSw8OGuXxsWASnIbEe
         mBXBi3m5J/92t4N3/Y0OFkiIQTjVPDPAb57MugMpCy96M2udh46lEyjZzTDrwioX9uXx
         0Ej6SMokbM3tXgw0HPZsa1ZVmNNOgDNq0T4QjWvDRTaTG/hBctqprqi6galv6eb/2F8L
         6hKfy0LV95Gz6fIgxNUksKPfFAqlYepJbUEsBmB5hb21TTc/9m9QMi92xhreOPEMtb7G
         dRP847KEPv4V8gMYwjVcmNPYO5xELsT4ulQ/zGJ3FijnPGf/6Ye0RQKK80RzFGwvbxMk
         voGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJNup7Vxsz6+On4yIRXvh6HCKLeXykOWPkgZdQe58ec=;
        b=jetObIkeCBYae0S9Ex6IWC3SQGlHUVxd+s9sqzF8ypIqVWuhdqGhfh8SzVYA7iqV9V
         CWEowxDTG6UdPORsJ2oDm+TYXWNTiQocsvw15EQovfinS2rZN1+RxLYmZuLS51iQ5Q2t
         1IGYcrIB8OVGfUwEkmkhqr6wOiLDZlpyW0dJIOUwBaIvBNadIWUa0tH28MCCRXNLorXM
         OSXxQmvO0AGp2EAENzCx+ixL1Q5n1w9xAQJemNTM6mJ1FAHUNN4DloOpi/2MOqsPQnkQ
         94eFDVZJIawh2A1BtDkcXwREGlhnVNfavgX4yan6s9Q58KFF9XHrnDjnzzXf24A7rF24
         DWXg==
X-Gm-Message-State: AOAM532giIAwdjanNu9gwVMavucG5F4n+UbBxPpi4g3mxij1ircevgf1
        q0dkcEO4u6BS+kYOxzP5zHyhE5OEh4cdeBpZPrM=
X-Google-Smtp-Source: ABdhPJwQlziVFcVfpPfuYhbEdCr9jdR8xY8VkzpCUpNCl1v0vgSE/eu02k6Lht4Ml/D3COMfHI14ihSFitE7KZV70so=
X-Received: by 2002:a17:90a:6282:: with SMTP id d2mr11713687pjj.168.1617950462695;
 Thu, 08 Apr 2021 23:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
 <8735w112yx.fsf@toke.dk> <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
 <CAC1LvL3g-VT+uwPjv3ArQiVnDAL8ydcrAnbWgrZT-_wk4DLLVA@mail.gmail.com> <CAJwr_MfPOzpdaM+MhkYVcLdQyc+XWvm=PChrRTrZXATL_X1pbw@mail.gmail.com>
In-Reply-To: <CAJwr_MfPOzpdaM+MhkYVcLdQyc+XWvm=PChrRTrZXATL_X1pbw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 9 Apr 2021 08:40:51 +0200
Message-ID: <CAJ8uoz2tsbpD1OvLLThC=a8O1KNMhHqwWGG9QOUJ0MMKHnzkSg@mail.gmail.com>
Subject: Re: Profiling XDP programs for performance issues
To:     Neal Shukla <nshukla@riotgames.com>
Cc:     Zvi Effron <zeffron@riotgames.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 1:06 AM Neal Shukla <nshukla@riotgames.com> wrote:
>
> Using perf, we've confirmed that the line mentioned has a 25.58% cache miss
> rate.

Do these hit in the LLC or in DRAM? In any case, your best bet is
likely to prefetch this into your L1/L2. In my experience, the best
way to do this is not to use an explicit prefetch instruction but to
touch/fetch the cache lines you need in the beginning of your
computation and let the fetch latency and the usage of the first cache
line hide the latencies of fetching the others. In your case, touch
both metadata and packet at the same time. Work with the metadata and
other things then come back to the packet data and hopefully the
relevant part will reside in the cache or registers by now. If that
does not work, touch packet number N+1 just before starting with
packet N.

Very general recommendations but hope it helps anyway. How exactly to
do this efficiently is very application dependent.

/Magnus

> On Thu, Apr 8, 2021 at 2:38 PM Zvi Effron <zeffron@riotgames.com> wrote:
> >
> > Apologies for the spam to anyone who received my first response, but
> > it was accidentally sent as HTML and rejected by the mailing list.
> >
> > On Thu, Apr 8, 2021 at 11:20 AM Neal Shukla <nshukla@riotgames.com> wrote:
> > >
> > > System Info:
> > > CPU: Intel(R) Xeon(R) Gold 6150 CPU @ 2.70GHz
> > > Network Adapter/NIC: Intel X710
> > > Driver: i40e
> > > Kernel version: 5.8.15
> > > OS: Fedora 33
> > >
> >
> > Slight correction, we're actually on the 5.10.10 kernel.
> >
> > --Zvi
