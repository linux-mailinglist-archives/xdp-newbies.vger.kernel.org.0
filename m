Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A84F23CD8
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 May 2019 18:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392524AbfETQEN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 May 2019 12:04:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35946 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392519AbfETQEM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 May 2019 12:04:12 -0400
Received: by mail-pl1-f195.google.com with SMTP id d21so6938702plr.3
        for <xdp-newbies@vger.kernel.org>; Mon, 20 May 2019 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+BJB3XofyjMBzl6IuBWPmnMj0izyvSUxO/CpTKK1zc=;
        b=hnL9NVzjCWe2lIwkTEcU8KVQ+Et0kXRD9UuFtdPunRg3hk3tjlam3RPbbB7k52ubqL
         tJ38XwwbGOwH0AFpm4VtJHOZ+i6MNUOninMm2lstGeaRpOLEeyOvLnrJYNdA9jqLZ0jY
         LHevsiFGHFOXT4fUVtNvpSO/Orq9J6LMMgTrqRUDfKku5XyrjTmM+ikDyPsDLHkboD1W
         7988lHv+oLm+6uWXyDqdpVvv0PAAgPoQtAVZkqBtVyqy4hC6zsxG2qlrnK0TuVNQxMRK
         4fzWHuzRdJLHkjrAw8oal5ZYTEPPHRekNvYDcZsSQpv5v3FpUnA8eEjrd5QBFiAuV75c
         Jrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+BJB3XofyjMBzl6IuBWPmnMj0izyvSUxO/CpTKK1zc=;
        b=t0z1c9fOmUE6mkJSSChGfMz4w0Z+tIfHnxdx0jd1o67YHmHHc6FUCdx4d98GHzY00G
         SbkOuPSX6GFVqEq0kfv5y1XkL+aHWR71+EeeMVJvzQyBEHnjOipRLPQOsejDTKc9ucuJ
         C92Jpn7dk3YPGsSRBgQM6oBVBnt1Za9RCFBiDR1oby8zVZLv1wPFkxJzUQqgPBNrUi67
         rSk+1R+5d2kkuaZqhFVvN9EHD6Y6WsmNni5qvIYbiQzzg9C/Ne0LO+N16jIkcFgd+gUi
         goUymGVeTF4F2dsz2FqnqqgBSBAuH+zgYzS5grpQqbaKTKi7Wf019osERp6y3gWSFpon
         kwkQ==
X-Gm-Message-State: APjAAAUnfaivcAl/O3SopalIIr2/6R5vXRnE4mvpvY2lsnCPMsYRimEO
        Fdj61hyaB2wx6G/N4Jtnb0GASw==
X-Google-Smtp-Source: APXvYqztibCADGVODRmEk4szKd4AhYTmp8cMzoPSJaz0RvoWX47dzIWQ3dzVLfUF1pFx8gIkGKmncQ==
X-Received: by 2002:a17:902:728d:: with SMTP id d13mr34154496pll.337.1558368252119;
        Mon, 20 May 2019 09:04:12 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id v81sm36546287pfa.16.2019.05.20.09.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 09:04:12 -0700 (PDT)
Date:   Mon, 20 May 2019 09:04:05 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        xdp-newbies@vger.kernel.org, bpf@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 net 2/2] net: core: generic XDP support for stacked
 device
Message-ID: <20190520090405.69b419e5@hermes.lan>
In-Reply-To: <20190520091105.GA2142@nanopsycho>
References: <20190519031046.4049-1-sthemmin@microsoft.com>
        <20190519031046.4049-3-sthemmin@microsoft.com>
        <20190520091105.GA2142@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 20 May 2019 11:11:05 +0200
Jiri Pirko <jiri@resnulli.us> wrote:

> Sun, May 19, 2019 at 05:10:46AM CEST, stephen@networkplumber.org wrote:
> >When a device is stacked like (team, bonding, failsafe or netvsc) the
> >XDP generic program for the parent device is not called.  In these
> >cases, the rx handler changes skb->dev to its own in the receive
> >handler, and returns RX_HANDLER_ANOTHER.  Fix this by calling
> >do_xdp_generic if necessary before starting another round.
> >
> >Review of all the places RX_HANDLER_ANOTHER is returned
> >show that the current devices do correctly change skb->dev.
> >
> >There was an older patch that got abandoned that did the
> >same thing, this is just a rewrite.
> >
> >Suggested-by: Jason Wang <jasowang@redhat.com>
> >Fixes: d445516966dc ("net: xdp: support xdp generic on virtual devices")
> >Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
> >Acked-by: Jason Wang <jasowang@redhat.com>
> >---
> > net/core/dev.c | 10 ++++++++++
> > 1 file changed, 10 insertions(+)
> >
> >diff --git a/net/core/dev.c b/net/core/dev.c
> >index b6b8505cfb3e..240d0b2de1a8 100644
> >--- a/net/core/dev.c
> >+++ b/net/core/dev.c
> >@@ -4921,6 +4921,16 @@ static int __netif_receive_skb_core(struct sk_buff *skb, bool pfmemalloc,
> > 			ret = NET_RX_SUCCESS;
> > 			goto out;
> > 		case RX_HANDLER_ANOTHER:
> >+			if (static_branch_unlikely(&generic_xdp_needed_key)) {
> >+				struct bpf_prog *xdp_prog;
> >+
> >+				xdp_prog = rcu_dereference(skb->dev->xdp_prog);
> >+				ret = do_xdp_generic(xdp_prog, skb);
> >+				if (ret != XDP_PASS) {
> >+					ret = NET_RX_SUCCESS;
> >+					goto out;
> >+				}
> >+			}  
> 
> I'm always scarred of changes like this. The history tells us that this
> codepaths are very fragile. It took us non-trivial efford to fix bonding
> here, not to mention vlans (that was pain).
> 
> The reason for troubles was often fact that different flows were treated
> differently (vlan accel/non-accel).
> 
> This patch calls do_xdp_generic for master device in different point in
> the receive patch comparing to lower device. Would it be possible to
> unify this? E.g. by moving do_xdp_generice() call from
> netif_rx_internal()/netif_receive_skb_internal() here,
> to the beginning of __netif_receive_skb_core()?
> 

I am trying that now. But one problem is that it would break the case
where XDP was being run on one leg of a bridge. For example if eth1 is
part of br0; then it would no longer be possible to run XDP on eth1.

Running XDP on eth1 might be used to do some kind of ILA or overlay
network. That change would break it.


