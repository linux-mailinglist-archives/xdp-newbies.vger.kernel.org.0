Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5A0349C2A
	for <lists+xdp-newbies@lfdr.de>; Thu, 25 Mar 2021 23:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhCYWSQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 25 Mar 2021 18:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCYWRn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 25 Mar 2021 18:17:43 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412C3C06174A
        for <xdp-newbies@vger.kernel.org>; Thu, 25 Mar 2021 15:17:43 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id l13so2926501qtu.9
        for <xdp-newbies@vger.kernel.org>; Thu, 25 Mar 2021 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xRxnRAbxLi/PNkirnYjeoihyfoAjO6Qd0P49C6A0FD8=;
        b=FiQkSkFi0uaKwCwNDl1iywTnp+kVKmpM40u63HeqJbN8T8t7l3zGurQuFGbkCMJYj1
         4LrsjjDlbN6bbOmNbVwDM7JqzXeXqhSvp0FqO0dRsyx3YGmAd+pWX/ev8xgugkKrrSVE
         yeoy4o8bd2tdQjlVSnEyebY/Dbzfvaf2n/99JI3TbUg0raiLScaZQ034as2KHkPW2sWc
         o6oGNilyrGKIyySuPLseqGKqU1yLTw725yzVRWD40OFJI/dq/V2mlybKN5wyuEsk9tOL
         KOYrfZNREyuChdH78eMLP1GTzEtKvXT60AAu8m+fKTONTebRbD0bVz1df/bUApjZ3ukK
         j6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xRxnRAbxLi/PNkirnYjeoihyfoAjO6Qd0P49C6A0FD8=;
        b=WbyV9MrwD8vyphfyF6zgQFm5OBiKzOPChVgMqTfsekJrIwXuVQY43k8VarJQn2pciZ
         3j67jm8Bl5d5C/lzz+hAofFF2sLT8D/ys6skn7DaqTxXt1y6WHibUATkm4vun8haaPdq
         cVWSAmk493O8rcIqdkioRDm21r/33369ORRE6f+PDicML5Odo+2fJxP38OyUJGLz9g13
         tnsqwhaQgwfNOOk7ugbLJrY4CexKRm7CDhSJs50x4RW/tKHVNLN78O4Q1vIpeA2DipIk
         K11p/fVQZRZfYZykhpw20iWXmzD3JnEtv0pPLDV0QH3geRGC2uJGOb8cY2NL4rWU3RgV
         V7tQ==
X-Gm-Message-State: AOAM530Ehf9k9h6kX4a5bPHI9clxKFX5jQAF8gQBBQOK3eNI4fUy10kJ
        1TjYO//NgUdA5uZIpLw2jf4Rqw==
X-Google-Smtp-Source: ABdhPJxi93MTHImp5mW1sU+8INdcYerBzBSdaSCu3df+DrzpbJmua/lxnvmug4hhi5YFF2hBGXQxzA==
X-Received: by 2002:ac8:5c07:: with SMTP id i7mr9913863qti.322.1616710662558;
        Thu, 25 Mar 2021 15:17:42 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:5524:727c:ba55:9558? ([2607:f2c0:e56e:28c:5524:727c:ba55:9558])
        by smtp.gmail.com with ESMTPSA id j26sm4536581qtp.30.2021.03.25.15.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:17:42 -0700 (PDT)
Message-ID: <eb19b630c087ba6497f2a0a627c232d45a5af22f.camel@coverfire.com>
Subject: Re: AF_XDP (i40e) behavior change in 5.11?
From:   Dan Siemon <dan@coverfire.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Date:   Thu, 25 Mar 2021 18:17:40 -0400
In-Reply-To: <CAJ8uoz3n=R2KZagznZ9XK+tVwdpMoeqY8CqJxyqh1B508bqntw@mail.gmail.com>
References: <35a931df0e2cb4bf1fd23ecc15895419c7ca0e3c.camel@coverfire.com>
         <CAJ8uoz3n=R2KZagznZ9XK+tVwdpMoeqY8CqJxyqh1B508bqntw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 2021-03-24 at 11:00 +0100, Magnus Karlsson wrote:
> On Wed, Mar 24, 2021 at 10:22 AM Dan Siemon <dan@coverfire.com>
> wrote:
> > 
> > ./xsk_fwd -i ens1f0 -q 2 -i ens1f1 -q 2 -c 5 -i ens1f0 -q 3 -i
> > ens1f1 -
> > q 3 -c 6
> > 
> > On 5.10, the cores (2,3) assigned interrupts for the queues (2,3)
> > are
> > idle when there is no traffic.
> > 
> > On 5.11, the cores immediately go to 100% system time when the
> > program
> > starts (as viewed in htop). There is no network traffic.
> > 
> > Intel 710/i40e.
> > 
> > I tried this with xsk_fwd built from 5.10 and 5.11 trees with the
> > same
> > result.
> > 
> > Is this behavior change expected?
> 
> Thanks for reporting this. No, this is not intentional. I did send up
> a fix for a bug in the i40e driver that was introduced in 5.11. It
> might be the culprit. Could you please try the patch below and see if
> it works? It is not yet in net.
> 
> https://www.spinics.net/lists/netdev/msg729128.htm

Hi Magnus,

It appears (quick testing) that the patch fixes the problem.

Thanks.

