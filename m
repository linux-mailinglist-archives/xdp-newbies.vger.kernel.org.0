Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1319244383E
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 23:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhKBWLT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 18:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhKBWLS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Nov 2021 18:11:18 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344CAC061714
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Nov 2021 15:08:43 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r4so2440604edi.5
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Nov 2021 15:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=nDA6/g8cBs+OPQqrRNm9eegWDZaKV9TYO3nV+5FLc3w=;
        b=emrrbxeodY51ypq7tgnuymxXU8IX6WnmdOHCcoKDcEvEEmEOYezNfa2zK4G1AYOl2G
         t/YE4tL4Nub/SJsgG7QR2GnkmbAVK0OU0GhC1wEb6HQyX4jeRpSsqgJ46FvobgM93qq1
         f8V0TpohzjwiovRRf03b9MRPdZQ7f/RcXSOYUVdOro260L5ncpYFI/RaC/bdcv/vixkR
         C7DmdwIOR4uxvEbT9c01As3jVIAy0vdBQDeL0R7I1ina1Tiq12TnQWqFgrMZ3od3auOk
         UnocC69PcLOTPs9ewU3DCi5+DTY+u4S9ZcAq/IUTz/4J7zu1uZlxSDvC8l+ZTaT/8ygp
         q2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=nDA6/g8cBs+OPQqrRNm9eegWDZaKV9TYO3nV+5FLc3w=;
        b=xLqLlxJ2az5Mb3XwCngPpO+PIKKs/tA3TXxBhBX2qOQByL5vsxFokV0lHiTFt6/Z46
         kQSQTWU36Qjt+GfVV4Wq3Zs2+a1D/e70OL/JwcdUe3UwSOS+zxj8kyEurluLNbzQ27Wy
         Pc2M/2nKHfzkOAniQNyBLVoks3MLhQtYyLBMIzNEa0bHEs1p1DXjZbxN2LwPsq3skUYS
         L5/eWiXlGkGCNwB+JEUyn95r6RYZ+IAh2OXYpdT9Mxp5C81xeV+6kZ562gl3cDhMrZuZ
         SCGtwpY+q7wstSXxiDr2Tq0iPRuX9WQjtuF7wwcSoDDHM310GxIluE57H3MKflsTUqXF
         SDnA==
X-Gm-Message-State: AOAM533yVzCrP/lz40z0db+3syMC/3Y/W9xCfW1dwpaHM4SxdBKU5mTh
        63LXiiBLN92pQvKIePtJpm8pej+Mz24k6iVTI7tVWxkgEDE=
X-Google-Smtp-Source: ABdhPJzl0hUvizTlfnPvY9PZPI+W9NyT9v+iJdyyr0t62wrBaSX5IZ01L13NoSjr00MOldYVzS/5lk+ZOriglUQb61E=
X-Received: by 2002:a17:906:3946:: with SMTP id g6mr13850799eje.87.1635890921840;
 Tue, 02 Nov 2021 15:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANDGNvaJZxXJaDYQKOF0pRZD5GWQYYZytnPyOUcZtejYE39jLg@mail.gmail.com>
 <c238d2db-c962-6e6b-cf2e-2eefb8d27c66@iogearbox.net>
In-Reply-To: <c238d2db-c962-6e6b-cf2e-2eefb8d27c66@iogearbox.net>
Reply-To: ThomasPtacek@gmail.com
From:   Thomas Ptacek <thomasptacek@gmail.com>
Date:   Tue, 2 Nov 2021 17:08:30 -0500
Message-ID: <CANDGNva6f6vU05yu2ZDha2Y43X556ckV2R13e17k-w0Qe2btOQ@mail.gmail.com>
Subject: Re: TC bpf_csum_diff problems post-5.6 kernel
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

!!!

That DID fix it! (I thought I tried it before, this time I just used
(1ULL<<5) as the flag).

Why did that fix it? Is that flag new? :)

Thank you so much!

On Tue, Nov 2, 2021 at 5:00 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 11/2/21 10:46 PM, Thomas Ptacek wrote:
> > The problem I'm dealing with is XDP-adjacent, but not itself an XDP issue, so
> > disregard if I'm too far outside the charter of the list. :)
> >
> > We run an XDP/TC-based UDP CDN.
> >
> > "Edge" machine XDP takes UDP packets off eno1, slaps a proxy header on
> > them and bounces them to a wg0 (WireGuard)  interface, which shuttles them
> > to "Worker" machines.
> >
> > "Worker" TC BPF on wg0 intercepts those UDP packets, strips off the
> > proxy header, reflects values from that header back into the UDP and IP
> > headers of the skb, and fixes up the checksums.
> >
> > All this works fine up through kernel 5.6. But we're working on a fleet update,
> > and something >= 5.8 is breaking my code (or my code was always broken
> > and relying on some pre-5.8 bug to function).
> >
> > With a bunch of perf debugging I've narrowed the problem down: it's the
> > checksum diff that accounts for the stripped header. I do (roughly):
> >
> >      /* not shown: parse, copy proxy header to stack */
> >
> >      bpf_skb_adjust_room(ctx, -12, BPF_ADJ_ROOM_NET, 0)
>
> Hmm, if you add BPF_F_ADJ_ROOM_NO_CSUM_RESET instead of 0 as flag above, would
> that work?
>
> >      skb_pull_data(ctx, sizeof(struct iphdr) + sizeof(struct udphdr))
> >
> >      /* not shown: re-check packet pointers, set up pointers to headers ... */
> >      sum = ~((uint32_t)(udphdr->udp_sum))
> >      sum = bpf_csum_diff(&proxyHeader, 12, NULL, 0, sum);
> >
> >      /* not shown: make other checksum fixups, write sum back to packet */
> >
> > Using some perf-based printf debugging, I can see that the checksum
> > I'm getting from that bpf_csum_diff is wacky. Further: if I just leave the
> > proxy header in the UDP packet, but still change the UDP ports and
> > IP addresses, I get valid UDP checksums (albeit with a useless packet
> > that has a proxy header still in it).
> >
> > I'm wondering if anyone can think of something that would have happened
> > post-5.6 that would have broken this (or if there's something obviously
> > abusive I'm doing with my "working" code, such that this never should have
> > worked to begin with).
> >
> > ---
> > Thomas H. Ptacek
> >
>


-- 
---
Thomas H. Ptacek
312-231-7805
