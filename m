Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998F81B87A6
	for <lists+xdp-newbies@lfdr.de>; Sat, 25 Apr 2020 18:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgDYQQl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 25 Apr 2020 12:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgDYQQk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 25 Apr 2020 12:16:40 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A8BC09B04D
        for <xdp-newbies@vger.kernel.org>; Sat, 25 Apr 2020 09:16:40 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id e9so13971496iok.9
        for <xdp-newbies@vger.kernel.org>; Sat, 25 Apr 2020 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k0vIzQC2lGV5X5pPeTrC0+kthTIrDN6ZpeWSqUIbOGc=;
        b=lFm2u0I+xpnZ3GtxcfQOvb/Fqif3RVZB/9kBWEp4lGKXJ2gdbd1bRGHBKd8ODBgztK
         u35D0fRgJXMLN0FPFqYkciBQ0Fi/hXkP/Vz7+KTr7L2UfWKIW5MkCoJ8pmUK58otyDyI
         JUrpx5TdG6CqkmqXAPCGVJC9oBz+6BlIZ9TLhyF5QfMrA/T95vlFav1sq0bxHigY6k7a
         R01giiyTGvWxeOnlsGbeQ1FIAOLxzLLCScT8WtKhjXcDCuq9YSCtVwlVp9HR9Ja5dBt3
         g/9bUqYGR2ZjZE57KQeTPJlRLMcSn/a7p2H1F87n589evVnEKYI6a+cLUzYZd305H9C/
         YoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k0vIzQC2lGV5X5pPeTrC0+kthTIrDN6ZpeWSqUIbOGc=;
        b=TNMBKuSYmYgvEh8E+1EXvm/bPoltx/Sdblvbdh9AKCcv7+cgpnTv28FefF/Xob/ZvC
         2tjSQAeRrEWVw+bOQfLkmLMZ3okbhF99NUgYYSX3M3gru4NX6w0blEO6wpxsQp/wIYJi
         z8jJrWYQWPwI+q/Lk49ybMbZUsiSayNqRk03dWbbY/q0gZ4NoEaLWXmtHGz9GIRG5DfD
         UymDsdInpOC4+6TobhegniAMMPGgCGjvw9wjsFGTvPL+yoRpawHrpgpvrjeYWdNXaXkt
         iDQCjZp006NeTZIFCdJR2HpopbGNIm6a4xSH2JkvWxrRsjnUVCfLbLj3y/kg7f2JEEce
         jHtw==
X-Gm-Message-State: AGi0PuZMfqvXjHwjwcOdwnFIM9UNk63zsKSZXvmH6c026nbeLKFbmFga
        m9LwVfUw4mANBSIANeVw4wHGg5VO
X-Google-Smtp-Source: APiQypKFW0zfV0eG8DMBGevxrYnp2twU07EVv79afvahYRd83aiti0h8DiIvBe+RIa56vJcGcKozoQ==
X-Received: by 2002:a02:ac1:: with SMTP id 184mr12702699jaw.140.1587831399549;
        Sat, 25 Apr 2020 09:16:39 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:7013:38e0:b27:9cc3? ([2601:282:803:7700:7013:38e0:b27:9cc3])
        by smtp.googlemail.com with ESMTPSA id e6sm3326382ilg.38.2020.04.25.09.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 09:16:38 -0700 (PDT)
Subject: Re: building eBPF
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Sowmini Varadhan <sowmini05@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <20200425122225.GA455@gmail.com> <20200425145619.4405a50d@carbon>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <aedacef2-25ee-7a46-cd5c-4aba448db68b@gmail.com>
Date:   Sat, 25 Apr 2020 10:16:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425145619.4405a50d@carbon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 4/25/20 6:56 AM, Jesper Dangaard Brouer wrote:
>> I am trying to get some basic eBPF examples up and running and I ran
>> into the problem you describe at https://lkml.org/lkml/2020/2/19/433
> 
> Yes, building kernel bpf selftests requires latest LLVM, currently
> works with LLVM-10.
> 

ubuntu 20.04 was just released, and it has llvm-10. I have been using it
to build and run the bpf selftests.

