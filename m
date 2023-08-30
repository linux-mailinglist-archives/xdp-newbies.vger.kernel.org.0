Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CE778DE01
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Aug 2023 20:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344040AbjH3S4f (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 30 Aug 2023 14:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244796AbjH3ODe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 30 Aug 2023 10:03:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B15FC
        for <xdp-newbies@vger.kernel.org>; Wed, 30 Aug 2023 07:03:31 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so86291511fa.1
        for <xdp-newbies@vger.kernel.org>; Wed, 30 Aug 2023 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693404210; x=1694009010; darn=vger.kernel.org;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SYwuvlBigznlg95SFndHP39p7WJ4tG2r7pv9WNtHGo=;
        b=StJcG9Xd0OVE+ujCI82zAaWEZRpiTYVDvB6kH8FwWRNxgmP4RpKo1gw5JLWWiOrNxm
         9QSbpJm5A5A0j+AtIRcEjdUTOA3lvEfYdCHh17qbYNzZZtrr5PyD5TgaUdKB5aFa4Lzy
         rlszJdfNozIMIXL6Qqa1JQGyiZuqxPJr5sEvRmDatSVyRDTEPvqksLtfpvTHqlnCiNiK
         tiWnCuRtxkg4xQTKWyTS6kPqPqnId4PxJL+6tYkM4EDVuHqF19fH6agPSM6azQca8c1Q
         3OiIjfBcWDeaYW6424hlcQ3Cv7ldSr0AmUt/rGv2RJTfZ8IaEyaaWwhLYjSjFqQ5oLmg
         qYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693404210; x=1694009010;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7SYwuvlBigznlg95SFndHP39p7WJ4tG2r7pv9WNtHGo=;
        b=FWHxVzt0dqXxcMlj/W3aOP/+DeyajIegRzGy2pxYRdn4Qr9oGnLFbTxXW6ahrXbVBu
         ztv68NNXHGM01LD6pAWxvF9nk+9K4YA3VxG98IYqHwWgpyAmw3bs7rPa1VKdDqgUpxJ1
         q9F19yMXoo2Muzc/F+PWtQOnyDypb6gyeIu26AA0jhnXX5HVCG9nmeuiI932WErD7QAq
         NXIxtN8tG5LumUBwAC7zf65VfIEvvQNgmy0S7PGBSS3fikYiXAADLN9cPrWwAz1LJkCA
         N3xZJu1IRiZ3a4ZMDvn2uyI3fqPo2djZZpZUv+B0JB3KoW5eI6lJ6nk9n074dOleJkfP
         WBjw==
X-Gm-Message-State: AOJu0YyG1sUWZRz6t3hg/CAO69Y6sqr9gT+P8nd1VqeT3NBRRwSfAgbY
        Xn5RsfFIuBRjDyYGBGANjQYffVAx2G0=
X-Google-Smtp-Source: AGHT+IF884DAnyjBOZ8HaRZUj622avfNwgAh8AXMKAUf/85t0GUJFYfd/sOFgOrAqZmn+vze7uHxHA==
X-Received: by 2002:a05:6512:3b06:b0:4fd:cbd6:d2ff with SMTP id f6-20020a0565123b0600b004fdcbd6d2ffmr2122200lfv.33.1693404209570;
        Wed, 30 Aug 2023 07:03:29 -0700 (PDT)
Received: from smtpclient.apple (2001-1c00-1437-6f00-ac78-060a-5c90-ae60.cable.dynamic.v6.ziggo.nl. [2001:1c00:1437:6f00:ac78:60a:5c90:ae60])
        by smtp.gmail.com with ESMTPSA id v21-20020aa7d655000000b0051e22660835sm6775558edr.46.2023.08.30.07.03.28
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 07:03:29 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rene Vrolijk <rrvrolijk@gmail.com>
Mime-Version: 1.0 (1.0)
Date:   Wed, 30 Aug 2023 16:03:27 +0200
Subject: XDP use for data diodes
Message-Id: <0CF95803-5B47-4793-9FE4-F20F3312D075@gmail.com>
To:     xdp-newbies@vger.kernel.org
X-Mailer: iPad Mail (19H364)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I have a question about the use of XDP. A little warning upfront, i=E2=80=99=
m not a programmer or network manager so my question could be strange. Sorry=
 for that.

I created a Github to teach people about the basics of data diodes on https:=
//github.com/vrolijk/osdd=20
Via this git i explain student in 2 hours the basics and how to to get their=
 hands on a data diode, insight in UDP packetloss with normal operating syst=
ems, setup Ubuntu to use as a proxy and send data with three different use c=
ases. All with publicly available hard and software and with complicated scr=
ipting.

My (noob) question:
There is a major issue when using Ubuntu and  packetloss in the Linuxkernel.=
 Is it possible to use XDP to prevent packetloss when sending data over an u=
nidirectional connection between 2 Ubuntu machines via a data diode?=20
Is it possible to help me (and the students) via an example how to configure=
 this on the 2 machines?=20

The main idea for the workshop is having a noob proof example so the student=
 has a working example and can continue with his own more advanced setup or u=
se-case.

Regards,=20
Rene Vrolijk

