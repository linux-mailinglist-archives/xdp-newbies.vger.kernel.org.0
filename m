Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CAE559A4B
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Jun 2022 15:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiFXNWQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 24 Jun 2022 09:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiFXNWP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 24 Jun 2022 09:22:15 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D5955358
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 06:22:14 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so1561646wme.0
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=iD4I9WXoiBfrnX2jGqjGyZ8Lf4SIkiIMY/Ir0bsF3SY=;
        b=ofUv6530ffCsbTUhWCBDtqiSWamgz/qFyTl8VISwtbWYnIWTkYECnZbNg2G+OtxAyf
         8KE0Yz7SkRoTxMM506tlEByb/xuJURM6JCkCdWSHRWjoL+YHeSpIhfrAgfGcyHPpKfj0
         y52I+/41Hj2OFggxRk7O/WZ4h6I8J5Kw/qgtyd0EE1xzMlQpJW8d6+Opcf6CbdyX+M14
         DStsN6gb9pLHxz0q5+LRl5xvfDEc7QumR0UflnJ+oJg3VBpYj0Td/jPd1kPlBKUmlysJ
         9JYYWVbzDF157ms5FAy+U0lxCHeJS2qX7BZ1EoK+0nJkU/J14djvI9PpPPUmoT8j2ZyR
         ma5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iD4I9WXoiBfrnX2jGqjGyZ8Lf4SIkiIMY/Ir0bsF3SY=;
        b=tyKTkHWrkUK9L4LPAwu4/at+1NTt5H7Q1MSrf7VufeGszZhtxKNYcU2HOvQpmxCbj4
         F09qHAdFSSMz7pnw1u20VYDrOIX0TK38CaopzUgUrE3ZzsTn53L22UjslTXGxMVHAu1O
         yT9DvzvllZVUP0hSwePLW5Ny6PZE+WBgaP021eJcj6XGy2s0ULQRCGP+FAI+7WYR1h0A
         s1mJAmPSzcEFsWOo/3QzxVY0/iFMWZZd+6Qmo8pOTIwkaO1YfnhWA0Pby19aHVz0cVDR
         Cpa1foM3jPE2Mc4iKfnxyuQ3ZJVJAQXBO63xbzFXjcP2WUriCKNgIhcesWFb7fV44PMr
         nG6Q==
X-Gm-Message-State: AJIora8v14GaaiV2CVLyA1chClzlmm1GZiQ8T8rOTAOrvfPrgZeYrePP
        oLRtm9AWn08auiO9kwJE+JiK4P3t77SsY7ZLII22zF8byA0=
X-Google-Smtp-Source: AGRyM1sJesZ6onQAGd34jjzR0CYpV1UJQrSACKh1QuVnGWAoqh3mJN/jrxg4+LOdOFNMsOcIDCwsBRe2cj+tSh3/+I8=
X-Received: by 2002:a7b:cd91:0:b0:39c:4a18:1533 with SMTP id
 y17-20020a7bcd91000000b0039c4a181533mr3877932wmj.148.1656076932448; Fri, 24
 Jun 2022 06:22:12 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 24 Jun 2022 18:51:33 +0530
Message-ID: <CANzUK5-ooeCADg0+N47TN29J5Pcknb8CF+3mrC7_jWDp-J-zNw@mail.gmail.com>
Subject: Full 40Gbps with i40e for large packets?
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

Using the xdpsock txonly benchmark in zero-copy mode with the i40e
driver, I get ~22 Mpps for 64 Byte packets.

However, for 1518 byte packets, although the theoretical pps rate for
40Gbps is ~3.25 Mpps (which is much lower than 22 Mpps), I am not able
to get the full rate - only around 39G or 39.5Gbps (i.e. < 3.25Mpps).
My assumption is AF_XDP performance is more pps dependent than packet
size related and so I thought full 40G should be achievable.

Settings:
 * tuned set to "throughput performance"
 * hardware tx ring size set to 512 descriptors - increasing it to up
to the max of 4096 doesn't have any noticeable changes

Increasing the packet size to 3000 or 4096 does bump up the Gbps rate
to around 39.9Gbps.

Is there a way to get the full 40Gbps (or close, say 39.9Gbps) tx rate
with 1518 byte packets?

Srivats
