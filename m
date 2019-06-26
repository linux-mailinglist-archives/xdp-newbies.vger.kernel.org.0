Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F0755E27
	for <lists+xdp-newbies@lfdr.de>; Wed, 26 Jun 2019 04:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZCRo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 25 Jun 2019 22:17:44 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:35279 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfFZCRo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 25 Jun 2019 22:17:44 -0400
Received: by mail-yw1-f68.google.com with SMTP id k128so325987ywf.2
        for <xdp-newbies@vger.kernel.org>; Tue, 25 Jun 2019 19:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oKNSTMowmRk3RkH/jcMvNDg+7Zu5bOsgngVeZGPE5Q8=;
        b=eY0A99wxkmneSw3ebBgb5whYrrPrAoGKxDfaWS3HcYMmutSOo1BH8nElIh41fZwBcD
         NwbVKrWfUvloOlQBGbMYUmhlFpV0RDV3KTes3kOXeIVwySVLujVm4OtqFcre7KKpfq/R
         D7G7dqEy6MSdABObz7svw3zakl/5/mjk7tvkyvGIWAA/cbwPg+//VTklgB0tRo1JkbFm
         7xkZFduPNqi/xRZSkxAx9H4pVVa24jOalHkwUs3GJGqmBtCST7x2tR0RXkBwf/ylqVuf
         IVXxxVoWHNndpMXYBHfCH/0w8BLAZzQ1S2BJ1yjwfCRh9Hmv9akNOAelzJl8IEVCY7xD
         uePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oKNSTMowmRk3RkH/jcMvNDg+7Zu5bOsgngVeZGPE5Q8=;
        b=ESRgPY/G8Yo3kZcd5FEDu7oeK3P5YokEvCKcqnp+o1dyW9EINczzfe8EggEbF7Tj1P
         2+Izoc1zOFYAEyZWaFuhXJYcDpzEkZ9jU4T1Ae7y3QgfAlDFiETlsF7QoAoht6rmEbnb
         BkTrcDPps57cd1jVryeYBUi5zFFdpnUIauXBRuzGhzZhFCgYzyYYhTbuB33OyCWbFTWe
         f4CX3bk6u0XVyPxEIKJ3BMrk8TDLkPDf8By8/G2UOjf/Iyb3ujJc03zCmV1KgitT3pLt
         IYwZLb1qTZ6Z/ZgIcB39NYpA2tk0ZcylwRhKoJ9kJmTk4t/zt+pbrGBSp9jtGcv/D+8V
         1vxQ==
X-Gm-Message-State: APjAAAUscs6ASfeGNqkoJ5YeQpc7qVEX4v4bLNeshHbw2qTTTnANcx9j
        dQF5VsDmOJiFZeHrLI3ORNkzq7su
X-Google-Smtp-Source: APXvYqzACCLMuKht2Kt3gWKRkPu0EdK8z3ixwAsZjJ5kyYC8PefxrdMndSiOGPhgBhFG3xtWQkpz9Q==
X-Received: by 2002:a81:2981:: with SMTP id p123mr1091064ywp.430.1561515462805;
        Tue, 25 Jun 2019 19:17:42 -0700 (PDT)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id v192sm4163431ywv.40.2019.06.25.19.17.41
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 19:17:41 -0700 (PDT)
Received: by mail-yw1-f53.google.com with SMTP id y185so308037ywy.8
        for <xdp-newbies@vger.kernel.org>; Tue, 25 Jun 2019 19:17:41 -0700 (PDT)
X-Received: by 2002:a81:7882:: with SMTP id t124mr1124280ywc.494.1561515461099;
 Tue, 25 Jun 2019 19:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190625175948.24771-1-ivan.khoronzhuk@linaro.org> <20190625175948.24771-4-ivan.khoronzhuk@linaro.org>
In-Reply-To: <20190625175948.24771-4-ivan.khoronzhuk@linaro.org>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Tue, 25 Jun 2019 22:17:03 -0400
X-Gmail-Original-Message-ID: <CA+FuTScQ2WdEqQpsCdM_KZK9e+Zq7v5B+x=HLthxLAyOhYu-zQ@mail.gmail.com>
Message-ID: <CA+FuTScQ2WdEqQpsCdM_KZK9e+Zq7v5B+x=HLthxLAyOhYu-zQ@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 3/4] net: ethernet: ti: davinci_cpdma: return
 handler status
To:     Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc:     David Miller <davem@davemloft.net>, grygorii.strashko@ti.com,
        hawk@kernel.org, brouer@redhat.com, saeedm@mellanox.com,
        leon@kernel.org, Alexei Starovoitov <ast@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org,
        Network Development <netdev@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        jakub.kicinski@netronome.com,
        John Fastabend <john.fastabend@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jun 25, 2019 at 2:00 PM Ivan Khoronzhuk
<ivan.khoronzhuk@linaro.org> wrote:
>
> This change is needed to return flush status of rx handler for
> flushing redirected xdp frames after processing channel packets.
> Do it as separate patch for simplicity.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>

> @@ -602,7 +605,8 @@ static int cpsw_tx_mq_poll(struct napi_struct *napi_tx, int budget)
>                 else
>                         cur_budget = txv->budget;
>
> -               num_tx += cpdma_chan_process(txv->ch, cur_budget);
> +               cpdma_chan_process(txv->ch, &cur_budget);
> +               num_tx += cur_budget;

Less code change to add a new argument int *flush to communicate the
new state and leave the existing argument and return values as is?
