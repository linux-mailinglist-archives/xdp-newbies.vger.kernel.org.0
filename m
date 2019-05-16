Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF76121082
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 May 2019 00:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfEPW0I (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 May 2019 18:26:08 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44919 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbfEPW0I (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 May 2019 18:26:08 -0400
Received: by mail-qt1-f194.google.com with SMTP id f24so5847608qtk.11
        for <xdp-newbies@vger.kernel.org>; Thu, 16 May 2019 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=z+lMxg6moxmVTJd4xVQUIKrnB2Pe9tq+zxdTiVlja5w=;
        b=MTf1wNO6dvAlBq4uNVTjRNWaxh4yaUhpjLTjAZNM9kE8rSBohB9ikhQ3Owr1aXlcoW
         M5peoCV2r+v3J6nIlgGCXGgeqZKLAPOTKACuGmx0SEehA3V+ZS+IR8EQWvVlJXcqvAbj
         gHauAt2j/yDWNyFDydZcguKWQmG5qvJO77ytYBpVNaQOtzqaKQAzZryooTDnD66TbAEq
         tx9aSyREjjUQ0OVW+dPm8CyJjfbL9JhnYdvAKZ3WqXY1MB0tQIGpTBeWMMxGlwn1VeXx
         EXevU+vnSoNtvmGvZH3YY4e8lvq/8h9pM0tZNa9zsWa2Xfp0P3tuX4ZrlxX+efULz3jT
         /3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=z+lMxg6moxmVTJd4xVQUIKrnB2Pe9tq+zxdTiVlja5w=;
        b=GAYrtAtC0//FiNla+f/hSd263Oj0DlNbCDeU4+N6hxtRs0lQy1ii0q08YcCV7mQsgZ
         VaJIjoD5p8KlTjHm2GJgDBMAsbiV+L0P9ASGThwlsJJD/Nu69l4mEyu8tPgpIFto7LDb
         ciSGwMUF0hJlxcbl633LZcn1tw1rn7S+9rdGrCUxOR2kAlJuYsa/V14eI1oQ8jZxvoty
         N4pXwm5LNrNKd1qEk2Gui8KSXwpgb3W/KQDltZvixSupOFcZd2g2e1hNX3KVykxdrtrE
         DKOAsMp6ehLmDshVkiNGXSHJ0vuUoKNh/XN50iH1F4Vi17nYlGgRPcPROj681NhohgO8
         BAhg==
X-Gm-Message-State: APjAAAXbGN6cH+wrmA4YgsBdWNp0HtGec27C5Qx/OvNqMtg05IANGhx+
        hqKhhyr3UwaxaM1K1bTe9TU+Sg==
X-Google-Smtp-Source: APXvYqwx6f05U0rLdKo7dKtBI03oGXhaY7wNIC+vWT/02Xp80EXjqg9DD+ESWOMJaOFeVF1ArVj8hw==
X-Received: by 2002:a0c:89e8:: with SMTP id 37mr9622340qvs.190.1558045567951;
        Thu, 16 May 2019 15:26:07 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id w195sm3369737qkb.54.2019.05.16.15.26.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 16 May 2019 15:26:07 -0700 (PDT)
Date:   Thu, 16 May 2019 15:25:43 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        xdp-newbies@vger.kernel.org, bpf@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>
Subject: Re: [PATCH net 3/3] netdevice: clarify meaning of rx_handler_result
Message-ID: <20190516152543.729c6cb0@cakuba.netronome.com>
In-Reply-To: <20190516215423.14185-4-sthemmin@microsoft.com>
References: <20190516215423.14185-1-sthemmin@microsoft.com>
        <20190516215423.14185-4-sthemmin@microsoft.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 16 May 2019 14:54:23 -0700, Stephen Hemminger wrote:
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 44b47e9df94a..56f613561909 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -374,10 +374,10 @@ typedef enum gro_result gro_result_t;
>  
>  /*
>   * enum rx_handler_result - Possible return values for rx_handlers.
> - * @RX_HANDLER_CONSUMED: skb was consumed by rx_handler, do not process it
> - * further.
> - * @RX_HANDLER_ANOTHER: Do another round in receive path. This is indicated in
> - * case skb->dev was changed by rx_handler.
> + * @RX_HANDLER_CONSUMED: skb was consumed by rx_handler.
> + *  Do not process it further.
> + * @RX_HANDLER_ANOTHER: skb->dev was modified by rx_handler,
> + *  Do another round in receive path. This is indicated in

s/ This is indicated in//

>   * @RX_HANDLER_EXACT: Force exact delivery, no wildcard.
>   * @RX_HANDLER_PASS: Do nothing, pass the skb as if no rx_handler was called.
>   *

