Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADBA6610B0
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Jan 2023 19:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjAGSFE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Jan 2023 13:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjAGSFD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Jan 2023 13:05:03 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2519C34D42
        for <xdp-newbies@vger.kernel.org>; Sat,  7 Jan 2023 10:05:01 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id g14so4634374ljh.10
        for <xdp-newbies@vger.kernel.org>; Sat, 07 Jan 2023 10:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V6+M1+Ak5jWfkbBjrbukf2x8jDrrP1Vxm21wFMq93M=;
        b=jPH9RS87F+neki3EFKbCxcN6QsDFuk2jdRYO5wHGHr8QljRGIBcVMTYsREoL8YNj4L
         SdcAJXjV1rl73u0e/LRefkrULHfP2fR9XhV5Bppan/zjxgjWRZ7fqMzi9fAPxq8/U1Tv
         PxdEn43ycAGjaD/ZsAz+Kf74Z9BJS3b3mMEozR3VO6C7DCRAYpRfh/qVLCNaXcKg+ItZ
         gUeXXYMCCphVHmA/3gIDp7Si1nEu/C6F2bXTdhMzg4n+dfxq1BZVIN+LsvfJmnCl24ED
         ERtRdYqGJhG//fmQ/FHv1gkzFzbheMALbowvRilcSYvfq9VlX8ni/9jvOeiL6NIwWmKV
         RD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V6+M1+Ak5jWfkbBjrbukf2x8jDrrP1Vxm21wFMq93M=;
        b=Ljr6C8dhhQ88r4mK8Mv7mOrfzRJ8sEFRX5EyOM+9Czg12aDyf+R8jrQ4RM0PVMArO3
         wohAsG731yAfpotIjtQMu8ivhMDH/vffsiG5+L3mhXt3WR0RRy3mkaXMrM8DYa+4yZyc
         Wq640hidUcIZ5fSaCNGnFR2bOzV2bLX8TlYJkRSUGOq3HVEB4LoNN8uHfdZ68YcygFrR
         TzTDbbYiXVMhlmCxWhuSR4fYpvJLJrMXmivpMCBsIv5fbb4TfFZdss8RA17UlAS+cQ4g
         ljGeR0QTeI3UL/ZSOMC/5Q3oaG1LfeUZFuMEBh69TARjoKCR7VE3C5kY8wCGaKVmGmoX
         /ehg==
X-Gm-Message-State: AFqh2kpkLsGixk8iGsYUPQHDlYL/Cjko1WMCs65tmoHUacyLxHjn8f+f
        /lRaCFt4pZ5YD6AydXOojQESfZRPov4+m1tHO08mP88N
X-Google-Smtp-Source: AMrXdXvqO9gnhiLGisIec1QSTqNyFp1AnGpuuNWhYm9Ai1Rgpkwq7xGt26cD4E6qgHovWfqmXW704lAEY0hVdAfvUTM=
X-Received: by 2002:a2e:8808:0:b0:282:ab40:5a82 with SMTP id
 x8-20020a2e8808000000b00282ab405a82mr220534ljh.164.1673114699432; Sat, 07 Jan
 2023 10:04:59 -0800 (PST)
MIME-Version: 1.0
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk>
In-Reply-To: <87sfgnzukv.fsf@toke.dk>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Sat, 7 Jan 2023 10:04:48 -0800
Message-ID: <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
Subject: Re: Pause and unpause queue
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
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

sure, during xdp redirect i found that sometimes the number of packets
arrived are too many for an interface
to handle in which case. Hence thought to experiment with tx pause to
make room for successive packets and then unpause !

Thanks !

On Fri, Jan 6, 2023 at 5:00 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> team lnx <teamlnxi8@gmail.com> writes:
>
> > Hello everyone,
> >
> > 1. Is there a way to pause/unpause queue ?
> > 2.  Is QoS (work in progress for XDP) ? Can we use work in progress
> > series if  there exists any ?
>
> XDP has no pushback from the driver at all, nor any way to queue
> packets. I am planning to add this, see this presentation at LPC last
> year:
>
> https://lpc.events/event/16/contributions/1351/
>
> Could you elaborate a bit on what your use case is, specifically? :)
>
> -Toke
>
