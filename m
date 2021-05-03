Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721A537125F
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 May 2021 10:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhECIUS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 May 2021 04:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECIUR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 May 2021 04:20:17 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34C5C06174A
        for <xdp-newbies@vger.kernel.org>; Mon,  3 May 2021 01:19:24 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t21so2409061plo.2
        for <xdp-newbies@vger.kernel.org>; Mon, 03 May 2021 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZVepcQA/3eyVStsqPaQdCEdxzgsy/BaJaXYqXK4hWgo=;
        b=di1163G0TYsqZuGaiLbrQvusvfH2q8kz1wapCe7QnRj9z5Or76w8FSTdx5qqrcIoi1
         S1SsoO0ONshISj2s4KYJ1ddOe7Q00HUC4aFvYEBtHd0f9fN+lF4Ox2akA44yDjbl5lWa
         v9YqeTPU3TFMa7DsERtJYIQKf5HW+6nCwUtUfw+KYTis+83KRn1fe8gye4S+VpuJt+Rf
         w+oJpVRfRW2X4uPWJ429GH5mDCdR+f/y3Cp0N1afih/0jL/Rg6YsKs7zPJx83b7uerUD
         A0Y3epzKp5m1O3ESgHTIkxL4Ul8gmmLSw1z/bmPXCE6mMxDyxJv5rDv9iJTx+3LAAJAE
         eKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZVepcQA/3eyVStsqPaQdCEdxzgsy/BaJaXYqXK4hWgo=;
        b=n/vSWQpUd4mdKCsFBRjwd8ueFpphwyfdXFVjVjfRiUDZWtyaq4zvM47kM13IROvA7I
         U6cUtpVKt8eQgn5Q9HgHSkxa4VXvbRrgCwhm0s8eJFuv2pcsSj+/dTvppwF9wBcQ6Qxh
         yRE2YkOx8Nh23QQCDgBrqOqma+StqOIDS/q3lpoga0KUqapweK8sfwlPfFjFULcO2FtO
         CRIkXkATwcMxud01kzGqKRi4tuuE/SY2NRQYcUG9Kt+U+yMYrHlEVRKdFOt7wt8ZEGPT
         sopBqZRy+hvJqpu2/UH82djgx0K+AUEK4jRVeCN4QqmVk+8AKkpSGOta84v/1xX7TLxB
         +dyg==
X-Gm-Message-State: AOAM531KOxUcDbLpLvlrggEqM2ruRjKKUsRBAPC1hwl9eHt0oe6qfOr8
        CgoQe6IngxDUmDO5eoxOCx5qDEx+NcCOw4AJof4=
X-Google-Smtp-Source: ABdhPJwCgeffbuHxOmqZYdHmTqAGlKipODi8gF+/Ic9KLC2lkYsD6NcAki6gcAQy+iz/XsPNIGF8iEiCztAQsHjeC9g=
X-Received: by 2002:a17:90a:6282:: with SMTP id d2mr28758266pjj.168.1620029964622;
 Mon, 03 May 2021 01:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEFQJSm2K3L-oVKddtvxJf0TiVupudSFzaL_eSCCF5-CQw@mail.gmail.com>
In-Reply-To: <CAGZFCEFQJSm2K3L-oVKddtvxJf0TiVupudSFzaL_eSCCF5-CQw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 3 May 2021 10:19:13 +0200
Message-ID: <CAJ8uoz0O7_8D44gZ9Vs_0bYCW1kcT-uWdPsuZci-qC7CAMueiQ@mail.gmail.com>
Subject: Re: AF_XDP question
To:     ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Apr 29, 2021 at 4:34 PM ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>
> Hi,
>
> Suppose a DPI application running on a AF_XDP socket ( zero copy ) and after inspecting , say 100 initial packets of the flow, decides to accelerate the flow in HW.

Could you please give an example on what you mean with "accelerate the
flow in HW". Many things could be accelerated and in many different
ways.

> 1. Do we have use case and products/solutions in market which does the same ?
>
> Just thinking, since packet buffer is from umem, how another entity (hw) can accelerate.

It is possible to share the umem between AF_XDP sockets using
xsk_socket__create_shared() function in libbpf. It works between
netdevs, i.e. separate physical cards. But need the example first to
be able to help you in a better way.

/Magnus

> Ratheesh.
>
>
>
>
>
>
>
