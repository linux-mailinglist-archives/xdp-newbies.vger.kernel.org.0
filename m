Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C58697F30
	for <lists+xdp-newbies@lfdr.de>; Wed, 21 Aug 2019 17:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbfHUPnP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 21 Aug 2019 11:43:15 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:59476 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726858AbfHUPnP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 21 Aug 2019 11:43:15 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Aug 2019 11:43:15 EDT
Received: from mxback18j.mail.yandex.net (mxback18j.mail.yandex.net [IPv6:2a02:6b8:0:1619::94])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id AE98AF204DF
        for <xdp-newbies@vger.kernel.org>; Wed, 21 Aug 2019 18:37:11 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback18j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ZmjgncDLkX-bB8WHR7c;
        Wed, 21 Aug 2019 18:37:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1566401831;
        bh=5/JCK/n2cmo6lBfPhgPUYGYUQQ3Ee8w5Xcc4sS87c+U=;
        h=Message-ID:Subject:From:To:Date;
        b=hSQ3S+2D865bZ/XKKrKGviXn00qRT69nmA9Nw+e1zOBa0WnALYuNca/9S/u5bWDB9
         VUFk/hOreJasPDRrQGznlNHIzT45T+wvhAXbe2QSP1EnJ6K+nYnTx9wCZwm5WmyIAa
         FJQ74woyf7t1NahRqvcJWb+eTKDHezw/V5oRhbBU=
Authentication-Results: mxback18j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JTQkkwHjfr-bB54v2lq;
        Wed, 21 Aug 2019 18:37:11 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
To:     xdp-newbies@vger.kernel.org
From:   Ilya Golshtein <ilejn@yandex.ru>
Subject: l2fwd between interfaces
Message-ID: <c4ba6c71-89e0-e8c3-1353-184b2e9f99a8@yandex.ru>
Date:   Wed, 21 Aug 2019 18:37:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

l2fwd mode of xdpsock sample puts a packet back into the same interface. 
Is there a good example how xdpsock can be modified to read a packet 
from one interface and to send it to another?

I've failed to find such example and created my own app 
https://github.com/ilejn/xdpbridge.

Do hope that such a thing already exists.

If not, I appreciate if anyone can review the code of my application. In 
particular I am concerned about the ENOSPC case in xq_enq_copy.

Basically the thing works Ok, but not as fast as I expected.

I've tried to share umem to get rid of memcpy, but bind returns EINVAL 
in this case. Exploring xsk_bind (net/xdp/xsk.c) in 4.18 kernel I can 
see, that there is an explicit check umem_xs->dev != dev . Is it a 
fundamental limitaion?

Thanks.

-- 
Regards,
Ilya Golshtein

