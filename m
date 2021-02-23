Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37FD322746
	for <lists+xdp-newbies@lfdr.de>; Tue, 23 Feb 2021 09:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhBWIzO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 23 Feb 2021 03:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbhBWIzM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 23 Feb 2021 03:55:12 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D882C061574;
        Tue, 23 Feb 2021 00:54:32 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id d15so8074095ioe.4;
        Tue, 23 Feb 2021 00:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QqCNPkmhFsesMQX2Xxkd0l85Dom8huWMGQVphp6ulYE=;
        b=GNXgEftx+3Lb9f6RKdNqgOjSiHx/g4t5H2rYz59H3Tj7+GGEvI4tEhuGYNPU/c8s0x
         wyg5qUcBZ6LE7FD5sqpUpz5d9YxE6+VUyHqqI/gFdfLOaBKoMj6eYomLMsprs63tYgez
         OsISC5ak/CPWgAWpGxYOtKWgE1592anIrGztJaPSy5ROwkfnpOmWT/ATW5ZW3Fgh2o40
         tCcua65/9huOAYdZtax6nh9G67nKAblztqRtEaYC6t93Of92mns/48tV5mf21PxAqGi4
         Jjvafojuwt3JyzKv32k8sdq9UKJr1OKgr1qLnSIcUOfjGSWyiPCQFKLP+a98IMTe8ueZ
         7U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QqCNPkmhFsesMQX2Xxkd0l85Dom8huWMGQVphp6ulYE=;
        b=pnua7uB/6CcUwtMBjaCX1gYurTxo8RujTPWAIEEkJtbhi79LI8KrZzmeH0qSaeomjV
         tJqyKImwJtDiVVCmtViX08MvszPjUIVQu1DcFJ3Fcnk9X2Mdpl6/LmFKklN08iI05erd
         BBrLdiUunT/rxDrgBjCoT9TFIb55n3505sqfApkGy8mJztyAv+m+3NvMhSR3d7Hqr6K6
         NJcVtoZMMBY8DL8GImz19ojrUd4eIdnrdp7gigAU8wxEQ4wxZ0V78AURIX9KRI1VPPcd
         9Tw1c5HfwitRF5ph7ZwhnJftGi6ha0y2rtybiI9aZ8hkkA6mPLz5iwFUrKPqTDklO0Cv
         iLXg==
X-Gm-Message-State: AOAM533ybLCo8UK3a/mLRfzP6tsuK8tOQDCwOPbPO3b8c2chyJNHcdv+
        bgZQMPTwzDvAiMQh77yir2s=
X-Google-Smtp-Source: ABdhPJze0lFIJe/d+dMHL0G18v+BVWqArVfptmHfM7TSMd2CvJEiwZUgx8742nTVf9/hhgK+qb0EXA==
X-Received: by 2002:a5e:9612:: with SMTP id a18mr18813871ioq.13.1614070471485;
        Tue, 23 Feb 2021 00:54:31 -0800 (PST)
Received: from localhost (c-71-199-46-190.hsd1.ut.comcast.net. [71.199.46.190])
        by smtp.gmail.com with ESMTPSA id 15sm14656186ilt.47.2021.02.23.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:54:31 -0800 (PST)
Date:   Tue, 23 Feb 2021 01:54:22 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210223085422.tv2gk6olg66zcbwe@snout.localdomain>
References: <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
 <87ft1un121.fsf@toke.dk>
 <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
 <87pn0xl553.fsf@toke.dk>
 <20210222193459.hxvlcq65yyh3b6dr@snout.localdomain>
 <87v9ajg1yx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v9ajg1yx.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/02/22 11:41PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> > On 21/02/18 05:20PM, Toke Høiland-Jørgensen wrote:

> >> No, I think the main difference is that in the model you described,
> >> you're assuming that your orchestration system would install the XDP
> >> program on behalf of the application as well as launch the userspace
> >> bits.
> >
> > Yes, that's right. This is the model we are implementing.
> >
> >> Whereas I'm assuming that an application that uses XDP will start
> >> in userspace (launched by systemd, most likely), and will then load its
> >> own XDP program after possibly doing some initialisation first (e.g.,
> >> pre-populating maps, that sort of thing).
> >> 
> >> From what I've understood from what you explained about your setup, your
> >> model could work with both models as well; so why are you assuming that
> >> applications won't want to install their own XDP programs? :)
> >
> > I would just say that in our organizations network and administration
> > environment, we ideally want a centralized orchestration tooling and
> > control plane that is used for all XDP (and tc) programs running on our
> > machines with our model described above.
> 
> Right, sure, I'm not disputing this model is useful as well, I'm just
> wondering about how you envision the details working. Say your
> orchestration system installs an XDP program on behalf of an application
> and then launches the userspace component (assuming one exists). How is
> that userspace program supposed to obtain a file descriptor for the
> map(s) used by the XDP program in order to communicate with it?

OK, so this part is admittedly a little hand-wavy and a work in
progress. We're literally working on design and proof of concepts right
now, but this is basically what we're envisioning:

1. Orchestration tool gets all its JSON config data, which includes
   remote paths for BPF programs and any respective userspace
   programs.
2. Orchestration tool downloads BPF programs and loads them (using
   Go libxdp when it's available). Then (and this is where I'm going to
   start waving my hands) the orchestrator will need to gather any
   necessary map names/ids/fds information to be send to the userspace
   program. I'm just not exactly sure how easy/hard/possible this part
   is.
3. We start the userspace programs as separate processes and communicate
   with them via RPC (there's a nice Go plugin system for this[1]). Each
   userspace program implements an interface and we communicate the map
   info (among other things) over RPC to the userspace program when it
   starts.

I'm going to continue researching and fleshing out the details, but are
there any obvious problems with this approach? A backup plan is to have
the userspace programs do the loading of the BPF program, but it's not
obvious to me how that would be easier to obtain the file descriptor for
the map(s) vs. having the orchestrator figure it out and send it to the
userspace process.

If it works out that the orchestrator can load the BPF programs on
behalf of the userspace programs, then I think the primary benefit is
that the developer of the userspace program doesn't need to follow some
boilerplate to load the appropriate way--we've done all that for them.
It seems nice that the orchestrator could be the one interface with
libxdp (for the XDP case) without every userspace program needing to
doing it's own adding/removing (and thus dispatcher swapping), though I
would guess that's not really a problem at all.

I feel like I've gone out of the scope of libxdp in this e-mail, but you
did ask :) And I do appreciate any feedback or raising of red flags.

Thanks,
Brian

[1] https://github.com/hashicorp/go-plugin
