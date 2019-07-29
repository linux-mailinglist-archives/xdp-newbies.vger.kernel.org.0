Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E5379CC9
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Jul 2019 01:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbfG2X1O (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 29 Jul 2019 19:27:14 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:40927 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfG2X1O (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 29 Jul 2019 19:27:14 -0400
Received: by mail-ed1-f42.google.com with SMTP id k8so60852001eds.7
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Jul 2019 16:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to;
        bh=p2e4ImxQ/Kk15SsdjKYn5yd8qaFPUIRi5GucmMdTyyg=;
        b=URBbXDjKAB1/+ejcZM4GTSymY5VbNJDabaQu56uo1Zsivp1UM30mY4I4eP239qLPKO
         TNwFxFVX981a5Ny02ZWMSnZE/B1yMKubDfEkOLEnwLoZlBi5T6sM7hUZ8/gOfpqMVY8S
         T3BqhhY+6k0LSNrcx0dy3MjeyUdNNyHkabknQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=p2e4ImxQ/Kk15SsdjKYn5yd8qaFPUIRi5GucmMdTyyg=;
        b=hUYykZuRYljmR8T6UKnBmfU8QZg+fxq1d8PYL4VQu8c+4T/Xb/1Rz3Qq/jLypNL1IF
         ViGxeYOCTI3XlA9xwFA8ATmhDDpcxftoL7lliMWkNwlf1CRJQTIuKvHuh3DUl3ROd4o6
         2lQ93zVACix94V9H0ausXnvHXGhBGTHmhdpZsxSPBQgans8JrLtIDs5B+IE+sS0VP7AD
         2bmeCiz4tlDwIkJmLfLJN/s0Q8L0Fs2Faw4iKpu8Yvdu9BZgZGS4lgHnwawS57YigSlr
         FDsGUb+Rm/uh7utctoU2mJZ+jQIMxINjaV5HOHCyBVgDu9Vg7Ydi+9U30o3lG58eYO7Q
         aygA==
X-Gm-Message-State: APjAAAVJl7rBEZZGwmF8teNKtLT9sQXOvNpITtfJ36HtfXmgMQ55W4lO
        GvnjKQZV1NfLOr57neCoD+eBn0E1QgwAS3ujC0UY5DKasCo=
X-Google-Smtp-Source: APXvYqyZB6+9VBbCPj4luSSKzf5I9RO3WLAKNApy0CxpGnas4JVtveZNSpooT7ORaPqep7akZxnjZnYvFuq5+bo860o=
X-Received: by 2002:a50:871c:: with SMTP id i28mr99133368edb.29.1564442832429;
 Mon, 29 Jul 2019 16:27:12 -0700 (PDT)
MIME-Version: 1.0
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Mon, 29 Jul 2019 16:27:01 -0700
Message-ID: <CAC1LvL3xoHQo_oNJEVa4DeZ3G9R6Z61ukScRuMq5UrnRCHWo1g@mail.gmail.com>
Subject: Intel 800 series 100Gbe NIC with XDP
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello all,

I was wondering if anyone knew if the upcoming 800 series Intel NICs
with 100gbe support XDP? I don't yet see a new driver for them, but
they may be reusing the i40e driver, or I may have missed it? If they
do support it, do they maybe also support hardware mode (as opposed to
driver mode)?

Thanks!
--Zvi
