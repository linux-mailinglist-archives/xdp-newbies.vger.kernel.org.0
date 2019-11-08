Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F90F3E73
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Nov 2019 04:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfKHDgd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 7 Nov 2019 22:36:33 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:45256 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfKHDgd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 7 Nov 2019 22:36:33 -0500
Received: by mail-il1-f174.google.com with SMTP id o18so3854565ils.12
        for <xdp-newbies@vger.kernel.org>; Thu, 07 Nov 2019 19:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7ERgCfCTRPGeC32FSgvyictvmI6E7zn/TlJTTgat7Ug=;
        b=ncu4g1u9yhjWn7QBQAbMDvkj7GUsJ9Nx3o8SDn4+NXv/xWlMnp3I4tSlcamawPW7gn
         h+jgJPD/8hLddmMBawT0R3jM4VnkPDJh6Ycc+3Rdd0vjRRDOlY6E15GF/kmMYHnnAmgk
         BSm45JnZmOf74ggBNjjn3HqDw7eDHMh1OM4nolalAEsaEGtQsXocYVEZhFLtdc89WpS4
         DVjVz5HlRnN9g9ujgpvQZsb6vqX7hLXKSDFftCbdEoCaZPuh2TGuzMyTU6xbqZL7h/qm
         nEnIZI/hU/naLM9787dVSkyrCQcTBYCJQuvsYGL6891P9KXCwvgHqigXwD5ygpONBQha
         14QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7ERgCfCTRPGeC32FSgvyictvmI6E7zn/TlJTTgat7Ug=;
        b=s8cEU2tv902u6VClRTAuglb8Sp9+lkgJxzwdROn1tm07+7wH9GlX7bb6Yw5sp4P3da
         xfK+2Z+hj217Pb21pJT+7smNmYhnqHIeg6raVkS1VHQptBzAjbbjd0U2MeqcEEMlCJY+
         +apAO65OgiJ+nNnzPZLdRAh6ZZjhfDdOIZzpFdYEZ05O5f+d8iHaaZ0ZbcLrGoNj1IdD
         gYCyT7HH0xyZFz1lReiDanPHwUQ1BQrnxg0RExnpzvMRQnnKdbIG+p6KsLstetQsO+ec
         GHl0+TRJZ7KBfPzLS/EXZTCOTwFTPxpdBq+AIt+k/7Q1iBi+RhuaCzdbxP+x8tZoG9wG
         42yg==
X-Gm-Message-State: APjAAAWa5+dlNIUqphYWzyQOXWTLeEkHgnfvTRn1qbORjbyt7afygRXj
        bUG8WD0IXRugsQZo4rkSh0YHog6/
X-Google-Smtp-Source: APXvYqxmm6fmFRyNsly4bUSoZUiq2pDZJ+A+LJ+V2ec89x3U8LWuuOpeBFd1kRUOEY1MRFekJUUVaA==
X-Received: by 2002:a92:865c:: with SMTP id g89mr9751664ild.291.1573184192195;
        Thu, 07 Nov 2019 19:36:32 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:48b9:89c9:cd6f:19d4])
        by smtp.googlemail.com with ESMTPSA id i198sm331149ioa.5.2019.11.07.19.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 19:36:31 -0800 (PST)
Subject: Re: xdp with mlx5 not working as expected
To:     Saeed Mahameed <saeedm@mellanox.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <a47dae54-87c8-c563-0c3c-524f4c95518e@gmail.com>
 <VI1PR05MB5102CF9D51954A7674C1F92DBE7B0@VI1PR05MB5102.eurprd05.prod.outlook.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <62ce7c93-88de-f458-60ab-1f149e3bd1ac@gmail.com>
Date:   Thu, 7 Nov 2019 20:36:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <VI1PR05MB5102CF9D51954A7674C1F92DBE7B0@VI1PR05MB5102.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


I think it is a vlan problem. Host traffic is untagged; VM traffic is
tagged.

Never mind; I think I see the problem.
