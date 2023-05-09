Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253636FC652
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 May 2023 14:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbjEIM2O (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 May 2023 08:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234398AbjEIM2O (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 May 2023 08:28:14 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592F92103
        for <xdp-newbies@vger.kernel.org>; Tue,  9 May 2023 05:28:05 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ba1ddf79e4eso836677276.1
        for <xdp-newbies@vger.kernel.org>; Tue, 09 May 2023 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683635284; x=1686227284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJTq9joLQjYUhdjrhw9seO0fM7xQTsbEWtFtCeXxK4k=;
        b=bokbxKj/o4RIVjbccTmgtd+cNXB/mKUAXWtfPqfFQwH0132PxVT6Vldu8yCGLIPeG1
         twHaWYxf30z7pZM+HstDVY4YOC5z5cbksu6ylPwMLFNMcRpWyBiPk/26Z1to9dBDYY6S
         Mya+TzFYdeUejZ9zI+f2fdFQXO6FW2g3/aK2ns0rgVmf+M+4r+4gyGin7do48uBjU2py
         LK98YfYC5Ie7VnpY3hQqtV7obE0mc1+7YQfXFeHurBDp31L08jokTcC+1F8FDdTpVzga
         W1S45p7LNsx/Z6wbymDyqlk1J/FV5YGX8CMarNS9Sct4ag1aXz/lKrRYJolzX6JQhSUq
         dmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683635284; x=1686227284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJTq9joLQjYUhdjrhw9seO0fM7xQTsbEWtFtCeXxK4k=;
        b=F8v4i0qIRp6ceY1wuxIv3B+AnKzlE0BoFDBgkocyMbdDbbc9Oto6s2SBD63b0YkmKQ
         ZIRe1wLMh7z5hDmRdMr2b5YnWnI9GAxqaIF9K9v1zpOm4VHgVCoo0zruE4p2V8+FpVKk
         ZBK54kadKRNXrbGoQX+MRfDSmaaFptsbGi6NNY5Gk6Jr2M0LYXAynGB9ZK1NShjLIvE4
         o2znOk/bVGAvnl91ZFhjzhx+ielnmV3ZK4jrXQ83RIIahlyC15TP6M0SGOdg9csD+JXp
         vl9AbpabZYr/F6wT3j0fPEzrCI4BgUBuXGVpjchjSMW4jfwZQ0Q9m0V109h4d/cP9qnt
         3Ljg==
X-Gm-Message-State: AC+VfDz8DNxEXO+PzPBqdOP4vZzwQRrDQcxRFsna/QeJa9tZBRuNZab2
        J4xs/FkO/UPoHoBQEKfdvtzLYLWUKHEaUKuP7E0=
X-Google-Smtp-Source: ACHHUZ6aQb8dihLCes/wv4ZMlsQ+iWM8qVwu6UVPXE2JuI3Cpa/uMxNsgoZ4yHwPWdTjgn5J8GznuO7m9fZiaORXZAY=
X-Received: by 2002:a81:1313:0:b0:556:c4f8:625f with SMTP id
 19-20020a811313000000b00556c4f8625fmr14365329ywt.1.1683635284396; Tue, 09 May
 2023 05:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <1192ed3a86ef4ef19e25a0864ede7ffb@tu-berlin.de>
In-Reply-To: <1192ed3a86ef4ef19e25a0864ede7ffb@tu-berlin.de>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 9 May 2023 14:27:53 +0200
Message-ID: <CAJ8uoz1e-1J1C4rnT-npfc9Op_TnPMNy6mnJOdWzHBZKkjA99g@mail.gmail.com>
Subject: Re: question on contributing to the xdp project
To:     "Le, Ba Que" <b.le@tu-berlin.de>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "bjorn.topel@gmail.com" <bjorn.topel@gmail.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 9 May 2023 at 12:58, Le, Ba Que <b.le@tu-berlin.de> wrote:
>
> Hello,
>
>
> I am a computer science master student at the TU Berlin and currently wri=
ting my Master Thesis.
> I have been working on the AF_XDP socket for some time and would like to =
use the AF_XDP as the basis for my master thesis topic, which is multipath =
tunneling with XDP socket (may be changed in the future, depends on my supe=
rvisors).
> While I was prototyping the thesis, I found that some of my code can be v=
ery useful for new people who want to learn and use the xdp socket.
>
> The code pieces mentioned are about:
>
> - UDP packet sender and receiver. These are ready-to-use programs. (Possi=
bly be useful for requests by https://github.com/xdp-project/xdp-tutorial/i=
ssues/307 and https://github.com/xdp-project/xdp-tutorial/issues/307)
> - Multiple independent AF_XDP sockets bind on multiple interfaces. I used=
 it to test the possibility of using AF_XDP for multiple path tunneling. Th=
is will demonstrate how to setup and configure multiple sockets without UME=
M sharing, and reading and writing UDP packets on these sockets.
>
> I imagine these examples might fit the XDP project's long term TODO "Addi=
ng AF_XDP support to relevant userspace programs" (https://xdp-project.net/=
#Adding-AF_XDP-support-to-relevant-userspace-programs).
>
> These programs will be submitted with detailed instruction and explanatio=
n.
>
> Please let me know your thoughts about the proposal.

Hi,

If you have good examples to contribute, that would be great. Maybe
they would be a good fit for the bpf-examples repo.

https://github.com/xdp-project/bpf-examples

/Magnus

> Best
> Que Le
>
>
