Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A157F645053
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 Dec 2022 01:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiLGA1O (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 19:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLGA1N (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 19:27:13 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE93A119
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 16:27:12 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qk9so10339106ejc.3
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Dec 2022 16:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cX+LykldszRvzg2efIY/XJV6LzC4AHfGIx80MJ8aYIQ=;
        b=l6UN8+f3mo1Ic0r6aLwXIC/pzkDoySkZ+DscHHD2hkLQB7fFYxM+3QMxOhJRrEz3yN
         bzFwIKd3jfUXBysaoYh6enaEKzlFL284l6DhFIDsbeAET2MdstOhm+3srq0F8AWiTo8N
         p6Cxcdk74Ggr7yGmrt8sMLdqTx5WWM7qflg2WFmv7wxZ6q9RXEZiCub4PRNDdleIFnPo
         QsZdw5l73vynS81lBrJsHdFO47vx44sD7628dQ8pCuSE8x1yKhlYTeuOKXRPECEQ8bjE
         o39SoWL1ddC4c+vQT9jQ47ayX6U63hd+mhBuIu2lTSQBfTA/2475AOZatNWo90jj6PtV
         AQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX+LykldszRvzg2efIY/XJV6LzC4AHfGIx80MJ8aYIQ=;
        b=duIcyicQmyI/Mfb3ubTalNr1TDM4He0+5lhKmAgs6uVHGFvXJdL5BHNVEs6kxcBTi3
         MF+9Q/kDgZdb8fkVMdUtX3ihrC8wv1JmwwRYtBqBzYr/X77sY0C9b3geU0V+qFjHLGoM
         abTKDrj+dViLQTS8SHFTEHNlgmF1o6BZwtafFIyeNLDh+oMdMBBzHOLRCNsfvfZkkyW8
         ae9U9PR7Gyqfm9v9erfrPhEhZW+Npn1D+sLqJe4jRD58c9MVGri8CkJxCEm/gNFeI1U6
         4T0+7QxuxXZNfK/fQqjLFPhcc4spuTDFh3C/jhQ1PYtNMg2MrYtF7jV/+ebLmP9UfoD2
         NSxw==
X-Gm-Message-State: ANoB5pn0YjQf9mWC4d1RIQ2viLcQFta/V+l6AJj6HGv9AXRB48+Hhx40
        E31sY2zHMl3HM4ghXp58fG4m/AWSlZqRZFHR19gD0RNJnVoQroHf
X-Google-Smtp-Source: AA0mqf7p5BwBLGN8BPuQff5R4vC0zpjWFEmTnDsweAstTORkv+o2d7H/wWLRoD4Im1FFbd0y8ecpUFz1ou9Rf9Ktbnw=
X-Received: by 2002:a17:906:30c1:b0:7b7:eaa9:c1cb with SMTP id
 b1-20020a17090630c100b007b7eaa9c1cbmr3635446ejb.745.1670372831278; Tue, 06
 Dec 2022 16:27:11 -0800 (PST)
MIME-Version: 1.0
References: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
 <6da4a45e-07ce-7cc9-760a-9be317122eb0@gmail.com> <CAOLRUnAfh5_MWo+1HeWSZbOeVjscMCaaW37V5b2jGh-sOvg5gA@mail.gmail.com>
 <212bab83-455a-b6b4-7398-a61a6cca2615@gmail.com>
In-Reply-To: <212bab83-455a-b6b4-7398-a61a6cca2615@gmail.com>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Tue, 6 Dec 2022 16:26:59 -0800
Message-ID: <CAOLRUnDhZQ0fNJuexPE=B5s=fzS29y74029rPAg0XwgY_bfySw@mail.gmail.com>
Subject: Re: xdp forward issue
To:     David Ahern <dsahern@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Dec 6, 2022 at 1:42 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 12/6/22 1:36 PM, team lnx wrote:
> > On Tue, Dec 6, 2022 at 12:10 PM David Ahern <dsahern@gmail.com> wrote:
> >>
> >> On 12/6/22 9:43 AM, team lnx wrote:
> >>> Hello,
> >>>
> >>> I am a beginner for xdp and following is the setup
> >>>
> >>> 3rd party Board - (64 bit arch):  This has 2 ethernet interfaces
> >>> supporting XDP (v0 and v1)
> >>> Host machine: Ubuntu
> >>>
> >>> step 1: 3rd party Board <-----connected over ethernet (v0) ------> Host - Ubuntu
> >>> step 2: echo "1" > /proc/sys/net/ipv4/ip_forward
> >>> step 3: Assign static ip address for v0 and v1
> >>> step 4: run:  xdp_fwd -D v0 v1  on 3rd party Board
> >>> step 5: start ping from host to v0 of 3rd party Board with expectation
> >>> of forwarding from v0 to v1
> >>>
> >>> Observation : In the above experiment I see xdp_fwd has a return code
> >>> always set to XDP_PASS and when I traced it found that below
> >>> conditions is the reason
> >>> in net/core/filter.c
> >>> if (res.type != RTN_UNICAST) {
> >>>  return BPF_FIB_LKUP_RET_NOT_FWDED;
> >>> }
> >>>
> >>> 1. Could you please help in understanding the reason behind this ?
> >>
> >> RTN_LOCAL means delivery to a local process -- ie., nothing to forward
> >> to another device / host.
> >>
> >> RTN_MULTICAST and RTN_BROADCAST: broadcast is not supported. Multicast
> >> ... I forget how to use that. The fib lookup and xdp_fwd test predates
> >> multicast support
> >>
> >>
> >>> 2. Once #1 is resolved, do we need to add manually arp table/neighbor
> >>> information as well ?
> >>>
> >>
> >> the xdp_fwd app is a demo. In a production deployment, you will need to
> >> have something manage the neighbor entries for hosts. e.g., look at `ip
> >> neigh ... managed` if you have a new enough kernel.
> >>
> >
> > Thanks for the response,
> > Understood #2, but for #1
> > I have initiated ping from Host (ubuntu) -> V0 (ethernet) of 3rd party
> > board with intention of forwarding/redirecting to V1 on the same board
> >
> > But I see XDP_PASS being returned instead of XDP_REDIRECT, anything
> > missing/wrong in steps ?
> >
>
> look at the return code from the fib_lookup. It indicates why the lookup
> failed if it does not return BPF_FIB_LKUP_RET_SUCCESS:
>
> enum {
>         BPF_FIB_LKUP_RET_SUCCESS,      /* lookup successful */
>         BPF_FIB_LKUP_RET_BLACKHOLE,    /* dest is blackholed; can be
> dropped */
>         BPF_FIB_LKUP_RET_UNREACHABLE,  /* dest is unreachable; can be
> dropped */
>         BPF_FIB_LKUP_RET_PROHIBIT,     /* dest not allowed; can be
> dropped */
>         BPF_FIB_LKUP_RET_NOT_FWDED,    /* packet is not forwarded */
>         BPF_FIB_LKUP_RET_FWD_DISABLED, /* fwding is not enabled on
> ingress */
>         BPF_FIB_LKUP_RET_UNSUPP_LWT,   /* fwd requires encapsulation */
>         BPF_FIB_LKUP_RET_NO_NEIGH,     /* no neighbor entry for nh */
>         BPF_FIB_LKUP_RET_FRAG_NEEDED,  /* fragmentation required to fwd */
> };
>
>

Sure, I did search for it and read some article but found that
BPF_FIB_LKUP_RET_NOT_FWDED means packets
are not forwarded and only unicast are forwarded. Verified prog id and
map id using bpftool to confirm if it has any issue

interface details:
prog/xdp id: 4
map_ids: 1
btf_id: 7

./bpftool map show id 1
1: devmap  name xdp_tx_ports  flags 0x80

Any hints or suggestions on debugging this issue would be helpful !

Thanks
