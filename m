Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F675872C2
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Aug 2022 23:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbiHAVL2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Aug 2022 17:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbiHAVL1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 1 Aug 2022 17:11:27 -0400
Received: from mail-io1-xd62.google.com (mail-io1-xd62.google.com [IPv6:2607:f8b0:4864:20::d62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1409517E09
        for <xdp-newbies@vger.kernel.org>; Mon,  1 Aug 2022 14:11:27 -0700 (PDT)
Received: by mail-io1-xd62.google.com with SMTP id c185so9338834iof.7
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Aug 2022 14:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc;
        bh=vb7qh7wOWn0edpOyfoavK0TKEKN1ZhuOeG024/+V6vo=;
        b=MgXnp132PiWyXPo1SePWhLbUWOfYKXO+y4cMgDOgLaGbHUelkzUCQyy6BgCfQEJMQx
         AUyhfAOU0HWZLbn7y55zUAiM4hLwL9702EBWsFbvJn/K6PbSDdkpfU9IKCpefZPoUD2S
         XRI65N0T528pbkKNDaAkn7UMLZZspUJILHbSyrYapKrqj3FIgNPSAJ5QwmLw8SPJNhup
         rZCyLQJawIWge44zkgmoQEp5I9PO/A86WtgXdg4nokhM7hwUCOzYyUa5mYD+hQJf5ACH
         ssG5r2Px96y+xuOM17Fv084ee0CcfimZWqP0t8RfeTbX03TP3uQHe0ckzNseoRJRmmEH
         99zw==
X-Gm-Message-State: AJIora9WP2kIPFqO5HQ3K43u6XIsC26MflSgyuCaUuz8I7TU4jTjQZNG
        LiaHQUWjTTGwGFTGbq0mRIC9pDkYsPxtV43IiabTNCII1KTbvw==
X-Google-Smtp-Source: AGRyM1v+A7x9Ycb7rqH4XfkJvfAq/pPPWdefT4fKBYOoQY/I1RF9Xb4dO3xSPqzGAW0y2BYfEk75W8Zgih8e
X-Received: by 2002:a6b:cdcd:0:b0:67c:9b5b:2fa with SMTP id d196-20020a6bcdcd000000b0067c9b5b02famr6480732iog.195.1659388286350;
        Mon, 01 Aug 2022 14:11:26 -0700 (PDT)
Received: from riotgames.com ([163.116.128.208])
        by smtp-relay.gmail.com with ESMTPS id o24-20020a056638125800b0034185ab164esm192917jas.54.2022.08.01.14.11.26
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 14:11:26 -0700 (PDT)
X-Relaying-Domain: riotgames.com
Received: by mail-qt1-f200.google.com with SMTP id u12-20020a05622a17cc00b0031ede432916so7731866qtk.1
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Aug 2022 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=vb7qh7wOWn0edpOyfoavK0TKEKN1ZhuOeG024/+V6vo=;
        b=T5Xn7JxMaVXWqsCDfPcfxobB016K9GurMYJ0BL3xZyZ6J4zeMzYs+SP/5PMrS429A/
         sSYx/VOzp9gG0SN9K7WcbmYAFxcdryUN0uI5HD3Qj4sknp/3amzEJy+HtbeH9qZHbNzH
         xKyA/Xmk1znTWvrR+Yf4BzjuAuxfiGFoVHdGE=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id n17-20020a0cbe91000000b0047401d6b1a4mr15948887qvi.108.1659388284424;
        Mon, 01 Aug 2022 14:11:24 -0700 (PDT)
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr15948868qvi.108.1659388284163; Mon, 01
 Aug 2022 14:11:24 -0700 (PDT)
MIME-Version: 1.0
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Mon, 1 Aug 2022 16:11:13 -0500
Message-ID: <CAC1LvL1E9wC8GS=x+yoAmA02iAgWRvRFu14pqHwLDzxod5RLJg@mail.gmail.com>
Subject: How to benchmark packet throughput for submitting patches?
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
x-netskope-inspected: true
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I see that many XDP patchset submissions to the bpf mailing list
include benchmark numbers for packet throughput to show how much the
change improves (or worsens) performance. They frequently show numbers
for a single core test.

I was wondering what methodology people are using to generate these
benchmark results?

Thanks!
--Zvi
