Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A176613BB
	for <lists+xdp-newbies@lfdr.de>; Sun,  8 Jan 2023 07:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjAHGCZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 8 Jan 2023 01:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjAHGCY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 8 Jan 2023 01:02:24 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB4718E0D
        for <xdp-newbies@vger.kernel.org>; Sat,  7 Jan 2023 22:02:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu8so8197118lfb.4
        for <xdp-newbies@vger.kernel.org>; Sat, 07 Jan 2023 22:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pzvc+7xr6PbtP+u2QswF4vcG5v7HDKV2ACMzaDNsCA=;
        b=VqCpupEq7LQGbbqm08VUsH9s5S1luulQlTP8+CEI5stgNF2bCd2jHjpjvaBQ9ttlnF
         xlOiB3s2nY6Z2QmFWHzqgvv84ZUWQzuT++uYglPWBrC2x+7RwOj9Iu+xBElO5WTxpCwe
         GFNvwLb+zONIdvO+ghZENfGPFvHXAV9SSGgcyfju6n6S1v+d14quRI1IgvRXzxDziXKq
         fTG/s7ZPQotGYbSNliEkTjSy1uSovxzEF/xcSzgc6hthf7KN59aAdCVYNU1I3ginhRgW
         vvL4h7dIFyM7r2jqn6wNPLjp8H7htXQKVfd1/0LMPm1dPWphMMkfZDAO56CKWRSFJ3nK
         p5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Pzvc+7xr6PbtP+u2QswF4vcG5v7HDKV2ACMzaDNsCA=;
        b=OgVrjuvYTZyGIANX8+j+LKIDVJaFZaZAhyLhIYtgK5lrHsHu7qO3fw/hTWGC5IGa+r
         jzHpulpTfmA/nDeThXjKYcTcfnELrs2hmMa+olcy5bIUP/js2xKIcvm/YBUvuNIpFQ06
         W+SlbaSqeWgtRRhzp5psbYykaYP5iEfjRWD3Xy+GnC+FXEc/+hTSPbJ8RhYaplI9hVNY
         +izSlzC5YeI4Bs7AWCIXa2KPiTioGxkPeQLQUiMI/2bUG6caHCwq34w+QFvRkRMdimMr
         XYIPtZr8R74d8R9Y21F/dy4HqJ05lgBPAJJO5vMh07gTU06q+pvG5rCrr6PfOppy33CX
         a7Aw==
X-Gm-Message-State: AFqh2kpHOlCNFXT7/2OPENro5TPM019XaP5VUWUFqMRiO6boC/5AjcTl
        Y1q2bqDPPRkk94vWwjDa44NhLzhTUsiN4Rrf021Ch0qR
X-Google-Smtp-Source: AMrXdXuIuJn7mF6eRCUq9npLn+FKMhppkU117joWJqHb1I34xu+iHLrsD7AHFO/Z+Cl0kCDNkPZCS6opTZ7jrKFeZMM=
X-Received: by 2002:ac2:4f16:0:b0:4cb:43e9:afd2 with SMTP id
 k22-20020ac24f16000000b004cb43e9afd2mr927365lfr.608.1673157741969; Sat, 07
 Jan 2023 22:02:21 -0800 (PST)
MIME-Version: 1.0
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk> <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
 <CAA93jw5EJ7OEo9hDJNWn8nLQhO+WezDs-rf+V0mOqUZ8ExAuLQ@mail.gmail.com> <87cz7qyycn.fsf@toke.dk>
In-Reply-To: <87cz7qyycn.fsf@toke.dk>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Sat, 7 Jan 2023 22:02:10 -0800
Message-ID: <CAOLRUnDSXNhGFA_Sv=khfQnXE4CZi1jc2JeUgK_FxQTTTwLSoA@mail.gmail.com>
Subject: Re: Pause and unpause queue
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks Toke and Dave for the response with explanation and knowledge
which explains that its work in progress !!

Thanks !

On Sat, Jan 7, 2023 at 10:49 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Dave Taht <dave.taht@gmail.com> writes:
>
> > On Sat, Jan 7, 2023 at 10:08 AM team lnx <teamlnxi8@gmail.com> wrote:
> >>
> >> sure, during xdp redirect i found that sometimes the number of packets
> >> arrived are too many for an interface
> >
> > That is often the case.
> >
> >> to handle in which case. Hence thought to experiment with tx pause to
> >> make room for successive packets and then unpause !
> >
> > "pauses" are really not how the internet works, there needs to be end
> > to end signalling to "slow down", either via packet loss, or marking.
> > RFC970 is a good read here.
>
> Actually it is, kinda, at this level: Pausing the TX interface (when the
> HWQ is full) is how the regular network stack creates backpressure
> against the qdisc, which is what allows fq_codel and friends to
> function. This is missing entirely from the XDP redirect path, which is
> what we're trying to fix...
>
> -Toke
>
