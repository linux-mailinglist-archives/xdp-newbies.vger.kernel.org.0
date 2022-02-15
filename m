Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4C54B730F
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Feb 2022 17:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238534AbiBOQQE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Feb 2022 11:16:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237417AbiBOQQE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Feb 2022 11:16:04 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7688DE371A
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 08:15:54 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id w1so13453812plb.6
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=princeton-edu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVHKuVaAcO0lXo+RxSwo5oHU7YbZ5zaOS64/5OqvsfI=;
        b=paR8mDYz/b4Mqlu8qP5NM97C3dj40kWGL13FRbtIW6FS3keemajhsDcDM37KdoplfX
         9G0YslMq/B0Gjpz0W3NeSnD26LF0sqaRUx4dcodukFX+YK2Kj1Xk2b+RUSNzgj7bwVfk
         b3zKKA7eZ9R8sklRlTZd2s++ZwXAcR+RPDbdixuXspJfgxvlpEpMcReB3VbtCwA6gtWF
         rHz4pQ7dGa11dlwY+AZfdQWMDnyyrpoxmPrMxWFHU7HZUNb8DMa97rpbToltkCt3cKT5
         QOYLHgkqHbfSGpjhKgytravAsts9JOPpWgh8psCVIErsdpKHJcfnzZiLR+bYA1rMNu9u
         vuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVHKuVaAcO0lXo+RxSwo5oHU7YbZ5zaOS64/5OqvsfI=;
        b=FL+XY6AUljZ1XRHmRSgvgcr205vRDNBqRWFde4S7RrWYS94eRffFXhmtIsXZVPpuos
         ZJwrQCDRC4Nzu4E0NjpIUsuTrpZvg3OUFE80w8unjtusd8LVbNzqAhBbzufXa8JR2mHM
         a7Cf8Z+qEtAC9ic0Nrmte1t5c3raF1zfxdlHJQa1zICqenLIWkfI69ZLqfmD1GAkWq92
         34JVI/3/Fev6psa5EpTXtuBFWbeZdY8dudclhSyz4MD2yeF1Yn1+wlFhnfJMTPw+Qtvt
         zSbPKjeSoTzhi+khYMdRnEokJMtFhQ7ymfzxnhFeiS5BvW6FFIjeT4McQWUu04d1a1F2
         Qmtg==
X-Gm-Message-State: AOAM531r+0Lp9KhdwchBMRt3jah5DP/9xgL76bLov9mFZ8q34WiSYlm3
        AvseOH+U7fdxqv84kPXnWZmLATgz1BOKUXMG7eRvz4/V/XJhHA==
X-Google-Smtp-Source: ABdhPJxmMEtCdYlcM5Oq5fa02jxKbCtu4XIjoH50AqbcqYw129hZV7RCcQZNpXIq/xXR5UdGWJFsQXheD6HDaCzL2CA=
X-Received: by 2002:a17:902:b494:: with SMTP id y20mr4919126plr.167.1644941753870;
 Tue, 15 Feb 2022 08:15:53 -0800 (PST)
MIME-Version: 1.0
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <877d9x7168.fsf@toke.dk> <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
 <874k516q32.fsf@toke.dk> <CANLN0e6ersLvCSZSbxt6Roy2qJV2C90Y12RmEwQNtwyX2tURwQ@mail.gmail.com>
 <87mtis5fju.fsf@toke.dk>
In-Reply-To: <87mtis5fju.fsf@toke.dk>
From:   Sophia Yoo <sy6@princeton.edu>
Date:   Tue, 15 Feb 2022 11:15:42 -0500
Message-ID: <CANLN0e7=Z8rHxmB5WEs4jFdaQ8sL2n_ckE-wcyURnfQHvgo45w@mail.gmail.com>
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> > This is a real use case as part of a larger design I am working on.
> > However, given that redirect from TC egress to XDP_DRV_MODE ingress
> > fundamentally doesn't work, I am rethinking other options to the
> > design. Alternatively, it seems that support for XDP_REDIRECT from
> > egress to ingress is currently in the works, although I don't believe
> > the patch has yet been applied to the mainstream kernel.
>
> Huh, really? Haven't seen that, got a link?

This is where I saw the discussion for adding XDP support in the
egress path https://lwn.net/Articles/818591/, which if I am
understanding correctly is also proposing to add the XDP_REDIRECT
support on egress. (Also, for completeness sake, this is the man page
for bpf_redirect() that says currently XDP only supports redirection
from ingress to egress, and does not have egress to ingress
redirection. https://man7.org/linux/man-pages/man7/bpf-helpers.7.html)
Do you have any insight into whether/when this XDP_REDIRECT
functionality on egress will be added to the kernel?

>
> > So I will also try building the kernel myself with the patch and
> > hopefully get the egress to ingress redirect working with 2 XDP
> > programs attached in driver mode. Thank you very much for all your
> > help!
>
> You're welcome :)
>
> -Toke
>
