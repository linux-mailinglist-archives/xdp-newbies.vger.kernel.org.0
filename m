Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3767E64D522
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Dec 2022 02:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiLOB5k (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 20:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiLOB5j (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 20:57:39 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BA7554F1
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 17:57:38 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id q7so4065778vka.7
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 17:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR60Hi00AIdqPjewoUJkRT2bvi71mjk/MV8vtk2Rh2E=;
        b=LWTVjc4mitEK5biINldNNUwSjGrTiBvvJ+LXFSAP3DtRYW0G5e1A7o3DZxOSJ1eDTS
         YHH5ll1mVzWEwZqCqVrVHojKoeduKJKjKWV/QW9G4IfC60jqPekLBls38r8KlMEVaCUG
         UlnWDcoSB1dUpel+b0xIeHg6uI9LpdkGPOl1Y621HYguUdpJKzx/Uj+DwhXXktKzntLa
         bjdyL4z64M6zHErPd8m7gyTIrJX12HUxvlEawCdSA1b27lYRZOoSsIYE3A8InDLpGUNQ
         ked1nk6/q0Z1Z38rse5RqgZw6xYtbu5CzL+mF+wRb0xD0vxOCdNcowF8vIK+r/R+nbQB
         ITMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR60Hi00AIdqPjewoUJkRT2bvi71mjk/MV8vtk2Rh2E=;
        b=Ym5WxmYw5hraifcxjNGfxx/vZdMb24JvHhAlDtNhIBA7XnqcHv1xc7zNzgWICrjQ8/
         RlwNirqPTHsd2LAjZDa0SBV8fm0z9OH5f6TMmbIiJDDze8LV5FnuBW0tuzrP8m6gPbcp
         uCFwr+HVzZPKLpzVMTI/NsRmVobz+b1P62PjLbpJMh+qQ+glxAD2Zy1kjtZ1Fij+mAs8
         BIHqNu1iVFwWXPxKcxSMg+6lNZbDZnE23N8D8cimVqk1ANL0tSTurjLt0gAZ6dz0wova
         T50gHfWcb9ozYzTLbiKLPugwB0Nhunuc/SWSalyoceA6cN2Yi3itz/Ax99H+Oq4wI7XU
         /gSA==
X-Gm-Message-State: ANoB5pk0EfuVWIHLFuxIEiTdyN3Jy/qjhXyUJGfTstOG65ngXh2hQ9Tu
        5v4/gj58aXVh8cmVBsteOxtVlixI74PiTGPCsrnzCHUbR5o=
X-Google-Smtp-Source: AA0mqf7wFGT2nglljwUaO3PoSueYxNrM5QQovQ3t2qEpNDGduac8wJmPbJnj+87lw0V7CbaQoauscghMJOa0o9mtJ1k=
X-Received: by 2002:a1f:fe0c:0:b0:3bd:96fd:e0d5 with SMTP id
 l12-20020a1ffe0c000000b003bd96fde0d5mr12649392vki.35.1671069457347; Wed, 14
 Dec 2022 17:57:37 -0800 (PST)
MIME-Version: 1.0
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk>
In-Reply-To: <875yedfvgs.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Wed, 14 Dec 2022 17:57:26 -0800
Message-ID: <CAK3+h2zpbpfTV31XU5Vr2kb5F0=zE5z9gMyb6Bu7LBuHQxEBMA@mail.gmail.com>
Subject: Re: Redirect packet back to host stack after AF_XDP?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Vincent Li <vincent.mc.li@gmail.com> writes:
>
> > Hi,
> >
> > If I have an user space stack like mTCP works on top of AF_XDP as tcp
> > stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
> > or other tcp attack, and redirect good tcp packet back to linux host
> > stack after mTCP filtering, is that possible?
>
> Not really, no. You can inject it using regular userspace methods (say,
> a TUN device), or using AF_XDP on a veth device. But in both cases the
> packet will come in on a different interface, so it's not really
> transparent. And performance is not great either.
>
I see

> In general, if you want to filter traffic before passing it on to the
> kernel, the best bet is to implement your filtering in BPF and run it as
> an XDP program.
>
I read about this
https://eric-keller.github.io/papers/2020/HybridNetworkStack_ieee_nfvsdn202=
0_slides.pdf,
thought that is good idea to run mTCP on top of AF_XDP as  anti DDOS
tool

> -Toke
>
