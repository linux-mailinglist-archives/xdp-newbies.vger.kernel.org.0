Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0226F70FC
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 May 2023 19:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjEDRf7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 May 2023 13:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEDRf6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 May 2023 13:35:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE08940CF
        for <xdp-newbies@vger.kernel.org>; Thu,  4 May 2023 10:35:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f00d41df22so11625737e87.1
        for <xdp-newbies@vger.kernel.org>; Thu, 04 May 2023 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683221755; x=1685813755;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QJChVOUgE7/YqZzrEYlFu/bQja0RuhvRqEqYFgLcEfM=;
        b=EwYvitvwJWd5XIi75dQtFLYPMRFIizAa1RvuwQu0FYy8qsEIr4T18X/s3zFaabJOSa
         udoYh7g/NUlYldMwUyKaRD0YJU2l8Siwxz7/AsOhlfsVaZsG2h4PJnUkjNgQsAHht872
         KyMsXbBIW4gasyybRPAZW0CdYY5+FK2WgNwUCQAM0tLcRzTQTowsf3qNuMrnatR1FyHa
         RyluvGVO/xbQ2fVO2Nzlu/yeF5gW33TCMAnma80FlBqom85Lb3/a/eS+TfcEADdHhbJt
         RgEcKdXjDBgNnvcGwYdE+0xTS9tEW3ekcfcWjxfTLs0/ykRcQHI7OLMpWazfcfLYXpwf
         5yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683221755; x=1685813755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJChVOUgE7/YqZzrEYlFu/bQja0RuhvRqEqYFgLcEfM=;
        b=AinKR0I45j3uToVJpj+TQzUxHrH6TLWMAz6vAxYR3DAjqw9t+SOeouaIJikYQr/A8k
         zXoOMUixoG2K9+ys51pIVQqbvr88nX6LDMLcU2jcH0Pa5Xot5kz+u+I4ObtmKq3uYati
         iFdm3cC3PgL1E11oV6vuc3uQy0ndj6k4LvCKq46fRj6dSfUAx+hI+JrR5T33zR4OjOwV
         phELJwre1yK1H1srrHayGSUh6Imj/KUH4zn3xgWI7+sSrDlHJtIRg+nyMQ9TiH8GEaaH
         VqEbE51d0QvFmeN6ZQb6+q3yE8ik0Wf28j8dGdtlYsmMUSVnH2hqxt72pkDVgc7vP5OF
         vRfw==
X-Gm-Message-State: AC+VfDzfxLqw4UI3ODU5nlWxsiDWqrL6sehIehHEuumCbb4Cbz4KsLeU
        m0iYzLFuODq+fqDYy2ukGCi5gskIzKxVKArI3og9tyXvif6MiA==
X-Google-Smtp-Source: ACHHUZ7KNsGyVvWpQW/CHkbbVHq/o8jEwDMdBVWGHy3K/WhGAaYQx4qz/H0nNtSE8bMUZzRzVxiIeyIXuO4tqr0dIrU=
X-Received: by 2002:a2e:a488:0:b0:2a8:b792:d7cd with SMTP id
 h8-20020a2ea488000000b002a8b792d7cdmr1168825lji.4.1683221754839; Thu, 04 May
 2023 10:35:54 -0700 (PDT)
MIME-Version: 1.0
From:   team lnx <teamlnxi8@gmail.com>
Date:   Thu, 4 May 2023 10:35:43 -0700
Message-ID: <CAOLRUnCCoHQLd_kyfrZ7QvVKD2D2TmxxUaZf17ZijP1qU5z3mw@mail.gmail.com>
Subject: XDP Redirect - Ping fail
To:     xdp-newbies@vger.kernel.org
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I see a ping not working in below topology with xdp redirect

                               --------------------------------------
IFACE1 <--------->  |  IFACE2                  IFACE3 |
<------------------> IFACE4
                              ----------------------------------------

IFACE2 and IFACE3 are on same host machine

IFACE1 and IFACE2 are  on static ip
IFACE3 and IFACE4 are on dynamic ip, IFACE4 runs dhcp server

steps
1. assign static ip between IFACE1 and IFACE2 (ex: 172.168.2.x)
2. dynamic ip between IFACE3 and IFACE4 (ex: 192.168.2.x)
3. Run xdp redirect on IFACE2 and IFACE3
4. start ping from IFACE1 to IFACE4

Are some of the assumptions not right here leading to ping failure ?

Regards,
teamlnx
