Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312497E3AAF
	for <lists+xdp-newbies@lfdr.de>; Tue,  7 Nov 2023 12:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbjKGLCo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 Nov 2023 06:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbjKGLCn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 7 Nov 2023 06:02:43 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01E111A
        for <xdp-newbies@vger.kernel.org>; Tue,  7 Nov 2023 03:02:40 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-581edcde26cso3246268eaf.1
        for <xdp-newbies@vger.kernel.org>; Tue, 07 Nov 2023 03:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wikimedia.org; s=google; t=1699354960; x=1699959760; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U1rTHCvmRjU2OBxfoIImn/WYGZCcSVeSMY7GA62kEc=;
        b=dM7Wc30h3Jlm0lq4XGlT4bL1TeXFclPwRznpZi86xYCihz4nN527HyGO5r4OC4LD+Y
         avihYs/IwUrwpMj5gNT8MfqLnzl8Z8zNPbMdFB2JaarqyNrI0TOyS6XyYH7Xjom1eaGz
         UQXzUYjhYux7WM1+HdFI0Og9MvR0xCJ8IxkDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354960; x=1699959760;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1U1rTHCvmRjU2OBxfoIImn/WYGZCcSVeSMY7GA62kEc=;
        b=dl35N0ER9A5qLSSV788gsMRcV4ODPuWNPeLKHulQA2MKEHpi3PGkHHrlkajYqTmKjD
         rMmjJSkSHO0MYRwvOXteqZPOZeafrCs1AqTIsWIlSywhhyJexs88qt4+nb5o+VJOjTdx
         3KpfEUC3ectxd2NzBbI9ldPrWBnMKp46eLoVcT0aTuYI+173clCE+QtObSjk/jhuw9v6
         KiD1uPN+Eb/Y83fkI3eQCLwkN3sC6bH7kah87IrBit1ZFNczweVgTMImerC2TRlxdLaT
         zuhY3S2ec6ku1SR/3PATlxyTWZPogI/rGkke+RdhHRkZEiyZ1flVGfX2SuNfD2eeyZoV
         4pew==
X-Gm-Message-State: AOJu0YwWO3xGxnt4t+NJRxs8SeeJwI15b43MdiwwaozuSmqpPGmhOgnd
        gXLFYdEGx6fRBYEuuB+vo1ClrReeb6sWT2p0vm4G7sRYFmSnayhUkw==
X-Google-Smtp-Source: AGHT+IHzIPPrqPvhYHA+gD2NRgOZ+rq1oEl/iU/f0+kE0qgMH5qkwT4MJUDZ4KTNhXWj1NkC5qmU455W3Zd+LFKZMmM=
X-Received: by 2002:a05:6820:1686:b0:581:ec87:edc0 with SMTP id
 bc6-20020a056820168600b00581ec87edc0mr36458527oob.9.1699354959821; Tue, 07
 Nov 2023 03:02:39 -0800 (PST)
MIME-Version: 1.0
References: <CALQkE9a0VWPZs3cXmWCyd4TWp2uDzghfhd8-VAAAb2Gtc-5CgA@mail.gmail.com>
In-Reply-To: <CALQkE9a0VWPZs3cXmWCyd4TWp2uDzghfhd8-VAAAb2Gtc-5CgA@mail.gmail.com>
From:   =?UTF-8?Q?Valent=C3=ADn_Gutierrez?= <vgutierrez@wikimedia.org>
Date:   Tue, 7 Nov 2023 12:02:28 +0100
Message-ID: <CALQkE9YthMqAL_M11d3+aOmcEw-dEe40h--aiCACu_nU8zWGDQ@mail.gmail.com>
Subject: Re: MSS clamping with XDP/eBPF
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Answering my own question, parse_tcp_ts()[0] can be  easily adapted to
find any TCP option and return a pointer to its position so it can be
updated using bpf_skb_store_bytes().

Cheers,
Valent=C3=ADn Guti=C3=A9rrez

[0] https://github.com/xdp-project/bpf-examples/blob/63cd4007b16b49b44241f1=
7a38f26aea926f8afc/pping/pping_kern.c#L424

On Mon, Nov 6, 2023 at 10:57=E2=80=AFAM Valent=C3=ADn Gutierrez
<vgutierrez@wikimedia.org> wrote:
>
> Hi,
>
> I'm trying to perform some basic TCP MSS clamping with eBPF and it's
> being harder than expected:
>
> * Parsing TCP options can be challenging for the eBPF verifier as it's
> been shown in [1] by Christian Deacon.
> * bpf_store_hdr_opt() introduced in [2] doesn't seem to be useful here
> cause it refuses to overwrite an existing TCP option and MSS is
> already set when BPF_SOCK_OPS_WRITE_HDR_OPT_CB is triggered.
> * bpf_setsockopt() isn't able to set TCP_MAXSEG per [3].
>
> Am I missing something?
>
> Thanks,
> Valentin Gutierrez
>
> [1] https://github.com/gamemann/XDP-TCP-Header-Options/
> [2] https://lore.kernel.org/bpf/20200730205748.3354954-1-kafai@fb.com/T/
> [3] https://github.com/torvalds/linux/blob/d2f51b3516dade79269ff45eae2a76=
68ae711b25/net/core/filter.c#L5151
