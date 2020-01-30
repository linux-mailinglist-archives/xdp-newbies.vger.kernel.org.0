Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD4C14D5D0
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2020 05:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgA3EmB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jan 2020 23:42:01 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44292 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbgA3EmA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jan 2020 23:42:00 -0500
Received: by mail-qt1-f196.google.com with SMTP id w8so1424133qts.11
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Jan 2020 20:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=vW5RhrIGCqvEYZT+lkT+luFGQWRqlGC/ecS3jYkSte0=;
        b=pUIYT/mfxkVDV5owyQBZjnPhFyGMu5IDpLuK4ZrNlcUy/FD90oU8EZU97tFIh8X5oQ
         tr10f44DfHH2Hvnlhyr+2XYMho6CkmcGEggddN2eMNoJrQ7x0UN4efbC50InInFtLgQt
         nQeP20J8kLorKxpVaGd8tZkRSzIf1Og4KgBc1g/VRqNTuZtvGHPoppsZ529h8XxXxxpP
         M5ffcbJCX2BKzT5/lIu1l2/DXq8gdkplLvFMnyKkpTsa7ipJfQyUwGeaUbLnHTqu6fEz
         +vXqVYQ0uEnvoFW/pnKRfRu6+Wo9xInb8PebNSSDjDsVfEoYIvFhmfhJHcyBy9mdxRk6
         JoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vW5RhrIGCqvEYZT+lkT+luFGQWRqlGC/ecS3jYkSte0=;
        b=X5KNNP4YR+UeQnLHFSkC+pEZsEHmcVzSEwZJ4UBBqtO1gjhN5FjjSmaP2fjrOwCrXh
         7MNSyHI61FgNh3G05n9GYyQ+Ig+wjrhgl3QOuERS8BpwcRRX6C96n63uis88I0yS60Zl
         RQ1ZX9dVJMHXMH2emQ6o3/10cRIAwc31c9vbLYMn5TuB9W+QAf6WGUDYhWr6Ojb5rmGJ
         FNgnYIgqsT0Ugn4pXZ11URQERx0E9UsQNhv95FD7Da7Gk6wDCTXhYa72blROYrTVJE4w
         +mL7K6iqTReQrgu+pmf41Aj5AD2PWMLdqdMDOwbRC+BYzR+YmSdxOk9c9U54d0ElGY6c
         y96w==
X-Gm-Message-State: APjAAAWg/4xWZYoqG897U/p+JiyY9ibXinesY9ZkdXmFeKxmDaumUFOm
        fldaOgHOUJ7ZgGEvt+N9vKc=
X-Google-Smtp-Source: APXvYqxL/wYNLATF95TARk82xjp46DDuXY0cJsHCKkUFj05s0TX/XU5+1w7R38X0N4C/BjnZa2iTNQ==
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr3033746qtv.144.1580359319673;
        Wed, 29 Jan 2020 20:41:59 -0800 (PST)
Received: from ?IPv6:2601:282:803:7700:58fc:9ee4:d099:9314? ([2601:282:803:7700:58fc:9ee4:d099:9314])
        by smtp.googlemail.com with ESMTPSA id f7sm2238867qtj.92.2020.01.29.20.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 20:41:58 -0800 (PST)
Subject: Re: xdpsock ... -N -z and AF_XDP XDP_ZEROCOPY not working: RESOLVED!
To:     Cameron Elliott <cameron@cameronelliott.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
References: <CAMyc9bVpR9thvVsa-LWNg6BPwkqNcL-W-FuEXdfXgGxCUUn3jA@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <c45f64a7-ffff-a123-818c-4dc127cd3ff4@gmail.com>
Date:   Wed, 29 Jan 2020 21:41:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMyc9bVpR9thvVsa-LWNg6BPwkqNcL-W-FuEXdfXgGxCUUn3jA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 1/29/20 6:02 PM, Cameron Elliott wrote:
> With this command:
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> More info: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/
> 
> I built the kernel using these directions:
> https://wiki.ubuntu.com/KernelTeam/GitKernelBuild
> 
> And after rebooting and running on the 5.5 bpf-next kernel, -z and
> XDP_ZEROCOPY were working fine!

since this is literally bleeding edge, is there a wiki/doc/other for
kernel versions and supported features? Something similar to what MLX
does for switchdev [1] would be really helpful.

[1] https://github.com/Mellanox/mlxsw/wiki
