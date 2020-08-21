Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E76824E3EC
	for <lists+xdp-newbies@lfdr.de>; Sat, 22 Aug 2020 01:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgHUXiE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Aug 2020 19:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHUXiD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Aug 2020 19:38:03 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0431C061573
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Aug 2020 16:38:02 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id b22so2960428oic.8
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Aug 2020 16:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PlE0geDPiqpVFofuw4zmPHFWxIiYspOCTvnbBdulhfA=;
        b=hH37jeJTSc6wI3WCLMGKLUoZ3r7qrScJD+Ht7gD7VH1bTkfsh+q4vQWUFN20UblVH9
         k5ZQ9PbVi+s9zRSchypnH9ykkogXWWq0k7ChCvGRn57NBc/oS487TeMvfc2b052dEoiO
         Ckh2BzQpQzH0DSr/lVN5HMFHKrPGhsEWsNx+1lV30fygkkjXmUkE39s1rhyPI2q87W8s
         /qXmBvRBtuJW83TTsGbPv7T/wKFUQisjYxLNLOnwEPYmMU3ZWXHxuqaRWUDsuwHJNLAb
         CIYcp7UDzS/PBmb/y5iaO+OBbiSIcnKZK/uFoqOoOn3AqU5sKRrGLaMcSF60nuckFzp5
         XXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PlE0geDPiqpVFofuw4zmPHFWxIiYspOCTvnbBdulhfA=;
        b=nJ25QY++yATbxUCf5Ht69OvQYvOlNHBtdKjJ0CMUtYFwFmLXI2cE//MGdbERcQ1wdo
         hqcIJPPTIs79zZEjeBptVq9MEDpCZNnpnimx7ZzfrUrqPrLvIopOhPL5rThGOnYmBLnD
         +96VRlliBeBtON8APb/9AiH0yXE0ugQYtKEadVE++mNq+Dm9Nhv89TwtOkcNtATMbfrJ
         dUEwau2p4Eyg3yWePBF0oVfdIpSiLrBr6qHChoH7TMaeqCOJd9SHWHLfUkew8Zw01MgA
         +/pnBw9IzlRy2077ad54B1m/Nx1HWNQf991wD1PstzBD1Vb5LIq41rmRbVd3bP70dLF+
         PzeQ==
X-Gm-Message-State: AOAM533bryWFxUGHcEGpvcOlH3s2NClPN/wlvXYZVBR1pjnv3Autbz0v
        xnIUIbqXzJ2Pj7UNjnhxAb8=
X-Google-Smtp-Source: ABdhPJyCOklBWY+UUip1NAjU21KeD4gL1zphWcMsbMcSFfC0q32SW1DCv47m7jb3UobOJkHA/yZbzg==
X-Received: by 2002:aca:2101:: with SMTP id 1mr3384029oiz.170.1598053080882;
        Fri, 21 Aug 2020 16:38:00 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([2601:284:8202:10b0:a888:bc35:d7d6:9aca])
        by smtp.googlemail.com with ESMTPSA id x9sm745425ood.45.2020.08.21.16.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 16:38:00 -0700 (PDT)
Subject: Re: Using XDP for Cloud VMs by David Ahern
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk2@gmail.com>
References: <20200821115614.40fa7eb0@carbon>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <20e8f763-e88c-a65d-50de-486609454acd@gmail.com>
Date:   Fri, 21 Aug 2020 17:37:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821115614.40fa7eb0@carbon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 8/21/20 3:56 AM, Jesper Dangaard Brouer wrote:
> Hi XDP-newbies and cloud-providers,
> 
> I want to promote the recent excellent work by David Ahern (maintainer of
> several kernel networking components). Ahern explains in detail how to use
> XDP for lowering CPU usage (and increasing performance) on the host machine
> running the Cloud VMs.  Making it more efficient for a cloud provider.
> 
> Ahern is explaining and calling for collaboration at many levels. (Note
> [xxx] brackets indicate link below). His [Talk#1] at NetDevConf have not
> been released on [YouTube] yet, but [Slides] are available. In [Blogpost#2]
> you can see the results for XDP vs OVS, and to understand how CPU-overhead
> is measured read [Blogpost#1]. He have even released the [Code] on GitHub,
> and encourage people to reproduce his results.
> 
> I encourage other cloud providers to collaborate with Ahern. XDP is a core
> kernel building block, but we need to create FOSS projects that explore
> different use-case (e.g xdp-cloud-provider). XDP is still early days, and as
> Ahern already discovered, trying out this Cloud-VMs use-case have identified
> several gotchas and missing XDP features that we should work on
> adding/fixing in upstream kernels.
> 

Hi Jesper:

Thanks for bringing this to xdp-newbies. I would definitely welcome
others to get involved. I had high hopes that this use case would fall
out of zabiplane work, but that project died.

Right now the code is integrated into in my repo for my convenience as I
move between hosts and VMs. If / when others get involved, I am open to
moving the code for the cloud host use case to another repo (under
xdp-project/xdp-cloud-provider?) and setting up lists similar to what
you have for xdp-project as a whole. I also have other code in a private
repository that I can pull over as well — e.g., handling decap of vxlan
packets to get the inner packet to do the forwarding lookup. It is best
used with hardware hints which can mark vxlan packets to limit the overhead.

We really need to get the hardware hints code committed it is key to
making this use case a reality.
