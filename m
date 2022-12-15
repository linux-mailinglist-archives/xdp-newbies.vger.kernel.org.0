Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28EB64E15C
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Dec 2022 19:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiLOSxJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Dec 2022 13:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbiLOSxI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Dec 2022 13:53:08 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49D037FA8
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Dec 2022 10:53:06 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id q22so948180uap.7
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Dec 2022 10:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjq3LfaUQwHTkEARWCmPlq415eR//k1qvuCbEDitwOw=;
        b=XvpM/TcjfhnEmb8mDJi07+mCIaOpdOWhnSRmhZrRZnVgLIXOYdCevaER8u9R2Ht7Fx
         eMK1oNjey3AIhp4IRwQnU2wPp9GLH3yMQDR2rE0L5mf8mvGCYJ4K+I/nwTVXiVGii0B3
         ZxVbuJZTusbi6hCfzjRylLTQZ7fU1/W/Fe5xGcxYtqLvSGn8N2oKkhHQboc7keDBhHvi
         cjuweMk/ztq4rDe3/lSOLRilXZcVl7NVb7zdl1QKoJgkVydlE8Lvp+TQQT11hk+rHSPT
         FA7KXzJoz+BwZsOcK5ZRbomEJbPhqyjMabSQZ3WKDoj1C/WRxQSVH4/zGUMq3CYGbEGG
         53bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjq3LfaUQwHTkEARWCmPlq415eR//k1qvuCbEDitwOw=;
        b=4BV+3Uq0adN75cbxzvCxSwP9iu4aN3ZQI+G0QvlcnO25AKYt9IX8L/mO9b+ewP29Ef
         NQYRaqriFDC/FP5uK6vc1USV4rLdT+lDd0/Nwym/htgSnpPHuvFvEeGCx5hHynFZELxF
         FxI/11O+zxTKJYYUUjhoNVeT9cawNH6FOxSsd0m+b3KxCUmlSzXKtkxQC+fvXe4Qwbt4
         C8Wpja/cjtvDWm3X89cvLUZ1LH1rgi/DfnOKjIc53ehqpr80vpPSHoy6OEeGIA5LOgru
         EQR/FQqC133zFxWsGiA/HjExlIq34WS8ffAh09n4udizTq8Zm8faGVZKimdC7fXqz8kY
         yQgQ==
X-Gm-Message-State: ANoB5plQ6ZzUJXX5bvYvcUNP+QzZ2WDFaYAP8jvqsi2/EkZp8di5RIq/
        v1tjEFHVlIk7oV7Tsx9Ctp+qbRE2hJ9EdNka6Pa5gdRY
X-Google-Smtp-Source: AA0mqf4+3Y1KHAZh8EbA4LyygKAReIlB5NZ17IOOYBLMoRejUpEsYwr1Kt2kuNHWOc+KXXLbsT3p8QgxrdqZLoC1eJE=
X-Received: by 2002:ab0:6cad:0:b0:426:ec0:5dfa with SMTP id
 j13-20020ab06cad000000b004260ec05dfamr2432667uaa.14.1671130386035; Thu, 15
 Dec 2022 10:53:06 -0800 (PST)
MIME-Version: 1.0
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk> <CAK3+h2zpbpfTV31XU5Vr2kb5F0=zE5z9gMyb6Bu7LBuHQxEBMA@mail.gmail.com>
 <87len8exfc.fsf@toke.dk>
In-Reply-To: <87len8exfc.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Thu, 15 Dec 2022 10:52:55 -0800
Message-ID: <CAK3+h2w30SmDn_NYnPO7NWSizqu4deNYB4oRDMSPfxFefNAV_g@mail.gmail.com>
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

On Thu, Dec 15, 2022 at 3:09 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Vincent Li <vincent.mc.li@gmail.com> writes:
>
> > On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
> >>
> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >>
> >> > Hi,
> >> >
> >> > If I have an user space stack like mTCP works on top of AF_XDP as tc=
p
> >> > stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
> >> > or other tcp attack, and redirect good tcp packet back to linux host
> >> > stack after mTCP filtering, is that possible?
> >>
> >> Not really, no. You can inject it using regular userspace methods (say=
,
> >> a TUN device), or using AF_XDP on a veth device. But in both cases the
> >> packet will come in on a different interface, so it's not really
> >> transparent. And performance is not great either.
> >>
> > I see
> >
> >> In general, if you want to filter traffic before passing it on to the
> >> kernel, the best bet is to implement your filtering in BPF and run it =
as
> >> an XDP program.
> >>
> > I read about this
> > https://eric-keller.github.io/papers/2020/HybridNetworkStack_ieee_nfvsd=
n2020_slides.pdf,
> > thought that is good idea to run mTCP on top of AF_XDP as  anti DDOS
> > tool
>
> Right, that slide deck seems awfully hand-wavy about how they're getting
> packets back into the kernel, though... I guess you could ask the author
> how they're doing it? :)

I will try :), thanks again!

>
> -Toke
>
