Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4A374849
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 May 2021 20:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbhEES4l (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 5 May 2021 14:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhEES4l (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 5 May 2021 14:56:41 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E42C061574
        for <xdp-newbies@vger.kernel.org>; Wed,  5 May 2021 11:55:43 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id j28so3249674edy.9
        for <xdp-newbies@vger.kernel.org>; Wed, 05 May 2021 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVJdQJB87bLH+SNAcPq5aXflQVgmVIevEyhPeCOrHIU=;
        b=kOKmT9l8WxLH+XqRcBJB3lagLBttj6c0kayJREW5OnX/zwdO58/rFgEpLNUe8uQjYy
         Ligpbe+lbzdSPoAeELy0wBDI9CNDPHFpzSvMtvjTau2Z3pLrMJECU4IAkFug1jehd1bl
         XcJu8OXgKP1CRTPXYwNAhJSWCn81zdRZ1ZWHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVJdQJB87bLH+SNAcPq5aXflQVgmVIevEyhPeCOrHIU=;
        b=hkpM3WdrMFHZcHjVck1oGfnJbehuSkIvFsU71TOhvPAMYXX6Tam5COels8xM5m7VcQ
         H+ZjJlvswPgn4l0BVZCjvSaiszgVHJQLQe8MNwvRkDnAY8uuRNNAx8X1AU9BDa8VGTGR
         O/T76QBqNDk4W55ru5RmyY/i/ux4qHkpvz6oegS7hY0dcgQaKFnkpI7gM6iC1jyWEe/W
         RsmLl5tkcZLQ79mGXIjx2SDdPVR9x7lrYWXclZu5FZQOQTBXC1M8+hBr/sch1WJXD7sg
         ZWDA2WI4M1Cq1fY6n+xSla6ZGgRgtyLmF8+Nzin3I7eiu8pCQ7H5ZKaFmlufsAZQuVG9
         1rGA==
X-Gm-Message-State: AOAM5300fpzxdFE9RRrk9DBE42Z1vfjPr3UZPXJBJaofhk/BGNKPx3PT
        a5YJZjP5kkjpyhOLzH2zc7w9V2fl9FnRsRm6XgNIZg==
X-Google-Smtp-Source: ABdhPJyBHbOPu/OWIvRah2UVv2V97ccAMbfA4I6obSntNg19uyHYQ447j6+xtxEMQ5XcdfSoGjCUIXqtZ0wLeLONKGc=
X-Received: by 2002:aa7:c850:: with SMTP id g16mr521323edt.324.1620240941644;
 Wed, 05 May 2021 11:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
 <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
 <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
 <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com> <CAC1LvL2zmO1ntKeAoUMkJSarJBgxNhnTva3Di4047MTKqo8rPA@mail.gmail.com>
In-Reply-To: <CAC1LvL2zmO1ntKeAoUMkJSarJBgxNhnTva3Di4047MTKqo8rPA@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Wed, 5 May 2021 11:55:30 -0700
Message-ID: <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     T K Sourabh <sourabhtk37@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, May 4, 2021 at 4:07 PM Zvi Effron <zeffron@riotgames.com> wrote:
> I'm suspecting it's something with how XDP_REDIRECT is implemented in
> the i40e driver, but I don't know if this is a) cross driver behavior,
> b) expected behavior, or c) a bug.
I think I've found the issue, and it appears to be specific to i40e
(and maybe other drivers, too, but not XDP itself).

When performing the XDP xmit, i40e uses the smp_processor_id() to
select the tx queue (see
https://elixir.bootlin.com/linux/v5.12.1/source/drivers/net/ethernet/intel/i40e/i40e_txrx.c#L3846).
I'm not 100% clear on how the CPU is selected (since we don't use
cores 0 and 1), we end up on a core whose id is higher than any
available queue.

I'm going to try to modify our IRQ mappings to test this.

If I'm correct, this feels like a bug to me, since it requires a user
to understand low level driver details to do IRQ remapping, which is a
bit higher level. But if it's intended, we'll just have to figure out
how to work around this. (Unfortunately, using split tx and rx queues
is not possible with i40e, so that easy solution is unavailable.)

--Zvi
