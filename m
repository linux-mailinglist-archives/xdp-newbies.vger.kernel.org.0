Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B211F87C6
	for <lists+xdp-newbies@lfdr.de>; Sun, 14 Jun 2020 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgFNIzn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 14 Jun 2020 04:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgFNIzn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 14 Jun 2020 04:55:43 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F1CC03E969
        for <xdp-newbies@vger.kernel.org>; Sun, 14 Jun 2020 01:55:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so14067865wrc.7
        for <xdp-newbies@vger.kernel.org>; Sun, 14 Jun 2020 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llpwFJx7bM20R9a6/mhnv06HJ/te3x1vavOQOVX/2CQ=;
        b=S7dzRgrpCv/EKte3nuNXBUVvfSn6Nl5+56xXsIBrcFZDTH6ry7SkYeor2FuubMsuYY
         4mgvYdZm1Sq8pCyD5XWASNJDqsrY9l6aIueXdnoj+HjjZ6OTB40a0jigH72PgSqypvSa
         VckOVTMG2I+N2BVFHFIgtJc106U7SFL0UHTVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llpwFJx7bM20R9a6/mhnv06HJ/te3x1vavOQOVX/2CQ=;
        b=Dgz40Zrfkq9L43bzK+ovXNEsDF5JBzN2T4u81Ozpoyq0DsIPKSTe3l0b9avYy41St+
         ljvZ/ib3p0AzuXHExlORmYaZFz9SRqISRJbVJ5BXCv1FXuNqmgxGMngxH2WYyjBUUYX8
         2hRUYij4uqAparpnhIdnfzLY7PFhcAHrnvYsWtPrKG28a9UX4mZK2LIH18if8SZKWcyX
         kCO/wkjudSF+Gb8dDgTe9F+P52gtc/lfGIAnNXdCrLTpRk1l1BMaH5srbJ0SdyaVATzs
         KGprziXTw/CTKNI56YH65ETFmba7gODa2i9Gv3sGr6QVWZy6fRgjQXJsMxT4GTlPwx0b
         NuVg==
X-Gm-Message-State: AOAM533NNvIlowimL1yixON/bxBp7xr7EuqvbI/4DGtfvXvz3ZRh+24g
        g+fCe8mxVv5o0bM365vLl0BFisA6mpa3ovgyl2+aFQ==
X-Google-Smtp-Source: ABdhPJyHz5Bhhj8GoMeDgXuhUhmcgBPzIWtD0lcvZ73CyDndfoVYYyIdA6vV0AaurwANQRaXjov6ypLV5gq6aCZtlxw=
X-Received: by 2002:a05:6000:1202:: with SMTP id e2mr22446338wrx.231.1592124941461;
 Sun, 14 Jun 2020 01:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mMi2jYAOCrGhpkRVybz0sDpOSkLFCZfVe-2wOcAO_MqQ@mail.gmail.com>
 <CAHApi-=YSo=sOTkRxmY=fct3TePFFdG9oPTRHWYd1AXjk0ACfw@mail.gmail.com>
 <20190902110818.2f6a8894@carbon> <fd3ee317865e9743305c0e88e31f27a2d51a0575.camel@mellanox.com>
In-Reply-To: <fd3ee317865e9743305c0e88e31f27a2d51a0575.camel@mellanox.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Sun, 14 Jun 2020 10:55:30 +0200
Message-ID: <CAHApi-k=9Szxm0QMD4N4PW9Lq8L4hW6e7VfyBePzrTgvKGRs5Q@mail.gmail.com>
Subject: Re: net/mlx5e: bind() always returns EINVAL with XDP_ZEROCOPY
To:     Saeed Mahameed <saeedm@mellanox.com>
Cc:     "brouer@redhat.com" <brouer@redhat.com>,
        Maxim Mikityanskiy <maximmi@mellanox.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "toke.hoiland-jorgensen@kau.se" <toke.hoiland-jorgensen@kau.se>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Tariq Toukan <tariqt@mellanox.com>,
        "gospo@broadcom.com" <gospo@broadcom.com>,
        "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "bjorn.topel@intel.com" <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Saeed,
Thanks for explaining the reasoning behind the special mlx5 queue
numbering with XDP zerocopy.

We have a process using AF_XDP that also shares the network interface
with other processes on the system. ethtool rx flow classification
rules are used to route the traffic to the appropriate XSK queue
N..(2N-1). The issue is these queues are only valid as long they are
active (as far as I can tell). This means if my AF_XDP process dies
other processes no longer receive ingress traffic routed over queues
N..(2N-1) even though my XDP program is still loaded and would happily
always return XDP_PASS. Other drivers do not have this usability issue
because they use queues that are always valid. Is there a simple
workaround for this issue? It seems to me queues N..(2N-1) should
simply map to 0..(N-1) when they are not active?

Kal


On Tue, Sep 3, 2019 at 10:19 PM Saeed Mahameed <saeedm@mellanox.com> wrote:
>
> On Mon, 2019-09-02 at 11:08 +0200, Jesper Dangaard Brouer wrote:
> > On Sun, 1 Sep 2019 18:47:15 +0200
> > Kal Cutter Conley <kal.conley@dectris.com> wrote:
> >
> > > Hi,
> > > I figured out the problem. Let me document the issue here for
> > > others
> > > and hopefully start a discussion.
> > >
> > > The mlx5 driver uses special queue ids for ZC. If N is the number
> > > of
> > > configured queues, then for XDP_ZEROCOPY the queue ids start at N.
> > > So
> > > queue ids [0..N) can only be used with XDP_COPY and queue ids
> > > [N..2N)
> > > can only be used with XDP_ZEROCOPY.
> >
> > Thanks for the followup and explanation on how mlx5 AF_XDP queue
> > implementation is different from other vendors.
> >
> >
> > > sudo ethtool -L eth0 combined 16
> > > sudo samples/bpf/xdpsock -r -i eth0 -c -q 0   # OK
> > > sudo samples/bpf/xdpsock -r -i eth0 -z -q 0   # ERROR
> > > sudo samples/bpf/xdpsock -r -i eth0 -c -q 16  # ERROR
> > > sudo samples/bpf/xdpsock -r -i eth0 -z -q 16  # OK
> > >
> > > Why was this done? To use zerocopy if available and fallback on
> > > copy
> > > mode normally you would set sxdp_flags=0. However, here this is no
> > > longer possible. To support this driver, you have to first try
> > > binding
> > > with XDP_ZEROCOPY and the special queue id, then if that fails, you
> > > have to try binding again with a normal queue id. Peculiarities
> > > like
> > > this complicate the XDP user api. Maybe someone can explain the
> > > benefits?
> >
>
> in mlx5 we like to keep full functional separation between different
> queues. Unlike other implementations in mlx5 kernel standard rx rings
> can still function while xsk queues are opened. from user perspective
> this should be very simple and very usefull:
>
> queues 0..(N-1): can't be used for XSK ZC since they are standard RX
> queues managed by kernel  and driver
> queues N..(2N-1): Are XSK user app managed queues, they can't be used
> for anything else.
>
> benefits:
> - RSS is not interrupted, Ongoing traffic and Current RX queues keeps
> going normally when XSK apps are activated/deactivated on the fly.
> - Well-defined full logical separation between different types of RX
> queue.
>
> as Jesper explained we understand the confusion, and we will come up
> with a solution the fits all vendors.
>
> > Thanks for complaining, it is actually valuable. It really illustrate
> > the kernel need to improve in this area, which is what our talk[1] at
> > LPC2019 (Sep 10) is about.
> >
> > Title: "Making Networking Queues a First Class Citizen in the Kernel"
> >  [1] https://linuxplumbersconf.org/event/4/contributions/462/
> >
> > As you can see, several vendors are actually involved. Kudos to
> > Magnus
> > for taking initiative here!  It's unfortunately not solved
> > "tomorrow",
> > as first we have to agree this is needed (facility to register
> > queues),
> > then agree on API and get commitment from vendors, as this requires
> > drivers changes.  There is a long road ahead, but I think it will be
> > worthwhile in the end, as effective use of dedicated hardware queues
> > (both RX and TX) is key to performance.
> >
