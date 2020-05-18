Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D32C1D7348
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 May 2020 10:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgERIvY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 18 May 2020 04:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgERIvY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 18 May 2020 04:51:24 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7181C061A0C
        for <xdp-newbies@vger.kernel.org>; Mon, 18 May 2020 01:51:23 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id o26so5058873vsr.10
        for <xdp-newbies@vger.kernel.org>; Mon, 18 May 2020 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R97u/ZUCynW7FAIuAIQkpCpqmrNToID+8h4VovoaUEA=;
        b=FTBqUYAUVO17VkLWq0q65gIRmB8fmiRnOiJgAxw/vhVUwMcOVMAAL+M5RRGNy1v6XO
         SuWkdK7otnWib79BmzGQ0rZjeoc6uAOXq7P5pjK8bdEiKcnwvIAPuBRftSBn1kk21etn
         p0wa9Jm32H54kgxYdq+hry1/6EzFxriYxR7If4pqUbmz/h82hM31Q0Q4Xgqxsch1RFlt
         3CNms/zb1yY90QaVPq7YkYMrDydH4Qk5ctpKvmfbDR6MIZWJmBXd3nBVr13TRaKLuB2K
         EsYmwVX+gQ8H6VLjigYeVtgFtArp3zKi7nTcwuk5Ih88YJpz6qaPVM5GNkv+PTpIWdmP
         cCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R97u/ZUCynW7FAIuAIQkpCpqmrNToID+8h4VovoaUEA=;
        b=sNsOl0cKnqSXOK8ioxCKUb4A5uAz7Eo1BCdCUvhp+h3LPmM+/8RIRKf2kFqoRnggRh
         T2+x2a+A/sz99hQPAMsQKFD+LGWdWiJBaiUguSVcn+aJO+VdKryl1ntWCCllR8JL34yy
         NPF5xsKSpuPukDc6F72rNiYQOCu7rkLvD5b1lUA2zZeuFa3BP7UBQTRne6fMKoUUkwfT
         +QQABC7l2YRP4dEr/p3gOawIZPJ38KJ+/VTGMO34a6DFoKrMPflVCXKQLRJHRvbAF3Ta
         xURESpLEOcr1w6fIJC6Qf9i0wBPf+c9m0df0L4eynqXV+gi+qguMU4V+A6yGdgT3gSSe
         GHRw==
X-Gm-Message-State: AOAM532J8Mj7ilrAUnh9cLxE0AcAOf6KQmjhSvZ+vJ3qje9EsoM3L3tf
        k4UoPt63fWaF+zgKKlTDs0beTjWSkmwZGLc4YJA=
X-Google-Smtp-Source: ABdhPJxIoWyWNmggr6JcdYGnUf1lxJC7palVPXK7xn8KybFPIm3FjBv3VjTZf97HeXepXFUYc24GoI2LlUQtwloc4bk=
X-Received: by 2002:a67:ed51:: with SMTP id m17mr10273009vsp.158.1589791882923;
 Mon, 18 May 2020 01:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <ba88e0ff11b940fe8855a0dd43c947ae@hm.edu>
In-Reply-To: <ba88e0ff11b940fe8855a0dd43c947ae@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 18 May 2020 10:51:11 +0200
Message-ID: <CAJ8uoz1wQcCN6N_NPQhG5OFOyBp-a2Mqwh+nqeTGYqOeL_dCLw@mail.gmail.com>
Subject: Re: How does the Kernel decide which Umem frame to choose for the
 next packet?
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, May 18, 2020 at 10:39 AM Gaul, Maximilian
<maximilian.gaul@hm.edu> wrote:
>
> Hello,
>
> I read through the paper "The Path to DPDK Speeds for AF XDP" but I couldn't find information about how the Kernel choses the Umem frame for the next packet? Or in case of zero-copy, how the driver decides which Umem frame to chose.
> But maybe I just overlooked it.
>
> So how does this work?

User-space decides this by what frames it enters into the fill ring.
Kernel-space uses the frames in order from that ring.

/Magnus

> Best regards
>
> Max
