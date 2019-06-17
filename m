Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B0647F98
	for <lists+xdp-newbies@lfdr.de>; Mon, 17 Jun 2019 12:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfFQKZS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 17 Jun 2019 06:25:18 -0400
Received: from home.regit.org ([37.187.126.138]:55598 "EHLO home.regit.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbfFQKZS (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 17 Jun 2019 06:25:18 -0400
X-Greylist: delayed 1511 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Jun 2019 06:25:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=regit.org};
         s=home; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:
        Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=AN3oSZfLoMeCAv8FxbZfN/AI3VoNT7qbrWbkSqcIaO0=; b=C8Nq2wu4SzcaLO2FNW/So1Ljcq
        t5bZ39ddFrKTZCUx85qoPybv4184Kdb6gtWKlXEhSpmVrV8HHNNF25T89p0wl4KE96Lxm1oAihM02
        7rv2uaSNnJuYPoePEALOfW77T;
Received: from infra1.stamus-networks.com ([91.121.107.192] helo=[10.24.24.5])
        by home.regit.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <eric@regit.org>)
        id 1hcoQl-0004Rm-Vp
        for xdp-newbies@vger.kernel.org; Mon, 17 Jun 2019 12:00:05 +0200
Message-ID: <86f135475a7820adadb05e7ac9a05c71846bebd6.camel@regit.org>
Subject: AF_XDP and packet timestamp
From:   Eric Leblond <eric@regit.org>
To:     xdp-newbies@vger.kernel.org
Date:   Mon, 17 Jun 2019 12:00:02 +0200
Organization: INL
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I did start to work on AF_XDP support for Suricata. API was really easy
to use via libbpf.

From Suricata point of view, the current system with default
configuration is lacking an important information. I don't have access
to the timestamp of the packet. I'm in particular interested by the
hardware timestamp as it would allow to do reordering in some capture
cases.

Is there a way to get the information via AF_XDP. I've seen the
discussion on hardware hints but there was no code example I was able
to find. 

BR,
-- 
Eric Leblond <eric@regit.org>

