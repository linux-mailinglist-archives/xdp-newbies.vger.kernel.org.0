Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511BD359986
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 11:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhDIJnV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 05:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhDIJnU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 05:43:20 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09495C061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 02:43:08 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso4694709pji.3
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i6zwQi9CnDe1JLmVnGZH4QNd2agSYHluNy5pV8mxNJQ=;
        b=EwN5YrzZGp5zuB62G5He5KisX+n/vH/DRuGcDEHQCercpU10LSf6nJQcG5jKrQ9e5f
         SUwDR99RnKzn15RzEleGVKB0+iF9m4xWnazPvc7V5cjELe4WpsAmm/8U3DzoXbYfnFC8
         E0huJ9qtL78G7EGh7EdCtO7UQASnVQ+zcAAIc0kPhIyKTDtBfIjLyJ74QI9E+RSYXfNe
         VPEc0nUu/6FwzbXILzDNrus8S4oIxH0JUeYJgWXhRcE3enWXd5jxxZlb4AYwmUivevUc
         50E/E9IjF2lgd9nQ7up71LCkX0E2CRCXBC1sbppVinOsSqHeYEnHteWtComlCK/Dma0Z
         t+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i6zwQi9CnDe1JLmVnGZH4QNd2agSYHluNy5pV8mxNJQ=;
        b=VroxPqGawD0nAeb1cWD6uUVD4nqnU0SYYQPw8eK5+nRJTWQqkKxFBltiWRXEpnAaXl
         d3ARv6Ije9TC+5xnt2DQ5H1r0HQDALvjT4DuknuN+/PQKVSaPpKXpRhd0Dwri3gOt9uO
         WOGO5xniln7LlfIpqpqvQYCuK6XPr0Wxn073LeOSZm1eqoNl9x9IDVdJnsxV794HabvO
         C7Nc0DXLNoka5S2P07NuXe2rY59qQjxFyVSNl9ROZra38MOoDS6A0ahM/cVGxEC7OJPi
         EVA7kaAOnrNHzVl9TYEa68vhNdc5/Pd5N23d73a45p5H1MtX6unmvw6+1WiNd3D9joaF
         oLZg==
X-Gm-Message-State: AOAM531anevwx0ruZr0l56Cv8VZJgYpnI87Q0Ce+bOzyjjZ4o4phdUM3
        WWKLbGCp8cbkYNTS8SVagxCl8iSesFQzGVqvTOY=
X-Google-Smtp-Source: ABdhPJxp7driQK0To9T4O9oCPizDZzqNgipxYG+QH3flHLfjVyw+YPLpEQrTyMgPsvANrEnAeHNT8SEvT9Mz+adSNSo=
X-Received: by 2002:a17:90a:a613:: with SMTP id c19mr524717pjq.117.1617961387402;
 Fri, 09 Apr 2021 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
In-Reply-To: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 9 Apr 2021 11:42:56 +0200
Message-ID: <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 11:36 AM ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>
> Hi List,
>
> Could you help with the below query ?
>
> if userspace allocates UMEM memory in non contiguous physical memory
>  (contiguous in virual address space),  how can i configure DMA ?
>
> https://github.com/xdp-project/xdp-tutorial  AF_XDP example uses
> posix_memalign(). will it ensure each buffer chunk is in contiguous
> physical address space ?

The short answer is that you do not have to worry about that at all in
user space. DMA is taken care of by the kernel. The only requirement
is that the umem is located in a virtually contiguous address space
since you can only register one area per umem. Physically, it can be
located scattered around the whole memory, but you do not have to
worry about that. posix_memalign() only aligns the allocated area in
virtual memory. It does not guarantee anything else.

/Magnus

> -Ratheesh
