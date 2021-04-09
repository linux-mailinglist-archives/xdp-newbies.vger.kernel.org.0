Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B6C359B11
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 12:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbhDIKHV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 06:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233680AbhDIKEC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 06:04:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762DFC0613E2
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 03:01:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u9so5747455ljd.11
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWDtTMLkuFS+AnWCsb6pFBM6Spk+lQ5gPsb4rm0+A9A=;
        b=WuxdafYPAuSqFKyyJngbi9/075+Kk3xUsJWELQaQn9d/LLJPKW74yGHxl72BI6SveS
         rVCX/OmC0H54qaqcrtsmBusTksfo4L8VIRrVAWSy60MmRuP8KJIyJbhXVL/mI8eUOPc0
         cQr2+0LspfLbOczu9N3a589eRk/gnOjGDEhC6YiNi8gh1bWwaRvQeMYX+3CwAddAF2n7
         J9q53h32iJo5DyDxI7YaJsGsWHfCsPoNbLFN6vXlIbl0PRDEGvvcLP8eY9dzvX50HQH5
         8QFfHUA36LdfkzIJ2jTtJXZIk9mgTkRk3EBWnJXWlP0bCj7nJFYVV/o/Bmj0HHhBYFTs
         e4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWDtTMLkuFS+AnWCsb6pFBM6Spk+lQ5gPsb4rm0+A9A=;
        b=aqj3nCGIoVVNZwX3If6GszrxPRiiNPBuPQw4xsQee02yJ8sz3pMU1xzqNxgU+TfrZy
         FlyJ8dRXU04UyWl/tg3Jn3/Uh955t2VlCs4WAba3MPgPninR1TsIGdl+5wS+tkw7+lLE
         X0iRb+/ZnQTHCPQxhyN8W7Bqvhn8f5foyKkLjhQBSL3D1Zjui8+pp+D2rX7/Wm2+Zrbh
         2csDP86ZHKGynYsXPDxTzSXf5IgkKDZLkB1W37ta04lz5sDwAllwmffOBthF5k8q/7jf
         EjRuLRCVmCKNpLvJarLhWgEa9Z2Ats6lm1njK8p/fl54xdLshpdb6atSVGUZUE5nMS6E
         a4lQ==
X-Gm-Message-State: AOAM531Otupk/VGIjgTGSwFx+vRdYy5hnSiVE8QIJIgpNBrxJc0WqykL
        j5G97sTz4ewPogjxwq+r9RwTq5Pg/UvQVeqOBNldnhJv
X-Google-Smtp-Source: ABdhPJzcd4RMc+mHtV61zdPVSiozxSssbbx13QrIG9QhIbjdfRmTcTyotaJvDxBjLm7iV3quEL0iZ2UnAuS/LiBdqu8=
X-Received: by 2002:a2e:5049:: with SMTP id v9mr3307702ljd.259.1617962502047;
 Fri, 09 Apr 2021 03:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
In-Reply-To: <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
From:   ratheesh kannoth <ratheesh.ksz@gmail.com>
Date:   Fri, 9 Apr 2021 15:31:30 +0530
Message-ID: <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 3:13 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
> The short answer is that you do not have to worry about that at all in
> user space.
i am interested in kernel space, where i have to configure these
memory address (physical) in HW

>>>DMA is taken care of by the kernel.
Agreed. For AF_XDP in driver mode (for zero copy mode), I need to
configure the DMA address.

> /Magnus
