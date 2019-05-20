Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C9322FEC
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 May 2019 11:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731235AbfETJLI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 May 2019 05:11:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40188 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfETJLI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 May 2019 05:11:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so13678730wre.7
        for <xdp-newbies@vger.kernel.org>; Mon, 20 May 2019 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iY4bjmFlTOU+kWVhdgeuaCtlCIwIcKYJkRN4xoBuL9k=;
        b=ifu2MzurmOzynu/ICMLIcSkuvuAQbd897GSJqVWzgm3XShjERBZYAj4Y1Ve4DSGfcz
         SPwcFOcZgYG6DMitgEdtcmt+m/Jbf79eqaXJKHOF2KRKZkqW9C2jy2XHSZzrzvWWgOtq
         JMM1ZYqRVSCIzaiRVBwdNQiRI4YajZduxj1JsRep7Up3fXUiYq34h3GVDSMdtkZNZ4m9
         jBUu2PePFB4B8Ktow1i2E8/RTItnSEzYl4f5VFPbYuM9gpTyeaE4ycRbsDCqM5i3G5KK
         DFtZQDsn71yUc4/VTyOSoMqKRs4ABYIcaVJ7BZrzDBFNDHcK8pKv9PUek0HE2OJ2nSA/
         HvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iY4bjmFlTOU+kWVhdgeuaCtlCIwIcKYJkRN4xoBuL9k=;
        b=RaCZMwugQbFPpzFgOD9Hj/3Rfi2qHk8R9DNkykalA76AF1MtB2fP45H6GlHzdkKh6l
         HgV5fJ2+SfDFm62RaZfzx3+YV+bEvG9D9l+dWMzby628rSalXKp/DyrUIt7BrEafqnxi
         ompWUD6My7I4qO4tPAxpnauuSFyRQTgvDAdSTzH+2DXijYStGs3O4Gxb9p/BdPvcYLOy
         50j/i6ygOfSKXxuNZEarMJN+/D7tcwF//czf2uXkiSEkfWwliG3FrLIIHLunuPUIXfd1
         bSMvv2tkxHSCQzl+BFwfK9Q981wktxKsbnLHV6sCOR8+WwA2rGhwfV+McQkBU+AJG66e
         W3sA==
X-Gm-Message-State: APjAAAVBxUxWo6cF7Ri7vmw9+00Nw8Tjf/6NaCPoO3riRRd/JJZKGg1q
        V1Q6jrQzMvWUW6hEM+9dowN6oQ==
X-Google-Smtp-Source: APXvYqxLuUKh4+K19lqHo2rP6Vtuu/r9TgPMvae5Zvez0WEKspDuCUYCzvnYcSMwxk6FH+UzPuvh+w==
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr1962859wru.102.1558343466709;
        Mon, 20 May 2019 02:11:06 -0700 (PDT)
Received: from localhost (mail.chocen-mesto.cz. [85.163.43.2])
        by smtp.gmail.com with ESMTPSA id s13sm14350662wmh.31.2019.05.20.02.11.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 02:11:06 -0700 (PDT)
Date:   Mon, 20 May 2019 11:11:05 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        xdp-newbies@vger.kernel.org, bpf@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 net 2/2] net: core: generic XDP support for stacked
 device
Message-ID: <20190520091105.GA2142@nanopsycho>
References: <20190519031046.4049-1-sthemmin@microsoft.com>
 <20190519031046.4049-3-sthemmin@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190519031046.4049-3-sthemmin@microsoft.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sun, May 19, 2019 at 05:10:46AM CEST, stephen@networkplumber.org wrote:
>When a device is stacked like (team, bonding, failsafe or netvsc) the
>XDP generic program for the parent device is not called.  In these
>cases, the rx handler changes skb->dev to its own in the receive
>handler, and returns RX_HANDLER_ANOTHER.  Fix this by calling
>do_xdp_generic if necessary before starting another round.
>
>Review of all the places RX_HANDLER_ANOTHER is returned
>show that the current devices do correctly change skb->dev.
>
>There was an older patch that got abandoned that did the
>same thing, this is just a rewrite.
>
>Suggested-by: Jason Wang <jasowang@redhat.com>
>Fixes: d445516966dc ("net: xdp: support xdp generic on virtual devices")
>Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>---
> net/core/dev.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/net/core/dev.c b/net/core/dev.c
>index b6b8505cfb3e..240d0b2de1a8 100644
>--- a/net/core/dev.c
>+++ b/net/core/dev.c
>@@ -4921,6 +4921,16 @@ static int __netif_receive_skb_core(struct sk_buff *skb, bool pfmemalloc,
> 			ret = NET_RX_SUCCESS;
> 			goto out;
> 		case RX_HANDLER_ANOTHER:
>+			if (static_branch_unlikely(&generic_xdp_needed_key)) {
>+				struct bpf_prog *xdp_prog;
>+
>+				xdp_prog = rcu_dereference(skb->dev->xdp_prog);
>+				ret = do_xdp_generic(xdp_prog, skb);
>+				if (ret != XDP_PASS) {
>+					ret = NET_RX_SUCCESS;
>+					goto out;
>+				}
>+			}

I'm always scarred of changes like this. The history tells us that this
codepaths are very fragile. It took us non-trivial efford to fix bonding
here, not to mention vlans (that was pain).

The reason for troubles was often fact that different flows were treated
differently (vlan accel/non-accel).

This patch calls do_xdp_generic for master device in different point in
the receive patch comparing to lower device. Would it be possible to
unify this? E.g. by moving do_xdp_generice() call from
netif_rx_internal()/netif_receive_skb_internal() here,
to the beginning of __netif_receive_skb_core()?



> 			goto another_round;
> 		case RX_HANDLER_EXACT:
> 			deliver_exact = true;
>-- 
>2.20.1
>
