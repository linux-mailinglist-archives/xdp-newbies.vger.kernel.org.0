Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299ED317E7
	for <lists+xdp-newbies@lfdr.de>; Sat,  1 Jun 2019 01:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfEaX1e (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 31 May 2019 19:27:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33765 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfEaX1d (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 31 May 2019 19:27:33 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so9230071lfe.0
        for <xdp-newbies@vger.kernel.org>; Fri, 31 May 2019 16:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/CnFI/Gplfb8sUNP8cdDqVeMfZ2XFe8YBzOqCLpB94A=;
        b=zRB3kJXbFOYoNSwjaQOpmRSldudJn+Df4uOo0m22Btl5w47IUgSF1V3KT9/1YBYqT2
         oQwMa8lZ8u1ftVKKwEjJSWoMnlGmoYsGw+g5M3W/zbFQvnxeX13U8hIMfcgwhGXYLtj3
         a4x+sk4uvlBpZvKG4WRkc2vdpY+N/iVAFAMGFeBGW8bWww4AgMd6wECsZe/Vj+ClsQ94
         LkRpa/iRwq3UCuhIW1BKIfW5E7Y6SE+Z+ibxlllm8+Lju9f67/TsPJ5y3DSY5dK0lK7Y
         tdEXFDHpC3dWaDw2Z25AarWFlmKDxvgKg01+1gdBP7eMcTnSIwX7WL0QC7vwnc7xCKdz
         xGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=/CnFI/Gplfb8sUNP8cdDqVeMfZ2XFe8YBzOqCLpB94A=;
        b=Xxon0caZTkdOAQ3qCLQGZtcNIpdgpg+K2XH+1IDYUEwbCj05Ql/IswwUYlR9xsT5mC
         sueM8VRdCvPlxZfogMF6JOKYXcwal5/4U24Kz/yjIp7tG37zj9X8g9bMz7KlvofaCVzM
         RVj7/sYmFVzVTydOyxWPSkfiqjvvvXwCqHfT70MFJpKWpxadg6qRbeTlq1ZSk35TgKTU
         8fr7TAbP9oGSr0wug+gACl4bcwmYy8eU/XZ8nvtdEvSfIGj24kzS404IPQkxN9tnelEN
         zh+vTzQoLdEstStWqmGShaL95P/4lW1hawNZi2ydA6HvkZ/cjI9lELAAsxQ1nfPysWH0
         sxxw==
X-Gm-Message-State: APjAAAUBrNtEa7tXJHMGzysOkSsubK/U/4iRAqZLAY7pb4dWCDs3TIdW
        hA7IyKYbgT2nasXyg0lxJGWEiw==
X-Google-Smtp-Source: APXvYqyW6MyVd0bvo1rYW8SDDxZBjY37O9w7HbIg7ST3VlduimXROlJPkxHLbG8bh/ASOk8YwdBEqw==
X-Received: by 2002:a19:f806:: with SMTP id a6mr3164054lff.102.1559345251665;
        Fri, 31 May 2019 16:27:31 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id y6sm1462951ljj.20.2019.05.31.16.27.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 16:27:31 -0700 (PDT)
Date:   Sat, 1 Jun 2019 02:27:28 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com
Subject: Re: [PATCH v2 net-next 7/7] net: ethernet: ti: cpsw: add XDP support
Message-ID: <20190531232727.GB15675@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com
References: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
 <20190530182039.4945-8-ivan.khoronzhuk@linaro.org>
 <20190531174643.4be8b27f@carbon>
 <20190531162523.GA3694@khorivan>
 <20190531183241.255293bc@carbon>
 <20190531170332.GB3694@khorivan>
 <20190601003736.65cb6a61@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190601003736.65cb6a61@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, Jun 01, 2019 at 12:37:36AM +0200, Jesper Dangaard Brouer wrote:
>On Fri, 31 May 2019 20:03:33 +0300
>Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>
>> Probably it's not good example for others how it should be used, not
>> a big problem to move it to separate pools.., even don't remember why
>> I decided to use shared pool, there was some more reasons... need
>> search in history.
>
>Using a shared pool is makes it a lot harder to solve the issue I'm
>currently working on.  That is handling/waiting for in-flight frames to
>complete, before removing the mem ID from the (r)hashtable lookup.  I
>have working code, that basically remove page_pool_destroy() from
>public API, and instead lets xdp_rxq_info_unreg() call it when
>in-flight count reach zero (and delay fully removing the mem ID).

Frankly, not see reason why it can block smth, it can be considered
like not shared pool. But Ok, anyway it can look more logical and can be
reused by another SoC. I will add it per channel not a problem,
at least for now no blockers. Adding pool per channel will create more
page_pool_destroy() calls, per each pool, that I can be dropped once
you decided to remove it form the API.

This API is called along with xdp_rxq_info_unreg(), and seems like not
a problem to just remove page_pool_destroy(), except one case that
worries me... cpsw has one interesting feature, share same h/w with 2
network devices like dual mac, basically it's 3 port switch, but used
as 2 separate interfaces. So that, both of them share same queues/channels/rings.
XDP rxq requires network device to be set in rxq info, wich is used in the
code as a pointer and is shared between xdp buffers, so can't be changed in
flight. That's why each network interface has it's own instances of rxq, but
page pools per each network device is common, so when I call
xdp_rxq_info_unreg() per net device it doesn't mean I want to delete
page pool....But seems I can avoid it calling xdp_rxq_info_unreg()
for both when delete page pools...

>
>-- 
>Best regards,
>  Jesper Dangaard Brouer
>  MSc.CS, Principal Kernel Engineer at Red Hat
>  LinkedIn: http://www.linkedin.com/in/brouer

-- 
Regards,
Ivan Khoronzhuk
