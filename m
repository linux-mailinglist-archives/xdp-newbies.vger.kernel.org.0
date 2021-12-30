Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A6B481CAC
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Dec 2021 14:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239728AbhL3N4b (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Dec 2021 08:56:31 -0500
Received: from mail.nic.cz ([217.31.204.67]:54344 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235821AbhL3N4b (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Dec 2021 08:56:31 -0500
X-Greylist: delayed 5706 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Dec 2021 08:56:31 EST
Received: from [IPv6:2001:1488:fffe:6:3401:de9e:a364:2ec3] (unknown [IPv6:2001:1488:fffe:6:3401:de9e:a364:2ec3])
        by mail.nic.cz (Postfix) with ESMTPSA id 244331405D2;
        Thu, 30 Dec 2021 14:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1640872590; bh=9ffCLjJGDWXhVzN6pFo9ZKjTvpDnwOy0FUhwaG4gIyA=;
        h=To:From:Date;
        b=eUvY7hpbEsQT7w1M7WLFfItOgbL16luv9WzrFukxPUrFgIMiTodT34iivhQ41oeYB
         MsZLOVPBUHn8MTJ+uGRBICJft/Q5S+/1bYnI4a4bDXMBNABdQpazY3YN7CKImK1RDk
         Oa+bxDAetZfAqh+6uHFnq7TXk8gNxTJ33aq6SDOc=
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     xdp-newbies@vger.kernel.org
References: <e33c8463-ed31-a2b7-f8d6-5275da05b777@nic.cz>
 <Yc2ueb/Lomb2yrGF@boxer>
From:   Daniel Salzman <daniel.salzman@nic.cz>
Subject: Re: NIC rx/tx ring size vs XSK rx/tx ring size
Message-ID: <531975c5-c457-9769-78fc-e9adeeea28a6@nic.cz>
Date:   Thu, 30 Dec 2021 14:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yc2ueb/Lomb2yrGF@boxer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.4 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 12/30/21 2:04 PM, Maciej Fijalkowski wrote:
> On Thu, Dec 30, 2021 at 01:21:24PM +0100, Daniel Salzman wrote:
>> Hello,
>>
>> Please what is the relation between NIC ring sizes and XDP socket ring sizes?
>> If my app sets XDP_RX_RING and XDP_TX_RING, what are the optimal values for ethtool -G rx/tx?
> 
> I'm working on 1k Tx/Rx HW rings and standard size (2k) of AF_XDP rings.

Okay. When finding the optimal HW ring sizes for a setup with our application (DNS server using 4k AF_XDP rings)
the OS sometimes collapsed and I'm not sure if the HW and XSK ring sizes are fully independent or if there
is some restriction or recommendation on their value combination.

> 
>>
>> Also I don't understand why changing TX ring size changes some XDP ring size for the ice driver (Kernel 5.13):
>> [  424.542118] ice 0000:41:00.0 enp65s0f0: Changing Tx descriptor count from 256 to 2048
>> [  424.542176] ice 0000:41:00.0 enp65s0f0: Changing XDP descriptor count from 256 to 2048   <- What is that?
> 
> I think you're mixing AF_XDP rings with HW rings. Above log comes from the
> changing the HW descriptor count - drivers in order to support XDP_TX and
> XDP_REDIRECT actions create a set of HW Tx queues that serve XDP and they
> are usually referred to as XDP rings.
> 
> XDP_{R,T}X_RING are AF_XDP rings and with ethtool -G you're not changing
> their size

Yes, this is clear. I just didn't know about the additional XDP rings.

> 
>>
>> In the case of the i40e driver, there is no XDP ring logged:
>> [847243.925269] i40e 0000:81:00.0 enp129s0f0: Changing Tx descriptor count from 256 to 2048.
> 
> Behavior is the same for both i40e and ice, it's just that i40e doesn't
> log the desc count change when XDP resources are up.

Thanks!

> 
>>
>> Thank you,
>> Daniel
>>
