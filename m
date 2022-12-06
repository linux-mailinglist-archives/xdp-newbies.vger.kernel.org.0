Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40787644994
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Dec 2022 17:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbiLFQns (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 11:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiLFQnq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 11:43:46 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD29DBA
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 08:43:45 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id t17so7669031eju.1
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Dec 2022 08:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=koCXjorduUlT7hHtY41zd9vDx8OwrLDaYojXyZPzBxs=;
        b=KeT0BDaATvunBGvlnHhq3pXnzjwf7SOH2uds8AS0db8mU/h1Q9z2VmbbcpLuemF7a6
         2yQCacOCRF/4EfKkYoep72mR5MCd7GmbiV4C0TL+pK1dgJFWk9/gkKDNyBXrbAWJo5+C
         IXi6cDJ5gMoBFAS9MddbuHENOQMj0JRq5/BRFecGUxKKSHQZGj+aievSANRZ36uJX3uH
         TkG8A19uEzmUf6WckQvDr+Byw9o9aJqPZmXFL+M9vi2wYShah+fsn3c/Ss/jaoapN1zq
         wO3lHk9C4Pqtsbm1Bp27lgrcyZ/rD2aiTwNycugdClGn7Yb/2TghOCPR6yHKq6wZwED+
         4PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=koCXjorduUlT7hHtY41zd9vDx8OwrLDaYojXyZPzBxs=;
        b=rCDmlQkladeSCO5VzZvqUg6dJOGlGbGbOc+I4DsyHL0yDIMlkehmOzz8b0Mwkm4cqb
         wDiJuFHD4BEycZE3spWuyKab3VM7cDtfn/94P1OrBnQ8rSVK5u855rllGT0N1M1XGZHF
         zGnfXAF+la0YqB3CVcmbF3toSnSA8Q5q7TtrEmSIEXguW1e35mQJ1DzPd0BVZrV2r/c0
         YTZFQz4W92J3z0lMzryKemNG5W1oqz/2QcUmLMFzz1vcMkdgh6Zry2tRtf7NhclgnzQy
         gXj5yg4om0zsBr4F1ZTO8rx+s8CjzAg8f7gDvp9cvCwl6J1ne3MondcLC8HIk8x1O2ID
         R/oA==
X-Gm-Message-State: ANoB5pkmO5ocRc+g0rb036DHyd4GeQ90l58XbjNMam9mq5Oe7MdN9K9U
        EvLC7hQH3+A2D0hxDn8iYsnmcHVl0gcoEkezyh0TRIm7EVgdyMUl
X-Google-Smtp-Source: AA0mqf7z89hNYARjzL8jEflANc+7fgmD3jONLP6fQGJq4xZNj15Ko/blLU/er5XMD526V4S9cswVacyNik2QISAoCjk=
X-Received: by 2002:a17:907:2721:b0:7bd:28b5:2fb with SMTP id
 d1-20020a170907272100b007bd28b502fbmr42776919ejl.169.1670345024318; Tue, 06
 Dec 2022 08:43:44 -0800 (PST)
MIME-Version: 1.0
From:   team lnx <teamlnxi8@gmail.com>
Date:   Tue, 6 Dec 2022 08:43:33 -0800
Message-ID: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
Subject: xdp forward issue
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

Hello,

I am a beginner for xdp and following is the setup

3rd party Board - (64 bit arch):  This has 2 ethernet interfaces
supporting XDP (v0 and v1)
Host machine: Ubuntu

step 1: 3rd party Board <-----connected over ethernet (v0) ------> Host - Ubuntu
step 2: echo "1" > /proc/sys/net/ipv4/ip_forward
step 3: Assign static ip address for v0 and v1
step 4: run:  xdp_fwd -D v0 v1  on 3rd party Board
step 5: start ping from host to v0 of 3rd party Board with expectation
of forwarding from v0 to v1

Observation : In the above experiment I see xdp_fwd has a return code
always set to XDP_PASS and when I traced it found that below
conditions is the reason
in net/core/filter.c
if (res.type != RTN_UNICAST) {
 return BPF_FIB_LKUP_RET_NOT_FWDED;
}

1. Could you please help in understanding the reason behind this ?
2. Once #1 is resolved, do we need to add manually arp table/neighbor
information as well ?

Thanks!
