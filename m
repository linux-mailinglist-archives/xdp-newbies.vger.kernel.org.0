Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4E5270720
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Sep 2020 22:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgIRUeS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Sep 2020 16:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgIRUeS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Sep 2020 16:34:18 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC27CC0613CE
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 13:34:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id a12so7239897eds.13
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=8bp4cLii3VM+WeyGqtrQMhYn7xGsuylBS58EDcy7I8M=;
        b=hw4uXuUfg34I7uPI+B3yo9g+aK1TQ1v1bgQtqenrQD9mJM9zgb2P61bcOGFB5ZXdGH
         i5DxHi/suk8aJqOhpyx1o/pVZYyA8HvPEQcPMLSaB0PiI7+zwBqmYiz/nXm15BItNdXb
         t2xzCd6X8M3tceWn2FBNWdM2w3ovnmXxxNLeZC2/4fPjuu0sE94U/ToVkNlA78MmqjjF
         rDL2W0a1inir1VQp8klQAEnqjhafiC7Io6O5tOd/brcLuE1g4xnHpwCwcQdmHaDPQ5XT
         zKpCy9ARRQU1t0eW0Xlifqx4hsl6ZN6kTND3e+JxNnZ+wJekwGPKvh3RDUXidNU+TqUB
         cDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=8bp4cLii3VM+WeyGqtrQMhYn7xGsuylBS58EDcy7I8M=;
        b=JJ3ZDdEmAnKX9EQO8AkGgCFuvYDgD3VIWbKqbFxmGBoRXnTvCgTR3F2GKUPp3Jr1+R
         Zei8249b6316fI4Iw1wTrtTncpnl1Z1Q0ApkjVmcO62RC2IwrlrI7E22lTjCkIfB66lO
         j24KdphfrPNdooGIJsJ2b16aTGfVFwqr9DRItG7/VcQUKwAgOp2PNR5mh1kkN2w258T1
         oJOd8So8qqLg1zuvNsIuOI3FnQFif17FDZP+qy2gRMTzcZDWO+XgUFWeyn7nwYFA2EXM
         U0Z8kaY3MwkI11ZF2WMvrAsCmvyHC1DSUR2/DI3U/SMvNgw2ZVeeluF8nFQuGn2BcW0l
         /H1g==
X-Gm-Message-State: AOAM532ggXILuM8Fkxgpil2cBSckR5HQYhiYUkca35pO9J6rdNAxaBJj
        sBVwp6RK07siocoLdQ0jFkpFV8EJxi7re7zxQ88=
X-Google-Smtp-Source: ABdhPJxeh1iY0RsQH4E6oiganwOHSR7ojfD9rR423jBjIwvL1e66qJupyHRMZ5Uaq2oGQZUC5sIU9dYhh2wxbjOBpfM=
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr42114834eds.366.1600461256316;
 Fri, 18 Sep 2020 13:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
 <87lfh7fkqs.fsf@toke.dk> <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
 <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
In-Reply-To: <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
Reply-To: ThomasPtacek@gmail.com
From:   Thomas Ptacek <thomasptacek@gmail.com>
Date:   Fri, 18 Sep 2020 15:34:04 -0500
Message-ID: <CANDGNvbYPCkV2RQ=D3gN+eFKUq-Pg6WOv682v3Bbfg7kmWmtxw@mail.gmail.com>
Subject: Re: bpf_redirect and xdpgeneric
To:     David Ahern <dsahern@gmail.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Perfect, thank you for the super-clear answer!

---
Thomas H. Ptacek

On Fri, Sep 18, 2020 at 3:27 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 9/18/20 12:42 PM, Thomas Ptacek wrote:
> > The setup is pretty simple. There's an eno1 (igb driver), to which our
> > default route points. On the same box are several VMs. There's a tap
> > interface (for each VM, call it tapX). Traffic for a VM flows in from
> > the Internet on eno1 and is directed to tapX; the response traffic
> > flows in the other direction.
> >
> > I'm deliberately simplifying here:
> >
> > eno1 runs an XDP program that does some lightweight IP rewriting from
> > anycast addresses to internal VM addresses on ingress. eno1's XDP
> > program currently XDP_PASS's rewritten packets to the IP stack, where
> > they're routed to the VM's tap. This works fine.
> >
> > tapX runs an XDP program that does the same rewriting in reverse.
> > Right now, it also XDP_PASS's packets to the stack, which also works
> > --- the stack routes response traffic out eno1.
> >
> > I'm playing with XDP_REDIRECT'ing instead of XDP_PASS'ing.
> >
> > I have the ifindexes and MAC addresses (and those of IP neighbors) in
> > a map --- a normal HASH map, not a DEVMAP. Using that map, I can
> > successfully redirect traffic from tapX to arbitrary other tap
> > interfaces. What I can't do is redirect packets from tapX to eno1,
> > which is what the system actually needs to do.
> >
>
> XDP_REDIRECT sends the packet to a devices ndo_xdp_xmit function. tap
> implements it hence eno1 -> tap works; igb does not meaning tap -> eno1
> fails.
>
> xdpgeneric does not work in the Tx path.



-- 
---
Thomas H. Ptacek
312-231-7805
