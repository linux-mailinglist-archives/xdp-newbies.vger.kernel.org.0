Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A82E35FF27
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Apr 2021 03:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbhDOBPC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Apr 2021 21:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhDOBPB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Apr 2021 21:15:01 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EE1C061574
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Apr 2021 18:14:39 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id o10so24255810ybb.10
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Apr 2021 18:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0RS2kW/YwWXZOS/sGJFI5fsqFXM+VVArA7QsFE7KgQ=;
        b=JimgqlZ7wZ90rlRk0q7tHL7chMwoo+YKXmTAvTsgLymP/YeVn55euw+yjrB35ehXcc
         MQfhAgG630lNYl31AxukCJ78AWrWFlg7fqPgof7icMGZiLqz3KG4k0cCybZxuXiksA06
         5BrfD9EwT2HWN+0X4V9qyuUdP+nrvl/2oIIPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0RS2kW/YwWXZOS/sGJFI5fsqFXM+VVArA7QsFE7KgQ=;
        b=nqMFBpHeEpL25yHxdGDjr9LygeyrEIP7tuO+09z47u51d/MDDzEYjXewYTWjRbXPpT
         HosewDHJZZGmNt/8Hp/Wq5SzEK8aFZC+60aUG6U6W4kjr3l8ZeuWEUXap+WxU/+zhJg3
         eQbqkkQy5zgOQB1Rpvjt0VOMUTUOTLznBnaERXoySdqpfmMGMvE5QnazKvpVHCwj4Xn0
         HpDy9rTNXJCq6SvD6xrrBbeLEpxgtAVvEHFOZX5RGlLw4KLiBpN7QWZXq8xxfqQMjKoO
         ph4siZFn8HafUvCPE4l2cke9gWT5H1GMk1TRuoYRQoVkUUN/WckSsSuJnwYqsjaL4O2G
         Gmqg==
X-Gm-Message-State: AOAM531vzK2ndJqI4Z4L/FrUssbEVgElK629Lm5lBtNezHrq82fXm0Zv
        IbPwwKMdt8AfnfpkC0+uycPh3YQiWoZZOqorK3vLrCAzVqJS0R7N
X-Google-Smtp-Source: ABdhPJzUyY9Zw2OombDnzyVh3CPKEnd1wH1eHR7zLrRDqq6grm3X7enR8vRxDXvcHCsEddS1QXz82FjhhM7vUmC0teM=
X-Received: by 2002:a25:aa2d:: with SMTP id s42mr1109223ybi.265.1618449278918;
 Wed, 14 Apr 2021 18:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
 <8735w112yx.fsf@toke.dk> <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
 <CAC1LvL3g-VT+uwPjv3ArQiVnDAL8ydcrAnbWgrZT-_wk4DLLVA@mail.gmail.com>
 <CAJwr_MfPOzpdaM+MhkYVcLdQyc+XWvm=PChrRTrZXATL_X1pbw@mail.gmail.com>
 <CAJ8uoz2tsbpD1OvLLThC=a8O1KNMhHqwWGG9QOUJ0MMKHnzkSg@mail.gmail.com> <20210409121049.18c9ea47@carbon>
In-Reply-To: <20210409121049.18c9ea47@carbon>
From:   Neal Shukla <nshukla@riotgames.com>
Date:   Wed, 14 Apr 2021 18:14:27 -0700
Message-ID: <CAJwr_McGe=wHFvcNTV3A2jeKajjrhBfjEiqVPtgX1qpq7Z8VYQ@mail.gmail.com>
Subject: Re: Profiling XDP programs for performance issues
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Zvi Effron <zeffron@riotgames.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sorry for the late update.

We used the patch and unfortunately saw no improvement.
