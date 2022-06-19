Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692B25507D9
	for <lists+xdp-newbies@lfdr.de>; Sun, 19 Jun 2022 03:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbiFSBMb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 18 Jun 2022 21:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSBMa (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 18 Jun 2022 21:12:30 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE64CE099
        for <xdp-newbies@vger.kernel.org>; Sat, 18 Jun 2022 18:12:28 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id z20so2801817ual.3
        for <xdp-newbies@vger.kernel.org>; Sat, 18 Jun 2022 18:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=Ol6dU6kIPRnhNpuwTGnVvhDuWE/EYBO89/kG/JOEgv04W7XBtB0zNPGizoSAI/vmAZ
         8RwO/R1T3cvQHpinMKiOwdQ9o0+eyqFROl7iklqon5jrXIC5AdRQjuzzATJjUErgalb0
         B1rNbuD9fFttxMG44jjMJ4S++C14ou7oR62zQnPw3G0xo4hEBVTJhsjYOsVctrw19KUd
         zwYT1avhf8WoE7nl6kXfiH9C+xqRLWu180nflTQk1W5LiNumpHyYdLRnOqKF6KbxfhlN
         zJGv8gwInLZYCBo5rRbSik1i0AfqWn55Qmig70D0JrPi5ChRzTyYx10OFH7YtwbIxYsc
         yunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=ehH18Zga95QrVp1qlpSCY6WCkWBplO4eCurVjKJMx+drKXkTyvmCCJaYBZK3Yyhppo
         hLuegSR8sCVsy8fX1xoKPV6NuLWMMc49sZOjy+9uhq2CseSWkWUSBrAi++3Yb7GGnhKI
         Cl6rn3yxgc5zmeelbvGkQ3bwjH52xSbj6DZsMk0nCWbk+92O/q4mw1VL1488GaprX9fM
         min6sxdqll2+JIN1KuDWS9WHSULDb7KWWxDiIG99btXg8tm9++x2XEK5WVXYIR1Uyl2V
         7V79iVUn8tlcS+4Y7EdGPm2gkx8ey86Jo7nKKCZEtSNep0ZpRENROeKEuU/OziU55s0O
         Kw5Q==
X-Gm-Message-State: AJIora9CZafddbnqL4geM5DKIWRDoT+JebtiU3ZaBJGpJGIiiGpwyDU1
        gs2RTJj7jpTbmh1M6hx/mo6eMtyLhm046VK+Fy4=
X-Google-Smtp-Source: AGRyM1uuPo7cXfUrqINr/3R8/1lqmOJTm0+Bjr53Ouw0U5/cmjqqURMY3hG+RwY9GHpkH/+PaIG/CBUp/VnBOjdWbIw=
X-Received: by 2002:ab0:1670:0:b0:369:36c1:c39d with SMTP id
 l45-20020ab01670000000b0036936c1c39dmr6713451uae.101.1655601147962; Sat, 18
 Jun 2022 18:12:27 -0700 (PDT)
MIME-Version: 1.0
Sender: hamzaafarizaa@gmail.com
Received: by 2002:a05:612c:2220:b0:2cd:51e8:669d with HTTP; Sat, 18 Jun 2022
 18:12:27 -0700 (PDT)
From:   "Mrs. Hamza Farizaa" <hamzmrsfari@gmail.com>
Date:   Sat, 18 Jun 2022 18:12:27 -0700
X-Google-Sender-Auth: avf91-5JIWzh_kNLozsGEFoKZeA
Message-ID: <CAHw4SCVe8a4X4hwGq9Bu_KjbuOPD-C5Xg2ogyK87mC9DsqWn5g@mail.gmail.com>
Subject: I think you can
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.3 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLY,HK_SCAM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:942 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5003]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hamzaafarizaa[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 HK_SCAM No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

May peace be with you,

My Greetings in the name of our family, This is the second time i am
contacting you with regards to the charity work. I am Mrs. Fariza
Hamza, an aging widow suffering from longtime illness. I am currently
admitted in a private hospital here in the capital city of
Coted=E2=80=99Ivoire.

I have sum amounts of US$17.500 Million dollars i inherited from my
late husband Late Mr. Mohamed Hamza, the sum will be disclosed to you
for security purpose which he deposited in one of a Bank here and I
need a very honest and God fearing person that can use this funds for
God's work and purpose, 15% out of the total funds will be for your
compensation for doing this work of God. I found your email address
and i decided to contact you.

Please if you would be able to use these funds for the purpose and
God's work kindly reply me back. on ( hamzamrs027@gmail.com )

Yours Sister.

Mrs. Fariza Hamza.
