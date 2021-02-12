Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB06319A09
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 Feb 2021 07:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBLGwb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 Feb 2021 01:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhBLGwb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 Feb 2021 01:52:31 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1849DC061574;
        Thu, 11 Feb 2021 22:51:51 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so4603094plg.13;
        Thu, 11 Feb 2021 22:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=evFCQaT/ghZ3Pvqdx1J68jSeh6NMcraTH0ARiyztbUc=;
        b=qblnLY+YnD/wItXeiwkEK8sBQ3dhiMZ4b+CMr1UslL2pHUMLts5Go9ghz89Jc2ndfe
         88IyAKm/okud088gc2FSl/xaH+V0ew9OW4cdc7gMhnTfDK7m6hYVwrob9fnDrp+HnFYQ
         fxH5y8tGHwlzCc70LBcPUCcss6brpXOq+aUWOXmfDyMxzNQVjD2D3RacLzB/9opwaFrh
         vExzpGSX6w85XGGL3u3VgDWfledr/sOVQRX3Er2VZ7bg7tyaYYQmrxdjWuEdXLtd+SYR
         jrQzv/lUrM37UU2wYfVyNpAKJYE+CCYtEl8hoAgzc2QXrIR2ItEGPjZpnGQP/LNHGa69
         5WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=evFCQaT/ghZ3Pvqdx1J68jSeh6NMcraTH0ARiyztbUc=;
        b=GChHkSYp+bzkyrJIitNqWBvbi/us696s4R8t/fFxocqkP3I34efMDv9ZYbClpwTC4v
         oIBtUcdtI3hVQHyW4BRRBKIu47ReRa5qyyzN7+yyRqlp2c1LXJ/hWhaedCG6FxjF7fS0
         n4NiGugo4LGCO/Dw6P2T6wRuhmbJ8f8CFNOHXJBX0P7fT2OrYr/VJxZdhei13zehTguA
         GrdXHXvgLvsvBLekOmo4uX3UR5xA9V88bbABdFYLSsEIDHtSL27+WdOe8cHoRCiGla6c
         2CZIWaXKXFkUxVsChxspygBVnztAqpGjnPs9eKQ8vWChfMWhHDI/fDSb9jp1rWxDitCL
         6TiQ==
X-Gm-Message-State: AOAM530E6IRYAz3Sys6zHvbiXZJ4eWpe7HyfpaUyTafnK4wjYdR3AwZC
        9AfxLm5xfLg9CuL5bdjn5Lc=
X-Google-Smtp-Source: ABdhPJzWMiPIjQmkccQH9nmBK9htkqxcEDcTr+BTBrdSBejmnDp1qWTsgxwyxAvoydrVjaAm6d3M8w==
X-Received: by 2002:a17:90b:358f:: with SMTP id mm15mr1523813pjb.13.1613112710475;
        Thu, 11 Feb 2021 22:51:50 -0800 (PST)
Received: from localhost ([216.207.42.140])
        by smtp.gmail.com with ESMTPSA id f3sm7057139pgj.6.2021.02.11.22.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 22:51:50 -0800 (PST)
Date:   Thu, 11 Feb 2021 23:51:48 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk>
 <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874kiirgx3.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/02/11 12:18PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> 
> > One thing I have been a little concerned about is the XDP_RUN_CONFIG in
> > the xdp program function. For our case--with multiple teams writing
> > independent, composable xdp programs--we don't want the XDP_RUN_CONFIG
> > policy to be in the xdp program. Instead, we want the Go orchestration
> > tool to have that policy as part of its configuration data (e.g., what
> > order to run the xdp program functions in). From what I can tell, it's
> > possible to omit the XDP_RUN_CONFIG from the xdp program function, and
> > instead set the values when loading the xdp dispatcher. That's great, and
> > thanks for the foresight there. I just want to confirm that I'm
> > understanding that correctly, because it's very important for us.
> 
> Yes. The values embedded into the program BTF are defaults, and can be
> overridden on load. The idea is that an application will set a default
> value (e.g., "I'm a firewall, so I want to run early" or "I want to
> monitor traffic to the stack so I'll run late"), but if the sysadmin
> wants to do things differently they can override the order. The
> important bit being that ultimate control of run order is up to the
> *user*, not the application developer.

Great. In our case, it would be ideal if the application developer
doesn't even need to be aware of the XDP_RUN_CONFIG and can just omit
it. I guess for our implementation that would mean that we don't error
out if the BTF section doesn't exist, and instead we look to our
configuration data (more on that below) for the relevant information.

> The policy override stuff is not implemented yet, but I am planning to
> implement it by having libxdp read a config file with priority overrides
> (similar to how libc will read /etc/nsswitch.conf or /etc/hosts which
> makes them work in all applications).
> 
> And of course, if you're writing an orchestration tool, then you *are*
> the user, so having the tool override priorities is definitely in scope
> (it'll just be an alternative way to set policy instead of a config
> file). How are you planning to specify the effective run order? I am
> also quite open to working on a compatible way that can work for both
> your tool and libxdp :)

As part of our control plane we have a whole process for a sysadmin to
get config data to to our BPF orchestration tool, which is running on
multiple nodes. It very abstractly looks like this:


                                     +---- Node 1
                                     |
UI -> API -> DATABASE -> CONFIG DATA +---- Node 2
                                     |
		                     +---- Node N

So, the sysadmin using the UI or API would dictate which xdp programs
run *and* what their priority is (plus anything else that would
otherwise go into XDP_RUN_CONFIG, plus a bunch of other config data for
various other needs). Then--and hopefully I'm getting this right--when
our (Go) orchestration tool uses (Go) libxdp, the tool needs a way to
set the run order for the XDP programs before the dispatcher loads. I
was planning to set the run order programatically on the XDP program
objects via libxdp calls. It looks like your libxdp implementation
already has ways to do this in the form of xdp_program__set_run_prio()
and xdp_program__chain_call_enabled().

Does that make sense? This is still all very theoretical for me at this
point!

> 
> > Also, I do hope that the existing Go BTF libraries are good enough to do
> > what's needed here, because if I'm understand correctly, that's how I'll
> > need to approach setting the XDP_RUN_CONFIG values for our use case.
> 
> You'll need to *parse* BTF to *read* the XDP_RUN_CONFIG. Which is pretty
> basic, really, you just need to walk the BTF reference tree. Feel free
> to reuse the parsing code in libxdp; that is, in turn, adapted from the
> .maps section parsing code in libbpf :)

OK, that makes sense. Since I want to keep our implementation purely in
Go (if possible), what I trying to say what that I hope there's an
existing Go library that can parse and read BTF (Cillium's Go eBPF
library looks promising). After thinking more about our orchestration
config data use case I was describing above, though, I don't think
reading XDP_RUN_CONFIG from BTF is strictly necessary for our use case.
That said, it obviously would be preferable to conform to the
specification, plus it does look necessary to read the program IDs from
BTF anyway :)

8< snip

> Please do keep me in the loop, and don't hesitate to ping me if there
> are things that are unclear or that you feel are less-than-ideal in the
> way things work. I'm also quite open to evolving the spec to meet
> everyone's needs!

Will do. Thanks for your help!

-Brian
