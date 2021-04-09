Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D3E359C56
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 12:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbhDIKvJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 06:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDIKvJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 06:51:09 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B988C061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 03:50:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u9so5899863ljd.11
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tqDob/0HKqeHP56eVnb1NuMTHQjc1DuUYHNkYX8t6XA=;
        b=XY3iP1ypkaQW3hCji+IzxY4R8xrTJwfQOR/OeOHma3Mkuc0dLbIVsJnhEaf/0tOwgi
         GY1nPzSM8QbP3y9LOerm89yR+X/kYQTgBJs6QKVK76M8ljlwG2kjP4gNEWCcZkJRJNxf
         qmC8Y9OUxiOjnM6Q4mjS1QOT4LJKx+nkroKTvCcRR3KmyHcDb3yDUJK7Y6xMWzrJHWi3
         ho5cNW74HxZhBLVf7G6ozHpNghvpXY/PvTFLzT9vwoU/VWBdT2rXdwjaon/fCfhj6xOR
         IXddtfb87+6PYNbN0YmwT7DUxHMPGt8LGyuW6FvwHzchsbIRwBLWV8Dxjx4UheOIVgeH
         Izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tqDob/0HKqeHP56eVnb1NuMTHQjc1DuUYHNkYX8t6XA=;
        b=PI2zb7PhLp6Cps9RbIWFUaB+Q3DQ2jGkJQyy3KhMkufQ1v7jBZDxuqjuUR4UxX2dR9
         vzqQrfrbSZzEK2Q8WSEGyD+IEODIsF82npCnw/Ocqdb5Urp+Bklbjo93Cbe34U5MUOCm
         zz1gXRSy4JC5GypgszFT8RbTcOInz5kOdkgduqiUS30gYoX3IwLC4jM//nAp5ExPou1Y
         y7R92w8xUVv6YGyKPrQtAJL/yalC8ZbLArDfJ68C8pzt7YetdXPHSrKL1QEyf+6TG4sm
         TCJ+S90eGZo+HN/qF5xFkjz5K5B5f0ezmUSZiFHBdNWSaELiQDobHmLYO1Fi/EWq5qiD
         zLfw==
X-Gm-Message-State: AOAM533eCV/vrRMMTrqQ1lcnPBwquBDci7F+Zsyel8sQCVlYOxpVWi4Q
        BIVoSGeX1ROzx7qZwIrNv1kG966uTGTwsYeiv7c=
X-Google-Smtp-Source: ABdhPJzZUcxh1t0LQUhfBhwGLtxkc48MrqtBO5WfLpT4i5YNy0/Xj3+DD9D5qctPW7S7IXU5Rv+hLjyDXICQ6a+Z1Dg=
X-Received: by 2002:a2e:910b:: with SMTP id m11mr9014867ljg.179.1617965454940;
 Fri, 09 Apr 2021 03:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
 <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
 <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
 <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com> <CAJ8uoz3ipXOE2VeMLh02R0FKysuovLf3vFU_z5nEOffHNps1=g@mail.gmail.com>
In-Reply-To: <CAJ8uoz3ipXOE2VeMLh02R0FKysuovLf3vFU_z5nEOffHNps1=g@mail.gmail.com>
From:   ratheesh kannoth <ratheesh.ksz@gmail.com>
Date:   Fri, 9 Apr 2021 16:20:43 +0530
Message-ID: <CAGZFCEGzm5M=pnuXrA5vXGfntX8BOtyVfVK2hmANVfAn7b79=Q@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 3:50 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
> Then looking at user-space code will not help you :-). Take a look at
> the code in driver/net/ethernet/intel/i40e/i40e_xsk.c in the Linux
> kernel for an example on how to DMA map the umem.

Thanks, i could see that it is pinning the pages and mapping.

Using Kernel DMA api, we can map the virtual memory. But how the NIC
can write/read to the memory if it is not physically contiguous. NIC
card only understand physical addresses. Correct me.

> > > > > /Magnus
