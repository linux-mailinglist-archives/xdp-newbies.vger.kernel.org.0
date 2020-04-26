Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84F21B9302
	for <lists+xdp-newbies@lfdr.de>; Sun, 26 Apr 2020 20:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgDZSiR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 26 Apr 2020 14:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726165AbgDZSiQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 26 Apr 2020 14:38:16 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6EEC061A0F
        for <xdp-newbies@vger.kernel.org>; Sun, 26 Apr 2020 11:38:16 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id s5so15116557uad.4
        for <xdp-newbies@vger.kernel.org>; Sun, 26 Apr 2020 11:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ka7E82etau1e7J53teMfHs3fvvAZ9ZfS7I4VzWyPIHo=;
        b=r6IhN4EP2lT1LoauuW3gv1T/tuIx4HBcHTPLCtu8/pG/f9KB4z+RaXt5xgq00hw71i
         xKNBZb1MyuU/JyJip88TaJhoMwk2yil4TdIX4cLTNS6cYXTyp1RqpaaeVFM4Zw/CAE1n
         LULDqtNowFPKiSNCyBne5KkUcXyjsjbIEO5hT6e9aLNgYfEmPqD+Vb3RcQRBfoe2FjMY
         ReYiCrjESaxMP0PHJwFV0mZRjbwYKYoPecSNzUT6WxPgzW9b/EW0eZbNmnBUdDyKDPG1
         +iuzfjTHcPxLbYyberf60GVziiJh4tLX7vFrhB+MVUHg3ECXg2OfS+NnUM2nZZ2DSkL0
         BUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ka7E82etau1e7J53teMfHs3fvvAZ9ZfS7I4VzWyPIHo=;
        b=e0dGIlUdIzycmoUK6Ru6oKIha3ykUN+mBabn9u3aDiht/qRzt90Wc58d4fpmyG/Nsw
         86aPqupgZH3jpclm1Bx0zvq7AJBe17REHgZru7mlvDSQLcKcGa9aXaRbPYrdg16Xfc4a
         eysHKDEkaNm2XO2LYAtERe5Pffeu2Y0/iXht+yeWwb9uU0heWiwuwTpx5TGCfWnOeHyX
         Z/UG8ohqvQj6+XsyTwwb8NHvc4NFpjbSPzEr7GCdEG8FbEkkGIW46VbaOIlQFkZPwu28
         3YcyePlmXNN0kbz9xpPy2hv2kerdL5C0K8YOwanhHkMOahX8btknmr4SUZClpR4NlDDI
         edMw==
X-Gm-Message-State: AGi0Puabi2rX+FNP27rMs1/GbfnFj6xQBPeKEf+NPHGA4/IFP5pZizwr
        r5xNWk6St1OQ5drewZgorxtQJ6Z0ts/qt93BIMIjcrVB
X-Google-Smtp-Source: APiQypLmrG9Sf5e/7a1M19Y5zfGMVt4nhOODJdc2b8+YhQYiSzvuec46qKFSjrLBKNzLlfj+EiQIOCYzUEEl3c0fhSk=
X-Received: by 2002:a67:3092:: with SMTP id w140mr13830933vsw.218.1587926294494;
 Sun, 26 Apr 2020 11:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJEJvEW31-O9x-0WsipVqSf-kPy8HnWnB6gG2jeQTH5WWm2iqw@mail.gmail.com>
In-Reply-To: <CAJEJvEW31-O9x-0WsipVqSf-kPy8HnWnB6gG2jeQTH5WWm2iqw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Sun, 26 Apr 2020 20:38:03 +0200
Message-ID: <CAJ8uoz0mcu=6_Czw-Y=v-MgRcCRxspkPfFJ4SaQamE-6jCwfkQ@mail.gmail.com>
Subject: Re: Error creating a AF_XDP socket after deleting
To:     Jesse DuMond <suttonshiredev@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, Apr 26, 2020 at 6:08 PM Jesse DuMond <suttonshiredev@gmail.com> wrote:
>
> Hi there,
>
> I am writing some test code that tries  repeatedly to create a umem
> and socket and then deletes them both. I'm using the libbpf function
> xsk_umem__create/delete and xsk_socket__create/xsk_socket__delete. I
> am getting an EBUSY from xsk_socket__create when trying to create a
> socket after deleting a socket on the same interface and queue number.
> The attached program reproduces the error.
>
> I've traced the EBUSY error to this call to xdp_umem_assign_dev in the
> kernel: https://github.com/torvalds/linux/blob/v5.3/net/xdp/xsk.c#L500
> That call is made during the bind call in xsk_socket__create. As far
> as I can tell this error is because the work of xdp_umem_clear_dev is
> actually called asynchronously after xsk_socket__delete. Putting a
> sleep between xsk_socket__delete and xsk_socket__create makes this
> code succeed.
>
> Am I trying to do something that is not supposed to be supported?

No, you are doing everything correctly. The tear down of a socket is
unfortunately asynchronous due to legacy reasons that are not true
anymore. We do have a item in the backlog to make this synchronous,
but have not gotten around to it yet. So sorry, we have to live with
this for a while more.

/Magnus
