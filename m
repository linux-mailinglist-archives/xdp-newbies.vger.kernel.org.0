Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC473748EF
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 May 2021 21:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhEET4R (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 5 May 2021 15:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhEET4Q (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 5 May 2021 15:56:16 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5E1C061574
        for <xdp-newbies@vger.kernel.org>; Wed,  5 May 2021 12:55:18 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso2794779otg.9
        for <xdp-newbies@vger.kernel.org>; Wed, 05 May 2021 12:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vOS+Itk0qES1W53b1Tq0rk7F6nmaf1gTMYX2jNiKkLQ=;
        b=Fa82n8Z/YlRxffAzgIt6piP7YCeluIbRZODqI+VW6AHS1hsfRMUeR1CiuhtAidk7Tj
         MiPvHW1sovgO0kHUMrhzhm2K5GMMpXs3TNYEmJGZsF9daahHUBtgcroSx7z0T4LjbTap
         EFKfnrjalrgCzAaL6Ylen4PGvcrxF3DcrXKLIb1KS0tf7NQgNEHYBZnoGshCHzWIWubH
         nIlgYEjwsVgWxv/SGalV5ctpjzIOJ2+6XaMHwLCIgVwlQkFWJGSiNG5JeJ1NeLhUxt5c
         9hoGRcaxYD8heXxWPGqigzUtQNKYL3oDBqtw0IEX6XgzMvh32oddwMw310lfJb7iG0vU
         55Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vOS+Itk0qES1W53b1Tq0rk7F6nmaf1gTMYX2jNiKkLQ=;
        b=h1dk/MukJVIhldBCjewZIOuHnGgHrea8466w5z++4PGk1xEPxnEPvf/hr9nSUJ/A5E
         n/jKMJBfPdMuNl5FI1wSAcJUwIcZfJkyiBjKooo9lKC6OB8BtQCeS0XFyqfwn2/zIilu
         AbDY4oqiQ07sfqIvE4K1WciKAhwRzILegHwWndFugBsvYIZeFD+cvLdSXwt2tiHNF/+d
         8l4kNas8+471OLeUyXN/JZDce68wQ8A3X95UTvOSJb3nJwrTYQu6EaDUNAHTavhYHTJI
         D8ULX0Thfvg8IxvoTxVTzKuShxi4e5p+SPulgmLN6zihsFGgyxwGTqEGNrI5Pe7A1noG
         PZXQ==
X-Gm-Message-State: AOAM5322HDGLlMEYUtn+vmBgMtLoqXx2dMKn3cxLTBJqt/YsrLeALFpa
        ial3Kjv6G3CEsxkaL+ThxxYJXDE8Jd/Ebw==
X-Google-Smtp-Source: ABdhPJyYDDngb4IveEhgjDaDTeyFzM+XnqUKYF5ks6zMn9d5um2dvADyG/GjbrVsr8mL4qCL26AEbQ==
X-Received: by 2002:a05:6830:1094:: with SMTP id y20mr300857oto.135.1620244518244;
        Wed, 05 May 2021 12:55:18 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.33])
        by smtp.googlemail.com with ESMTPSA id w85sm37023oif.42.2021.05.05.12.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 12:55:17 -0700 (PDT)
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     Zvi Effron <zeffron@riotgames.com>,
        T K Sourabh <sourabhtk37@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
 <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
 <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
 <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com>
 <CAC1LvL2zmO1ntKeAoUMkJSarJBgxNhnTva3Di4047MTKqo8rPA@mail.gmail.com>
 <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <5d3668dc-af55-f909-7ce6-67c437caccef@gmail.com>
Date:   Wed, 5 May 2021 13:55:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 5/5/21 12:55 PM, Zvi Effron wrote:
> On Tue, May 4, 2021 at 4:07 PM Zvi Effron <zeffron@riotgames.com> wrote:
>> I'm suspecting it's something with how XDP_REDIRECT is implemented in
>> the i40e driver, but I don't know if this is a) cross driver behavior,
>> b) expected behavior, or c) a bug.
> I think I've found the issue, and it appears to be specific to i40e
> (and maybe other drivers, too, but not XDP itself).
> 
> When performing the XDP xmit, i40e uses the smp_processor_id() to
> select the tx queue (see
> https://elixir.bootlin.com/linux/v5.12.1/source/drivers/net/ethernet/intel/i40e/i40e_txrx.c#L3846).
> I'm not 100% clear on how the CPU is selected (since we don't use
> cores 0 and 1), we end up on a core whose id is higher than any
> available queue.
> 


that is known problem; mlx5 has that constraint too.
