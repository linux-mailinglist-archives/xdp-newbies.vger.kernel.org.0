Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B691F038A
	for <lists+xdp-newbies@lfdr.de>; Sat,  6 Jun 2020 01:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgFEXe5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jun 2020 19:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728314AbgFEXe4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jun 2020 19:34:56 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE742C08C5C2
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 16:34:56 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id g62so6496903qtd.5
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jun 2020 16:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=tEhfiQJIpHDipum1/WZoiZplK8GFqVgyYr5hOGYK0Fg=;
        b=FzLemteo/hZynyYbhSpx+ptYI/qaPEUiJlBspATBUBloBli+juJDSv5Hb/3myiGQSv
         r71N9SE4FDNXtk+gq/agSyuRIKZFEDN+FHdO9JehflGLiuayXdjoWkoGY/MUsNdZMi89
         2xOcg5ZHLzmmpe9Ded7polU6/Jk+UJQkmE64dLzj6JmJDGqe7a6lY//dXIpRfCo98vzr
         KwiAphYuBdJc2US6WjOna77qM6rAvws4GpxTmHuKcR+NC/tfxK/a2gccsF/AwqkQBcfa
         Yir7QMzJ6ISi7n8WwXfAESDSoqvRm/xElj5jsnL67QV2JRlmHILfcm/Jo85RupMBBW64
         jPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tEhfiQJIpHDipum1/WZoiZplK8GFqVgyYr5hOGYK0Fg=;
        b=QLzDZ1a5jNy7AwTfRmMhms6+3ssltkAUlifluVOeW/ZbKcI2LHGSmGcx94QC+gt8ZU
         H0ReqRYPFlRI7/jPH3iO2/IC3aADznPRAUHFvhGJbl1FMa9Oy5Ux8IFv9DeN2odahwzY
         8GW+hG/UQzTluSak8CyyDGUW02sw8k262sQ3KB8G3gxtQixv+LxabE++I4jLuH9ETMKx
         bWsaWNCwqetIf/G81AoA1U2OPchfuPQrcVyJfWras8qGF+1hiBYsyn+NiqKpkEDREDSj
         0g3P/JIeJzshcT3MRU0TAVsiaubUH/cVf1rXwU/eP9x1VZToigL4XFtkjnweEVPCVXef
         lwuw==
X-Gm-Message-State: AOAM531ITvHcvzSOG+XSdfKcjQWPfJSs76x33kT5tJ/EDYOb/rJhmz8r
        z1E9mtca6f5FZVZ3KYPudQCVJ5OE
X-Google-Smtp-Source: ABdhPJwS8JitkAHnDhGdUUJxff2WWRYU9glURENyEhnjYd1+tQNUqo4u0phfZLJwlgJX3uvmhMaXwQ==
X-Received: by 2002:ac8:468d:: with SMTP id g13mr12700547qto.47.1591400095625;
        Fri, 05 Jun 2020 16:34:55 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:2910:573e:9fb2:51d7? ([2601:282:803:7700:2910:573e:9fb2:51d7])
        by smtp.googlemail.com with ESMTPSA id v53sm1233881qtv.10.2020.06.05.16.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 16:34:54 -0700 (PDT)
Subject: Re: Lightweight packet timestamping
To:     Federico Parola <fede.parola@hotmail.it>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <DB7PR08MB3130BDD01387627E7FAD775F9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <DB7PR08MB3130C02AB04133E07146F40D9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <DB7PR08MB3130BA2C0F90E0819577C5289E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <b712de09-fd35-1d5e-1842-31bb3b2e163d@gmail.com>
Date:   Fri, 5 Jun 2020 17:34:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <DB7PR08MB3130BA2C0F90E0819577C5289E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 6/4/20 7:30 AM, Federico Parola wrote:
> Hello everybody,
> I'm implementing a token bucket algorithm to apply rate limit to traffic and I need the timestamp of packets to update the bucket. To get this information I'm using the bpf_ktime_get_ns() helper but I've discovered it has a non negligible impact on performance. I've seen there is work in progress to make hardware timestamps available to XDP programs, but I don't know if this feature is already available. Is there a faster way to retrieve this information?
> Thanks for your attention.
> 

bpf_ktime_get_ns should be fairly light. What kind of performance loss
are you seeing with it?

XDP does not support access to h/w timestamps at the moment.
