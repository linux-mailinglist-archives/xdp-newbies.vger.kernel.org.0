Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9824236240C
	for <lists+xdp-newbies@lfdr.de>; Fri, 16 Apr 2021 17:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbhDPPfo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 16 Apr 2021 11:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235293AbhDPPfo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 16 Apr 2021 11:35:44 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE10C061574
        for <xdp-newbies@vger.kernel.org>; Fri, 16 Apr 2021 08:35:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v13so583474ple.9
        for <xdp-newbies@vger.kernel.org>; Fri, 16 Apr 2021 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=wSV2gvFZSbSjtPd4ILqXUc5OMwQHEyZS6loRnbzsPew=;
        b=a8chjtS7x2UMCcZIS7r1ZiIQP8Bu5N8rEmPo5Bd9Ze6Tw7vCNaooLouqcCZQN4SzgY
         pZcTglNUfBefvNiTwO04viPfbIV8Kso656dv4k1aJUAcEHA9wUgjv/VHdGomJvWar21k
         7xdoiW2OaSpMj2s1Nk+JMAgjDi9GxNvuGudx3NhqubzWYI/UmO/x5RhKCMSgbs8tkiV6
         iTiO8n1Pc9KvyprX85VPSIRy9Ac0fDXaWIxdi7KQ2re9Lga/O4ODDxz/DKViWmSTVjRJ
         MUeMjy/SJ9ymk5qJNTtp1ONHPC+KL6RVO4HTSDt+PaS9SS3H/x6ctyxcQwy0nJLyikf3
         GuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wSV2gvFZSbSjtPd4ILqXUc5OMwQHEyZS6loRnbzsPew=;
        b=s8yrJs4WuIeRCmmiyt19eilCIbfKpKWQwXxhd1qT5Qb+92CPFUbE+wSAltf2G65O7Q
         8OOtY7bq3thxpgpyZSzO81MyDFHky6nZ4qrGhwfOa2kVLjoSPGwapNm7YP7Jxpe6ewKx
         MXBaY76iEoavZLMbYd6Rm1w9tosXiX/wzTtqBzcnD4ojtP1L3qI98x+NB2519ZDQc41E
         LRJu00Gs7jmEBhraKoh/58JULjKHyvk79MsNyh38eIiONLTJidG/PDckLOWLn+Pzvm9L
         niEPZ+5zQGAlZZwESA8zCR2SsyK6id4GiHEWLiuU5AGJe9cNL4YvE9isD1VQ7gjAWWC4
         Yddw==
X-Gm-Message-State: AOAM531nD8IJGZRJqOtLQYn4uDqltr+f9PtdSUP6odz191b3n/ovSSic
        K04Lm+GRRZ4gNSmk7IQR5pF9ehBrruQ=
X-Google-Smtp-Source: ABdhPJzIx0TBqQlnoiaNRfs+OgQuYyCa+FfrxYlm/WquUjdD1HvIYP0R3Z3oUWrktJiIOOjWNS1UzA==
X-Received: by 2002:a17:90b:1bd0:: with SMTP id oa16mr10278464pjb.49.1618587318808;
        Fri, 16 Apr 2021 08:35:18 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.45.41.12])
        by smtp.googlemail.com with ESMTPSA id kr16sm6046018pjb.30.2021.04.16.08.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 08:35:18 -0700 (PDT)
Subject: Re: bpf_fib_lookup VLAN
To:     Konrad Zemek <konrad@zemek.io>, xdp-newbies@vger.kernel.org
References: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <9e19881a-1f62-410f-8dec-0eff0c7ea03b@gmail.com>
Date:   Fri, 16 Apr 2021 08:35:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 4/16/21 5:03 AM, Konrad Zemek wrote:
> So both vlan fields in the output struct bpf_fib_lookup are always zero. I
> haven't seen this commented on anywhere, including the discussion around
> introducing bpf_fib_lookup, so I assume it's an accidental oversight.

The uapi was setup to cover the use case, but VLANs are not supported at
the moment.

> 
> Do you have any proposals for a workaround? Right now I'm thinking of
> creating a BPF map that would map ifindex->vlan, populated in the userspace
> - but that assumes the output (struct bpf_fib_lookup*)->ifindex will be an
> index of the vlan device and not the physical device the vlan is attached
> on, which I'm not sure is the case yet.
> 

vlan netdevices do not support XDP redirect.

It's not a trivial problem to handle VLANs or stacked devices in
general. I have working code here:

https://github.com/dsahern/linux/commits/bpf/mpls-vlan-fwd

but it is not ready for submitting upstream yet. The use case and
related ones need more work.
