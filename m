Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47DFC5EEB82
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Sep 2022 04:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbiI2CO3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Sep 2022 22:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbiI2COU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Sep 2022 22:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0721B122A74
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 19:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664417656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eCW9KL3vBxfDg7HvobNkW0lqNA/HJiSrx6HqI8xEZ/s=;
        b=DTZT/N/9BkAtK0dimOuq7XKZISibaCJGHAS83sDxSE9syNix7nB6tvdZUkfyb9BUWAIuTY
        jGrYkWvzDneGHm3dUq2ujTwUJGAMvSrzqPSaSvKsirwyuqKSrMo9t8W9PgTbvbZidv8ymS
        q4AJkmvIDj0KlttDZ5DWWmmOildXhYw=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-suNL2qWiO_SVDkqovQ1yXg-1; Wed, 28 Sep 2022 22:14:15 -0400
X-MC-Unique: suNL2qWiO_SVDkqovQ1yXg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1275c2d65feso118146fac.4
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 19:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eCW9KL3vBxfDg7HvobNkW0lqNA/HJiSrx6HqI8xEZ/s=;
        b=z81321UQq73z/mdaEs8h82YmmEHcjYoY77prx7fLzUgp5p6RLVwVqv11G5KCnQqFYd
         d4ipaunrzZRkF3zFi/VB6NxkozY2waf/w9vHJ66wQMdfrJ72x2VEL0q5QjP5vBcDaA/n
         2j48WgjU4mPNgF8W8LZ5uK0h0I5/pemO28n46oprvZA70giXGggnOzNjmVP3x4G1/f6G
         UvcTF1gk8QaDD3mYn0yxi2KQBD1BdXBJyDd/hsTooug3m0uUE8qHTp4A4dGQg7bApzMd
         XkwMgo1dEJC53gbUnW5cQ3JLi/DghIAajIuBV8gsgaIIP0KPxJaro3G1Fe7ncClnjFM0
         5+wQ==
X-Gm-Message-State: ACrzQf34M9p9MUiBD+QrqZeZDYOqJb8beZeCeL0mvbXPHkzKkmrKpf6N
        Nm/zCaxRwhgyR0rl/aCv9sYvtzlSaS1lA0yqVVp7ziMEIwakSvNCDwFmmvghWpD1GuiELSOThWa
        we9MbPrYoNP7w7D6EICtd8VrMcObYfUrd+JJhIkE=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id l16-20020a056830155000b0065968f7492bmr379961otp.237.1664417653906;
        Wed, 28 Sep 2022 19:14:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GbfSJ2XVlE6X7Lig+fPX5Rf96SErdXfELtPSoJlmowC1y0nS9+7xdo/klemPzTzv/JMOqckmVWatCuF7+nqM=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr379954otp.237.1664417653684; Wed, 28
 Sep 2022 19:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
 <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com> <2d2d13bd-da93-2e04-3fd1-a5fd4713d7df@kernel.org>
 <YzTMmGuZjiO8+dVu@lore-desk>
In-Reply-To: <YzTMmGuZjiO8+dVu@lore-desk>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 29 Sep 2022 10:14:02 +0800
Message-ID: <CACGkMEuzJ_gupygHkdmuDkH-upgTjea6rucwt0z97LHLMfsCew@mail.gmail.com>
Subject: Re: [xdp-cloud] Questions about Offloads and XDP-Hints regarding a
 Cloud-Provider Use-Case
To:     Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc:     David Ahern <dsahern@kernel.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net,
        brouer@redhat.com, Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Sep 29, 2022 at 6:37 AM Lorenzo Bianconi
<lorenzo.bianconi@redhat.com> wrote:
>
> > On 9/28/22 11:07 AM, Jesper Dangaard Brouer wrote:
> > >
> > > On 28/09/2022 15.54, Marcus Wichelmann wrote:
> > >>
> > >> I'm working for a cloud hosting provider and we're working on a new
> > >> XDP-based networking stack for our VM-Hosts that uses XDP to
> > >> accelerate the connectivity of our qemu/KVM VMs to the outside.
> > >>
> > >
> > > Welcome to the community! Sounds like an excellent use-case and
> > > opportunity for speeding up the RX packets from physical NIC into the
> > > VM.  Good to hear someone (again) having this use-case. I've personally
> >
> > +1

+1. This is somehow what I wanted to achieve in the past.

> >
> > > not been focused on this use-case lately, mostly because community
> > > members that I was interacting with changed jobs, away from cloud
> > > hosting companies. Good to have a user back in this area!
> > >
> > >
> > >> For this, we use XDP_REDIRECT to forward packets between the physical
> > >> host NIC and the VM tap devices. The main issue we have now is, that
> > >> our VM guests have some virtio NIC offloads enabled: rx/tx
> > >> checksumming, TSO/GSO, GRO and Scatter-Gather.
> > >
> > > Supporting RX-checksumming is part of the plans for XDP-hints, although
> > > virtio_net is not part of my initial patchset.
> >
> > Lorenzo and I both had versions of a patch to propagate rx csum
> > validation to the VM on xdp redirect. I do not recall a version after
> > this one:
> >
> > https://lore.kernel.org/netdev/cover.1622222367.git.lorenzo@kernel.org/
> >
> > and I lost of track of what change is needed for it to go in.
>
> iirc the blocking point was the missing CHECKSUM_COMPLETE support (we support
> just CHECKSUM_UNNECESSARY). We can conver it with XDP hw-hints.

How about other metadata like gso_type, gso_segs, csum_start and
csum_offset etc? This looks like a must for GSO to work even if
multi-buffer is supported.

Thanks

>
> Regards,
> Lorenzo
>
> >
> > >
> > > XDP-redirect with GRO and Scatter-Gather frames are part of the
> > > multi-buff effort (Cc Lorenzo), but currently XDP_REDIRECT with
> > > multi-buff is disabled (except for cpumap), because the lack of
> > > XDP-feature bits, meaning we cannot determine (in kernel) if receiving
> > > net_device supports multi-buff (Cc Kumar).
> > >
> > >> Currently, these offloads (especially TSO/GSO) are incompatible with
> > >> XDP_REDIRECT and result in packets being dropped. Because disabling
> > >> these offloads in all our customer VMs is not a good option, we're
> > >> searching for ways to support these offloads with XDP.
> > >>
> > >
> > > To David Ahern, didn't the kernel recently loosen up on having to
> > > disable these offloads for KVM virtio_net?
> >
> > not that I am aware. Still need tx offloads disabled.
> >
> >
> > This summarizes what I was looking into back in 2020, along with the
> > current state of XDP for VM use case:
> >
> > https://legacy.netdevconf.info/0x14/pub/slides/24/netdev-0x14-XDP-and-the-cloud.pdf
> >
> > source code is still on github too.
> >

