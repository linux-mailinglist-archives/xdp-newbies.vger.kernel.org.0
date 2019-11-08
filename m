Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36DABF3D6D
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Nov 2019 02:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfKHBak (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 7 Nov 2019 20:30:40 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:42926 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHBaj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 7 Nov 2019 20:30:39 -0500
Received: by mail-il1-f172.google.com with SMTP id n18so3644459ilt.9
        for <xdp-newbies@vger.kernel.org>; Thu, 07 Nov 2019 17:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0UMq0pm4Voe+2TaX8dNQCyQP+/7d1Y6JocWQ2VQSTAc=;
        b=MR6JuhWvH/TY7DwcyPXs5kWfQ/U8KGAh9gbUpz8WHXRSw1Z71NSKrwzV/phlppKQcU
         8HIgT+IdmF/I2EuYDrqKvRihCny5SaLdyXuA8Au8jxmzAqE9R8gGKu1zZNUSYTm001Io
         Bn0GXBOtEMU2kdeSpxo146Ia4KsZJ9BGPUG8zBgomNhb2j1o+SufS1OJZ94UrBa46U8B
         zjNuwGiKcr7qAqSOb9Lfi+uD/i2vLJcih1y/g+DUMw4FMK600GAec+7Nhu5z9XjlmSf7
         1k+Q0c9J8GAdFzNbITT0NpimagjZSixG7ewABqzcfMxh/IwrL5FMwSeKmtkj0p/8eHqX
         LqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=0UMq0pm4Voe+2TaX8dNQCyQP+/7d1Y6JocWQ2VQSTAc=;
        b=dFmW7sXmfpm/R0eMSujgEateClxhOFnmQ/IK6B3XE2U7B00Jpq8yyW4zMKOA3JwWYp
         ix7ICFkCllF+ziduLIgNuDM4zD4DSSjsNZPrjvS7qkyGAoRJVIwILgdvMCogpd47t2WD
         XOwVB9LMLTsgxaC7S9kM43aEUZG+doRG3YXTCeotfuz9AqTQSw9Qg96kXA/nzQovAsao
         79jacpuXrPejEQixJSYkAfZ40vxuBtOCVK+J5/aJdPqiwTLy9mSuNsheD3cxUl1o51fY
         n9UB0znm3Q/gUPo4fTkT8o9MLw8WTuS9jN1rhJYcky14BVPGQZW5rzXG4d15DfcJfdP2
         TsOQ==
X-Gm-Message-State: APjAAAVwRreYJRR9UZFGVnNMikksLGCgFIViFCOwJwmioNMw/ML/c5MW
        JAFBpXUl8reCddYH2JjgCq2nmIJj
X-Google-Smtp-Source: APXvYqwH37xoK3e8MiNlS+2vZu7SGo14nPjkNImoACRPv5tZKjA+hi0OTZnfp0cJFlo0fOzqOySBTQ==
X-Received: by 2002:a92:a30c:: with SMTP id a12mr8486798ili.150.1573176638805;
        Thu, 07 Nov 2019 17:30:38 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:48b9:89c9:cd6f:19d4])
        by smtp.googlemail.com with ESMTPSA id h14sm549703ilc.87.2019.11.07.17.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 17:30:38 -0800 (PST)
To:     Saeed Mahameed <saeedm@mellanox.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
From:   David Ahern <dsahern@gmail.com>
Subject: xdp with mlx5 not working as expected
Message-ID: <a47dae54-87c8-c563-0c3c-524f4c95518e@gmail.com>
Date:   Thu, 7 Nov 2019 18:30:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi:

I am trying to get an XDP program working with an mlx5 based nic and not
having much success. The same program works fine with sfc and i40e, but
with mlx5 it seems to be limited. I added a trace_printk and basically
it seems to only run cpu 1 and rx queue 0. Fiddling with the number of
channels (ethtool -L) I was, for a brief moment, seeing the program
running on different cpu with a different rx-queue id. I am clearly
missing some setting that is needed for mlx5, but I have not been able
to find any wiki, conference paper or git commit message with helpful
hints. Do you have any references you can forward?

Server has 48 cores, 96 threads and RPS is configureed. The card is:
d8:00.0 Ethernet controller: Mellanox Technologies MT27710 Family
[ConnectX-4 Lx]

Thanks,
David
