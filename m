Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D79E64F738
	for <lists+xdp-newbies@lfdr.de>; Sat, 17 Dec 2022 03:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiLQCxD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 16 Dec 2022 21:53:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiLQCxB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 16 Dec 2022 21:53:01 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B7E10B55
        for <xdp-newbies@vger.kernel.org>; Fri, 16 Dec 2022 18:53:00 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3b10392c064so58695037b3.0
        for <xdp-newbies@vger.kernel.org>; Fri, 16 Dec 2022 18:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egoaLEMxAlyMgvCnzlzHFL7msWTM+ljQ1kBunV4XZIE=;
        b=qmx16zBMngLLA+Rpa1+eVXF8aJqV7i+KwKGBjyJAbwJyunFERroTbwuxT4zu06OjHr
         PeoXH1TdMgfW6SGgFezOf9TjlaGORFn/OEDPctVOxI10/M/IhvvJS+8g5Bdv0Wi8m7+2
         iOm+m3QjiC4+VRVM36GlVvp2HrHWZMk/ib0Q6N1Pyh7bUeiZk9R+7GWhvnUxT6er1sxb
         YFoEMZ7gM+MtVrEw82t6gdCbElcMkqhmGTsjIrcg7PsW19dk+SAx+58uHvziA/OJp1ix
         0XhhoBnUHIuIerXC/QcndTzCo6duxF9n6h5JRnSDzoZIgzuYwriynKrylzsIhzlWTHae
         oAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egoaLEMxAlyMgvCnzlzHFL7msWTM+ljQ1kBunV4XZIE=;
        b=a1Hmj0EY98DmAEWb6saflJtCx119KEJp6gaGLmz8XKhAOd2g5So8nkN+wR65zTMZyt
         snbUC5i9CVx96dNb+srOhY+TT6TdUD7oNWNrXUcIkLpA9lp4ajy0un3+hUdeIgEytQL6
         xlF4RdYOzEP9nGrOG5snZjjGtn1cD3LiXtMfcAKmmmWDxN7umGEEiEMzRHA60j1O00r9
         6HYGHOMAV3I2HMqSCfdOHa3z2vKnNF/+4UmdQEljB5y/6aR8Adxza1ukI8N8qklTPzEH
         5iteYspyks6m8Zo59aL9r9W4EsF2lQykQ67U1mXvYy/iPlg8cZwEO7cH0IEIUx/UnvE3
         Pptg==
X-Gm-Message-State: ANoB5plfZeKRuXJ4BTbOb6YSeX+CEcaYo3jelcPwrmwtC+Jo+EA+3WtN
        X82qGNIXe9HbTmEjCFhjy+h/GWCkDxm9uu9QxDpI4Sf+EyU=
X-Google-Smtp-Source: AA0mqf7Bg8uCYozSUmZab7dhxYG5ZRuRpg/qy/VmERsHEo5350ShEBMZclbSfyGjQ9jAM86anKVr0Y+06ws++Jl2y0I=
X-Received: by 2002:a81:8453:0:b0:3e3:87ec:f862 with SMTP id
 u80-20020a818453000000b003e387ecf862mr27409603ywf.15.1671245580117; Fri, 16
 Dec 2022 18:53:00 -0800 (PST)
MIME-Version: 1.0
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk>
In-Reply-To: <875yedfvgs.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Fri, 16 Dec 2022 18:52:49 -0800
Message-ID: <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
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

I have thought about it more :) what about this scenario


good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP ->NIC2

NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
redirect good tcp rst/ack to NIC2, is that possible? any performance
impact?


>
> In general, if you want to filter traffic before passing it on to the
> kernel, the best bet is to implement your filtering in BPF and run it as
> an XDP program.

I am thinking for scenario like tcp rst/ack flood DDOS attack to NIC1
above, I can't simply drop every rst/ack because  there could be
legitimate rst/ack, in this case since mTCP can validate legitimate
stateful tcp connection, drop flooding rst/ack packet, redirect good
rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1 is
able to do stateful TCP packet filtering, does that make sense to you?

>
> -Toke
>
