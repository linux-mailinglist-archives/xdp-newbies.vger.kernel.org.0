Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221C5700772
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 May 2023 14:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240447AbjELMHG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 May 2023 08:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240396AbjELMHF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 May 2023 08:07:05 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0BE2119
        for <xdp-newbies@vger.kernel.org>; Fri, 12 May 2023 05:07:04 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3909756b8b1so3133716b6e.1
        for <xdp-newbies@vger.kernel.org>; Fri, 12 May 2023 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683893224; x=1686485224;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m52u6vvyFHeyRBVxzigvM0DebOZXvPNtz9Cne7y2bw=;
        b=cTGyhM6af1uo92bQcDFBKyWOyurUv1W95gwlwiPshFXn6mFWzI7kxl4U5C3pvTx3/5
         q34KOpQfXOoEyR4dJ55sJVifiwhj1j4NjRyFl0mcA1gmst0aQwiiMWSzrNOkMVJDegwr
         XW7vFAoCi6o46e66uBoX5upePgEUxj5CL0p4M1kWUI6Fe0z/5cL+ebO8eWuiQDImc/yx
         3//Fz22eEl+VjIdSMFYhkG2UdCyXSwu2D0X8QuegQfEV/5QVgIXbcrWsKfUW4GbKsrQA
         5Fcvpi8dyLHCBWG1NJT/Jw7dz74RKI4NWQ52ts4vpHIzzBlpOc4wQOWNFpMEJgsueUUz
         sbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683893224; x=1686485224;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1m52u6vvyFHeyRBVxzigvM0DebOZXvPNtz9Cne7y2bw=;
        b=W287sYjps4sVWGxcYeHKAEvZUjyrOYhl5jH0AJURCLYz4o10ZOadIZxs7DqyvkwpAn
         hx3EfwPiB6XhV3W7bkiMFxzsd1gVTreE1as3kMCrrqNMDdYwcojgJzBg47xz0f1m3dXc
         1mfuUgHUVX67v+FE9YASAAMc9lHGzV4xmNJQlkoKr2x3Y/CpWVc26fmQnoAxNIvXq265
         JzP4QX7lOXaCOd4IHPhm7L+mjmT/+szfYNLaVF17updcd/OWJ46W9we5WCXkOI5KOE+8
         qzQ48g5gpA7BoseFkiNzGK8YuV7LqUkUW8qr0YdFa5zIDLleYymRn99wuvgwHP3v0iN/
         n+3A==
X-Gm-Message-State: AC+VfDwt0Bj2OBzcpXVWup/UuYFivseCYRqeXiimlDw9DsxitrVfk+lq
        8T+Q4df5/pTFE2/Y38BoqmUGF6RbDGanh0v0ajGzC6/Ri7ol8Q==
X-Google-Smtp-Source: ACHHUZ43jAJt4geaGzT5yTCP7RlVzgWlm1KzTiP+y4eSQ6pN+tLpuoUZVEdBDyTsqGQN9IbnLGs72vRuac2GeSCTf+M=
X-Received: by 2002:aca:1808:0:b0:38c:5a32:3257 with SMTP id
 h8-20020aca1808000000b0038c5a323257mr6259877oih.42.1683893223701; Fri, 12 May
 2023 05:07:03 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Fri, 12 May 2023 15:10:10 +0200
Message-ID: <CAAVAo4MN5jJ9wXkTTHNK3XJ35DJ6cDO99HZKi_AWYnozKXtg2A@mail.gmail.com>
Subject: Cuncurrency question
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello

Is it possible to use the pinned (LIBBPF_PIN_BY_NAME) map
BPF_MAP_TYPE_LRU_HASH in place of BPF_MAP_TYPE_LRU_PERCPU_HASH for
concurrent read and write?

I'm only asking because I've seen similar usage on the internet.

Thanks

Marco
