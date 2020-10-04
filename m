Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0EC282DA8
	for <lists+xdp-newbies@lfdr.de>; Sun,  4 Oct 2020 23:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgJDVEP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 4 Oct 2020 17:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgJDVEO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 4 Oct 2020 17:04:14 -0400
X-Greylist: delayed 9379 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 04 Oct 2020 14:04:14 PDT
Received: from cornalina.dcc.ufmg.br (cornalina.dcc.ufmg.br [IPv6:2001:12f0:601:a902::155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D441C0613CE
        for <xdp-newbies@vger.kernel.org>; Sun,  4 Oct 2020 14:04:14 -0700 (PDT)
Received: from turquesa.dcc.ufmg.br (turquesa.dcc.ufmg.br [IPv6:2001:12f0:601:a902::150])
        by cornalina.dcc.ufmg.br (Postfix) with ESMTPS id 98DE020DCAE;
        Sun,  4 Oct 2020 18:04:09 -0300 (-03)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by turquesa.dcc.ufmg.br (Postfix) with ESMTPSA id 421D8C514A
        for <xdp-newbies@vger.kernel.org>; Sun,  4 Oct 2020 18:04:09 -0300 (-03)
Received: by mail-ot1-f43.google.com with SMTP id m13so6739512otl.9
        for <xdp-newbies@vger.kernel.org>; Sun, 04 Oct 2020 14:04:09 -0700 (PDT)
X-Gm-Message-State: AOAM531EAS5/EaYfnZ/OxP6c7rKfF8WXmg/KKXXWv0JOyfRDZNBQI+yo
        YpoBhK46NZeAoflFBUdEtxjvtsGOMXMDLtuOuWo=
X-Google-Smtp-Source: ABdhPJx1HI9L7c9GveOPxA5K5aTgp0+qvR6RWfu/bWqNDO3CHwVsriiwOJhupNiK/xNDwnLpeXT25o1+g+70MN0QKnE=
X-Received: by 2002:a9d:3bb5:: with SMTP id k50mr8484252otc.252.1601845446866;
 Sun, 04 Oct 2020 14:04:06 -0700 (PDT)
MIME-Version: 1.0
From:   Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br>
Date:   Sun, 4 Oct 2020 18:03:55 -0300
X-Gmail-Original-Message-ID: <CAPyJoHk74hN6roX+-66fU1H03ZRsO5qtpGiH9mwiXzdzqqYpQw@mail.gmail.com>
Message-ID: <CAPyJoHk74hN6roX+-66fU1H03ZRsO5qtpGiH9mwiXzdzqqYpQw@mail.gmail.com>
Subject: Create copy of packate given to BPF
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'd like to create a copy of a packet inside a BPF program, alter some
of its headers and redirect it and the original packet to different
interfaces, either on XDP or TC layers.

By taking a look at the helpers list, I have the impression this is
not currently supported, but as things evolve rapidly in the BPF area,
I want to make sure I'm not overlooking anything.

So, is there a way to do this today?

Thanks,
Matheus Castanho
