Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0631824A146
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Aug 2020 16:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgHSOIw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Aug 2020 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgHSOIv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Aug 2020 10:08:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AD8C061757
        for <xdp-newbies@vger.kernel.org>; Wed, 19 Aug 2020 07:08:51 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so25553993ljc.3
        for <xdp-newbies@vger.kernel.org>; Wed, 19 Aug 2020 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khomp.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=yB+2i4wcTLjb3uVJlFRR66sAoyWCWa7iGZvAvUpwnuw=;
        b=Y12dNlACFPrDzPflz8IIBZe2Rx3PoH5xlTNekDeFpa4xXk9VxC1S/p9d+zw/nK5dvY
         +twc6U/0EwcP+m+Aq6EvjBWz0xYC/yCmsSruP+zMg1hgncCvRUnviwd9WzjnGZKHBcsa
         T3r5mCjXoUC9S3Obihzn/L9nef5NGVmd7JC+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=yB+2i4wcTLjb3uVJlFRR66sAoyWCWa7iGZvAvUpwnuw=;
        b=ppHL2KHHGzNY/BroBk+tv6sgH2mS9TdzAG0y2r/BUvNV7k2FBBFqt+efogl2p2nx7W
         yZGp89xCB51MtkC4B+zxcUQZxPgWyLfuNblth4lkX8QBwc+H9MgLOTdEFvduZlo5g0wk
         i5lJEhHngCgmyrrH4nASy+UQpo7s6Ko6uHBdtpi7LLr/hB4SI1jr6yymOoeXSyBNgYPp
         qfhrsB9iZVbuEGJo9lG+9YljdNg2fWIFPLBSVxbr0i11exPO2tUM/H894Rk7ZEvdQvYP
         r7sK7ZCHD6kku2kQbh6ib+FZ88E1xgW7kB7VkuElzoMain3ejPucAL7EtU3M4fQugVkG
         UmNg==
X-Gm-Message-State: AOAM533WFZ5MTZ4bkOowXaFbnXf9TIgGh61b1/CmEJBLQqV+WMSaUpIa
        7lRe98qZ06kfWawC5ikow8zEP7ZW1xB1DvdfR7AbCVsIl2VhIA==
X-Google-Smtp-Source: ABdhPJyM8iAXPEELj1NSXGE0aCDcyPi7ixG0UU9PE9asvOKXIgf8HK0ifSCtiMT6JW+GvOT4IhIsy5fG4ireukUlejM=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr13052430ljc.366.1597846127607;
 Wed, 19 Aug 2020 07:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaYoca34NU43BK9VQdpM5W-j4uHSix4VW=G9Ja8iNRVZ5Zsjg@mail.gmail.com>
In-Reply-To: <CAEaYoca34NU43BK9VQdpM5W-j4uHSix4VW=G9Ja8iNRVZ5Zsjg@mail.gmail.com>
From:   Rafael Vargas <vargas@khomp.com>
Date:   Wed, 19 Aug 2020 11:08:31 -0300
Message-ID: <CAEaYocZ6Px5Jyt96TDrqyJNXbYps-GTrrSeGFm9nZeUPO-9U2Q@mail.gmail.com>
Subject: Re: Kernel Panic when loading XDP on i40e driver
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Em sex., 7 de ago. de 2020 =C3=A0s 12:51, Rafael Vargas <vargas@khomp.com> =
escreveu:
> [...]
> Using kernel 5.8 (mainline from kernel.org) and a Lenovo Intel X722
> controller (using the i40e driver). Loading any XDP program to this
> driver will immediately crash with a Kernel Panic.
>[...]

I've tested with the net-next kernel and there is no Kernel Panic
there, but looks like native XDP support is not working on i40e, as
iproute2 reports it as xdpgeneric. Is this correct or am I missing
something in the way I load my programs (libbpf's
bpf_set_link_xdp_fd)?

Also the driver that is currently supplied by Intel and the one
supplied in the kernel sources seems to have diverged...
