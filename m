Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E52E60DF00
	for <lists+xdp-newbies@lfdr.de>; Wed, 26 Oct 2022 12:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiJZKrl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 26 Oct 2022 06:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiJZKrk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 26 Oct 2022 06:47:40 -0400
X-Greylist: delayed 802 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 26 Oct 2022 03:47:38 PDT
Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [IPv6:2a00:1398:9:f712::810d:e752])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3789DA6C1F
        for <xdp-newbies@vger.kernel.org>; Wed, 26 Oct 2022 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kit.edu;
        s=20220408; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=U3n+VUnjRNIRLWEu4fHd24MtKvXfh+5t/Y5y6BTF12c=; b=TGZP/3gVUKBD8zZZfer8EYoIPu
        cDnkOiCD2/+VqqEaYL11TZQkt+79yypUBK0pTqjSQvgfQaDQRUWb++57UABnBrxX1Oo9DMIwyjn8j
        pdGfziXs8iAnxW0A2TOIwASqcJCizBCZQqD7Z6aIX2mUfYcfTj0Owb/WJcpfAUtfCQObxRFj3ZGt6
        jL0u2iX72FqqR3ZcqwtGUqiX7Ssu0qPbTsM9Oi563qSgMYTgQcU3nVam6N6JIVu+/paTF6hoWSEkg
        n1UhRmzJ6Cc69G3uyA+5TKAYmZf4n7OStdguBK4WtAkUDDrNCQX3PT94iL35W9qIRoxa4+u0P8qsB
        i+ganDMg==;
Received: from kit-msx-42.kit.edu ([2a00:1398:9:f612::142])
        by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
        (envelope-from <jalal.mostafa@kit.edu>)
        id 1ondjh-00AgPU-Of
        for xdp-newbies@vger.kernel.org; Wed, 26 Oct 2022 12:34:13 +0200
Received: from [172.30.103.52] (172.30.103.52) by smtp.kit.edu (129.13.50.106)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 26 Oct
 2022 12:34:12 +0200
Message-ID: <7779608e-0207-a4dd-0979-90ef4ac46e86@kit.edu>
Date:   Wed, 26 Oct 2022 12:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     <xdp-newbies@vger.kernel.org>
From:   "Mostafa, Jalal (IPE)" <jalal.mostafa@kit.edu>
Subject: AF_XDP-example/txonly: strange performance with different packet
 sizes
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.30.103.52]
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I am running the txonly microbenchmark from the AF_XDP-example sample 
program
in bpf-examples. Howerver, I noticed strange performance with different 
tx packet sizes.

With the following command I generate the below results:

./xdpsock -i enp2s0np0 -q 4 -t -b 2048 -m -s 128 -m

Driver: mlx5 on 40Gbps ConnectX-6
Kernel version: 6.0.0-rc6+

| Pkt Size | Native-ZC PPS | Native-C PPS | Generic PPS  |
| ----------- | -------------------- | ------------------ | 
----------------- |
| 64         | 16.5M              | 1.73M            | 1.71M          |
| 128       | 9.42M              | 1.72M            | 1.66M    |
| 256       | 7.78M              | 1.64M            | 1.66M          |
| 512       | 9.39M              | 1.62M            | 1.59M          |
| 1024     | 4.78M              | 1.42M            | 1.38M    |

At size 128B, I expect 16.5M packets (the limiting performance of 
AF_XDP) since
the link is not saturated. The problem is more obvious at size 256B, 
only 7.78B
even though it jumps again to 9.39M at 512. So I think the problem is 
related to
the packet size and not to a limited performance in the xsk engine in 
the kernel.
Or what do you think?

I have already opened an issue on github here:

https://github.com/xdp-project/bpf-examples/issues/61

Best,
Jalal

