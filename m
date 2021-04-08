Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE10358F4D
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Apr 2021 23:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbhDHViR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 8 Apr 2021 17:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbhDHViR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 8 Apr 2021 17:38:17 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC4EC061760
        for <xdp-newbies@vger.kernel.org>; Thu,  8 Apr 2021 14:38:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id r9so5439338ejj.3
        for <xdp-newbies@vger.kernel.org>; Thu, 08 Apr 2021 14:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7JEkm5FXiWU3pGHpZRvwPcJ0VeYAqF2mTbMtSYKWIg=;
        b=WLxRzLSWpQvHNO78Lr7mJ9i1m0QCx9hyOAxHPEVuiBGavPFuBXMQdqYsEula+io75b
         dz/C4RNLQ3irxcAX+4xzJBs0AvlkmJ0xleVD0UveVlrXR+qC4eVOQp+y2JCfIc2nlGxj
         d7ppp9+9nt7oHqRKvud93/wUJ8kaIs7+vLoYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7JEkm5FXiWU3pGHpZRvwPcJ0VeYAqF2mTbMtSYKWIg=;
        b=KzkAOUAPyZwoI8MR7+UbZ2tN5V2BmK6fypieReSSR/jF9T9K4RfOO0WCMMG3xc8Tow
         9iuJxrSh4kDgxYI/fQT6JcQfZxQ1qsMlyUg7wpD1wVTsJ7KskcRf4GMSDeKrJ9hN07qv
         VZ/bPr0vtx90FnvRI/ReiL8da7xu/c325rYLdLVBbgZnIy+e9BA8aPWQaEZt+tjOjmm4
         tFMoAlgRH1v875ekK/h8sbKxMgrzBGATWBVTCLMxET/uQCcrkzGcZXG2hVJq26giJ9IC
         BT++HOAZpUbG7GXax9F6JyrHMmZXlNHYrR109qXandGO2AlIK3uwhxGgEaKHMb6HzUYV
         8hiQ==
X-Gm-Message-State: AOAM531OH6GoZCawNAsvc4UMhSci78r1ELEa2CN8NokoD2/t0gXQ5qxQ
        2PyG+Ig4KCO+PMQFeZV9/XHWBvLxPwqdLtAmpRoXYF3ZDT2zuA==
X-Google-Smtp-Source: ABdhPJywliiMChWTvtryu7rb95xWs5BzD3LJYtduiVkjkc/xv+2XHWST5DKUD9LcJr7iAHMYozBhqXASjorTt/aKVtM=
X-Received: by 2002:a17:907:75d9:: with SMTP id jl25mr12918872ejc.452.1617917884004;
 Thu, 08 Apr 2021 14:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
 <8735w112yx.fsf@toke.dk> <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
In-Reply-To: <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Thu, 8 Apr 2021 14:37:52 -0700
Message-ID: <CAC1LvL3g-VT+uwPjv3ArQiVnDAL8ydcrAnbWgrZT-_wk4DLLVA@mail.gmail.com>
Subject: Re: Profiling XDP programs for performance issues
To:     Neal Shukla <nshukla@riotgames.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Apologies for the spam to anyone who received my first response, but
it was accidentally sent as HTML and rejected by the mailing list.

On Thu, Apr 8, 2021 at 11:20 AM Neal Shukla <nshukla@riotgames.com> wrote:
>
> System Info:
> CPU: Intel(R) Xeon(R) Gold 6150 CPU @ 2.70GHz
> Network Adapter/NIC: Intel X710
> Driver: i40e
> Kernel version: 5.8.15
> OS: Fedora 33
>

Slight correction, we're actually on the 5.10.10 kernel.

--Zvi
