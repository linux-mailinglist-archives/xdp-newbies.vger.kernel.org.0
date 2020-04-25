Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D971B87B9
	for <lists+xdp-newbies@lfdr.de>; Sat, 25 Apr 2020 18:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgDYQfH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 25 Apr 2020 12:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgDYQfG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 25 Apr 2020 12:35:06 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593D9C09B04D
        for <xdp-newbies@vger.kernel.org>; Sat, 25 Apr 2020 09:35:06 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id g74so13535097qke.13
        for <xdp-newbies@vger.kernel.org>; Sat, 25 Apr 2020 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F3AkqRDNrvfoqt9vVhdrC+gQhSSUve3iT9LTMIhVR6g=;
        b=J/B+MHE9ZNOVlFFopdb12d4Si9Ge6WUriookuAY97UQId+C3C1xJhkTdhFuIp/PVyI
         9ymAjquEGnxeYrpbBEztrqqAo2kEFPeTAYOgp7qvRjSdCPW15n5Cra2txHv+zeqHYVzc
         2hL7oQeNBz9PW84XL2j2LjJgyvITIfobpdXddWxLhGOpzyd854kFN0zftOrdJMkXRWOf
         Fns/AU6RN4meQ6/flaDu7qU0x3zhsRUbEdcOzd467QiW3+VcbnJ/pXF+tSDU5p5fT1tk
         fl79rxQIbfpn44Nm0a58PH0RIzZhFrXU3Y1cLCS+i4QISrEFdxGIkyP/FGfrlY/5A0V1
         Y2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F3AkqRDNrvfoqt9vVhdrC+gQhSSUve3iT9LTMIhVR6g=;
        b=f23I0CKddm6keAbelIBR1wz2mENKTEKZNQlAZNvIB26H/xrUMulk6za6wSywPBIwzc
         sAmi9ICgLTgC4Hps15w0NpMl27N9QLD6vxk+IeK/UzwKTM1/XSqCmdn8vKeAetrghKra
         BuDr/axsS79lMEbhDc6QztnbUHgHv2in47KdnWO9RE50yw834cxITt8n6H7f7p4M+CZ+
         ICg0Fcf97pdy5et0qIxhQaymPxpZKdecrOgFzQRCznbaUqH7A+UT9y3rXuRRKdEaVIl7
         5RvDrZI9gFd1eW+aVXQmdOjXASfXAmjAwnIKNa7n6dR/DBaHHGQXBnYsBvAbHzcCI7CG
         Mw4Q==
X-Gm-Message-State: AGi0PuYE3YB6pp4Ln+XWmnJyIbY7IDtPldqssyU8SlSyjPFcfoplDHoY
        Uz0ae5rmgF8G5fJk1u5hTcXLnXAe
X-Google-Smtp-Source: APiQypLlpztfmbcEG2czS1oKH+BBIam5B0We++NexxkSPuP4rHjFX+DONee8FL4iuKLFf1o3Gb0omg==
X-Received: by 2002:a05:620a:2202:: with SMTP id m2mr14287731qkh.426.1587832505513;
        Sat, 25 Apr 2020 09:35:05 -0700 (PDT)
Received: from gmail.com (pool-74-104-133-20.bstnma.fios.verizon.net. [74.104.133.20])
        by smtp.gmail.com with ESMTPSA id p202sm5953730qke.120.2020.04.25.09.35.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 09:35:04 -0700 (PDT)
Date:   Sat, 25 Apr 2020 12:34:58 -0400
From:   Sowmini Varadhan <sowmini05@gmail.com>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: building eBPF
Message-ID: <20200425163458.GB455@gmail.com>
References: <20200425122225.GA455@gmail.com>
 <20200425145619.4405a50d@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425145619.4405a50d@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On (04/25/20 14:56), Jesper Dangaard Brouer wrote:
> 
> The kernel's samples/bpf/ should still builds with LLVM-9 (and lower).
> Follow instructions in the README.rst file[1].
> 
> There are pre-build Debian and Ubuntu packages for LLVM-10 here:
>  https://apt.llvm.org/

thanks that helped me install llvm-10

However, after all my adventures, I  end up with
# ls /usr/bin/llc*
/usr/bin/llc  /usr/bin/llc-10  /usr/bin/llc-5.0  /usr/bin/llc-6.0  /usr/bin/llc-7
and the default points at 6.0 so I had to go and tweak Makefile
to use clang-10 and llc-10

After that, samples builds and runs (thanks for that hint!).
But not selftests.  However, samples is good enough for my experiments,
for now.

> I suggest you start with the XDP-tutorial[2], it (still) works with older
> LLVM versions: [2] https://github.com/xdp-project/xdp-tutorial

will do.  

--Sowmini
