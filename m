Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9818E32715A
	for <lists+xdp-newbies@lfdr.de>; Sun, 28 Feb 2021 07:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhB1Gz7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 28 Feb 2021 01:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhB1Gz7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 28 Feb 2021 01:55:59 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE14C06174A
        for <xdp-newbies@vger.kernel.org>; Sat, 27 Feb 2021 22:55:18 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 105so13429881otd.3
        for <xdp-newbies@vger.kernel.org>; Sat, 27 Feb 2021 22:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sTTX4AXanYvUOyG045wSmsxiEZwKY/VjiLqYf9UQzVU=;
        b=Iz5FoQSx+Uu9MLoZfdz4tuBdto9tzrWv2D4NX1AeZjSc/Gk4StrbfYUEbJE1lA0vWx
         4qodruwBoC7nKrRUzdDHxlI5Tsixh70zqJlwO1Q9O6bWXckjcow92gUHCaP7/DbMMlqH
         Jzz1caODsmOulqzsTAr+f/82fOswWdvd1vw+lsnxlNe469tgYviMbpq/N4/rj6+xlOIW
         w9OIitRCcsfbdF1dbhOCIkVmGfOgkPSFp+QiElOXG9TJ7xvt2JQLyfR5P401yBeuqHVn
         Z+nRInJU2LH5oEhkJ6E7GreQ2BKO6aN/R3NqvD8ZfabB8MIoHpI/7SiZV8s0BbAFt/tC
         8F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sTTX4AXanYvUOyG045wSmsxiEZwKY/VjiLqYf9UQzVU=;
        b=LpuZlltII9ztkmSICjxKN+fdp+lSYFMevGkp+RUoNFsrmCY5aH7UENXrbs3D9qTdAE
         AECTJk6DM39Qdw5U/ZBhXzk5o2vVQmbvmdSR1AX+pMWGTS7afMSdjriDCqScafE1QQYW
         6MWjE7urIKqvGW6oGN0ZgxfoWlJVF+vXC3okn1bj+0kTb6auojtvoaTngxPAvi+VZ0FC
         Dk+/MbQqw9uRgd0NdIoWa1DC4d8uZ2FeRlcYgPPWSxePX9sg3tpXc2PCzxGj92Eqfqmd
         NOY7d7Cy1TyEgwFeLgDF+hSMLcgWQ1Fy12708DTDhZck0sa4wpwkn1rZqh0xHV9WRKIy
         HnJw==
X-Gm-Message-State: AOAM530bDTrjs7u/AJeRkSWtlgAXnaBbMX+AaFP27ikVpbkN4a9NFkkD
        nMsGTuXQk9kmvwOFFiI+YnZe04YEst07/PrD2aWUZgQiK7Y=
X-Google-Smtp-Source: ABdhPJxkRZ4m3GNfunoqsHDoyrqwap9EQA/niO48u6TpA29txkUHLvQMOGe2zKatn2GNy7bGlPMxNqpk1Ru7U0dPdU0=
X-Received: by 2002:a9d:225:: with SMTP id 34mr8732020otb.337.1614495317905;
 Sat, 27 Feb 2021 22:55:17 -0800 (PST)
MIME-Version: 1.0
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon> <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
 <20210209094137.GA14290@ranger.igk.intel.com> <20210218101239.GA7062@netronome.com>
In-Reply-To: <20210218101239.GA7062@netronome.com>
From:   Radu Stoenescu <radu.stoe@gmail.com>
Date:   Sun, 28 Feb 2021 08:55:04 +0200
Message-ID: <CAM-scZPjB4QFTNPfbzD0DNmrfKMKUPMnnH+gSRFRk6jH4_WswA@mail.gmail.com>
Subject: Re: Redirect from NIC to TAP
To:     Simon Horman <simon.horman@netronome.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks a lot for the info.

In retrospect, was there a way I could reach this conclusion myself
(no driver support)? I'm asking this since I'm relatively new to the
environment and we run various NICs from various vendors, and I would
like to know how to perform the "due diligence" myself before reaching
out?

Best
Radu


On Thu, Feb 18, 2021 at 12:12 PM Simon Horman
<simon.horman@netronome.com> wrote:
>
> Hi Maciej, Hi Radu,
>
> On Tue, Feb 09, 2021 at 10:41:37AM +0100, Maciej Fijalkowski wrote:
> > On Tue, Feb 09, 2021 at 11:26:06AM +0200, Radu Stoenescu wrote:
> > > Hello
> > >
> > > My physical NIC is a Netronome (I can come back with exact model type
> > > and driver version).
> > >
> > > Redirect NIC to TAP doesn't work when XDP is attached in driver mode.
> > > It works when they are both in generic mode. I haven't tried other
> > > combinations of attachment modes (one driver, other generic etc.).
> >
> > Looks like Netronome driver still doesn't support XDP_REDIRECT in native
> > mode.
> >
> > CC: Simon
>
> Sorry for the delay, I was on vacation.
>
> > Simon, any plans on adding support for redirect?
>
> Sorry (again), there are no immediate plans to add this feature
> to the driver.
>
> > > Thanks
> > >
> > > On Tue, Feb 9, 2021 at 11:21 AM Jesper Dangaard Brouer
> > > <brouer@redhat.com> wrote:
> > > >
> > > > On Tue, 9 Feb 2021 10:31:50 +0200
> > > > Radu Stoenescu <radu.stoe@gmail.com> wrote:
> > > >
> > > > > Is it possible to redirect packets from XDP program attached in driver
> > > > > mode to a physical NIC to a TAP interface?
> > > >
> > > > Cc. Jason Wang as I think he implemented this, but I'm not 100% sure.
> > > > Maybe Jason can remember?
> > > > (or point me to the relevant code that I can check).
> > > >
> > > > > The same works fine if the XDP programs are attached in generic mode.
> > > >
> > > > So, you have tried and it doesn't work.
> > > >
> > > > What is your setup?
> > > >
> > > > --
> > > > Best regards,
> > > >   Jesper Dangaard Brouer
> > > >   MSc.CS, Principal Kernel Engineer at Red Hat
> > > >   LinkedIn: http://www.linkedin.com/in/brouer
> > > >
> > >
> > >
> > > --
> > > Radu Stoenescu



-- 
Radu Stoenescu
