Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780C964CD15
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 16:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237771AbiLNPbl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 10:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLNPbk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 10:31:40 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A2962E3
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 07:31:38 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id m19so23015306edj.8
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 07:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TzC9/ILiYzSbOMtA/PGaKZobiWyizSlF+LPxU3YEnZQ=;
        b=ANgr1kPXFox3/zIdC0tYY7HAenJnigko3hJSVmhUm6rX2b2p46/L8rUIdffzxa2N8a
         klv9q4mhdau/qY/2B7o4rIwTbRTkVetTTSAmAAPsmqtv6VlLVYgp/EmGIbYx4QKIYAmI
         PTBGps3y5Ur7d0xwsi5cBbc6SF7DIAxcbz/1g+SWMROCPqonmuSiX/36Va1mNCwqu8hN
         Dh6i36gKVjsX0pKlqkAJ0ZvmyH/0lxYYc6YaiRxGi+sgbcHMcCD73abVMgb4qvg6RIW6
         1K+WusaBQgLCZbr75RdkpuHSIvHklifC5WzuFhLifL2hZV9vJbTVPDvSQ68cvD0DDd0z
         T9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzC9/ILiYzSbOMtA/PGaKZobiWyizSlF+LPxU3YEnZQ=;
        b=Kkk5ydvap0lcvQzr3cNtNJeiMcrqIfZGp+c7H4T3XtklsCbN8vgIo5o8A4sGkr/uPp
         AaWQAWpG1WPPjYxMGDOtVU6NoYusAjVWzoGU/YqUCbyN7vLp9Q6va5cwyEFtF+/v4gKW
         xo3PcLH0W3u2Cbe242OI8nuf7AlTO+s4wojH0JJ3l7cTfXjX/EM+zRZspDKZBDEtYXIb
         Z+bZM0nEqhUGoKkIacLzojRIQ9ANH49njQzGXKYSiARpDMPdviCFeBGynJad2dtzn9Oc
         QvEJzcCnO9P0h8LzBwg0KCtx6W6OVe+I/v6vndhlMc34C8ke1rU+9znDR5k2Dd/cmYi6
         al+A==
X-Gm-Message-State: ANoB5pn5G5IXRrSY4cv1LqfLkOtve3rVXS3aljMHNs4qwG6Z9JNAPtJe
        iFMvnyNM+fIl3HJM0EkM+H7Bg3fK0VJus/UAxLo=
X-Google-Smtp-Source: AA0mqf6GbqbNqMXHndirJtPLZ0c+tpMT+j2Wb71FsCpPKACLOnhrEr+XD3d3HdYmIwHC2QFlIjrC/SKvOwAAn9G3eJw=
X-Received: by 2002:a05:6402:a52:b0:46b:d3b3:669f with SMTP id
 bt18-20020a0564020a5200b0046bd3b3669fmr31289230edb.414.1671031897394; Wed, 14
 Dec 2022 07:31:37 -0800 (PST)
MIME-Version: 1.0
References: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
 <CAJ8uoz3bgtUGBAW7f7vcA7=mvg8fAz8PXvjbmoEuMKaoURkw+w@mail.gmail.com> <62dd0cd8-e133-406e-7a2e-18435f92ffe3@polito.it>
In-Reply-To: <62dd0cd8-e133-406e-7a2e-18435f92ffe3@polito.it>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 14 Dec 2022 16:31:25 +0100
Message-ID: <CAJ8uoz0zo3zH8a_Zq+L5WzDYjgZh7-pU+ubo9MSbmk-NbxKoiw@mail.gmail.com>
Subject: Re: Why choosing AF_XDP (busy polling) over DPDK
To:     Federico Parola <federico.parola@polito.it>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Dec 14, 2022 at 4:16 PM Federico Parola
<federico.parola@polito.it> wrote:
>
> On 12/14/22 10:00, Magnus Karlsson wrote:
> > On Wed, Dec 14, 2022 at 9:16 AM Federico Parola
> > <federico.parola@polito.it> wrote:
> >>
> >> Hello everyone,
> >> in a context in which all traffic is sent to user space, and the main
> >> concern is performance (so AF_XDP busy polling is the best candidate),
> >> is there a reason to choose AF_XDP instead of DPDK for packet I/O, given
> >> that the latter is still much faster?
> >
> > The choice is not AF_XDP vs DPDK, since DPDK can run on top of AF_XDP.
> > The choice is do you want to use user-space drivers or kernel space
> > drivers. There are many pros and cons with both approaches. The two
> > main advantages of user-space drivers in DPDK are that they are faster
> > than their kernel counterparts and you get access to many NIC features
> > that are not available right now from user-space if you are using a
> > kernel driver. Kernel drivers, on the other hand, enables you to
> > deploy your application on any Linux system (from a certain version)
> > and does not force you into the strict execution model of DPDK (which
> > is what most people use with user-space drivers). Everything in Linux
> > is still usable and it is easy to have a system that mixes data-plane
> > processing with other types of workloads. If the only thing you care
> > about is max performance of a pure packet processing workload on a
> > system you have complete control over, the choice is easy: go with a
> > user-space driver and DPDK. If this is not your ultimate goal, then
> > XDP and AF_XDP might be something to consider.
> Thanks for your answer Magnus.
>
> - Concerning deploying an application on any Linux system, what could be
> the limitations of DPDK userspace drivers that AF_XDP doesn't have? The
> use of hugepages?

That would be one. The requirement of shared memory, forced unity
mmap() calls that might fail, lack of binary forward compatibility,
etc.

> - Concerning a system that mixes data-plane processing with other types
> of workloads, do you refer only to the capability of XDP to steer
> traffic either towards userspace with AF_XDP or let it proceed to the
> kernel? Or are there other features of DPDK userspace drivers that would
> impact this kind of system? Maybe the use of busy polling is too
> aggressive to share the CPU with other workloads?

Yes, busy-polling and sharing a core is not a good idea in any system.
But there is a good solution to this in DPDK that uses capabilities in
newer CPUs. Basically, if you use DPDK you should adhere to its strict
model of one process per core, otherwise you will likely get into
trouble. Either by performance dropping significantly because you
enable things like interrupts or 4K pages in DPDK, or because you do
things like trying to run to DPDK polling threads on the same core,
which might result in deadlock. If I am not mistaken, there is a
concept in DPDK called service cores in which you can share a core
between a normal process and a DPDK data plane thread. But it requires
you to program specifically for it.

If you want to steer part of the traffic to the kernel, you are better
off using XDP. Bouncing things through user-space is expensive, DPDK
or not.

> >
> > There are likely some good write-ups on the Internet about this.
> >
> > /Magnus
> >
> >> Best regards,
> >> Federico Parola
