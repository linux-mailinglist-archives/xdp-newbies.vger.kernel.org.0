Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229985F54B5
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 Oct 2022 14:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiJEMnN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 5 Oct 2022 08:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiJEMnM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 5 Oct 2022 08:43:12 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405FE2CE0C
        for <xdp-newbies@vger.kernel.org>; Wed,  5 Oct 2022 05:43:08 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id m81so17472421oia.1
        for <xdp-newbies@vger.kernel.org>; Wed, 05 Oct 2022 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6WHsOaVAPt108cDTbzZrG266wz4HK2yccOlUseqNdaw=;
        b=oTE6Y4pdh5hyj3pDMtifwQpuDqj13124RLwtegg1zFW3f2qouYzyhCli9HrznFuD3o
         HZO+RAsQgdqUvzf3iRmthFagh58aIPbE0wz2/NToEUe+G2TgRIwP54B8uH3WR+j3oc4R
         /gcvZNOt1s5ohly1JyfjEnQ9qxnmxPMIH553mKo1XwQd0GtxLhL3CKYM0UhKMErqJkCX
         mMpAyrNlnoIKhvH4W765z76j3GKZlP+Nwu5KaI/4srglEDNbBG1r2O4ToXijYfOd3xg/
         RfwWGDJUBgw2Tr6tioz/LgC3TQkVAkhCrZGTqoCnaQs+p7Ntv+ubxyeURfuEHQnvAxAM
         EbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WHsOaVAPt108cDTbzZrG266wz4HK2yccOlUseqNdaw=;
        b=CMkCVf2QSGIPpmepbDGUV5EnAZWoQeKgHOSO/k6qMAfGoSTU71KqZ++dzRBTdxsKu8
         wHAYZAti5tHaQPZaM5Whz1+7GwoF1WEUISP349raQPs98717A+dvuR7aMJJU+Swe4oJl
         MIDnkpSp4MTlmWRqkMBvLCSf5GZcJlZhs9Hp9/VQBi4fs6iA0mg8NztAiqDgoO8bORb5
         D/leGw0JU130h+NZ237Y3UqIdeKjpLGRCYV41ogtDM1d/qIyB0aBCKg0R1wHUSUBsMNj
         EE8+6+2+JTMYMd+jRHEwpCkclL6ESvJJlobl2rJHpubQ973t4oRPVB42By6GfSZB/ESv
         v2kw==
X-Gm-Message-State: ACrzQf2ld+HlpaX++1pxhfkOfVSHBZqLxqKqZYTUmqw64pV3TMMYEnAs
        n0si//ptUgHkZ6mVyrxcNPfYggxJyzI6CsywB58=
X-Google-Smtp-Source: AMsMyM5ZqcRqkHWzg9aJVAeNDWftLlYxwXqcVlXyApkcSZL39i8xOErV4DW9rJbU4c3ovqhm6+MHFFKWjxiAcVap71U=
X-Received: by 2002:a05:6808:1a14:b0:350:1965:8b5 with SMTP id
 bk20-20020a0568081a1400b00350196508b5mr2039598oib.85.1664973787611; Wed, 05
 Oct 2022 05:43:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:5798:b0:b3:716b:d3b8 with HTTP; Wed, 5 Oct 2022
 05:43:07 -0700 (PDT)
Reply-To: proctorjulius@yahoo.com
From:   Julius Proctor <ecobank.ecobankcustmercare.to@gmail.com>
Date:   Wed, 5 Oct 2022 13:43:07 +0100
Message-ID: <CAMGyYt77k-vAFbUqmPXcH3fdraTGY+Sb6jrPfnszhde_KN3KxA@mail.gmail.com>
Subject: =?UTF-8?B?xIxla8OhbSBuYSB2YcWhaSB6cHLDoXZ1?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

RG9icsO9IGRlbg0KDQpKc2VtIEp1bGl1cyBQcm9jdG9yLCBwcsOhdm7DrSB6w6FzdHVwY2UgeiBh
ZHZva8OhdG7DrSBrYW5jZWzDocWZZSBQcm9jdG9yLg0KS29udGFrdG92YWwganNlbSB2w6FzIG9o
bGVkbsSbIHBvesWvc3RhbG9zdGkgZm9uZHUgemVzbnVsw6lobyBEci4gRWR3aW5hDQp2ZSB2w73F
oWkgOCw1IG1pbGlvbnUgZG9sYXLFrywga3RlcsOpIG1hasOtIGLDvXQgcmVwYXRyaW92w6FueSBu
YSB2w6HFoSDDusSNZXQuDQpOYXbDrWMgdiB0w6l0byB0cmFuc2FrY2kgY2hjaSwgYWJ5c3RlIG9k
cG92xJtkxJtsaSBkxa92xJtybsSbLg0KDQpKdWxpdXMgUHJvY3Rvcg0K
