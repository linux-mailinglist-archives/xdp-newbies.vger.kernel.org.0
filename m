Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3DCE9F6A
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Oct 2019 16:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfJ3Poc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 30 Oct 2019 11:44:32 -0400
Received: from forward105p.mail.yandex.net ([77.88.28.108]:59864 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726302AbfJ3Poc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 30 Oct 2019 11:44:32 -0400
Received: from mxback4o.mail.yandex.net (mxback4o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1e])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id E27C44D41FBE
        for <xdp-newbies@vger.kernel.org>; Wed, 30 Oct 2019 18:44:28 +0300 (MSK)
Received: from sas2-69645cccb3fe.qloud-c.yandex.net (sas2-69645cccb3fe.qloud-c.yandex.net [2a02:6b8:c08:bd8e:0:640:6964:5ccc])
        by mxback4o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 8JodPeZUYS-iSlCDcIL;
        Wed, 30 Oct 2019 18:44:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1572450268;
        bh=splE6MUj5bgHu21YNv/oSPwsDWuDJTzpgyyGMTRDu6c=;
        h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
        b=Ajrih4oIVTMAI3YdvKGGAAzIT7z20pD+4NuMBLHdSccVlg/30UjNp7DiPVN4KFBwS
         R5j8VGqRQ6sO83feyzGmU3Md5yimT0ldZM/72MRIY4MZdtpjSJBn5CsmPdvi2VsTx9
         w9EWjlJ82YWCAXFdBHY70RWCWk4GZo9AR9UHhQJw=
Authentication-Results: mxback4o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas2-69645cccb3fe.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id dV1V5h2tGv-iSVic20b;
        Wed, 30 Oct 2019 18:44:28 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Subject: Re: bidirectional: => AF_XDP , <= XDP_REDIRECT
To:     xdp-newbies@vger.kernel.org
References: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
 <87imq0ut8l.fsf@toke.dk> <e83a6f5d-785e-d3c7-6bd8-63d972973427@yandex.ru>
 <87a7bcusg3.fsf@toke.dk>
From:   Ilya Goslhtein <ilejn@yandex.ru>
Message-ID: <ac54dbc6-245a-c1b6-4bef-47296c69ec75@yandex.ru>
Date:   Wed, 30 Oct 2019 18:44:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87a7bcusg3.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

playing with xdpbridge https://github.com/ilejn/xdpbridge/ I've observed 
a limitation which is serious for me.

xdpbridge is basically a combination of xdp_redirect_map sample 
(world=>client path) and slightly more advanced l2fwd mode of xdpsock 
(client=>world path),
where AF_XDP sockets are bound to two different interfaces (vanilla 
l2fwd mode uses same interface as ingress and egress) and where 
multithreading is supported.

xdpbridge sets options for client and egress interfaces independently.

So, setting zerocopy bind flag for world interface (-z command line 
parameter) prevents this interface from working as ingress for 
world=>client path, although different queues are used. No errors, just 
no data transfer.

It would be nice to understand if this issue fundamental or specific for 
the kernel (5.0.0-31-generic #33~18.04.1-Ubuntu) or card (Intel 
Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 01)) or 
driver.
Or, may be, it is just my mistake.

I do appreciate any comments or suggestions.

On 10.09.2019 17:38, Toke Høiland-Jørgensen wrote:
> Ilya Goslhtein <ilejn@yandex.ru> writes:
>
>> Hello Toke,
>>
>> thanks for the response.
>>
>> I do not think that it is the case.
>>
>> The interface I am trying to share is outgoing for xdpbridge and
>> incoming for xdp_bridge_map.
>>
>> xdpbridge does not load xdp program for outgoing interface (while loads
>> for incoming).
>>
>> xdp_bridge_map loads dummy XDP program for outgoing redirect, while it
>> is Ok if it is already exists.
>>
>>
>> It seems that if I use different queues for incoming and outgoing
>> packets, everything is Ok, while I am not 100% sure yet. Does it look
>> realistic?
> Oh, right, yeah, the AF_XDP socket will need to configure a hardware
> queue to use; depending on your hardware, that could be incompatible
> with running a regular XDP program on the same hardware queue.
>
> Incidently, we are working on a way to make this work better; talk
> starts in five minutes at LPC:
> https://linuxplumbersconf.org/event/4/contributions/462/
>
> -Toke

-- 
Best regards,
Ilya Golshtein

