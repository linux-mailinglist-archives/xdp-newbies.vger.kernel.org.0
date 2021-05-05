Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87423748E9
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 May 2021 21:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbhEETyc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 5 May 2021 15:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhEETya (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 5 May 2021 15:54:30 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C65C061574
        for <xdp-newbies@vger.kernel.org>; Wed,  5 May 2021 12:53:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y26so3449958eds.4
        for <xdp-newbies@vger.kernel.org>; Wed, 05 May 2021 12:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ob8x6cJgdz99rBOpDU3tc6+K/JIeAdA21Oi1cM9RkMo=;
        b=OXikqMpOzMncQ0LcYfrLWCj4D9dPdAA1ZZkJQx/BBUQduy2viWxXUXfP4wH933+Hv5
         sjV5P6wbUoEq20Yo2gqeQC44ErGeRi6IpiqMZmWA0Pv9Z+onctpS9NE/Us0mx4QjlbQW
         1LLvBULkYfyBr1kC13v2ehgTAZmLyeQiW/Eew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ob8x6cJgdz99rBOpDU3tc6+K/JIeAdA21Oi1cM9RkMo=;
        b=LzWk3GY4kfq/WHzpPk+LR1ZHH6cg4ouvtd9OFcSZYzxAtxzGcxPX1IMrsHT9h1pBw/
         bDpR+MJaYmBkxsv0+52nbFc8bjduh9PcCWXwe0DKtEYWkL8Q6PL97nnBRuPQVhSdbqSs
         GJl2VnVaaDZAkUA4WrY5OjFOvuHFdoke3dyx703dUyTHN1rWaqHQVaTlvr2QKD2RNfcj
         QED8BNzrQsAAjP/lR65TMjZsp6Qvt78JCmSV2zZqIKeLSSQDWHypjaJg1lmSEdEL+WbB
         4uHwA0LFMBkOPP+bpjbibu/JBS5DOZx8qkFtt0YTr4XeqMZwP1VtQHRe0lvTNf9pHOY7
         5JiA==
X-Gm-Message-State: AOAM531+NZ2hQNe3CMP6NkOPnoodprufujzPm8k6ZK4Zxrn55ruWgzU5
        2F4ZMmpXPiwgdx7ETONUKEHPXaGTHZJvNqQyOBXwIiNDN9Ca1A==
X-Google-Smtp-Source: ABdhPJzGKQqO0hlvDe/18PWBQyXHV1CwydkD/5msWHQPZHttOw180AgM+Im1i0A1mzjqlbl59hrRBzVxMwYEkVHzoQ4=
X-Received: by 2002:aa7:c150:: with SMTP id r16mr763292edp.82.1620244410342;
 Wed, 05 May 2021 12:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
 <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
 <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
 <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com>
 <CAC1LvL2zmO1ntKeAoUMkJSarJBgxNhnTva3Di4047MTKqo8rPA@mail.gmail.com> <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
In-Reply-To: <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Wed, 5 May 2021 12:53:19 -0700
Message-ID: <CAC1LvL0+Yh_hVdVGOs1woVfCDsfrxnngHfZtRzRKJ5mLwzzERA@mail.gmail.com>
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     T K Sourabh <sourabhtk37@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, May 5, 2021 at 11:55 AM Zvi Effron <zeffron@riotgames.com> wrote:
>
> I'm going to try to modify our IRQ mappings to test this.
Confirmed. When I modify the IRQ mappings so that I don't use cores
with a higher number than the number of queues, the drops go away.

Going to move this over to the i40e driver's mailing list, as it's now
confirmed to not be an XDP issue.

Thanks!
--Zvi
