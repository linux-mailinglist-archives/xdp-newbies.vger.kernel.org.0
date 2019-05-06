Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADEF1552F
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 May 2019 23:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfEFVAb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 6 May 2019 17:00:31 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:42868 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfEFVAb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 6 May 2019 17:00:31 -0400
Received: by mail-qt1-f174.google.com with SMTP id p20so16539613qtc.9
        for <xdp-newbies@vger.kernel.org>; Mon, 06 May 2019 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=3wJRQ6VKWRxL27a5QxEQoOQCJUnNTmSip3XDWhvdBaQ=;
        b=A/lSskv2O+Uy1ln/4WsjLObJSCsYlFzGzAWfWBpCgQp9nJ+T99/ChlO5vaAVXQQYq1
         kDaLE662WickGYjmxtVJdcvsq7kbFg4eC4W16FIdZCN7C2VGClGEdQDMahn3ZhHRkxpz
         xIiZn7TZq4GQZTSQxsdL3I9hj6RlHCaA9RvYcxeBBfDIV/gJAtL4IGK1GyNFw5ACccvr
         cZ2eUhhH0dV8ZgUOM7Un1kQSqKXNjDsZnpU1zGcN0N71PRXpRelhx4MLGkHG5W9T6Npv
         y9Wtzcv1SgLUUVHhBJVhRcCciD8eRu8h4dAs/HDyUMOPXIM1H+KtNqfsI1DVDUYMxByn
         pMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=3wJRQ6VKWRxL27a5QxEQoOQCJUnNTmSip3XDWhvdBaQ=;
        b=E8zPs9dctz8ew3sSDtd8MZkzPDMt+DS1Z6RnH+tZFKBQ3GUpScMQVMyWVh1ZV0Tejv
         LfF4Wh0hesHceDdtw5/jBIJ2QJ4KtlkywDdrs5s0VcZ1OjPoxkpjTPvh0pwvytIfaWlA
         1tNBvSmq2dTGRaeAPK8NpcYvawNYx/o75aHg0A9kM/M5bIhxG6Sd2kFeaoJRsXdL+PXV
         lg2ZNNbAaw6K44JjdkJ4jwph6BOKoNx81DEg8Exl+/xBGjPkmyBWDkPXa/agCqMFaHCq
         OXtO5kOoMcF/M2K96rh2L529Z3o4cEfTxRr6EeC7UtaBFL3xt6oyOxDXVHTFYatmphFX
         F3dA==
X-Gm-Message-State: APjAAAWhCD+qWkOcdCfEgKSpSrnsjQPBxNpn/csK4W5DC112b7LKY71i
        Rpvw55yPIaGVhC7DWVN+htWtYw==
X-Google-Smtp-Source: APXvYqx/0CijmHQT5nAegd8Iq3bmLEJ/dSOVuelYyGhdUDs4JSPE3rCKI5bh09sk4kBRUcTwpfs8uA==
X-Received: by 2002:ac8:743:: with SMTP id k3mr20214481qth.207.1557176430476;
        Mon, 06 May 2019 14:00:30 -0700 (PDT)
Received: from cakuba.hsd1.ca.comcast.net ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id 67sm5934254qtc.29.2019.05.06.14.00.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 06 May 2019 14:00:30 -0700 (PDT)
Date:   Mon, 6 May 2019 14:00:22 -0700
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
Message-ID: <20190506140022.188d2b84@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <673b885183fb64f1cbb3ed2387524077@natalenko.name>
References: <673b885183fb64f1cbb3ed2387524077@natalenko.name>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 06 May 2019 21:40:07 +0200, Oleksandr Natalenko wrote:
> Hi.
> 
> Obligatory disclaimer: building the kernel with -O3 is a non-standard 
> thing done via this patch [1], but I've asked people in #kernelnewbies, 
> and it was suggested that the issue should be still investigated.
> 
> So, with v5.1 kernel release I cannot build the kernel with -O3 anymore. 
> It fails as shown below:

Any chance you could try different compiler versions?  The code in
question does not look too unusual.  Could you try if removing
FIELD_FIT() on line 326 makes a difference?
