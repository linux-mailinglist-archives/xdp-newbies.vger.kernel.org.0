Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25A16F2BFB
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 May 2023 04:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjEACns (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 30 Apr 2023 22:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjEACnr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 30 Apr 2023 22:43:47 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94E410A
        for <xdp-newbies@vger.kernel.org>; Sun, 30 Apr 2023 19:43:45 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-74e076b66f7so88342585a.3
        for <xdp-newbies@vger.kernel.org>; Sun, 30 Apr 2023 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682909025; x=1685501025;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJv/fJ1N9jilF17E3JtERDb5lS97I4U+7QcLu+oqNwQ=;
        b=r1hHjKMadYA9qUv5QGLoKSP4lvrL1tERBc0AUECAOYh47XhQtn+pIghRmYRoI1Jkog
         MGf9D3vBCHuhqMRCq1T9DKvGAJgvH0eVxQgHbCaLuyc8reTIDPJziEzgSwyUu0TEp8hL
         qv6d8OaaF/IW6eCA0y+LSfvkvuWb5KethTQjUxRXZ0vjfvRrp/+b/BGK1NEO7uD9Zm1S
         M/9jriXUyUj4wakoK+zNQHgSqXNoQv4J7fQNOI/PLNB9HkqScYrMVi8iELbb9B7+yT6k
         vRzmtRY2qxyTgI4zj9AqHLGSaSrIDriP6nEBdhmiVLQy4dMDzmMET9cv6Q1N1/z2a5fH
         78Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682909025; x=1685501025;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJv/fJ1N9jilF17E3JtERDb5lS97I4U+7QcLu+oqNwQ=;
        b=K2ksP3HUlVA8jyczIqN1kKOjOBf5qTFvx0k+S8WaDmOBbKZbjERtDczh3s9UZcnyQq
         HtotzoNVC7lgovt2QfT2eqpMmuG//6pdQumWIthKjfGFgMDGiRK/CX1x/bK5zFYaVkWj
         z5b2EU9NRgTJB/vwvd7Kvq/jXzuDjbqUD84+MERbRFZS5Ur0AGYn8Edf28V1wMvZxphz
         U7QFYkaSzNROZh69A6OS8GKh+wSRu0Bt1PWJM6UBnWAMcLsatONbd15w4osaUINooeUg
         NBuce+2wuxWo4nUp95ik353NPIxCMnpBjY689amX7liIsnl5jYboaaCAjNFDEYY0PydY
         nIjw==
X-Gm-Message-State: AC+VfDzCOGbgy9nvxiX5qoiS5SqY1bInnfcqepgtgri4bIiKgo6bFoHf
        XCPEkJHekoTDstYLwBtvPJjNKghc6iYzGLNVZJ4=
X-Google-Smtp-Source: ACHHUZ56Rofy3wtPzxB6l0qO3alj2+0UxwyDkArCNzIgrme0+fOWcwel7RBJRfFVx1R0tGcrGyDejpDDwD8tPlRxJG4=
X-Received: by 2002:ac8:5c53:0:b0:3e2:4280:bc5b with SMTP id
 j19-20020ac85c53000000b003e24280bc5bmr21184727qtj.21.1682909025009; Sun, 30
 Apr 2023 19:43:45 -0700 (PDT)
MIME-Version: 1.0
Sender: mrmusaibrahimibrahim4446@gmail.com
Received: by 2002:ac8:5b81:0:b0:3f0:a619:60a7 with HTTP; Sun, 30 Apr 2023
 19:43:44 -0700 (PDT)
From:   Mrs Bill Chantal Lawrence <mrsbillchantallawrence58@gmail.com>
Date:   Sun, 30 Apr 2023 19:43:44 -0700
X-Google-Sender-Auth: C0Rkb9d3WyUz8eqcmsp-8ixp74g
Message-ID: <CANgEpsLZ4YJoGGCSC-MOjLq-pqruGdCPs+W_e=eDw94_OgbC3A@mail.gmail.com>
Subject: Hello Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:732 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4951]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrmusaibrahimibrahim4446[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrmusaibrahimibrahim4446[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello Good Day, You have been compensated with the sum of 3.5 million
dollars in this united nation.

The payment will be issue into atm visa card and send to you from the
santander bank.

We need your address and your Whatsapp this my email.ID
(mrsbillchantallawrence58@gmail.com) contact  me

Thanks my

Mrs Bill Chantal Lawrence
