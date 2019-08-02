Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C656F7E73E
	for <lists+xdp-newbies@lfdr.de>; Fri,  2 Aug 2019 02:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfHBAoZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 1 Aug 2019 20:44:25 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34888 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732712AbfHBAoZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 1 Aug 2019 20:44:25 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so72296356qto.2
        for <xdp-newbies@vger.kernel.org>; Thu, 01 Aug 2019 17:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=I99MXub3RxHBbdcs4GEzo+bYDVcQ48KGxJSMH7TVKYs=;
        b=NG897lt2eaaccL8b5AUCXatOaAcPbCPRCwmk4S2CJ9XSXaIUkg+vDTOo5UolwWxZDU
         eyIe2pYdFexKHI9rRhJH904vANu2uAcyS4Ds5adfBSoPiAE6xpSUDbzuxF3ZyIf4D3lM
         WgpJVtRkVq883k1D7GWX50OGVTrFgaBzSR6lIJydWHkw95TNOpubJKVYYn7uJs8KOPWa
         1uMQdnBSXmHsptp+LtLPptptEYVeIJRIdvNmxIkfjPgwTONsL+GuzE43szff1P9Odo5d
         V0ibVaLIIapK4U1ZGVQE0iXt3VPwO2kZGpIVgMMBWyLi7f0XpQDF8MdJDU23ghpnlsWK
         u2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=I99MXub3RxHBbdcs4GEzo+bYDVcQ48KGxJSMH7TVKYs=;
        b=An/RbJNEM8LmqPhr6HttK41qWRuUhSPytu5Ar3tsknZ0YIlvWxG4IYcuAeowM+R0kD
         rANwGDumA1s6xOeBdKiOYgQOJRTHbk8ft0h6VvtbaX3Ly0fEd/caEUV56b8tG3ZEb/Un
         9H2GqeIGFGUhSqN8KcveMeMgK8j9NBzfMKyx6Auy9kagmUZkwK3BFcTk5mVc/zdNuztb
         WZ59ycZCVwzb5mAIzpn+6F7CFqcFK0+aNiUp/tSqJsgD8nF4uvrSnY4lQWn2Cn0ySeKh
         UOIQS3J9ZxxvBkRmSN+Ku0MXzaIjQ+HKLUGwEyZ1jp1MvSNI21DSSnvTwY0oJ+rvpXhb
         JSbw==
X-Gm-Message-State: APjAAAWpRmtOzLPAhUOI9trMzPT6I5r5fcMyfRsqGUNPQ07jfT64aXOv
        /CFyKdyu2eUg1FmFCltWVbwJPQ==
X-Google-Smtp-Source: APXvYqxkqOBOpyQFdSQwvwMmI25LSLkQ+9YNmsSKR9EFlELk6AN5sYhqOnTW5y9G7I1AyYAtb5HGfQ==
X-Received: by 2002:a0c:87a1:: with SMTP id 30mr97960541qvj.167.1564706664159;
        Thu, 01 Aug 2019 17:44:24 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id j8sm31178842qki.85.2019.08.01.17.44.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 17:44:23 -0700 (PDT)
Date:   Thu, 1 Aug 2019 17:44:06 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        xdp-newbies@vger.kernel.org,
        Daniel Borkmann <borkmann@iogearbox.net>,
        brandon.cazander@multapplied.net,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [net v1 PATCH 4/4] net: fix bpf_xdp_adjust_head regression for
 generic-XDP
Message-ID: <20190801174406.0b554bb9@cakuba.netronome.com>
In-Reply-To: <156468243184.27559.7002090473019021952.stgit@firesoul>
References: <156468229108.27559.2443904494495785131.stgit@firesoul>
        <156468243184.27559.7002090473019021952.stgit@firesoul>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 01 Aug 2019 20:00:31 +0200, Jesper Dangaard Brouer wrote:
> When generic-XDP was moved to a later processing step by commit
> 458bf2f224f0 ("net: core: support XDP generic on stacked devices.")
> a regression was introduced when using bpf_xdp_adjust_head.
> 
> The issue is that after this commit the skb->network_header is now
> changed prior to calling generic XDP and not after. Thus, if the header
> is changed by XDP (via bpf_xdp_adjust_head), then skb->network_header
> also need to be updated again.  Fix by calling skb_reset_network_header().
> 
> Fixes: 458bf2f224f0 ("net: core: support XDP generic on stacked devices.")
> Reported-by: Brandon Cazander <brandon.cazander@multapplied.net>
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>

Out of curiosity what was your conclusion regarding resetting the
transport header as well?
