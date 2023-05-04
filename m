Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773A36F7135
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 May 2023 19:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjEDRjT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 May 2023 13:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjEDRjP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 May 2023 13:39:15 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C296A5FE6
        for <xdp-newbies@vger.kernel.org>; Thu,  4 May 2023 10:38:39 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ac770a99e2so9285841fa.3
        for <xdp-newbies@vger.kernel.org>; Thu, 04 May 2023 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683221910; x=1685813910;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/U2FsRAABcYvDrg9qeQvqxqaubdM5gWSSkhYZVJEMM=;
        b=crQgcTkgibaCRmG3vdxRDkmKOahAWFSXobQJoaz9VnNnPmSVBHi0RQhfaxNf6jsKUp
         bSVkuc+8iWLGHXiiTR+8JkV309Qww9CxdA9njNQgrZYiGTl2zJ2X/T8/BUgG7KOaecxJ
         uERd2gldm2fxUHdcRFOWJuTdm0PKyxzNaK5ci+ihcT+cc4rW6Bi+8Hj+3Oe8/xPIVdH1
         FE40JoNimtbp19gs23wpCVJ7yxLusFJJuoL0yO0Ulpr9u6yA9VHqyM9mE9N3mB9hZsbD
         rSX//1uW94GbVirpaCQHEVKZnFru+DRUr28AiLDXRaVDISK5aF74OWyMPccBxjm4Zf9M
         UBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683221910; x=1685813910;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/U2FsRAABcYvDrg9qeQvqxqaubdM5gWSSkhYZVJEMM=;
        b=dNQ0Ar5FbF8I6pqfgGbPyE5OhLBC+0qNE17sZsBAAtgUdufwEIWsGqQ3Uf4Qiwy4Dl
         TvZyfbaKboUTDMYmHxABopMrat1VH2qZUBYIIjLjEYpzVeOIRgD0ktvMmVDN9ucxZoIJ
         KQ5vuwQWbzX8t8bpMJKaXxQ1V1kQmENSbRAwIhxP03MXkqlqzktSDOEk/0xtJAnsVBeC
         CqVdoL7qaRICY2hzcu8OBI2Syd/LrN7rPYl9RshTBMfyhEfTMw1A665EkQFc9gqqNnvX
         z3slZ7m5wjVHm0wnFJFQ7rQ78LtLodEMdG3xQfHSRPEENzOf7JbuVlML60+nlq9HWXqM
         s9Jg==
X-Gm-Message-State: AC+VfDw62WlQKXlJVLrzPZF39hUFqfbm6yH9ojV7uWu225PoWcZ3YyU4
        SM2oIeYwClBgczkmFWpQkccuqeyImmwKA1MCgjVb0paI4l3/DQ==
X-Google-Smtp-Source: ACHHUZ72wFIxhMm0MuNyr/tHVrYjssna1aFxMAXHOMz0P7aaujJB7KbGPr5vIyMRM49C4+gPYn6FlBYhFYSnqYSL/xw=
X-Received: by 2002:a2e:9599:0:b0:2a8:bd47:caf7 with SMTP id
 w25-20020a2e9599000000b002a8bd47caf7mr1125193ljh.7.1683221910369; Thu, 04 May
 2023 10:38:30 -0700 (PDT)
MIME-Version: 1.0
From:   team lnx <teamlnxi8@gmail.com>
Date:   Thu, 4 May 2023 10:38:19 -0700
Message-ID: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
Subject: XDP redirect - ping fail
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


IFACE1 <--------->   IFACE2      IFACE3    <------------------> IFACE4

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
