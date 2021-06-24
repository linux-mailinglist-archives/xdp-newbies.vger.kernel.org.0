Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00833B37B3
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Jun 2021 22:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhFXUVQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 24 Jun 2021 16:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhFXUVP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 24 Jun 2021 16:21:15 -0400
Received: from telegrapho.inexo.com.br (unknown [IPv6:2001:12c4:f0da:5e:216:3eff:feff:56a4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 640B0C061574
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Jun 2021 13:18:56 -0700 (PDT)
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id B14EE6690C61; Thu, 24 Jun 2021 17:18:55 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br B14EE6690C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624565935;
        bh=hX71w8iZD8VMcPwJZNYOTBwI7QAzjX3DcxR4+ozynDs=;
        h=Date:From:To:Subject:From;
        b=Q8fDuDv/vEvMXbbYSv9nGhG5iJAq8/QKXK0c0mg6rfb03vS1iwsI7eBouAuSIB/rz
         Rew5MU9x9DZZbk6uV9T1vrbWDqXPeoT3H3U0qvI66qWBzyFmFEb8NM1//PAFJlGZrJ
         AtUjY5pxJOQlTwXFRkpMKBPK/c2mNtQXod9G/nNcOK08gjOve6SL4mvN9HSgP1wbEk
         c4rfROUi7xTKSjhXoyQYIGQe9HXmZ9hRRV7AWZ0I86fNoiZPVzlm/be4XAaqw5ZHHH
         hy1GW5hBosoiAshmZKiGBInYDzshG8t0Vt/VHPd9NOO+RQGm1y2MvpGIWNhrpRqJRf
         WKAOlTS/ktfpA==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 84B576690B66
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Jun 2021 17:18:55 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 84B576690B66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624565935;
        bh=hX71w8iZD8VMcPwJZNYOTBwI7QAzjX3DcxR4+ozynDs=;
        h=Date:From:To:Subject:From;
        b=Q8fDuDv/vEvMXbbYSv9nGhG5iJAq8/QKXK0c0mg6rfb03vS1iwsI7eBouAuSIB/rz
         Rew5MU9x9DZZbk6uV9T1vrbWDqXPeoT3H3U0qvI66qWBzyFmFEb8NM1//PAFJlGZrJ
         AtUjY5pxJOQlTwXFRkpMKBPK/c2mNtQXod9G/nNcOK08gjOve6SL4mvN9HSgP1wbEk
         c4rfROUi7xTKSjhXoyQYIGQe9HXmZ9hRRV7AWZ0I86fNoiZPVzlm/be4XAaqw5ZHHH
         hy1GW5hBosoiAshmZKiGBInYDzshG8t0Vt/VHPd9NOO+RQGm1y2MvpGIWNhrpRqJRf
         WKAOlTS/ktfpA==
Date:   Thu, 24 Jun 2021 17:18:55 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: xdp-cpumap-tc: users distribution over MQ queues
Message-ID: <20210624171855.084aad66@babalu>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Hi

What kind of distribution are are you guys using to scatter users over 
the available CPUs/MQueues? Round robin? Random? 
Some algorithm based on the bandwidth sum on each queue?

Regards

Ethy
