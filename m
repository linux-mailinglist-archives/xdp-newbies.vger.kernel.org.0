Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EDB368359
	for <lists+xdp-newbies@lfdr.de>; Thu, 22 Apr 2021 17:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhDVPbu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 22 Apr 2021 11:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbhDVPbu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 22 Apr 2021 11:31:50 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE1CC06174A
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Apr 2021 08:31:15 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y62so719279pfg.4
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Apr 2021 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKN++d+eqi6xowMJXa7Ug/AFAcGEdvy+UibCNZRh5fA=;
        b=lH0Jz8OpAZM6eiIuxgJ236ZLPodk233WhXHTfmma88tkU8yiZqGu6CuyASGN5TxI3a
         msezG+qe2+h5BIzmom1jkulYE65FDh79o3uyF2+r7S6AO6NFCqy53viHpxBp7zcBYZ9z
         bvGXMhLLIkjsAWazh7DvLRBO8PkVvIISze5YiMAnNybKp/a/98Cpw9DvLHOuphw6RYRf
         kMipLpD7uv+R8d7hfEAJRrc+tW+ZpTaNAwrq2GQoufzv75V3MkrMUoR+uY6/aabf/p68
         uT7JyFFPA7ucQYsF7aEyoTP34x4qCRebT6P8aIxW6ArpNmFhr3okKtbCSXsGTfKo81Z4
         T0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKN++d+eqi6xowMJXa7Ug/AFAcGEdvy+UibCNZRh5fA=;
        b=Ac0CgU1N7kFjZ5MCVyuACqiwpaamBjoppKXnOS//1esiW/fr4eT60DRZIH2q40hnNP
         vQGn5ApBmFZSqOtyF3Xt0EQa12iRsSUkeLrbpiKxXJg/+4NaBhGf6sa0wChmMpMg8aMD
         9RbIk8p7SBd2diUb7NqAQ0428oaAve30ALQ74JAj0xgrE30r8iTJCNOFsj6cqZ8pYxWR
         bTUR7E6YETI9UqgXqeAWXbEmmFJGq00gWMf+hO1StANyijybVb3nGO7BudjY1EprG9Ho
         q+zMMVWlC7pKRZLAukmScL0xcoOgN3zH4u39VZ1ShGZ4F/GFF17ixUSu7EUjlLtoff9q
         E4dw==
X-Gm-Message-State: AOAM531QRDYJwC88WzLy32TAy8tiiuzAfKqxyuWKOG9f0ieKSLls6FAM
        DUbbHyiTD13Iu5XQRLmb8IH/JwCbrZ8kp6roL3qoIjuk
X-Google-Smtp-Source: ABdhPJzlphbJMkZXraz/cOTE0aMw/H6CitaLhGclx68EaCUNXxoRjxNq6dMXoO83kYw7F0FSUKNWF9mrbI8RojSXjUg=
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id
 s15-20020aa7828f0000b02902006e278c8fmr3980336pfm.44.1619105475226; Thu, 22
 Apr 2021 08:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5-QPBHuGBVvrdcXvsjo2BVcQcfeQrWmZV5__WuhgnpiDQ@mail.gmail.com>
 <CAC1LvL3rFo8YaMyRim=MpYP00a9ZH2c8X=J-hxiM48=SBm+Xuw@mail.gmail.com>
In-Reply-To: <CAC1LvL3rFo8YaMyRim=MpYP00a9ZH2c8X=J-hxiM48=SBm+Xuw@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 22 Apr 2021 21:01:03 +0530
Message-ID: <CANzUK5_i9cynLiTB8-C-S90_7K_YutTcn8nDvxboKWU0=wfe4A@mail.gmail.com>
Subject: Re: IRQ assignment for queues
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Apr 22, 2021 at 3:14 AM Zvi Effron <zeffron@riotgames.com> wrote:
>
> On Tue, Apr 20, 2021 at 11:57 PM Srivats P <pstavirs@gmail.com> wrote:
> >
> > Hi,
> >
> > Not a XDP question, but more generic about IRQ assignment for queues.
> >
> > For a NIC which has separate RX and TX queues (no COMBINED queues), I
> > see in /proc/interrupts that only 1 IRQ is assigned.
> >
> > ...
> >
> > srivatsp@EXA8:~$ cat /proc/interrupts | grep enp5s0f1
> >  73:          0          2          0          0   ITS-MSI 2623488
> > Edge      enp5s0f1-rxtx-0
> >  89:          0          0          0          0   ITS-MSI 2623504
> > Edge      enp5s0f1-rbdr-0
> >  92:          0          0          0          0   ITS-MSI 2623507
> > Edge      enp5s0f1-qset-err-0
> >
> > Is the IRQ for the RX queue or TX queue or both? Does Tx need an IRQ?
>
> I see the IRQ name has "rxtx" in it. From my experience, that's the
> same type of designation used for combined queues, and indicates that
> the IRQ is for both RX and TX.

I guessed as much (based on i40e combined TxRx queues experience), but
wanted to confirm.

> I'm not sure which driver you're using,

This output and query was for the Cavium ThunderX nic_vf driver specifically.

> though, and my experience is mostly with i40e and ena drivers, so it
> could be incorrect when applied to your case.
>
> --Zvi
