Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDAE9347538
	for <lists+xdp-newbies@lfdr.de>; Wed, 24 Mar 2021 11:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbhCXKAd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 24 Mar 2021 06:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhCXKAU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 24 Mar 2021 06:00:20 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406FAC061763
        for <xdp-newbies@vger.kernel.org>; Wed, 24 Mar 2021 03:00:20 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e14so7638775plj.2
        for <xdp-newbies@vger.kernel.org>; Wed, 24 Mar 2021 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5/ZAO82ZiB1lLh18pWn8Q9psiQzu9d3kqKGXJDBMJk=;
        b=V1OOtzu8sIuFTPjLKcw45yDYU76vVyh5BRCmleScaQzIZLqG99rEtE0cYrk5qHcoYC
         S6drbnZNj5xSGHxoqershzPv/JB98hTZmy7+LFGRd9M4cYBd0ycwqAsSKeYsu1cFj7FY
         9muW0DDfxeC7hazFTHsMI/JvTjuJrLh7Z6AzX+JNv18gACsctWe41yMTKO6g5MIPFfhW
         ycSnvfyA7IYNQtPV41ZtTDRcU/zGZLVTdOXoUDt6tlQVdIEpMSayamalAqBfJFqSPenb
         1e1S6XOBSsVc5R6N8vy4f+Z2qrHS38GJQOPQpGRLdlQil4wzxe0B5ZrDCjjbCIskFDcl
         Npjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5/ZAO82ZiB1lLh18pWn8Q9psiQzu9d3kqKGXJDBMJk=;
        b=nyBYtOPCI5flsESQGAJpAYdB6JWVkoyJd+bLWTzOcJ47K1KxHGBxrENUF1mqZqPXhq
         nZf1HqIxsAzn60hxUzPjxH7Jy9YkC7EMdyFZO8mr/lB71sqHqAypo675g03FAcgblG81
         KeOfDZU0Qmm3vWyZvsFIUzVQw1qhofQzq5fpZEkLTEN+5AGAzcD4gTkeaq4b7XSkN1MM
         Wjx47vGdUUsMMeNpqPTNIsah8TgzJToOB3LXb1qQQztrEkamdwbPLt3jVimjfWuS6YxL
         GlVMDVC3VCDkca2YQK8a/ozlGoUsrgRQJHiqkeRqxOb1y8dsYKjNuZErTcP8Wo98eTjr
         JEpA==
X-Gm-Message-State: AOAM532tkqefuzn+DU104Fby5SxjiIqojN5rQhfPgvSmGVT1+GvHiNlG
        BB0WMQLiK9jPLwcphWd2CuvTPs7fgS2Ikk7igdZZ4dalCK2AIA2v
X-Google-Smtp-Source: ABdhPJzODOmEY4qn7YPxsVRQMwsYBvZSjCkZ9QLFs1NBnsAv7ogYCVckov/sCWxFBXdjrgL37TZ8IXKmf/4//KjTFuw=
X-Received: by 2002:a17:902:8e89:b029:e6:ef44:6a54 with SMTP id
 bg9-20020a1709028e89b02900e6ef446a54mr2955707plb.7.1616580019796; Wed, 24 Mar
 2021 03:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <35a931df0e2cb4bf1fd23ecc15895419c7ca0e3c.camel@coverfire.com>
In-Reply-To: <35a931df0e2cb4bf1fd23ecc15895419c7ca0e3c.camel@coverfire.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 24 Mar 2021 11:00:08 +0100
Message-ID: <CAJ8uoz3n=R2KZagznZ9XK+tVwdpMoeqY8CqJxyqh1B508bqntw@mail.gmail.com>
Subject: Re: AF_XDP (i40e) behavior change in 5.11?
To:     Dan Siemon <dan@coverfire.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Mar 24, 2021 at 10:22 AM Dan Siemon <dan@coverfire.com> wrote:
>
> ./xsk_fwd -i ens1f0 -q 2 -i ens1f1 -q 2 -c 5 -i ens1f0 -q 3 -i ens1f1 -
> q 3 -c 6
>
> On 5.10, the cores (2,3) assigned interrupts for the queues (2,3) are
> idle when there is no traffic.
>
> On 5.11, the cores immediately go to 100% system time when the program
> starts (as viewed in htop). There is no network traffic.
>
> Intel 710/i40e.
>
> I tried this with xsk_fwd built from 5.10 and 5.11 trees with the same
> result.
>
> Is this behavior change expected?

Thanks for reporting this. No, this is not intentional. I did send up
a fix for a bug in the i40e driver that was introduced in 5.11. It
might be the culprit. Could you please try the patch below and see if
it works? It is not yet in net.

https://www.spinics.net/lists/netdev/msg729128.html

/Magnus
