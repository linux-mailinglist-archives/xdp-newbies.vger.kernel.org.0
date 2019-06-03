Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F5933674
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Jun 2019 19:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbfFCRVr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Jun 2019 13:21:47 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46039 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbfFCRVr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 Jun 2019 13:21:47 -0400
Received: by mail-qk1-f194.google.com with SMTP id s22so909463qkj.12
        for <xdp-newbies@vger.kernel.org>; Mon, 03 Jun 2019 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=x7mTqHfW25Yfgg2m6bdYw6M5XlwzGvI7rSJIno4dGcg=;
        b=0pXOe0S3UATwQJ3foBGdeblPbc59sDMnw5rDa66bcJ7G6nqdYwsQk8hCfb5up0XMmM
         Xy01qTNfOqEqK9rjJEe66Nr2RxfnaGNnjoSo8ZbBnNJreVKYmqsILtZwHNg4hZhpRkNU
         YPvtf6KKMyygMqKeEOZ3ltOcu96YjOhtKbV7ZKGpqx1fO5zJGT8U8sIjlLmqq1jKniSX
         Jb9Pgaj2cceEhgjBZE7RNL6I1QnfxIcCDY7L0Zsy9t5Ss1TVs4EHzOD31w0h6d3UhiHg
         +Pw/XQ5+7tXPZyBDTJnK0Xv3aM8ZL6AO4j02CnutvdBDb+NXgHs7Md9385ZYFvG2M2H6
         tctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=x7mTqHfW25Yfgg2m6bdYw6M5XlwzGvI7rSJIno4dGcg=;
        b=MH2UlKKzPmSEcc0Lmlfvv3vF1vlZRstFPlU2NQdk2gr0A4PCLX/d6WPiB5yjMt0A64
         2JB9kOOOrQggZlKL3hQtgdtnrYo9QbHQ0DWdwsTs2RNek2eHHyMajyeWAHn4jXz6ocSv
         IBacgY/xPoBvXrdNJjIHAgOuy5qTfocllg+4hAwFqU7Zz/tN7JNHVuvwJ4EmtRsX1iWG
         nBi6GRdbmuyTVk900S7Z51YNI9l+NNw5ZmpuH1F3nnWND7bcwzayc5MRfD7OTwhmAkHY
         EPb+8ofkUXgr0FCCXLTM3G1lSv/iZJKhpSkBUiNnb9FuynnCMl8tRbVBC5LVWDWNNGT/
         sDrA==
X-Gm-Message-State: APjAAAX8DfD2HI5olxGZFbWOIAGXuPT3ErlFQtul+lGoJgWTwWRdZyGy
        kHkLWD8fEhEmh5jX2oThKNpXgw==
X-Google-Smtp-Source: APXvYqzLGOq03x63kPvRAktqQgITC5ecSo/OEEL09HH061JSrHRVkAQ5hmpnP8/k5LqHiSqlUAfRNw==
X-Received: by 2002:ae9:ed0a:: with SMTP id c10mr22414632qkg.207.1559582506309;
        Mon, 03 Jun 2019 10:21:46 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id 100sm8493263qtb.53.2019.06.03.10.21.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 10:21:46 -0700 (PDT)
Date:   Mon, 3 Jun 2019 10:21:40 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S . Miller" <davem@davemloft.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bpf: remove redundant assignment to err
Message-ID: <20190603102140.70fee157@cakuba.netronome.com>
In-Reply-To: <20190603170247.9951-1-colin.king@canonical.com>
References: <20190603170247.9951-1-colin.king@canonical.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon,  3 Jun 2019 18:02:47 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is assigned with the value -EINVAL that is never
> read and it is re-assigned a new value later on.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/bpf/devmap.c | 2 +-
>  kernel/bpf/xskmap.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> index 5ae7cce5ef16..a76cc6412fc4 100644
> --- a/kernel/bpf/devmap.c
> +++ b/kernel/bpf/devmap.c
> @@ -88,7 +88,7 @@ static u64 dev_map_bitmap_size(const union bpf_attr *attr)
>  static struct bpf_map *dev_map_alloc(union bpf_attr *attr)
>  {
>  	struct bpf_dtab *dtab;
> -	int err = -EINVAL;
> +	int err;
>  	u64 cost;

Perhaps keep the variables ordered longest to shortest?

>  	if (!capable(CAP_NET_ADMIN))
> diff --git a/kernel/bpf/xskmap.c b/kernel/bpf/xskmap.c
> index 22066c28ba61..26859c6c9491 100644
> --- a/kernel/bpf/xskmap.c
> +++ b/kernel/bpf/xskmap.c
> @@ -17,7 +17,7 @@ struct xsk_map {
>  
>  static struct bpf_map *xsk_map_alloc(union bpf_attr *attr)
>  {
> -	int cpu, err = -EINVAL;
> +	int cpu, err;
>  	struct xsk_map *m;
>  	u64 cost;

And here.

