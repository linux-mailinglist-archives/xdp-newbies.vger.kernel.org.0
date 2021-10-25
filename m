Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C9D439E80
	for <lists+xdp-newbies@lfdr.de>; Mon, 25 Oct 2021 20:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbhJYS24 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 25 Oct 2021 14:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhJYS24 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 25 Oct 2021 14:28:56 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BC3C061745
        for <xdp-newbies@vger.kernel.org>; Mon, 25 Oct 2021 11:26:33 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id d204so12874995ybb.4
        for <xdp-newbies@vger.kernel.org>; Mon, 25 Oct 2021 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CAFm8jFPF4O2IQwiZTjW7mQZv2H1s0T7XgQF/cZjhMo=;
        b=Gxy4gljJ8HzE/COdY1cihl4WkaoqkdbKMERbJngoQiXA3E9NfcFXPmshLDYd8qa2QS
         2XkbhPVNNn7csq+whmH6lJ36csb6RAIyu4PpbOEkfwVSC/sQRSB8PB7UcwMIyj6ZMG6L
         VRIssB5NCSE0ahJ+YTjHYIK940hhAgApoXfyyieH6/as7gXmDixCXxSVrUW6dAxgKrC2
         SwIlun/qhcy95RDm3yiLuYoDjvb3swzAguMQ6a/xlnAQfURDDWPKMVUszeSqe7j2eL42
         ybFZrNiUvhH3ngPjBgM+uuDdyjqW62S1cIRsOEzmyg9ExhoLe3UjaM4UYQk5V9U5xixC
         8NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CAFm8jFPF4O2IQwiZTjW7mQZv2H1s0T7XgQF/cZjhMo=;
        b=VJFo1CnNX67nK+M1AOKuRAEwQn/lXW0I28DhuN2esm+RbiiG+hWsPkX8e3t1MaR6Uf
         N3JC2ZFh3YEuZjDiWwy+YzsjjXmB53BwZhMS6jSzHyMOLd1IPovZc3hgrKS68e0t9bLM
         IGX2YPu/G6g6GseVc9rRaz9n1WzYzV5wZSTD17gB3SG3bAQinxGtQPSrauzzqcjmo7wl
         HtFORGwenCNfeJa0oxU3ZISnGUTW20ddzzF3DxJpNHxW+2bcqnfSriCuYpklbkFG+z6K
         UKtvqACGIlKR3xnso7vTV4DUM49tE4BSCHrAEEqjLpLVWYXposf11sD90kez+Md6uEhn
         Ppfw==
X-Gm-Message-State: AOAM533QovpuTl4AbFGgM0uRWbz7ztn338O71mxeH918UTJEChNegDdg
        l5sd299QLrB5/kPyiBClCvHA/OvMjsTFq8V85cLjoz+aoHY=
X-Google-Smtp-Source: ABdhPJyzkQ9OhtCpw1vweFoxQS67Fmp95XLXhwfUdd2cLrtlbXFEdZZAVk/JjI/PktAxn6X97KDC5DiNKINRgF8tBLM=
X-Received: by 2002:a25:cd47:: with SMTP id d68mr19549715ybf.130.1635186392726;
 Mon, 25 Oct 2021 11:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
 <875ytlcrdi.fsf@toke.dk>
In-Reply-To: <875ytlcrdi.fsf@toke.dk>
From:   Jun Hu <hujun.work@gmail.com>
Date:   Mon, 25 Oct 2021 11:26:21 -0700
Message-ID: <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
Subject: Re: AF_XDP socket TX path interact with TC?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Oct 25, 2021 at 3:48 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Jun Hu <hujun.work@gmail.com> writes:
>
> > Hi,
> > I want to put a timestamp in the egress packets, and I want to use
> > AF_XDP socket for both sending and receiving packets; since a XDP
> > kernel program only work in ingress direction, I wonder if I could use
> > a tc kernel program to change a packet sent out via an AF_XDP socket?
> > I searched around, but couldn't find any direct answer...
>
> Nope, AF_XDP bypasses the stack completely, so TC won't see the packet
> on egress...
>
> -Toke
Ok, thanks for the clarification, I guess I have to wait for the XDP
egress support ...
