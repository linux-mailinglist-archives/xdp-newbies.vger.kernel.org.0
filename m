Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE0B371278
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 May 2021 10:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhECIcO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 May 2021 04:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECIcN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 May 2021 04:32:13 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4586EC06174A
        for <xdp-newbies@vger.kernel.org>; Mon,  3 May 2021 01:31:21 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id b15so3647727pfl.4
        for <xdp-newbies@vger.kernel.org>; Mon, 03 May 2021 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dIf4JFT8XgtskeWTHKZRYmwt7k8IVraeYNafR5ooYa8=;
        b=LmoN3eAwPcPFUv3VkbDhCU+Kg1MoUkKqjDevXuO2ERvgUkCMydR4g10Wrd9CdY1PHK
         wdS+JWWoKAC7gyApMqNBWKpAuV5FZ1pVNdQqCCBb5cqKOo34N2a7zqfMGV/FyCFYmt+M
         HKf4t/SuzO95VEnBzkeFKOSSB1YTqkV709tBkUAqvH884Qyzo5xmRsqR98qiS8WVF9Dz
         oGdhHstoSfZHTilhNMDEPnPz+Mozwud6FU1GHjMGeMnyRi9HUfrhnI24E0jaiheYfmF6
         5rtbEdXtvSi0Ehn3MPzhPlDNP7wAzdxU7DWMN+VELltXZw5wwzxbk/aSVEwtpXtYeXbs
         dz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dIf4JFT8XgtskeWTHKZRYmwt7k8IVraeYNafR5ooYa8=;
        b=XsERtgXBqX+LnBEIfmXbv32FpzL/aCR8mIksvTWxE9UadoZl5XIz3QuFGpasgd2I3g
         V2U7Gg+Zo5pqnouQFgLCoTuhldzpZWwTazweOcbCtGp2YKFSFEUuO0wH1cWh4E5HgBcS
         cFT4pRhgYrgNOLQ+EO3X92vET4M6T7AXI5pGjUwLBPzfwDtnsBf4sNmhwKUfOV9UttDg
         aNEI/Ju12lLvawrzJZ6N/phS4+1oAk3ZyAlhf/DyD/ve1aDDNlElqePB9k8Y3JWzVg2l
         84If/JOTIJmtjYxAiPRqsopd39MKnrrhulC/SeVynYtrHRS1wCPMjakbH1HNFFiGLWnz
         AR2g==
X-Gm-Message-State: AOAM532pOhcQ+Y5vELGg/v26f3/Zh6Jzz580YMRxn3dfiz4TjVK1/xg0
        rqxHKwDsZEnsB4nAfMjVCTOVt1NXRhJbKHi/3oJe7i0tZn6vpA==
X-Google-Smtp-Source: ABdhPJzZjAQ5JYj3DGlyOcI5uzyENQn27tR+fllDPPf0fTJKIVHFWHuhOTdP9CWce1Xcz7tFBgbxTjP9SRa0UqTffu8=
X-Received: by 2002:a62:1b97:0:b029:24e:44e9:a8c1 with SMTP id
 b145-20020a621b970000b029024e44e9a8c1mr18054695pfb.19.1620030680801; Mon, 03
 May 2021 01:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <0b0ebcc691f6dfeb560c2faf1e329e059cbecc2d.camel@coverfire.com>
In-Reply-To: <0b0ebcc691f6dfeb560c2faf1e329e059cbecc2d.camel@coverfire.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 3 May 2021 10:31:10 +0200
Message-ID: <CAJ8uoz3vFize=OW6HhFvMMVabsdioywUSC09sTz4mSOmnjT-0Q@mail.gmail.com>
Subject: Re: AF_XDP Rx and overload
To:     Dan Siemon <dan@coverfire.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 30, 2021 at 7:24 PM Dan Siemon <dan@coverfire.com> wrote:
>
> When an AF_XDP based application is overloaded, it is preferable for
> the application to:
> * Service the Rx ring as fast as it can and drop in the application if
> required?
> * Let the Rx ring fill up and let the NIC drop?

Let the NIC drop, since this is much faster. And always process Tx
first, if you have such a component. This alleviates buffering
problems and makes sure you get as much as possible out of the system
to the devices that want your packets. You generally want to get as
many packets through your whole processing pipeline, not trying to
receive as many packets as possible (and not getting them the whole
way through).

>
> This is mostly a performance/PPS question. Obviously the application
> loses the ability to directly count the drops if the NIC drops among
> other limitations.

You will not be able to keep up counting anyway :-). It is not
possible to count all drops in user-space (or the kernel). You would
need HW support for this. Just think of blasting 162 Mpps at one port
and trying to count the drops in the CPU. Would need a lot of cores
for just that.

> If it makes a difference, the use case is only i40e right now.
>
