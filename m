Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AD238986A
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 May 2021 23:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhESVKl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 May 2021 17:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhESVKk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 May 2021 17:10:40 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA074C06175F
        for <xdp-newbies@vger.kernel.org>; Wed, 19 May 2021 14:09:20 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id k4so3089304qkd.0
        for <xdp-newbies@vger.kernel.org>; Wed, 19 May 2021 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JQep4d4+RnvDcQjIAxC0fRbJIlK4zu89KMwgGi6Symw=;
        b=VZhcFdX+3VKGvcKbyTqLa6Ur/Fiu3fNnKY8GNGC32sLfHjZsQqQLlDg3883wQpXshk
         YKeS2v+FlMEoSrKZ65WH15a8I1LGqwWu4OKl36ypjE2EHbR/T2RUq2LnUjt9gWPyLnUf
         VHfh5c1lBXVcKGlnHHa6cpczgh0InF+1NHqU0RdRB3CxTS9SyyK8ZJDfjSO+8lMfTqoH
         bgS2NmTHdzNuhaVEiDi3r8pTeYwNfQ/NI7h0MJ26boDotPOsXsgHxVqf7cYZmTPAuZBt
         Iiid7kel2qQW3SPxmhUiAvsF33xjRZzEpnrstjLH1Lu8LjLfWrUbKW3910pbxVGBpirn
         Q7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JQep4d4+RnvDcQjIAxC0fRbJIlK4zu89KMwgGi6Symw=;
        b=B12UIDAYSnjE2h6DZ5vl8tuz04YZgZWBjjZwbWdD526V9+onv1xIQeyfzQobcv/lsk
         xKeYxyxlW7tn2dInAA6j2eGyDXwUNMi2yR+S0BaCO50bGNDk5x+4VFc3H9c6+jqTuNyn
         ig/Mey/v1QC1vYOP64RhZIHCyM4rz+RAEog45aPFUN+MJBxta727JVvY3nQL6WW7xIy+
         z+nEKmfj1lKcpdFTT972tUmlLaAUC8TkXFqrvDBXwTzElNyEqIXB6vdpD1h3EYa2Ja+t
         1pvrL84d0dnR8nvioMzWZK5/TkxvNVfGR6tMvmdpHH7N0CF6XvG1WXMSF+l4Z35azOtc
         jY6A==
X-Gm-Message-State: AOAM531E9JRVTsnHq4cZpie35bCxfR2KHK0+WEwL9733EXxN2dSCzqCE
        0/01plhhoKu7EiG6c5tUNuqosA==
X-Google-Smtp-Source: ABdhPJz+n8a1KGFp4LNdP7yhnjvjR77t0/JgkYy9HPj7XMik8jvaMDlVPd64w6Kci+3oegwJqqMEPg==
X-Received: by 2002:a05:620a:13ac:: with SMTP id m12mr1516770qki.77.1621458559973;
        Wed, 19 May 2021 14:09:19 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a? ([2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a])
        by smtp.gmail.com with ESMTPSA id a19sm516491qtn.97.2021.05.19.14.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 14:09:19 -0700 (PDT)
Message-ID: <da5422fe0fd031212d6e422177979354207aa609.camel@coverfire.com>
Subject: Re: Umem Questions
From:   Dan Siemon <dan@coverfire.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Date:   Wed, 19 May 2021 17:09:18 -0400
In-Reply-To: <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com>
References: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
         <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


> > 2) It looks like there is a limit of 2GB on the maximum Umem size?
> > I've
> > tried with and without huge pages. Is this fundamental? How hard
> > would
> > it be to increase this?
> 
> This was news to me. Do you know where in the xdp_umem_reg code it
> complains about this? I guess it is xsk_umem__create() that fails,
> or?
> The only limit I see from a basic inspection of the code is that the
> number of packet buffers cannot be larger than a u32 (4G). But you
> are
> not close to that limit.

Yes, the failure is in xsk_umem__create(). I don't know where
specifically but there are a couple spots in kernel side of that which
return ENOMEM which is the return value.

