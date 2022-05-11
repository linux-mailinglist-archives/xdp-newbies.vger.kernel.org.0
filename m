Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58BB4523100
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 May 2022 12:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbiEKKtn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 11 May 2022 06:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiEKKtm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 11 May 2022 06:49:42 -0400
X-Greylist: delayed 931 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 11 May 2022 03:49:38 PDT
Received: from office2.cesnet.cz (office2.cesnet.cz [195.113.144.244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F04579AA
        for <xdp-newbies@vger.kernel.org>; Wed, 11 May 2022 03:49:37 -0700 (PDT)
Received: from [192.168.1.105] (ip-86-49-247-242.net.upcbroadband.cz [86.49.247.242])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 272F840006C
        for <xdp-newbies@vger.kernel.org>; Wed, 11 May 2022 12:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1652266176;
        bh=fUuRxmzFZvvnGG1k1eevvwV3c3ojEQwpNYStjq6Qgwk=;
        h=Date:To:From:Subject;
        b=kCTC2LglhKClQUEnZ1YDh/vHuRW+HcSorZKMDktKAJ477wMdKE+d6j5NWuyaLFArQ
         RpNTD6JZy1sy2S+3/VZVJGQwF+Yr0WZUfHEhSml/QNesEQuwADURbgcloM6eUJndXL
         MvtNGFg3uo3GDI/u2q7GOXE0B12WeumQMBuwpT1lLW5GytfyM2L9EZq+cwSD2TB9VT
         V2TE3haH0b1mTEfBQ/bDLkYjOB3jus+sS6hPCiqVV4ehtX4qDAEAYaNCgjMVCcNYkK
         23cGcXonMVxp98H3a5Q3uScG/KVwS+f4uaSTeJBEZqUDBMyzRDEVzjjuRzbpbfoxT+
         nus4/yzSKfjKQ==
Message-ID: <51ddb56f-5155-aabd-19b3-1bae187009ac@cesnet.cz>
Date:   Wed, 11 May 2022 12:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To:     xdp-newbies@vger.kernel.org
From:   =?UTF-8?B?UGF2ZWwgxaBpxaFrYQ==?= <siska@cesnet.cz>
Subject: XDP-ZC RSS - Mellanox
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello XDP-newbies,
i am trying to figure it out, how can i configure Mellanox mlx5 card to 
use XSK(XDP)-ZeroCopy queues instead of normal RX queues and use RSS to 
spread traffic.

I have no issue with this on Intel Cards which use same queue for 
both(normal and ZC mode).

My commands for Intel:
$ sudo ethtool -L ens4f0 combined 8
$ sudo ethtool -N ens4f0 rx-flow-hash udp4 fn
$ sudo ethtool -X ens4f0 equal 8 start 0
$ sudo ./xdpsock -q 0 -z // everything is OK


My commands for Mellanox:
$ sudo ethtool -L ens4f0 combined 8
$ sudo ethtool -l ens4f0
Channel parameters for ens4f0:
Current hardware settings:
RX:             n/a
TX:             n/a
Other:          0
Combined:       8

// Bind to ZeroCopy queue 8, after bind number of combined queues 
doubled. [0..N-1 (normal RX queues), N..(2N-1) (ZeroCopy queues)]
$ sudo ./xdpsock -i ens4f0 -q 8 -z &
$ sudo ethtool -l ens4f0
Channel parameters for ens4f0:
Current hardware settings:
RX:             n/a
TX:             n/a
Other:          0
Combined:       16

// Try to redirect traffic to ZeroCopy queue 8-15
$ sudo ethtool -X ens4f0 start 8 equal 8
Cannot set RX flow hash configuration: Invalid argument


The only solutions that i found was to use "flow steering rules" to 
redirect traffic to specific ZeroCopy queue, but this does not solve my 
issue.

Is there any way how to achieve my goal on Mellanox card?
(mlx5_core v. 5.5-1.0.3, ol8 kernel 4.18)


Thanks,
Pavel Siska

