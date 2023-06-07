Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A0072723C
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Jun 2023 00:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjFGWzJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Jun 2023 18:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbjFGWzD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 7 Jun 2023 18:55:03 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBAF2697
        for <xdp-newbies@vger.kernel.org>; Wed,  7 Jun 2023 15:54:55 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-973bf581759so3547166b.0
        for <xdp-newbies@vger.kernel.org>; Wed, 07 Jun 2023 15:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686178495; x=1688770495;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lwmqmz3SLTAm/5XHn54kA2Qkz1KiGdBlOiEDAaxIk1A=;
        b=ISCokn/+UIjmwzb6Qqen8aovmGAMcufN2mg1vGaVQi8JA8vZVBoPrpfg9FKEMyYA93
         F57+n8LpDPJ4hKvYa+mB3Qpd/5wSmCE+u9rnSzcRcdxcqA1ThVsA2GVhO8NhufTEIDDo
         +AJF+xfN2v4uPSaV7my+CeYbBAi+c9iv67JdLUZveeT2LRG0G9ifmy1A4hDBa7dCPKKn
         QcFFwZlcW9xjzdCCTjcFdSGgnC40/mtVnpsd5mTQ2ZIQz2DTj76AqN+YyrBlAL/Jzzuq
         8qtTKibIx9QF/94MEfHxXYku+7yxCA1MQd0USYrXUo2RAqhk0OdEwoUaorDUJyV0+gvT
         dfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686178495; x=1688770495;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwmqmz3SLTAm/5XHn54kA2Qkz1KiGdBlOiEDAaxIk1A=;
        b=aJMHRR3GMZzEb818A+p7nBAkBo7rD/Iyw7QNGp8aDwnrfBL2jsigUcsQ23PsjgnU1F
         aD7BZDjiIlzyG3WGd+S8k0VxD+KP0sn60BOnhtaSCpLt5Jv7cRZdal3NUPhKx3HrvEH4
         rLuYFINJEBCyVTOcQLYYnuhW345WCYfBV/twg38+xOXmkBL1EFIIST/8CkGPLaZz5BKI
         G3dKtwIYBTVWCnlY7LjWGy+31ZBWtr9utSRSHR2YkWRjET4I/vfEO4ocZfUEWE4e86mq
         E3/3mEKq6TJ87bG8D4t+Jvv7BGq2cDjLAq1hqdtKueAjBKs5DHLxeh1p3QdcQOoYeqC+
         EtDQ==
X-Gm-Message-State: AC+VfDxHoaZ/OnUD60kMgRBVwSviAcGGNU/pmJ6HLGOLZWdHoUw2jP35
        zCajdh506tDnqhnTV2e6FOA1i7k1VDcnfqDoKiviaqCzmOkvYw==
X-Google-Smtp-Source: ACHHUZ7J0yv2Uy0Ff3URHHllMh6dn7geAOftATdUjaOMCSCEm6sdR3gpAsqx+SgrMGXj3gnAhFPKaDZy027dlMN9Xtw=
X-Received: by 2002:a17:907:783:b0:94a:6de2:ba9 with SMTP id
 xd3-20020a170907078300b0094a6de20ba9mr6600647ejb.68.1686178474547; Wed, 07
 Jun 2023 15:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:2409:0:b0:217:72a9:f646 with HTTP; Wed, 7 Jun 2023
 15:54:33 -0700 (PDT)
Reply-To: unitednationcompensationcoordinatortreasury@hotmail.com
From:   "UNITED NATION DEPUTY SECRETARY-GENERAL (U.N)" 
        <successikolo@gmail.com>
Date:   Wed, 7 Jun 2023 15:54:33 -0700
Message-ID: <CADFNGJ9M60ti_yHcUzQD8BP2Qji_qiW+6MK-iYxt_qf8B830+w@mail.gmail.com>
Subject: CONTACT DHL OFFICE IMMEDIATELY FOR YOUR ATM MASTER CARD 1.5 MILLION,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.6 required=5.0 tests=ADVANCE_FEE_3_NEW_FRM_MNY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FILL_THIS_FORM,FORM_FRAUD_5,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FORM,MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_FILL_THIS_FORM_LOAN,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:629 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [successikolo[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  0.0 T_FILL_THIS_FORM_LOAN Answer loan question(s)
        *  0.0 MONEY_FORM Lots of money if you fill out a form
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_3_NEW_FRM_MNY Advance Fee fraud form and lots of
        *      money
        *  0.2 MONEY_FRAUD_5 Lots of money and many fraud phrases
        *  0.0 FORM_FRAUD_5 Fill a form and many fraud phrases
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

UNITED NATION DEPUTY SECRETARY-GENERAL.

This is to official inform you that we have been having meetings for
the past three (3) weeks which ended two days ago with MR. JIM YONG
KIM the world bank president and other seven continent presidents on
the congress we treated on solution to scam victim problems.

 Note: we have decided to contact you following the reports we
received from anti-fraud international monitoring group your
name/email has been submitted to us therefore the united nations have
agreed to compensate you with the sum of (USD$ 1.5 Million) this
compensation is also including international business that failed you
in the past due to government problems etc.

 We have arranged your payment through our ATM Master Card and
deposited it in DHL Office to deliver it to you which is the latest
instruction from the World Bank president MR. JIM YONG KIM, For your
information=E2=80=99s, the delivery charges already paid by U.N treasury, t=
he
only money you will send to DHL office south Korea is
($500). for security keeping fee, U.N coordinator already paid for
others charges fees for delivery except the security keeping fee, the
director of DHL refused to collect the security keeping fee from U.N
coordinator, the Director of DHL office said that they don=E2=80=99t know
exactly time you will contact them to reconfirm your details to avoid
counting demur-rage that is why they refused collecting the ($500) .
for security keeping fee.

 Therefore be advice to contact DHL Office agent south Korea. Rev:John
Lee Tae-seok
who is in position to deliver your ATM
Master Card to your location address, contact DHL Office immediately
with the bellow email & phone number as listed below.

 Contact name: John Lee Tae-seok

 Email:( dhlgeneralheadquartersrepublic@gmail.com )

 Do not hesitate to Contact Rev: John Lee Tae-seok, as soon as you

 read this message. Email:( dhlgeneralheadquartersrepublic@gmail.com )

 Make sure you reconfirmed DHL Office your details ASAP as stated
below to avoid wrong delivery.

 Your full name..........

 Home address:.........

 Your country...........

 Your city..............

 Telephone......

 Occupation:.......

 Age:=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6..

 Let us know as soon as possible you receive your ATM MasterCard
for proper verification.

 Regards,

 Mrs Vivian kakadu.

 DEPUTY SECRETARY-GENERAL (U.N)
