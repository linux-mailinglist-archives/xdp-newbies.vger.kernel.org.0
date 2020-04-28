Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3212B1BC64C
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Apr 2020 19:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgD1RTH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Apr 2020 13:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgD1RTH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Apr 2020 13:19:07 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4629C03C1AB
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 10:19:06 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id k12so17968618qtm.4
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 10:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=rpSVexTlTMrngytLRS8PSHAjpmH9snxsb4gZk2KIMLw=;
        b=h+CHSngY+wrZuB02BxNholczt7BNsIaHcwchlFsK+PLocIzSI+Wf9SbUZJ8J0WxQbj
         k2U6h+RLMgeCcskvSpMBrnV/mCiMi0tAVH1NHmeqvUL1+OV7aBomJWzSWF9MFo6gE1EB
         ewxW94vUyG81w8GORosonfJgZWksHtWdlHRkBnfdwlVs93euJcLnhwJtfsqrzuXEEKYI
         xcpM0Ifc89F3HQPd3bl5Rkm4jsLvYN83DIaw0DbXxzhpdDrxSE3x2WO4qPcJq6ylBU5Z
         hSzAKpqZvRIjfHfpS/W/m+cERoJZz0E3ORpOVnTeNJ37Rf2sfJsQa2h7X/cG2rzYFqMm
         QLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rpSVexTlTMrngytLRS8PSHAjpmH9snxsb4gZk2KIMLw=;
        b=fIbl6XLtiWiFdpqnFI10vD2jUQHONI51S/Anyn0yDMIucVUE2YmZaVbVtAnPmgaJ/A
         sfR3nl4RYMIj+oriG1YSDlUr4PGlaY8gq8qLP8oRjas7EL5Fh4LA6l83y/xjugEp7go7
         gpdjZdAb0Cz/6IU3by6LwWDVhWoBuHI/HqV9nv5s6qH4LHK1r6P6PGKOLK67BVdFrfTx
         vctxWuQU7dTFDnv7Pp98hyoIMb2gd4sG0EkzCrFijeLveDvrPRCxwUNY4akAsld5XjPC
         901Vx7ekb61iVjF5e8rtb9WJcSLN7WNJhnCdR0JaGAj2ocgS5FKksYgO8Wh+VLxBNIzB
         k3+w==
X-Gm-Message-State: AGi0PuayJEGRzS4NN7N1tN0dUGyzTYQzlsQyHHu5+wgMUmch/swzLpKE
        KoLrXh1HlibetBU78WRgQdlJ3SYv
X-Google-Smtp-Source: APiQypKgulQH5CDxKZMEvoWv0Ag30LuORPcVh8RJ4l/iR0au3A3bkd/1qSD/LRRgEh2963tGGNTNCA==
X-Received: by 2002:ac8:8a:: with SMTP id c10mr29993222qtg.369.1588094345597;
        Tue, 28 Apr 2020 10:19:05 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:3576:688b:325:4959? ([2601:282:803:7700:3576:688b:325:4959])
        by smtp.googlemail.com with ESMTPSA id b10sm10735777qkl.19.2020.04.28.10.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 10:19:05 -0700 (PDT)
Subject: Re: XDP Native mode with public cloud (GCP)
To:     John McDowall <jmcdowall@paloaltonetworks.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <CAHQoOTZGdLYZ=qjF8+Rwi+E5y_st1u1CwMPiP65UHWpvRXvhZA@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <60973878-18e8-aca3-5b4b-26947dc5ded8@gmail.com>
Date:   Tue, 28 Apr 2020 11:19:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHQoOTZGdLYZ=qjF8+Rwi+E5y_st1u1CwMPiP65UHWpvRXvhZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 4/28/20 11:11 AM, John McDowall wrote:
> Hi,
> 
> I am running the XDP redirect example on Google Cloud Platform using
> the GCP provided Ubuntu 20.04 image as my host. The code works fine in
> SKB_MODE (xdpgeneric). When I go to DRV_MODE I get the following error
> message:   "libbpf: Kernel error message: virtio_net: XDP expects
> header/data in single page, any_header_sg required".

The most likely explanation is an old machine model for the VM.

But that is just the first step. Once the VM model is updated to
something modern, the cloud provider needs to enable multiqueue for the
tap device with the number of queues = 2 * vcpus for each tap device.
e.g., a 4 vcpu VM needs 8 queues per tap device that xdp is to be allowed.

> 
> For all images on GCP that I have looked at the number of RX and TX
> channels are set to 0 and the combined is the number of cores (ethtool
> -l dev). My question is then, is there any way to run XDP native on
> GCP images or do I need to try and create a custom image with re and
> tx queues set?
> 
> Second question, does anyone have experience running native XDP on AWS
> and Azure?
> 

last I looked AWS does not support XDP either. Never tried Azure.
