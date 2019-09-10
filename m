Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83ECAEC9B
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2019 16:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732164AbfIJOGS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Sep 2019 10:06:18 -0400
Received: from forward103o.mail.yandex.net ([37.140.190.177]:55094 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731801AbfIJOGR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Sep 2019 10:06:17 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Sep 2019 10:06:16 EDT
Received: from mxback16o.mail.yandex.net (mxback16o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::67])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id BF9F65F80756
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2019 17:01:11 +0300 (MSK)
Received: from smtp3p.mail.yandex.net (smtp3p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:8])
        by mxback16o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id wBbSTCF3KY-1BtaRa0J;
        Tue, 10 Sep 2019 17:01:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1568124071;
        bh=P+scgDRO/3DA+XbSbkZPmvQ5Qc8d4CTEPjSdVYhgFIg=;
        h=Subject:From:To:Date:Message-ID;
        b=Q8Nf0/OqsvjZGERF1S5ryjL4TveZAE5tA2VtR6UXEzg2b/3GnGm2FeU5lgc/g4Sbp
         b8UZtFHB1L8YbHZZzmmcUa/S6ohJLl1bvmg76RgHGo2a2VkO9CfEO6p+HDAOw57jn2
         NNsTaqfUyRbP9o6Mu2txprrT/8xE7K/CYKY4TSmM=
Authentication-Results: mxback16o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by smtp3p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id ttKOQByrzi-1Bj0bbKw;
        Tue, 10 Sep 2019 17:01:11 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
To:     xdp-newbies@vger.kernel.org
From:   Ilya Goslhtein <ilejn@yandex.ru>
Subject: bidirectional: => AF_XDP , <= XDP_REDIRECT
Message-ID: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
Date:   Tue, 10 Sep 2019 17:01:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I am trying to use a network interface to
(1) send packets via AF_XDP
(2) receive packets and redirect to another interface via xdp_redirect_map

Basically, I am making xdpbridge https://github.com/ilejn/xdpbridge.
  bidirectional. My goal is to process packets in one direction in 
kernelspace (xdp_redirect_map) and to pass packets in opposite direction 
via userspace (recieve via AF_XDP then send via AF_XDP, rings are not 
shared, so I perform memcpy).

For test purposes I ran two applications: my xdpbridge and 
xdp_redirect_map bpf sample.

It does not work. Only few packets are received, then the thing stops. 
Redirecting works until xdpbridge does 'bind' against the interface.

 From XDP point of view we have:
application one: bind with PF_XDP
application two: XDP program

What is the nature of the problem? Is it fundamental, 
environment/hardware specific, or I am simply doing something wrong?

ubuntu 18.04, 5.0.0-27-generic,
Ethernet controller: Intel Corporation 82599ES 10-Gigabit SFI/SFP+ 
Network Connection (rev 01)

Thanks.

-- 
Best regards,
Ilya Golshtein

