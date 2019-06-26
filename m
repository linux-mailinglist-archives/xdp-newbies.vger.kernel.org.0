Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA887570A0
	for <lists+xdp-newbies@lfdr.de>; Wed, 26 Jun 2019 20:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfFZSee (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 26 Jun 2019 14:34:34 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44241 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfFZSed (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 26 Jun 2019 14:34:33 -0400
Received: by mail-qk1-f196.google.com with SMTP id p144so2504189qke.11
        for <xdp-newbies@vger.kernel.org>; Wed, 26 Jun 2019 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=bUsYiNyoZNoL9lby/1FtByidZxf9m7iN70pAJQ8cHC0=;
        b=r5VP+hiPFDl1KT2oQBakfOd9mxdQI719XRPTQTYuuG50ZfGHKYHwHjMUsKt7nA5WaF
         Ml3W+oex9LoGShtNebp+J8L3h3magpWY/DRmg1RCloe8suDVfKtVUzyNNZlNq473kJHC
         28/KogVtHOP+FFbELPKWmrtSdx7SmbT6FKEtEsaqXVGH167iyJ73yvx8Wy9Hl585WwpP
         DvFfZtVg8v/Wqd9rGYl1mN55dTe/HeWcIcawx0FeA3GTlmyNBEjPYjMkZfyuznbFHM/O
         e59KtZnF3mQHBm9Ytx+AZb8EzpmC3YGuRJhGqQYl3uobg4plf1R6FzAO0DuczDGM1B2b
         fR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=bUsYiNyoZNoL9lby/1FtByidZxf9m7iN70pAJQ8cHC0=;
        b=BZgGpP3dHB8vKbyDCVS921c8Fwc6TRq9629HQelIac0ocz7D6CTqgBiqeFtlMFAVAK
         /4gAOcvqye2zDemH7JdbP6N7ppqOuGqJk0N9EC+q+DxH+rxLUgRU4f0DBnmBTpckPulL
         oBpf1Ma5H3dNyG5NXmNoiOkxqqOEaglwskFs1IsLRKah7+OsceiTJm9gc8Y9R2QGfTOn
         1XxMe/YPZlBJzOAAJ7JfLgIrP71x1bwNr3bV4nIPMaV4OXKSkZ8SsJhLCAXtqiJmB+VJ
         yYJt3cGVcJOWtmF+kO5+65OGyxtIIXcpzcrw5IBZOPm/Oc2RTIKZm82RUqwMZ1JAIGW+
         mFbg==
X-Gm-Message-State: APjAAAW6p8jGoWo1FKDPTi01+iin59bIEZpSzIYgQsIlJEJfBIwaMZnx
        ZBDOoKS00wgY9qwIbSWzc7gDoA==
X-Google-Smtp-Source: APXvYqwIjRK9ufTFUbOfPl6WKlxXXjYaqCKV8dx/pdoLrLKTUftM+rSEze3dcL/V4SGGMeFv9RhVsQ==
X-Received: by 2002:a05:620a:1497:: with SMTP id w23mr5125682qkj.49.1561574072737;
        Wed, 26 Jun 2019 11:34:32 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id d17sm8220627qtp.84.2019.06.26.11.34.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 11:34:32 -0700 (PDT)
Date:   Wed, 26 Jun 2019 11:34:27 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Ilya Maximets <i.maximets@samsung.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, xdp-newbies@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH bpf v4 2/2] xdp: fix hang while unregistering device
 bound to xdp socket
Message-ID: <20190626113427.761cc845@cakuba.netronome.com>
In-Reply-To: <20190626181515.1640-3-i.maximets@samsung.com>
References: <20190626181515.1640-1-i.maximets@samsung.com>
        <CGME20190626181528eucas1p190f20427a1d2a64f2efa6cedcfac0826@eucas1p1.samsung.com>
        <20190626181515.1640-3-i.maximets@samsung.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 26 Jun 2019 21:15:15 +0300, Ilya Maximets wrote:
> diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
> index 267b82a4cbcf..56729e74cbea 100644
> --- a/net/xdp/xdp_umem.c
> +++ b/net/xdp/xdp_umem.c
> @@ -140,34 +140,38 @@ int xdp_umem_assign_dev(struct xdp_umem *umem, struct net_device *dev,
>  	return err;
>  }
>  
> -static void xdp_umem_clear_dev(struct xdp_umem *umem)
> +void xdp_umem_clear_dev(struct xdp_umem *umem)
>  {
> +	bool lock = rtnl_is_locked();

How do you know it's not just locked by someone else?  You need to pass
the locked state in if this is called from different paths, some of
which already hold rtnl.

Preferably factor the code which needs the lock out into a separate
function like this:

void __function()
{
	do();
	the();
	things();
	under();
	the();
	lock();
}

void function()
{
	rtnl_lock();
	__function();
	rtnl_unlock();
}

>  	struct netdev_bpf bpf;
>  	int err;
>  
> +	if (!lock)
> +		rtnl_lock();

