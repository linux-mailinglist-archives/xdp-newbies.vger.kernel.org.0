Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA3A389D8D
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 May 2021 08:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhETGQI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 20 May 2021 02:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhETGQI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 20 May 2021 02:16:08 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2618EC061574
        for <xdp-newbies@vger.kernel.org>; Wed, 19 May 2021 23:14:46 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso4696998pjb.5
        for <xdp-newbies@vger.kernel.org>; Wed, 19 May 2021 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5G7ReAIDrwQP5rVgX/cReTWCa3m/pt11N0uWE7bb4A=;
        b=DhJq4td20f3vPB9Z5D/Uw9/APOi3DZY1Uksoj/dgR4PyxVfwtrNmkMQ/UMiIF3Xk+3
         SD/ZpFP5kDhCTvNQCyi1MY0JQcJynL3kCLHd3LQSfQ6xWv4ripxbeXQdyjmONBxAzee3
         jm60cqFgVLYLtySJkFd/RmwYEmkNvMon9/cILwr4dfIgvfvPVmrXS2TJ1XweetlZoBEf
         gT8ZLizqFd7HCtFgGqqrbes6f/LwVmFAcUL+sv2mB5Wf1jzGqe1d3aR/rMAwzEEmSKs7
         zn1RhYFycCuanoj6OevGSxUaeQGFQMKUOx2OUTi7JQMbXF3jxD9Gc0OS77EN42na4sJr
         wuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5G7ReAIDrwQP5rVgX/cReTWCa3m/pt11N0uWE7bb4A=;
        b=mKP1qRQe73BHRtj1n+X5ZSMC7QIbfkz0wjzpEPO8VMs6iX+2NY6hbL0KvScp4LaotD
         /wTlZuTAcAKUyTCGFUpePlwHywIKoDlprJKsFbjRcpEf9EVOQfKNdHLa8wGV+9xhM9+P
         yyIW3IU2+nXztwCkHh7GzVjo9bBhAOegpwQgy1divbs9mBD/ZvwjrUP2Nz3SHsIyGw29
         dThtzBYdM+23PKk34uBNND8bKjMD1VBZBQeTz1I0ZdpycIDLDdrL8nn6Pj2Y2c2O/0Ub
         pQyqNpOlJHVAA/zqTMHv3rob47TV5j5ismHSN0nC8axdYjDTYazyyVM0S0e9Sx9DmYug
         YGHw==
X-Gm-Message-State: AOAM532alAoglJUhzmCrM5ypqMkQgSiFeapIzsORjG9HyQ6ZlYC+hNRR
        Pd0skOKpQZAZ4N9i782oC/nvs9WeycZ1yzhQijADDOPEUwXczxCE
X-Google-Smtp-Source: ABdhPJyAp44WoMo7z2qI2fEMmeVT0hsASQk2cEyP53AZSg+wkk+hktIx7c+GdKrvLsssaK3XuSVf7CtX/eg7vern0YA=
X-Received: by 2002:a17:902:b412:b029:ef:1737:ed with SMTP id
 x18-20020a170902b412b02900ef173700edmr4010696plr.43.1621491285533; Wed, 19
 May 2021 23:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
 <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com> <da5422fe0fd031212d6e422177979354207aa609.camel@coverfire.com>
In-Reply-To: <da5422fe0fd031212d6e422177979354207aa609.camel@coverfire.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 20 May 2021 08:14:34 +0200
Message-ID: <CAJ8uoz023wsbt9mfa2V96kFgkQJiUqj-TG4etbyszWNh1u4qww@mail.gmail.com>
Subject: Re: Umem Questions
To:     Dan Siemon <dan@coverfire.com>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, May 19, 2021 at 11:09 PM Dan Siemon <dan@coverfire.com> wrote:
>
>
> > > 2) It looks like there is a limit of 2GB on the maximum Umem size?
> > > I've
> > > tried with and without huge pages. Is this fundamental? How hard
> > > would
> > > it be to increase this?
> >
> > This was news to me. Do you know where in the xdp_umem_reg code it
> > complains about this? I guess it is xsk_umem__create() that fails,
> > or?
> > The only limit I see from a basic inspection of the code is that the
> > number of packet buffers cannot be larger than a u32 (4G). But you
> > are
> > not close to that limit.
>
> Yes, the failure is in xsk_umem__create(). I don't know where
> specifically but there are a couple spots in kernel side of that which
> return ENOMEM which is the return value.

Can you issue a "ulimit -a" on your system and share the result? Just
to verify that there is no per process limit that kicks in.
