Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495176140C2
	for <lists+xdp-newbies@lfdr.de>; Mon, 31 Oct 2022 23:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiJaWkQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 31 Oct 2022 18:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJaWkP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 31 Oct 2022 18:40:15 -0400
Received: from scc-mailout-kit-01.scc.kit.edu (scc-mailout-kit-01.scc.kit.edu [IPv6:2a00:1398:9:f712::810d:e751])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DA55FE4
        for <xdp-newbies@vger.kernel.org>; Mon, 31 Oct 2022 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kit.edu;
        s=20220408; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
        To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=YcOWi3tktpWivQsWk2h7Dc98mEStyAjOWR+I+G9TIb8=; b=an9P2yxsPsFW2UpcizX3xU2vT+
        Ip4GKjf+5y4y+MdxO8zRg7BGXBSTfpRGsQdywefQUQSarkEFgdtMtsW7xLJnJj1rgQF1rEaOoRp+3
        rp9kKsE4jUfFoNnc3JlpPNb0TibgCwwc9XMXa/+ufnYGLpDi2a3yW9OyFullomihSeg4kOOJNFz70
        lV2i4wtr2gYuzz0dg65zd1WHwSIKtc2ZQl8WdiPLPgBVYWRjxQXSlGbWUkE6+WqyX5wN6PM4ndGfa
        b8y1vxCpFO3pYUN26/pX2ZrYht+JV/FDRd84n5S1bYqeQYzQS3He6x+V/20vi2M4ULCQDD/zJ392c
        XEp9oANw==;
Received: from kit-msx-44.kit.edu ([2a00:1398:9:f612::144])
        by scc-mailout-kit-01.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
        (envelope-from <jalal.mostafa@kit.edu>)
        id 1opdRz-00Bik8-4B
        for xdp-newbies@vger.kernel.org; Mon, 31 Oct 2022 23:40:11 +0100
Received: from [172.30.86.241] (172.30.86.241) by smtp.kit.edu (129.13.50.106)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Mon, 31 Oct
 2022 23:40:10 +0100
Message-ID: <feb90fb7-31e3-b111-76d7-a8df3420253e@kit.edu>
Date:   Mon, 31 Oct 2022 23:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: AF_XDP-example/txonly: strange performance with different packet
 sizes
From:   "Mostafa, Jalal (IPE)" <jalal.mostafa@kit.edu>
To:     <xdp-newbies@vger.kernel.org>
References: <7779608e-0207-a4dd-0979-90ef4ac46e86@kit.edu>
Content-Language: en-US
In-Reply-To: <7779608e-0207-a4dd-0979-90ef4ac46e86@kit.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.30.86.241]
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

MPWQE apparently causes this in mlx5. MPWQE does not provide true 
zero-copy for packet sizes less than 256bytes. In order not to saturate 
the PCIe bus, MPWQE "copies" multiple small packets into one fixed-size 
memory block and then send them in one work queue entry which explains 
the degrading performance from packet sizes 64B to 256B.

https://github.com/torvalds/linux/blob/5aaef24b5c6d4246b2cac1be949869fa36577737/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h#L159

MPWQE can be turned off using: ethtool --set-priv-flags enp2s0np0 
xdp_tx_mpwqe off
Performance reaches 25M pps on 64B and 128B, and 18M on 256 saturating a 
40Gbps link.

Best,
Jalal

On 10/26/22 12:34, Mostafa, Jalal (IPE) wrote:
> Hi,
>
> I am running the txonly microbenchmark from the AF_XDP-example sample 
> program
> in bpf-examples. Howerver, I noticed strange performance with 
> different tx packet sizes.
>
> With the following command I generate the below results:
>
> ./xdpsock -i enp2s0np0 -q 4 -t -b 2048 -m -s 128 -m
>
> Driver: mlx5 on 40Gbps ConnectX-6
> Kernel version: 6.0.0-rc6+
>
> | Pkt Size | Native-ZC PPS | Native-C PPS | Generic PPS  |
> | ----------- | -------------------- | ------------------ | 
> ----------------- |
> | 64         | 16.5M              | 1.73M            | 1.71M          |
> | 128       | 9.42M              | 1.72M            | 1.66M    |
> | 256       | 7.78M              | 1.64M            | 1.66M          |
> | 512       | 9.39M              | 1.62M            | 1.59M          |
> | 1024     | 4.78M              | 1.42M            | 1.38M    |
>
> At size 128B, I expect 16.5M packets (the limiting performance of 
> AF_XDP) since
> the link is not saturated. The problem is more obvious at size 256B, 
> only 7.78B
> even though it jumps again to 9.39M at 512. So I think the problem is 
> related to
> the packet size and not to a limited performance in the xsk engine in 
> the kernel.
> Or what do you think?
>
> I have already opened an issue on github here:
>
> https://github.com/xdp-project/bpf-examples/issues/61
>
> Best,
> Jalal
>
