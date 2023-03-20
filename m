Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D0F6C1A00
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Mar 2023 16:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjCTPm2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Mar 2023 11:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbjCTPly (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Mar 2023 11:41:54 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287253CE25
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 08:33:14 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so12829667pjb.0
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679326392;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTFi9rhd0Sg4W4xVfy6ivm8464tZh8fXEE1u61yZhXY=;
        b=X6KGc6tBU3Y6kCclljl05Qd+t2B7yPYEfC8dceNb/rIR/8r2rfm86KT5b9KSbZF/7H
         JX6bq3sAVjl3vqfkXjXg+17Siru8qIkLr8EIBSiclceIFnQHWQiDUJyTa9lLaqsBMCsg
         O2R5/uB+YAouMtkg66PghybOJMHftyT65tHbMuL5dAoIQxsiVit2P8xbyAipTZbC3bnq
         z5ZoMtc7wxeFV4RIoBcwF8U6+PE3AVM6WSceLA9EcGm0nwjDQngqnMyCgEiT2rkTReIf
         GMVN4+533v+Mv0NEGcZkBJsUUHyj5+OSzDfSNLSkkVYvMPuy6w8YoSLQwkmUyrqaH0XB
         1mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679326392;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTFi9rhd0Sg4W4xVfy6ivm8464tZh8fXEE1u61yZhXY=;
        b=C9eWsGeTBZ7GhpgYj5K4luOHwmrN0B3AFq3/JUG3L8/Gu7p622JUK08tFVEJPgxZL8
         N3I6rheRKgC0sd+/H+E/9TG+uzdYVx9qp4YZo5IlxBW6sW7NWwzel5TLGPFGCkOzP1Wx
         5Ejh/mIG5OQQs8vpe+Aa7+1z1PNrwnQveuEwJtqmjiBs+sniE+KbZRGgVSGT5CyKCLHB
         f2bbzofe5f+3UlJfofEulUNgMtI3GL3je577nZlGqwyTCgDgcFBXX1S1syv6XUk2V2P5
         1oy/+bTPhLthggFiFwOskA48mlOyec66LXJ/B2LsErIRYq+qcz3dUOorgVZ+DsOuDK9N
         6KZw==
X-Gm-Message-State: AO0yUKUpa2N3CYm32OetKXgdVi4AKRAydKs4nRUqWn8ZrXvoKI3HXGOB
        iyXehP1nL99NGjFe+gWg9KnUnDokfl1IkUAlIfyZQ0P7Ev3C3Q==
X-Google-Smtp-Source: AK7set8zilKt3IXyx9Vfwntr5lZm7VhDj+mHYOfeB/++l2eLMwzO7XFpo5mZR6R+rPHFaYmT0qFh3mnZ9nc1lIyAg3c=
X-Received: by 2002:a17:902:ec90:b0:1a1:bbc5:be8e with SMTP id
 x16-20020a170902ec9000b001a1bbc5be8emr3004461plg.11.1679326392693; Mon, 20
 Mar 2023 08:33:12 -0700 (PDT)
MIME-Version: 1.0
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Mon, 20 Mar 2023 08:33:01 -0700
Message-ID: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
Subject: How to get system localtime/wall time from eBPF?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

if I have a XDP based firewall to block ip  access based on system
localtime/wall time, is it still impossible like what mentioned here
https://github.com/xdp-project/xdp-tutorial/issues/204#issuecomment-819419800?
If so, is there any way to workaround this?

Thanks!

Vincent
