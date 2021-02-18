Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4862831EA06
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Feb 2021 13:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhBRMr0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 18 Feb 2021 07:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhBRKNY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 18 Feb 2021 05:13:24 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CED7C061756
        for <xdp-newbies@vger.kernel.org>; Thu, 18 Feb 2021 02:12:43 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id a132so2390928wmc.0
        for <xdp-newbies@vger.kernel.org>; Thu, 18 Feb 2021 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XdEKuorHa+UYLsTLm0963MlAjKKUGC+vCIKINm4H/VM=;
        b=h0kOyt4gYEu96FkxvSULbzVYNWvG1rikNjKjBFJvVqRgMzeTh2bjyr5eU2ez93TlgE
         Ic7sQwZ337nkbwmNHnZvCDWp71Nsrf5deXsnnEPUkutwabhEXUPlxSPSiZQPKLRvmxPJ
         G7Fz6lHoHU1OGyBVBf3GGkbDNg8GwH2SM4Iaj2kCzGcZhu5BCYYYu/mHv1QSGP06+AdO
         lwjTbc7EVlmdboMnI3L5emR7geCHC8PedHz6UmOWujzpLqxqkiUwKYojsUZ6RFFM2GNU
         3mqikKZCPQCl7K8SSSC7zi9qa5hQ/neWMVyXrKhnURr0Cbdaf8lhKan1/FV7sNXh+kKy
         0KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XdEKuorHa+UYLsTLm0963MlAjKKUGC+vCIKINm4H/VM=;
        b=RLDLY2XiN85lbXPyv+EMXzaZCAwvb6KH2E4Tu+OBNFHuUyiqMRpgddzgXTm7I1YLQU
         a1S9rte6Ga5VEaMMxlzFT7OLAJPJ3RE9reYLrfvpoJ+GYEznWF4FFpYQzW7qKKNdBY4H
         db9uVS8qkf2HHpDfpKLamAYpg2N35Ydtr473dHsKNVnTrdgUtF26TMFg6evmsIR65oM/
         uLB0d0qXoTZbiqV66oDqTTUR8kTw2dpwMv7nisYj6v4ovpWDwOPdMA91b7Y7VMj70+zR
         QGELb+zAUOxOwsBsavNtK88A5G4SMCPUtgVJr34JPMDxCw2Y99f+OmllW0wwLHjGZ3my
         LTIw==
X-Gm-Message-State: AOAM5309K2e8vk1o0TXeI/FptcrflkZ4FkRHpEVRG5bFS/8hJ8a5HsC/
        P/PQTIjX3qB6qM807aX9bv/bSA==
X-Google-Smtp-Source: ABdhPJyUA0UkUFwAAahfD5VoIk1GxbOcZ9s1OovON8yVJ92F5BtYXpZpN1lJZoWr3xDCi4yr2cuctw==
X-Received: by 2002:a1c:4e13:: with SMTP id g19mr2865591wmh.55.1613643162025;
        Thu, 18 Feb 2021 02:12:42 -0800 (PST)
Received: from netronome.com ([2001:982:7ed1:403:9eeb:e8ff:fe0d:5b6a])
        by smtp.gmail.com with ESMTPSA id i15sm6161977wmq.26.2021.02.18.02.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 02:12:41 -0800 (PST)
Date:   Thu, 18 Feb 2021 11:12:40 +0100
From:   Simon Horman <simon.horman@netronome.com>
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     Radu Stoenescu <radu.stoe@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Redirect from NIC to TAP
Message-ID: <20210218101239.GA7062@netronome.com>
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon>
 <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
 <20210209094137.GA14290@ranger.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209094137.GA14290@ranger.igk.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Maciej, Hi Radu,

On Tue, Feb 09, 2021 at 10:41:37AM +0100, Maciej Fijalkowski wrote:
> On Tue, Feb 09, 2021 at 11:26:06AM +0200, Radu Stoenescu wrote:
> > Hello
> > 
> > My physical NIC is a Netronome (I can come back with exact model type
> > and driver version).
> > 
> > Redirect NIC to TAP doesn't work when XDP is attached in driver mode.
> > It works when they are both in generic mode. I haven't tried other
> > combinations of attachment modes (one driver, other generic etc.).
> 
> Looks like Netronome driver still doesn't support XDP_REDIRECT in native
> mode.
> 
> CC: Simon

Sorry for the delay, I was on vacation.

> Simon, any plans on adding support for redirect?

Sorry (again), there are no immediate plans to add this feature
to the driver.

> > Thanks
> > 
> > On Tue, Feb 9, 2021 at 11:21 AM Jesper Dangaard Brouer
> > <brouer@redhat.com> wrote:
> > >
> > > On Tue, 9 Feb 2021 10:31:50 +0200
> > > Radu Stoenescu <radu.stoe@gmail.com> wrote:
> > >
> > > > Is it possible to redirect packets from XDP program attached in driver
> > > > mode to a physical NIC to a TAP interface?
> > >
> > > Cc. Jason Wang as I think he implemented this, but I'm not 100% sure.
> > > Maybe Jason can remember?
> > > (or point me to the relevant code that I can check).
> > >
> > > > The same works fine if the XDP programs are attached in generic mode.
> > >
> > > So, you have tried and it doesn't work.
> > >
> > > What is your setup?
> > >
> > > --
> > > Best regards,
> > >   Jesper Dangaard Brouer
> > >   MSc.CS, Principal Kernel Engineer at Red Hat
> > >   LinkedIn: http://www.linkedin.com/in/brouer
> > >
> > 
> > 
> > -- 
> > Radu Stoenescu
