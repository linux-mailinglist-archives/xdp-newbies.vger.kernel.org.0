Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67B8651A99
	for <lists+xdp-newbies@lfdr.de>; Tue, 20 Dec 2022 07:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiLTGUb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 20 Dec 2022 01:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiLTGU3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 20 Dec 2022 01:20:29 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140D4BF62
        for <xdp-newbies@vger.kernel.org>; Mon, 19 Dec 2022 22:20:28 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id y4so11408435ljc.9
        for <xdp-newbies@vger.kernel.org>; Mon, 19 Dec 2022 22:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oCS3HXK/YqKFWXxaiEGQ8s8umAiCMTLLHhg6TSItcFc=;
        b=Jy97icuGL2mFmZNp8jOdUUEfIZA99717T9q4HdYVS3mDts1yX1DWQKuZcFUcEAZC61
         YBfbwyTfMlOuDOaohCUcR7RFYO9MX0sZUMlohhQ1EsHlskGamnKKUP5mi4Qv6Wic/AKo
         ypwgZc6V4Y6FruObIgADno4tPJAyCGsJ0a9T/3h41JKSNFZ8EPTW0H8O2nzm4PyCy8i4
         uye/8CgHI1Nf4obqD6yyy+A4QsbAUhdkKPpb2WtG9I7ba0A9bX4XRxx84SBeLElapFfk
         zZMWAh49YsTZTnZlaRloNn3s0yW0nqn3CmZsNUf5Zrtp8W+gIm05Eu+PCXzjatZBGbYf
         uzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oCS3HXK/YqKFWXxaiEGQ8s8umAiCMTLLHhg6TSItcFc=;
        b=WtTyHtcdSlCx8+c51r50czgxjWyvbBRTWfU1u4Dj0nEaCcCfXRnU/1+LkTuQwc9XKm
         mX5TlLt2qPxIaOV+3bGyj8QTw0GzKZ1cItcBidYEEDurSOWukSuHjc5aqDH0Hw9Lcdlg
         YMycuuutpnr/VMj+Xsv7Esi68e9aNHMDazNtsF4TseVQE/yebFV4s5IzC4wbtFUvckRD
         jTcPXqGf+jMoTvIiUnot2EqxpDPhm0Xck7NTXsbaxY/m1L3Hbo6rIKnlFu7iKH67XAA+
         WqCS/YM2843/f5Ox2OjmxpzuXdSwwUlGpSwmrevtWsMxxrsQyjkgggObub6b7hwxBYiZ
         Kqng==
X-Gm-Message-State: ANoB5pl9WtHE6waLVRBzopv2g9dGub0F8RSKw9pq7nj1tQpRFMyU/mNT
        1osjQjBdHLc3/Gyh/QMnmKSXEL14OQDD3TItcsNxvHR3J6I=
X-Google-Smtp-Source: AA0mqf5m58dsRHCXW7DWmQ/DoYDB4BxxbIz0mnj1ME5o+DmsT3UQ5ehskPyJREAqDuwPLvXuM536vwPiFKmIO4OLDpw=
X-Received: by 2002:a2e:a28f:0:b0:27b:4dc8:76e3 with SMTP id
 k15-20020a2ea28f000000b0027b4dc876e3mr1653880lja.345.1671517226268; Mon, 19
 Dec 2022 22:20:26 -0800 (PST)
MIME-Version: 1.0
From:   team lnx <teamlnxi8@gmail.com>
Date:   Mon, 19 Dec 2022 22:20:15 -0800
Message-ID: <CAOLRUnA_0r_kWr8dwNnBfdPNJymkp+1XM+djVrmD4-VmYXSeXA@mail.gmail.com>
Subject: BTF error - 6.1 kernel
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everyone,

I have enabled support for BPF and BTF in kernel 6.1, kernel
compilation ends up in below error

Segmentation fault (core dumped)
LD      vmlinux
BTFIDS  vmlinux
FAILED: load BTF from vmlinux: No such file or directory
make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 255

Are there any work around/solutions or any suggestions?

Thanks !
