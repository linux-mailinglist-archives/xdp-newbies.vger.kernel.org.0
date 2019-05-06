Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78FF1155AB
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 May 2019 23:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfEFVgI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 6 May 2019 17:36:08 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]:39394 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfEFVgI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 6 May 2019 17:36:08 -0400
Received: by mail-qk1-f171.google.com with SMTP id z128so6284017qkb.6
        for <xdp-newbies@vger.kernel.org>; Mon, 06 May 2019 14:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=92TBfP6AEPchZTUan2PXByAVCV5aHVWIiftraVkfuME=;
        b=sJbXTmKWQtTUvSTjBLV8yxJbuWsvKCzinYgYM9jzzePYPBlyRDT472Idhg8AJRsTIp
         VvtWAXo35X3sxsyeOCd1zUQb4vAN0aDSc1qpgvX/qm3bAUoaboUb5+slDl6RMvC49iZF
         Q7aHjibqVnCe/z65zstTmDxnrC4n+C8Pcnb5L4oaPaFk88kxkLi2IrwuAei/MPYDejLV
         FFAoLi5UeZysxbLgHvvFXzRdF+pd1a9Y6wuDF0N5P6nV7d4m5GDZCmJglOOcGBGYTCdp
         T+7XOYc5KekyfJA/mLX0CNmXIubsziv+9pR05T1lRPCajYZoL47ihAlN3zebS2hmZpkW
         ybnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=92TBfP6AEPchZTUan2PXByAVCV5aHVWIiftraVkfuME=;
        b=X3WRrwbjN6+CYwCqq9DqbNk8j4y9Kbw33bk4ddUp/iW186n6RRMtuOysQP2nG7A5IF
         cgOBKfLEQH3n+hKaBNpG+Q0KXx6j0I5UFuYqbSfW0CBgKqxvWNz5zzKCtvGP2Zj5ERur
         9EskSKn5t7GQ4g4hSHETEIxeGnPgejqmyuaxbcD+0MQTWdSt/DCz99zn4vtqT/TELo9q
         EcaVX8Y5f6V/HNyj2S5zTMKzFOLHhdmM3Gb1L3MDb9sKirrD9liuhcBhcuGJ02udXci6
         JpIy6S3ERJECnSok9OPA6wtB4UB121vP9p2TT9ycTl5xBfCA/xm1gLVRKcwbH5+H7hUA
         idvA==
X-Gm-Message-State: APjAAAXyS6g55X6U9FACNoTnMeuviU2D80qxGsF31lB7jhnpwNhXVfEG
        03NUwoal511w0c+/LvoZoFz0Uw==
X-Google-Smtp-Source: APXvYqyLwlgu7HVcFCJ0Pc3G1IGsUKEkaPJ5gyvmRH0D9bffD/7Uges8jlJx5u3fNd8mUrgrQ+IRDA==
X-Received: by 2002:a37:b8c:: with SMTP id 134mr3793391qkl.121.1557178567283;
        Mon, 06 May 2019 14:36:07 -0700 (PDT)
Received: from cakuba.hsd1.ca.comcast.net ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id z38sm7641658qtz.13.2019.05.06.14.36.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 06 May 2019 14:36:07 -0700 (PDT)
Date:   Mon, 6 May 2019 14:35:59 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        oss-drivers@netronome.com, linux-kernel@vger.kernel.org,
        xdp-newbies@vger.kernel.org, valdis@vt.edu
Subject: Re: netronome/nfp/bpf/jit.c cannot be build with -O3
Message-ID: <20190506143559.31e7c968@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <2a3761669e4ec13847205d30384c0a17@natalenko.name>
References: <673b885183fb64f1cbb3ed2387524077@natalenko.name>
        <20190506140022.188d2b84@cakuba.hsd1.ca.comcast.net>
        <2a3761669e4ec13847205d30384c0a17@natalenko.name>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 06 May 2019 23:24:39 +0200, Oleksandr Natalenko wrote:
> Hi.
> 
> On 06.05.2019 23:00, Jakub Kicinski wrote:
> > Any chance you could try different compiler versions?  The code in
> > question does not look too unusual.  Could you try if removing
> > FIELD_FIT() on line 326 makes a difference?  
> 
> If building with gcc from CentOS 7:
> 
> gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-36)
> 
> the issue is not reproducible.

I just did a make CC=gcc-8 CFLAGS=-O3 with GCC 8.2 here, and doesn't
seem to trigger either.

> Also, commenting out the whole "if" block with FIELD_FIT() prevents the 
> issue from occurring too.

Hm, could it be that GCC 8.3 has some constant propagation bug which
breaks BUILD_BUG_ON()?  My uneducated guess it tries to pull the mask
validation out of FIELD_FIT() and FIELD_PREP() into one place but in
doing so loses some information.
