Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEC926C061
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Sep 2020 11:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgIPJWl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Sep 2020 05:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgIPJWk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Sep 2020 05:22:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106E6C06174A
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 02:22:40 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y15so2218135wmi.0
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=22J6FsQeYdHH9CJgQaVZ3trYkzcC0hIGh0KPe8vgGTU=;
        b=kCRROZexcWLXXP7usVE7SPn9efE9w2nx45tCoakSgpmmCInDa/JLkO53snKIwFTE1S
         1aVMjRyRXxf43I0sw4TOIIJUffmkD5CaSklyfEjtJu/GKickL5U0fJ6+dmpbAeHX2YOq
         K9FMk1nZaGlfKnO2a76EqXr+W7Kk9FuAU8Cswr6cY5/6frCjyRlq9fBPSaPw1UwtTgXU
         z+nJJ7OtJ4gNNoksuf0X1IC89lCXB3wS9QdEbqKZcEsyAEmquE3AbdIrNmOFW7Ag6f3E
         wH4oHLzXILCOn+zpqa4vQnJq3i7YSBRxNub60cLz3o6AsXONl1+V2wEuCAqPOxQy01X+
         jitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=22J6FsQeYdHH9CJgQaVZ3trYkzcC0hIGh0KPe8vgGTU=;
        b=p0G5rjXe/D2SF0Z+QA7PH4D7a6hqJTQk1b7DFscEOfU/R+VQOVMAOE2EHq9TZUTijJ
         K9brYa6hsMD5s4BneW6FwtGSOD6yaOSa0Ca3JbacurWuF2ZnpkQ7sxUOwRcLf7THdgm2
         Uh2LFeQHe0I96xX230SSshZt5QtFHpwBUm3bQAQMIukjcqMA4LZKe2ePZTSK335R7F0X
         vXBIS1w1K3l4yIxwjyFS/3UZc1xnsp6j+qci9Xfw3sWeIPgSLbT6PKymtUpOsdXroD5A
         5ldt7jbFB2+ugyt8SKCZ62nIezIHVHyH4AXbCoFnsosJgOR32DVL/vFMdl6neJ9MoKmh
         IfYQ==
X-Gm-Message-State: AOAM532q0Mn8ZOFGecUlQ/trgUU3/KY2N452kP0UIjMuECxIySDZpEiS
        rgnjk0Y7McKzxQtzK2/wmLRyNLcjlV5L6rHk
X-Google-Smtp-Source: ABdhPJwelGwfeFt3q9Li3fUwBkb40UbWe1gQ1xL92rIrnpiMKgzIW26z2s09KMVaTdUOVKzUbPoFAw==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr3694338wmb.32.1600248158264;
        Wed, 16 Sep 2020 02:22:38 -0700 (PDT)
Received: from [192.168.1.12] ([194.35.117.100])
        by smtp.gmail.com with ESMTPSA id k8sm4545872wma.16.2020.09.16.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 02:22:37 -0700 (PDT)
Subject: Re: Using pinned maps within a network namespace
To:     John McDowall <jmcdowall@paloaltonetworks.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
From:   Quentin Monnet <quentin@isovalent.com>
Message-ID: <de4d3860-dca9-a516-cf40-208c12abb3ca@isovalent.com>
Date:   Wed, 16 Sep 2020 10:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0a1
MIME-Version: 1.0
In-Reply-To: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 15/09/2020 18:00, John McDowall wrote:
> Hi everyone,
> 
> This may be a dumb question, I have set up a simple test environment
> with multiple network namespaces running on a ubuntu 20.04 vagrant
> box, with the latest github libbpf.
> 
> I want to use a pinned map, I can make /sys/fs/bpf shared by:
> 
> $ mount mount --make-shared /sys/fs/bpf
> $ mount --bind /sys/fs/bpf /sys/fs/bpf
> 
> but when I try access the maps from a C program running in a namespace
> using bpf I get
> 
>  Access to /sys/fs/bpf/lwtconfig map failed obj_pin errno: No such
> file or directory
> 
> The code snippet is:
> 
> mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
>         if (mapfd < 0) {
>             jed_info(jed_logfile,"Access to %s map failed obj_pin ",
> CONFIG_MAP_PATH);

Hi, from your log message ("obj_pin") it looks like the error occurs
when you try to pin the map, not when you try to access it. The way you
try to pin it:

	mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);

looks suspicious. If I remember correctly, bpf_obj_pin() returns 0 on
success, it does not return a fd. It does use a file descriptor to the
map as a first argument, can you double check that this is what "pin_fd"
contains? How did you retrieve this fd? It looks to me like "pin_fd"
does not point to an existing map, and that the kernel fails to find the
map to pin.

Good luck,
Quentin
