Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF537BD172
	for <lists+xdp-newbies@lfdr.de>; Mon,  9 Oct 2023 02:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjJIAkN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 8 Oct 2023 20:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjJIAkN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 8 Oct 2023 20:40:13 -0400
X-Greylist: delayed 5053 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Oct 2023 17:40:12 PDT
Received: from mx.ucpejv.edu.cu (mail.ucpejv.edu.cu [200.14.49.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A8FAA6
        for <xdp-newbies@vger.kernel.org>; Sun,  8 Oct 2023 17:40:12 -0700 (PDT)
Received: from mx.ucpejv.edu.cu (localhost.localdomain [127.0.0.1])
        by mx.ucpejv.edu.cu (mx.ucpejv.edu.cu) with ESMTP id 63E83EEFA4;
        Sun,  8 Oct 2023 17:54:39 -0400 (CDT)
Received: from mail.ucpejv.edu.cu (mail.ucpejv.edu.cu [10.68.100.8])
        by mx.ucpejv.edu.cu (mx.ucpejv.edu.cu) with ESMTPS id 3AC53EE427;
        Sun,  8 Oct 2023 17:54:39 -0400 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.ucpejv.edu.cu (Postfix) with ESMTP id 9663E704EE6;
        Sun,  8 Oct 2023 17:54:38 -0400 (CDT)
Received: from mail.ucpejv.edu.cu ([127.0.0.1])
        by localhost (mail.ucpejv.edu.cu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Z8EqDoF1a8w2; Sun,  8 Oct 2023 17:54:38 -0400 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.ucpejv.edu.cu (Postfix) with ESMTP id 1CCBD704FA8;
        Sun,  8 Oct 2023 17:54:38 -0400 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.ucpejv.edu.cu 1CCBD704FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucpejv.edu.cu;
        s=6944A500-D828-11EB-A78A-E8BC65E2ACE4; t=1696802078;
        bh=YVQkxxsQjcA28pTrfdCHmYTQQhEotWPiglViH2UlrcU=;
        h=Date:From:Message-ID:MIME-Version;
        b=tMM+bpq3pm/3Ia2/eZlUrciMAADHH/jwqQR1mWlOQdv1ZvFCqFj7WWoT5Cz3kdtCc
         8RBJTaLzOh9ZRn+D2vgX0C476z22PlXJ+Kx+Egzvrt5zSYAYB24b1WIkX/1SZQa6+8
         QTW9QBa+HNTRVvNfYOgrJG7frqX3/HFtzfgVsKhZyxo+RYvlDVMFj7/60ybbnzZnOw
         VO37UC4HizEkHD+Og9QQGCX7OSuE8xioI5yYyxaQbFeBkRM/St0nLKs8SdONzoeAvh
         TaPhiv+t8vXP9qCRS2lOhh2rk+gWcSZFLaxtZ3Joc25Y1N/+nnGdbLAsSYb+bPr8Ym
         rZzvXRoX0zAOg==
X-Virus-Scanned: amavisd-new at ucpejv.edu.cu
Received: from mail.ucpejv.edu.cu ([127.0.0.1])
        by localhost (mail.ucpejv.edu.cu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id khSA9vpDhZOc; Sun,  8 Oct 2023 17:54:37 -0400 (CDT)
Received: from mail.ucpejv.edu.cu (mail.ucpejv.edu.cu [10.68.100.8])
        by mail.ucpejv.edu.cu (Postfix) with ESMTP id 1388D704437;
        Sun,  8 Oct 2023 17:54:36 -0400 (CDT)
Date:   Sun, 8 Oct 2023 17:54:36 -0400 (CDT)
From:   Han <atencionalapoblacion@ucpejv.edu.cu>
Reply-To: Han <han92728817@proton.me>
Message-ID: <644966233.26261.1696802076061.JavaMail.zimbra@ucpejv.edu.cu>
Subject: Gesture
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.68.100.8]
X-Mailer: Zimbra 8.8.15_GA_4508 (zclient/8.8.15_GA_4508)
Thread-Index: xTuLVhpBXjKXC1UVtj+ew5jKon+UrA==
Thread-Topic: Gesture
X-Spam-Status: No, score=3.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_BLOCKED,REPLYTO_WITHOUT_TO_CC,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



A smile is a small gesture that expresses an interest and is a first step towards getting to know someone better! I am sending you a smile,I would love to know you more.I am 100% genuine in my search to hopefully meet someone special and withwhom together we can start as Friends and from that strong foundation hopefully build a life lasting relationship.Han

