Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4258247EF6
	for <lists+xdp-newbies@lfdr.de>; Tue, 18 Aug 2020 09:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgHRHEM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 18 Aug 2020 03:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgHRHEM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 18 Aug 2020 03:04:12 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 Aug 2020 00:04:10 PDT
Received: from mailg210.ethz.ch (mailg210.ethz.ch [IPv6:2001:67c:10ec:5606::21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AF7C061389
        for <xdp-newbies@vger.kernel.org>; Tue, 18 Aug 2020 00:04:10 -0700 (PDT)
Received: from mailm111.d.ethz.ch (2001:67c:10ec:5602::23) by mailg210.ethz.ch
 (2001:67c:10ec:5606::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 18 Aug
 2020 08:48:48 +0200
Received: from [192.168.1.40] (83.76.127.227) by mailm111.d.ethz.ch
 (2001:67c:10ec:5602::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 18 Aug
 2020 08:49:03 +0200
To:     <xdp-newbies@vger.kernel.org>
From:   =?UTF-8?Q?Michael_A=2e_Fl=c3=bcckiger?= <fmichael@student.ethz.ch>
Subject: XDP and AF_XDP
Message-ID: <44904e04-b9f5-0e9e-9b67-8ccfeded852e@student.ethz.ch>
Date:   Tue, 18 Aug 2020 08:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [83.76.127.227]
X-ClientProxiedBy: mailm113.d.ethz.ch (2001:67c:10ec:5602::25) To
 mailm111.d.ethz.ch (2001:67c:10ec:5602::23)
X-TM-SNTS-SMTP: 32A6A42ACE490B12A3247C530609DFD66B874A21C81646747E2C73F72983B8F42000:8
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all

I've recently discovered XDP / AF_XDP, and I now familiarize myself with 
the very interesting technology. Two questions came up, and I'm sure 
that the XDP community will be able to answer them a lot faster than if 
I search for documents in the www jungle.. :)

- An user land application is able to read and process incoming data 
directly from the AF_XDP socket. I'm wondering what happens when an 
application writes data into the AF_XDP socket? Are these frames 
directly sent out on the respective network interface?

- Whats the current status on XDP support on TX? Is it possible to 
intercept the TX queue (outgoing packets) or is still "just" the 
processing of incoming packets possible? Where could I find documents 
covering such updates?

Thanks for your effort!

Best,

Michi

