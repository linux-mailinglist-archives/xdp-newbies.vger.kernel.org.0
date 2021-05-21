Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CAD38CD12
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 May 2021 20:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhEUSTB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 May 2021 14:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbhEUSTA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 May 2021 14:19:00 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40312C061574
        for <xdp-newbies@vger.kernel.org>; Fri, 21 May 2021 11:17:34 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id 1so15988721qtb.0
        for <xdp-newbies@vger.kernel.org>; Fri, 21 May 2021 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gwczo3gw1nE366oVnwDQKi6l70C4XM6fFeoPRrnj/Zw=;
        b=j/pp2KdbkQKb6MHzlsxEo2rc890ulpNqpcJL07H8Aev5FIZDmhAgGkGgblC6gpsJ+j
         agSnASzcm1kXPeY21iAGyZez38OF+B43vfTOI5XlylcRQmTYCtRPuLL7pHG+PX+Du7WX
         t8R8QfnQYQyfo5XkfYyz7cGYWfITrbTBO/aWNr7u0CJV8ACBw/vfXIXrxozjD99O/NOb
         RZfpSWX5iAzMfaAOfjbkF5j7z/ry/krxh7c3sVkAGIj3TPVEIqk8GJsJZ1kfCMVzivbT
         YAPlqmcEnhaQsL1LJzpUlugNaF2DoDmQHWdcZpGen8/A0u/0w17GkwEwK7nEgqCw16Ww
         qLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gwczo3gw1nE366oVnwDQKi6l70C4XM6fFeoPRrnj/Zw=;
        b=jx9sX9hwk7UgUFNawCI+1IOZ+SkonhPeamiV6zeA8xKqg5gZeNEdlfE6JXD4FCOTly
         t0e0umn9GBNvW80W0qcV+M0aVZq89xx8roLGRk0PsWaS7eDo0eMDAuuBflbaLCWti8/4
         UoY+2RpGyaJo41oGoskx+hlJPyxHHn7kgVhRlWbxr2e0OYf59bpXzKzR5Km49XZO7iIO
         za13qu2p0XVISxXs0RfGPkooJ4N4aYcYZErRsjkXEyj0JD8kphqna71FT1cm5CAVczxs
         1QW2Fsly5gFvFeA6S7ZkzggnSTuiXsffb58WhOdxdswa6y8nMPZX9h6+YJVNN11zvJ8a
         ZZ9w==
X-Gm-Message-State: AOAM533heg7ug1DZ+xoymF83B9yVHmKgqkGnBmkk/PMFccZv6MegZd66
        vu2jDvlzqgKWUtqCN8QmMhPbIIlMYPb7fg==
X-Google-Smtp-Source: ABdhPJzMFtUWhE+DdX+4oUKt0YVMXDM4siS8VJ7EO6vTli765WpyVT7Eyj9GLXPYVwqdfebNfjmQmg==
X-Received: by 2002:ac8:6bd7:: with SMTP id b23mr10831400qtt.201.1621621053331;
        Fri, 21 May 2021 11:17:33 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a? ([2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a])
        by smtp.gmail.com with ESMTPSA id g1sm4771090qtj.44.2021.05.21.11.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:17:32 -0700 (PDT)
Message-ID: <28b9bb250f204022d3400a447ad6b9f04922dec2.camel@coverfire.com>
Subject: Re: Umem Questions
From:   Dan Siemon <dan@coverfire.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>
Date:   Fri, 21 May 2021 14:17:31 -0400
In-Reply-To: <CAJ8uoz1Q-a8wS0nb=iCBjrgqzNT0ww8sPbT1tgF0kbBxEhG2sw@mail.gmail.com>
References: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
         <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com>
         <da5422fe0fd031212d6e422177979354207aa609.camel@coverfire.com>
         <CAJ8uoz023wsbt9mfa2V96kFgkQJiUqj-TG4etbyszWNh1u4qww@mail.gmail.com>
         <CAJ8uoz1=H8-vNajPaGoBYLKHAypT_DePb-G=9QzQXsQ4841eow@mail.gmail.com>
         <CAJ8uoz1Q-a8wS0nb=iCBjrgqzNT0ww8sPbT1tgF0kbBxEhG2sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> 
> Could you please check if this one fixes it for you?
> 
> diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
> index 56a28a686988..f01ef6bda390 100644
> --- a/net/xdp/xdp_umem.c
> +++ b/net/xdp/xdp_umem.c
> @@ -27,7 +27,7 @@ static void xdp_umem_unpin_pages(struct xdp_umem
> *umem)
>  {
>         unpin_user_pages_dirty_lock(umem->pgs, umem->npgs, true);
> 
> -       kfree(umem->pgs);
> +       kvfree(umem->pgs);
>         umem->pgs = NULL;
>  }
> 
> @@ -99,8 +99,7 @@ static int xdp_umem_pin_pages(struct xdp_umem
> *umem,
> unsigned long address)
>         long npgs;
>         int err;
> 
> -       umem->pgs = kcalloc(umem->npgs, sizeof(*umem->pgs),
> -                           GFP_KERNEL | __GFP_NOWARN);
> +       umem->pgs = kvcalloc(umem->npgs, sizeof(*umem->pgs),
> GFP_KERNEL | __GFP_NOWARN);
>         if (!umem->pgs)
>                 return -ENOMEM;
> 
> @@ -123,7 +122,7 @@ static int xdp_umem_pin_pages(struct xdp_umem
> *umem, unsigned long address)
>  out_pin:
>         xdp_umem_unpin_pages(umem);
>  out_pgs:
> -       kfree(umem->pgs);
> +       kvfree(umem->pgs);
>         umem->pgs = NULL;
>         return err;
>  }

Hi Magnus,

Thanks for looking at this. Yes, this patch allows me to create a much
larger Umem. I tried up to 32 GB.

I have not yet run any tests that extensively use the larger Umem.

Thanks again.

