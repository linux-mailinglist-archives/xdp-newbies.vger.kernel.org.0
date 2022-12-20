Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D506519F4
	for <lists+xdp-newbies@lfdr.de>; Tue, 20 Dec 2022 05:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiLTEXN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 19 Dec 2022 23:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiLTEXL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 19 Dec 2022 23:23:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E676350
        for <xdp-newbies@vger.kernel.org>; Mon, 19 Dec 2022 20:23:10 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b13so16817653lfo.3
        for <xdp-newbies@vger.kernel.org>; Mon, 19 Dec 2022 20:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lffEieMvLyTjXorj+1GMvoOlnZJffkHwtDdN9o9KQyM=;
        b=DGJf+l8YEY9OshVp+XubgWLTNA/1sRz/uyIDZxNidEgNZI9mxXkokxD5yAZNBEwJbA
         oWXBYINyd9NmLcMsBIlVILmC9Q6UWcoqBMA3TWtdtpvJOKuML1n75GX1uKV42myxZ0Pd
         CmDJNPA/XGKncG/DQ4BAzeVsrBEAr1islxyxdMTd449baOrZaSER6wkSTo9QVD/xBkRy
         g5D/3d15H/oYZpIgfdkRefubHQQMD4vkkCKDq37rVebWQElP4kcdeUYdAR4xCkg7DTdb
         KCEnEjT0yUWN5gov2Afs6MSaP6tHhHn2Q+n3b8C/pTE1ypyVO2IWRvgKADE90GmZGXZU
         WnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lffEieMvLyTjXorj+1GMvoOlnZJffkHwtDdN9o9KQyM=;
        b=SCaqh1itIT2zU4H0JIm645xQPvJQndN1CQ8Q7TWoHTvr+WEwIyzjj6rYeBu9q0XSYR
         AuGgfEJOtO7KlJZwnshhb4ppq0Wx9xv/y8RKRW67VLa70QJ6Q5n9xu/O+PnWmVymvsBe
         pf+7klku9Y9pFMYGR4LYWL35v3sDM/bC59osUAlae05jg3ngVyP+S5pET1kAG2MoXtiB
         Ow/D/BhBJP6NH3BKDvWaWBgO/e5FO6tU3GlC/EzgfJUSBbicsi4MlLdlQ3IyuKLqMFoj
         nc3Fuhh7QgVe4fnPMQBY65V/y6Qm/SqJEvhlImYbRAcIwWESBm2wjc/UxWR7irUKEKhf
         aXpQ==
X-Gm-Message-State: ANoB5pkqczVHOFHj/37nbvYpeeuI8MuC7WV/4HGm28gzEDY0hNrhBeOl
        TCHzfIeLBjkxPbSo5KDmOBclbYB9QDar98KqT5im5cV2
X-Google-Smtp-Source: AA0mqf75R2msEXM1B1fHPNL01s5KvhVEpaSodia82K4+iCUBLdYK8iVybKExK8dW52UZWnaJ9PS7iRgf9yJPeKaloo8=
X-Received: by 2002:a05:6512:1683:b0:4af:bbc9:e47d with SMTP id
 bu3-20020a056512168300b004afbbc9e47dmr33851929lfb.608.1671510188854; Mon, 19
 Dec 2022 20:23:08 -0800 (PST)
MIME-Version: 1.0
References: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
 <6da4a45e-07ce-7cc9-760a-9be317122eb0@gmail.com> <CAOLRUnAfh5_MWo+1HeWSZbOeVjscMCaaW37V5b2jGh-sOvg5gA@mail.gmail.com>
 <212bab83-455a-b6b4-7398-a61a6cca2615@gmail.com> <CAOLRUnDhZQ0fNJuexPE=B5s=fzS29y74029rPAg0XwgY_bfySw@mail.gmail.com>
 <37d5bcac-4b63-c9f1-280a-caf7d303c309@gmail.com>
In-Reply-To: <37d5bcac-4b63-c9f1-280a-caf7d303c309@gmail.com>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Mon, 19 Dec 2022 20:22:57 -0800
Message-ID: <CAOLRUnApBOYXXhOvV_2qzELQD+bTWERqEDOR9sgOYrTiU=J_MQ@mail.gmail.com>
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

Thank you, it helped !!


On Tue, Dec 6, 2022 at 7:05 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 12/6/22 5:26 PM, team lnx wrote:
> >
> > Sure, I did search for it and read some article but found that
> > BPF_FIB_LKUP_RET_NOT_FWDED means packets
> > are not forwarded and only unicast are forwarded. Verified prog id and
> > map id using bpftool to confirm if it has any issue
>
> ok, so this one:
>
>         if (res.type != RTN_UNICAST)
>                 return BPF_FIB_LKUP_RET_NOT_FWDED;
>
> and the discussion about local return. If this is really supposed to be
> forwarding and not local delivery, the next step is verifying the
> routing tables and fib lookup parameters:
>     perf record -e fib:* -a
>     <run test>
>     ctrl-c
>     perf script
>
> the tracepoints will show you input variables, table ids and result.
>
> >
> > interface details:
> > prog/xdp id: 4
> > map_ids: 1
> > btf_id: 7
> >
> > ./bpftool map show id 1
> > 1: devmap  name xdp_tx_ports  flags 0x80
> >
> > Any hints or suggestions on debugging this issue would be helpful !
> >
> > Thanks
>
