Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992ADD5FB5
	for <lists+xdp-newbies@lfdr.de>; Mon, 14 Oct 2019 12:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731207AbfJNKFW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 14 Oct 2019 06:05:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27989 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731057AbfJNKFW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 14 Oct 2019 06:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571047520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vCUDtkOoQ6BzuRMK6ViEnNMgTlMpP1MT0PnKemd3QJA=;
        b=b5i7d1/Mqww5Ppe3YpkOY9Janol7FuUZuzDoHxZYWPdBZW2tV3cN8IYt0leCZRWSqZdCs7
        zZc2sV0n/u3AJeTp9lAWsC7A+F/m6w7TSU2mSGCbW/blsGkxz3v7Lg9R97588m9hWMYKi2
        vLeL+J2A+D/pY3DF4+fznfR+xHcZCJI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-sHREop3oOGqQyaKGggUAEQ-1; Mon, 14 Oct 2019 06:05:19 -0400
Received: by mail-lj1-f198.google.com with SMTP id v24so3224541ljh.23
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Oct 2019 03:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UrLjfbVcYpttMDbVrHA4kpUrr2Ak/f5LiZ2fC2GMN1E=;
        b=JCvCOwQIUHbqhqNWpKLQouvMHuvvtNx5U4vtbDMcqCRYJX3m2UYNgdrTrtjHdoEa9Z
         SKA+4ClWMxLAJYINZ9nEB6zu/C7f2Jf5fzpITnA9tBIREaOWDiF+I+flJNb226i1RXtv
         wDi/I/rWUxjAPaiiIW4ED2b3tnj/GT9DctniPrybtEF1sHH7TvQYf/KWl5LEL1M4rHZO
         XYz0cww1uSUBYMzM6AjBIdWp12VkNHV23GNbgxvAQq8GBYrLIS/yRCWS1axod6uaCcS+
         uQgydJCTcw5079tZ6z7Aj/a9FbGsNVunobulSq3kRlyghv7GBPsMRT72xXVsqCPgaZZU
         eVzg==
X-Gm-Message-State: APjAAAWSghwZcJHoixpBlPL7nnmcryoLyhLtzLEb4VnEHRwzH+40WtMr
        GlsbgnQKNjNpMyTPNbirte2QFvXpGpW20q+I/U2MEbNdt/3NaGDR/FTpg/0tOuTb76+METq7sAB
        3yci9vlTy341dGMf69cJ0eauMhY6xxeMdF3hhS0c=
X-Received: by 2002:a2e:a166:: with SMTP id u6mr18089343ljl.209.1571047517536;
        Mon, 14 Oct 2019 03:05:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz58pWoDCwNKRvahF5Zwiw+c+jCV6b7AiF3+eRTcS5h637x3h4FQ++xJ2iV3AYjCrZAnHDP7fW1dG0Ml1Sz9kQ=
X-Received: by 2002:a2e:a166:: with SMTP id u6mr18089338ljl.209.1571047517368;
 Mon, 14 Oct 2019 03:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <CALn2wre+wvE6DmryyT1=1NL5vShk4eqKQwTErZJbQnrg6V7jzg@mail.gmail.com>
In-Reply-To: <CALn2wre+wvE6DmryyT1=1NL5vShk4eqKQwTErZJbQnrg6V7jzg@mail.gmail.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Mon, 14 Oct 2019 12:04:41 +0200
Message-ID: <CAGnkfhyt65=1XaeBs34y=u30Gk3gFVjXnOe7y0vARVjSUZ-gdg@mail.gmail.com>
Subject: Re: XDP performance and benchmarks on generic not supported NICs
To:     Vladimir Soldatov <solardatov@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
X-MC-Unique: sHREop3oOGqQyaKGggUAEQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Oct 11, 2019 at 3:46 PM Vladimir Soldatov <solardatov@gmail.com> wr=
ote:
>
> Hi guys, I could not find any XDP benchmark for the not supported NICs
> to figure out is there any benefits / performance improvements when we
> will use XDP on NICs without XDP support. Could you please share such
> benchmarks or your thoughts?
>
> Thanks in advance,
> Vladimir

Hi Vladimir,

I don't have the numbers, but it should be just slighty faster than tc.
That's say, still much faster than traversing the whole network stack.

Regards,
--=20
Matteo Croce
per aspera ad upstream

