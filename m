Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753484EB5B8
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Mar 2022 00:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiC2WQZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 29 Mar 2022 18:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236271AbiC2WQY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 29 Mar 2022 18:16:24 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1751E186FA6
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Mar 2022 15:14:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n35so11164138wms.5
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Mar 2022 15:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=dQYxcxyvmpWpqCXjjT6Ei+3z5x0GxgEWzXOfKwEAUys3BoGDH2ddaxpSzpP35b6C2K
         2KOV07FG8/W+MErAqPx1v/J/YqGRxlpV2KeQSGaHuKu1pCu/9ZDeco7nkBARR+XOyTUW
         vFC0cXLlvO2I1v0VoSSZ5jkDLK04G3TB1UEhigsRcHanVy0HnG5G3d9jzImq2dWVH7lN
         ONDe82QdBMaol9dyt8BiQ/SclqyBv5hjWpA2LSuwfsq7v+I+kYpYQ9GdCh3aJknwhArY
         apBHJZyDyxCkHXrqrrjOCpzimgGzhfMHakcMTKlV8SxaLgH2Vb+dPor7tpuYNPerBm4I
         yGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=QllvqGCrJeWORHffiQmpqlJqAnSHpqfQ4lS5oX/ED7AQpxA4GBIx2XGDAhI9G2Y/rh
         bzdBSPaqwohI58R/54EpXw7h1XvHFbjuopNKuiCtfyEkCnt0FRImPtHfKV3v4r6TsJ/O
         zY0cEhe0wrG8v/M6j3aRUxYdxQ3QZ+zBo+cf3cr5Z26mtaTzh1kdpkt5M8XISqayGmya
         bOEoGPJs9WjcgA/XI1gFe9NDhrdaTZHSjbeI4luBtudDPJ0p3N449YFOE28oi6ya9F4J
         TcVw8WWfGLPikV7OZ3WXXowjwbQ3IBKyAXQ6a/FivqOH92xzfGwtWu6teB5AN/V1WsFX
         T4Jg==
X-Gm-Message-State: AOAM530dloMthyEatHTvsJs7vpWlgTIusWBlNR2uZh/9cTm8nunaRi8T
        QOdUXt5+Ac/lyLMlW2AXtK0=
X-Google-Smtp-Source: ABdhPJzutH7zSC1+/k62KCVir/IOt6uaGkVAowZMgB9H8P5e5W5t5yFG0GRakQvQAep4uCJi4JSh1Q==
X-Received: by 2002:a05:600c:3d86:b0:38d:581:89ad with SMTP id bi6-20020a05600c3d8600b0038d058189admr1607835wmb.42.1648592079734;
        Tue, 29 Mar 2022 15:14:39 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.172])
        by smtp.gmail.com with ESMTPSA id r15-20020a5d6c6f000000b002040552e88esm18228940wrz.29.2022.03.29.15.14.35
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:14:39 -0700 (PDT)
Message-ID: <624384cf.1c69fb81.86420.76d9@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:14:31 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
