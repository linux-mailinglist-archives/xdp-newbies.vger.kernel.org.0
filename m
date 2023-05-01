Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399366F2BFE
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 May 2023 04:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbjEACqm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 30 Apr 2023 22:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjEACql (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 30 Apr 2023 22:46:41 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EABD10A
        for <xdp-newbies@vger.kernel.org>; Sun, 30 Apr 2023 19:46:40 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-76355514e03so193053839f.0
        for <xdp-newbies@vger.kernel.org>; Sun, 30 Apr 2023 19:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682909199; x=1685501199;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJv/fJ1N9jilF17E3JtERDb5lS97I4U+7QcLu+oqNwQ=;
        b=lshvDbwgTpk0t8G+7QQyXPvTfoPMRkoeA8qfAPnZkaBjD6nBGREd34YjosGBmT+vHo
         eM/FId0UYPZwmXfuHqd0QayS/IfSzoNFAkKGuWkfFcSA0cP6yPKO5JRLmUyHX09L0eAW
         j0L2SFssFioogbWE+f78wahhBDBTpjXY3HGeB57HrCDs5IRfQSqtEQxSOGtZW2bLiWqR
         RcJg5i9YPezhgb0VQq/VEtz9SEZx0BiyhHXkW9pDfmBoCn+L5JUjPywtUZMhL6kHRH18
         UOZvc66NBNUJLLU6L7DwdMCypjh2+YOxJtTQdwYXs8TfIMlQrbBGTNHwymvwub+wqjyh
         JVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682909199; x=1685501199;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJv/fJ1N9jilF17E3JtERDb5lS97I4U+7QcLu+oqNwQ=;
        b=C8Kpaeoy8/StGVGF6Hnhxn80QPLKANSvNgyUH/fVJb8dmHyX5QEt67lMl5qdKY/pdg
         lK78q0ZTconRBENl7JVnwum0sCLRZuBcFrGKhz4DZJujA+yb6nkaST7EU0ysKKzsCjl/
         FgkMNjQ9YTLRXn8lORtj+S1lCjfN1/sMdfJR0kUY1Gk4uAYYiy6Xdt/52Ke0Gn4Y1P/e
         uy4BdvYsXp3uzQukEeZx+2PJFGyJ+ZJkirzuRO8hMbfMEDR//jBdozU0kk9N50DxW3lr
         Df57x7GuhtM4uuTSqoERBe8DMMiMcMBCZvgY7mRQoE6BNbKusFbrSM+a4QCJgMV+Ovnh
         mG5g==
X-Gm-Message-State: AC+VfDwJQgRYdbiiU2vsCx8cBZOP6lkkImiAug6CETYh5FCc/LBymONB
        YC/Ig4pp5A4J2zWpL38vF7WQh4t+OoVc67/t+fk=
X-Google-Smtp-Source: ACHHUZ6RSddfd8EHr3SHFjRglYZRKWsd5+xizGTHS/89QEtL0ZHUNkFETBuq3iZLc4YwndmbQRiWakhv4QJY8JqBf5w=
X-Received: by 2002:a05:622a:1b9f:b0:3e4:d887:3e88 with SMTP id
 bp31-20020a05622a1b9f00b003e4d8873e88mr19047487qtb.10.1682908847178; Sun, 30
 Apr 2023 19:40:47 -0700 (PDT)
MIME-Version: 1.0
Sender: mrmusaibrahimibrahim4446@gmail.com
Received: by 2002:ac8:5b81:0:b0:3f0:a619:60a7 with HTTP; Sun, 30 Apr 2023
 19:40:46 -0700 (PDT)
From:   Mrs Bill Chantal Lawrence <mrsbillchantallawrence58@gmail.com>
Date:   Sun, 30 Apr 2023 19:40:46 -0700
X-Google-Sender-Auth: ZlBYx9y9kx4cNCSXTIw7i-xuM0M
Message-ID: <CANgEpsLnrLubc+t43gj=9Nvi8zgjvEtAt4=rJWVSkkLbd797qw@mail.gmail.com>
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
        *      [2607:f8b0:4864:20:0:0:0:d2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4851]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsbillchantallawrence58[at]gmail.com]
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
