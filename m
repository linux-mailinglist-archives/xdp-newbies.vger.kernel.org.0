Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB46132203C
	for <lists+xdp-newbies@lfdr.de>; Mon, 22 Feb 2021 20:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhBVTfr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 22 Feb 2021 14:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbhBVTfn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 22 Feb 2021 14:35:43 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D8FC061786;
        Mon, 22 Feb 2021 11:35:03 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id gi9so6615334qvb.10;
        Mon, 22 Feb 2021 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i0npRPFT7npCmOqDBNbIB4dxyCx/lPT/+Nse/ehcJqQ=;
        b=A8bedpmm3ljLxg68poK3u1RcG1bxMhXxjiibJZfLovecc25WcmnRk4VznW975lcjU9
         k9cyHP/eP9VChcfsgE/Mf9DNsg8F9nSkNUpvSYd/V1+BYxjyfLiPrQ2XjsmoXjjWgQBv
         De0PSHySqcOlFW5oc6NH+U83DN7gAsv+z4eHq/0ue2IZiJSEyyFUdyaw/t/z4ClNiirB
         4d1AZGJwSCYpohNh/E/j+jzohkPd9aFYvSPBcPc9lPPYLLUNrUwtJXK8T1aJTNHHZeoQ
         8wFZWeysCQkRPyEKo2FuT0sCk35vJQG16Vz8qlph2wfRpxEVvAStHRndANqfsNuWThvD
         wKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i0npRPFT7npCmOqDBNbIB4dxyCx/lPT/+Nse/ehcJqQ=;
        b=F9d0ld9g9aCF+o9l3qmDtKmBW7dgnSiNeizmaMkvOzWFU8b2yjy/g/KItFP2mp/KA+
         Uo/nBdxb3n2prBhc0M8cJB7RiqoQ6i3qaCoaLyXmw0LwU2aERKDizvoQRRf9GlKQwENf
         J/Z8NzXV8Gb6MuBFITybMtJmOVlRjjIJU1VmwgV4xGaYh7Q/wdx8a4KaJVsUsDLX8dwk
         Pkycn0uSjfcfaTuLoOqT4IPfNWrnCgedkq/O1wZGmibDBxDSfgxGbR1h1KWKSJ7ekEtP
         8jExaKTbV8DWrGNvmeecoPww+ekZ9EbAajR95aVvR05KuNFLNzMqsd2JWaFk16vZ43P5
         Fsyw==
X-Gm-Message-State: AOAM533dKD7Witlewm0GSdJcAfH4wP+TyjsHptVBTNyvBpu6hsavfP1j
        3EIyYIOszT26AJRStP8nry66xbFKkH0=
X-Google-Smtp-Source: ABdhPJx1K0m0ZOkr3c7obyw/tDOE0gDg61K/9LNjFLw/RnbELLFFPruiHwSJR5izTxQjHDVyGvt6EQ==
X-Received: by 2002:ad4:482d:: with SMTP id h13mr22953508qvy.8.1614022502423;
        Mon, 22 Feb 2021 11:35:02 -0800 (PST)
Received: from localhost ([216.207.42.169])
        by smtp.gmail.com with ESMTPSA id l137sm13308646qke.6.2021.02.22.11.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 11:35:01 -0800 (PST)
Date:   Mon, 22 Feb 2021 12:34:59 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210222193459.hxvlcq65yyh3b6dr@snout.localdomain>
References: <873605din6.fsf@toke.dk>
 <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
 <87ft1un121.fsf@toke.dk>
 <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
 <87pn0xl553.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pn0xl553.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/02/18 05:20PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> >> > We explicitly do not want defaults set by program authors. We want that
> >> > policy to be completely in the hands of the orchestration environment.
> >> 
> >> Right, OK. How does the admin configuring the orchestration system
> >> figure out which order to run programs in, BTW? Is this obvious from the
> >> nature of the programs, or do you document it out of band somewhere, or
> >> something like that?
> >
> > We're a pretty huge organization... lots of DCs, public cloud, private
> > cloud, different kernel versions, sister companies, hundreds of
> > applications, etc. We want anyone to be able to write cool BPF
> > programs and userspace applications without needing awareness of
> > what's running before or after or if that order might change in the
> > future. I'm sure the desired order will be more obvious for some
> > programs than others, but we have administrators that can analyze the
> > BPF programs, compose multiple BPF programs together, and order and
> > reorder them. We have a team of people that can work with teams to
> > resolve any interdependencies if necessary.
> >
> > As an example, we've done something similar for HTTP ingress and
> > egress Lua plugins in the past. We have dozens of teams that write Lua
> > code to do custom L7 things with HTTP requests and responses, and then
> > we have a UI where admins/ops folks can literally drag and drog the
> > plugins into the desired order. We wouldn't want teams making
> > assumptions about what order plugins should run in, either.
> 
> 
> See, so this is the part that's actually analogous to what we want to do
> as a distro. Except the people writing the cool BPF programs are
> different software vendors and open source projects, not different
> divisions within the same sprawling org. But in a sense the situation is
> quite similar.
> 
> So thinking a bit more about the difference between your orchestration
> system and the model I've been working from, I think the biggest
> difference is not that you are assuming control of a system with an
> orchestration system. In a sense a distro is also an orchestration
> system bringing together different software from different sources.
> 
> No, I think the main difference is that in the model you described,
> you're assuming that your orchestration system would install the XDP
> program on behalf of the application as well as launch the userspace
> bits.

Yes, that's right. This is the model we are implementing.

> Whereas I'm assuming that an application that uses XDP will start
> in userspace (launched by systemd, most likely), and will then load its
> own XDP program after possibly doing some initialisation first (e.g.,
> pre-populating maps, that sort of thing).
> 
> From what I've understood from what you explained about your setup, your
> model could work with both models as well; so why are you assuming that
> applications won't want to install their own XDP programs? :)

I would just say that in our organizations network and administration
environment, we ideally want a centralized orchestration tooling and
control plane that is used for all XDP (and tc) programs running on our
machines with our model described above.

That said, I do see your point about the possibility of using some other
application that runs its own XDP programs, and then, yes, we would
definitely want some way to control the priority. Ideally, the
application would have its own configuration to set priorities, but I do
think the system configuration file is a good way to ensure that the
sysadmin does have the power to override if necessary.

I think you're right that both models should be able to be used. Thanks
for the good discussion.

Thanks,
Brian
