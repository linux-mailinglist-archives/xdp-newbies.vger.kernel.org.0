Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136F464D179
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 21:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiLNUtu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 15:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiLNUts (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 15:49:48 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DE12A251
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 12:49:43 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id c184so1012623vsc.3
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=woX5Jq/51IPI3V4isUibXqD90TR/ZH/XsB9LSAIgoUI=;
        b=W2sw5N+8DXajEDlXgR/AoD9hDTHHIupaH/Eu81Br6lmiX+Qq/xeKez/3knbjrEyrmW
         thm7D0++cmq1MLzBNDEnJJhUlSfG+iRzBN/hI0PZ37TiUWvXnEVrEUC5KVpdHAILbhiq
         JHNLhHzOXVg45tFlScEEbMjufTh/81upKDgwGJwIX4H4FTxXGSbSGLmDK+CFZHU8SS8U
         qTnAiMKFg/8KkEos3fSg43yrTrPlgP0NpcQb0vwDDrwZ8l/oG139mdbBxGuUuWF4hE2G
         wcOB/E4LE386hXdllBoAm9PUHDur0PKUIcjE21e32vxEeX0wo4ZoUGPKQ5bcLCKSwz8g
         Obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=woX5Jq/51IPI3V4isUibXqD90TR/ZH/XsB9LSAIgoUI=;
        b=EQXW2ADvDIz9QPdTL+SeuojHqw7f1qxKI6Zifq1VT9KvaPMw2v7hyjAnUn/PVrWVVc
         qIAmEg9cSedDatFJs2xscCZyhm/vUvdxwMHEIYBWJckNr5H+uBpnF1lhVnCSmSrLQmYO
         sJN0pZaOW5TxrmXtfNOuO1tQ3mUvRv2gKzKrH2fST7jG3EyZ2ebjmIfeQvD7Y8VEdKR9
         146k7O0/brfwyX6sPT6moIUBafpVPDfgsAGVn3GlnUn4vezUURd45THgwNpTdpChw8lf
         IRjl2lyNgZk8ou82BpKRrj1GdpODEmg0D7gFSjF8fZ5JAmVHJSDpmjgLW09sdnvXbXg6
         o/eA==
X-Gm-Message-State: ANoB5pkKwEn7Mo6R9iLPHLp0QDBP1i0dq6sNH7k4HdG+lcE5JVBNvlre
        9HSvQpT5j3ipEMhEa7Z2bhquNfe8qpfaS4AI1l5tRQZ0
X-Google-Smtp-Source: AA0mqf7V/xzPklBwSnvcuCWqrvzXwIUS066pcdWJAvVugTKrF1r/BD/WJ+TAL/FFW9ylVGids0SG1lSTD6hKjXvZo9g=
X-Received: by 2002:a05:6102:3da2:b0:3b5:f9a:7fae with SMTP id
 h34-20020a0561023da200b003b50f9a7faemr1453326vsv.81.1671050982368; Wed, 14
 Dec 2022 12:49:42 -0800 (PST)
MIME-Version: 1.0
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Wed, 14 Dec 2022 12:49:31 -0800
Message-ID: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
Subject: Redirect packet back to host stack after AF_XDP?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

If I have an user space stack like mTCP works on top of AF_XDP as tcp
stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
or other tcp attack, and redirect good tcp packet back to linux host
stack after mTCP filtering, is that possible?

Thanks

Vincent
