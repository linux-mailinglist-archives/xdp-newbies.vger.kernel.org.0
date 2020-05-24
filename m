Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E0B1E018F
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 May 2020 20:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbgEXS6P (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 May 2020 14:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387951AbgEXS6O (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 May 2020 14:58:14 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC24C061A0E
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 11:58:14 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id p123so3215629oop.12
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=adG/2Bw03uBNYtyoHbdfScHZ7cE3PcrpeUlhmxUjVxM=;
        b=JxvLCpPKAyvLXLOVizNhKhAdMcB6zh0iFZngoh3ADO+BNbQPrx2h55nr5NWEkLdthe
         zzmNSt9eA8LyqFoljg7bPUHuMb7txweRa0Enn8hduAHx2deXCHgb9tH2QzwWtgKo7YTf
         wVNIe4NLucDYgioDG0looQPBAMv1jG2S8SMM/IsXlAmJ4bRkHvFH46V0meZPR1cvD2Ef
         cr+edHUln6HQqkZHPqQi0LdvVSq4oAEQ0QnMO/zeQZ1wzbBYZcF9YErpx3EmX2xw83ZA
         nQWN5HtNZREw03jptvnpefto6UHGJdRRgBSjoPybhMqXySH1h8IbOHZbr+SJk69TUNl5
         DINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=adG/2Bw03uBNYtyoHbdfScHZ7cE3PcrpeUlhmxUjVxM=;
        b=dV4iq1STzifHJMfbg1+i3PFnoIGuYn0hCE1DT1kbhvcV4QO89p9e4KzJhBcj4jvB0C
         S/Z75+pvqivaLcj0idkUaMJLC6kDbdv5xUTzK5HKiA7N0S9plsz0L1RSeMlhUPjcRiBH
         /IK5RTydtnw9fvnJF+uLPdtvQiyvsuXfytC8dpPpVzy6mVUN9UkA7xwamcEWF4j2jHzE
         3SeCpMgsNR9XFnV8vzlUVC2T5AHpHaVuLz0yJTzMTFm0uBHdcXOKGgkMLo/ARTeCRwjb
         JnGMfQ3iI33P2cKm4bSkvDxs6AfAnjj/4MVX2gJn1elSHZLlcweN35LM0BZy+lEoU385
         FCDw==
X-Gm-Message-State: AOAM530nuRm81bjPiRk3V/9kW/vDyRjZIQslJXWmSy75Z57euCj7cIPk
        ReCL01UgRVyh88jFLyH5pPpVilHQ
X-Google-Smtp-Source: ABdhPJylWJmDlpz6ZckOMQHYt6kj8psWh37sV7WnNISOr/mCgUK2CadzpjHzWJO7peewcCXD5D7Llw==
X-Received: by 2002:a4a:d043:: with SMTP id x3mr10729416oor.17.1590346693526;
        Sun, 24 May 2020 11:58:13 -0700 (PDT)
Received: from ?IPv6:2601:284:8202:10b0:dde6:2665:8a05:87c9? ([2601:284:8202:10b0:dde6:2665:8a05:87c9])
        by smtp.googlemail.com with ESMTPSA id i13sm2573102ood.15.2020.05.24.11.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 11:58:12 -0700 (PDT)
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     Christian Deacon <gamemann@gflclan.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
 <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
 <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
 <2ed7d441-1a98-b4c1-8799-733ae286ed5e@gflclan.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <f4a901ef-6edf-0b92-5ec1-d931956c0ffd@gmail.com>
Date:   Sun, 24 May 2020 12:58:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2ed7d441-1a98-b4c1-8799-733ae286ed5e@gflclan.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 5/24/20 12:13 PM, Christian Deacon wrote:
> Hey David,
> 
> 
> Thank you for your response!
> 
> 
> The VM only has one CPU right now. It's possible the cluster has 8 RX
> queues I'd imagine, but I don't have that information sadly. I executed
> the same command on another VM I have with two CPUs (not being used for
> the XDP-native testing):
> 
> 
> ```
> 
> root@Test:~# ethtool -l ens3
> Channel parameters for ens3:
> Pre-set maximums:
> RX:             0
> TX:             0
> Other:          0
> Combined:       8
> Current hardware settings:
> RX:             0
> TX:             0
> Other:          0
> Combined:       2
> ```

That's odd that they give you 8 queues for a 1 cpu VM. This is vultr? I
may have to spin up a VM there and check it out.

> 
> 
> I did receive this from my hosting provider when asking which NIC driver
> they use:

...
> 
> 

I agree with the provider - the hardware nic's are not relevant to the VM.

> To my understanding, if the NIC isn't offloading packets directly to our
> VPS, wouldn't this destroy the purpose of using XDP-native over
> XDP-generic/SKB mode for performance in our case? I was under the
> assumption that was the point of XDP-native. If so, I'm not sure why the
> program is loading with XDP-native without any issues besides the AF_XDP
> program.

The host is essentially the network to your VM / VPS. What data
structure it uses is not relevant to what you want to do inside the VM.
Right now there are a lot of missing features for the host OS to rely
solely on XDP frames.

Inside the VM kernel, efficiency of XDP depends on what you are trying
to do.

A 1 or 2-cpu VM with 8 queues meets the resource requirement for XDP
programs; I am not familiar with the details on AF_XDP to know if some
kind of support is missing inside the virtio driver.

> 
> 
> I will admit I've been wondering what the difference is between
> `XDP_FLAGS_DRV_MODE` (XDP-native) and `XDP_FLAGS_HW_MODE` since I
> thought XDP-native was offloading packets from the NIC.

H/W mode means the program is pushed down to the hardware. I believe
only netronome's nic currently does offload. Some folks have discussed
offloading programs for the virtio NIC, but that does not work today.
