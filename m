Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E564662717
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 19:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730587AbfGHR3F (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 13:29:05 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43391 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728744AbfGHR3E (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 13:29:04 -0400
Received: by mail-ed1-f65.google.com with SMTP id e3so15256094edr.10
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8fR4IfbgdSdmP2UWwIgyTv5ijEAyW9+ygbTmH/m354=;
        b=VtwanGKmz4CJ85eTeet2ee8Lt1lD0P0kW7Ib+x17rLBUTZVSEL+Ea5qQsXsoZw/ZaD
         LkZkKcH3s+O4/dgbj4fmChxP+L7SqW/WKE0S9OTrHj2Hh2e0LYqg8TCrkQZlH1n7z8ln
         n1HYnEI+ayOC6aCK571VYfgrQOSag0LvBLg0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8fR4IfbgdSdmP2UWwIgyTv5ijEAyW9+ygbTmH/m354=;
        b=UUBddls01LVlBgU1sPtZuW6gkM4V+imZqHTCdkYiSnRE0mcMxHnuAtjNxAnzM2BN/I
         4PJoDlaSzRooSBpufsx4a3Pjkc0u5JkfFNQnuL6R3dzUcB6MJORb8eHeNoo9oB0UY+Pe
         CnG5NOyZ43wZvT6jHl2t4ywp0iAZfOgcsvqTCdgdBQRx/cSYYD9jRjD9uklCzIxgGJ59
         Eb/Tp0cE9X/0BhBeKYQnqmS8J6Ee+GmeYHkAPeDOP2PmUSMEv4f0jpfsS565kYziCO+b
         oNtixRU4DAj1vYo+88bU4uPCi1k37GgS7bIhJVDjOzkmZtWA3kFrLAeBF8C3DamUYG9E
         xotA==
X-Gm-Message-State: APjAAAX9XngQ7BUZbkohbReil7NMlcTjvXVsRA1D9AgU2GpDbPQJaEK5
        2HPxpfCAGbz609AvaXX7gvyUhHMg8s/3FzQDKePj0mNrwrfbZg==
X-Google-Smtp-Source: APXvYqwFeiyoocrdN4semM3E/SE0vhod2LElFIBNV2aaIHa8pq0f6XRvQFxw3ssT9rzd7mMvSXLf6YxngMBCgLFfXT0=
X-Received: by 2002:a50:871c:: with SMTP id i28mr16231619edb.29.1562606943189;
 Mon, 08 Jul 2019 10:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190704161900.43cec3a7@carbon>
In-Reply-To: <20190704161900.43cec3a7@carbon>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Mon, 8 Jul 2019 12:28:52 -0500
Message-ID: <CAC1LvL2Rx4+9QCDPPFYhi3kZj_srEcfw9n6ODAM2yC5jgZvE5A@mail.gmail.com>
Subject: Re: Should we remove xdp-newbies from kernel patch CC-list?
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jul 4, 2019 at 9:19 AM Jesper Dangaard Brouer <brouer@redhat.com> wrote:
>
>
> Question to people subscribed to xdp-newbies@vger.kernel.org mailing
> list.  As you likely have noticed, patches and kbuild-bot is sending
> XDP related kernel stuff to this mailing list.  This is caused by being
> listed in the kernel MAINTAINERS file[1].
>

I cast my vote for both. Having the named newbies channel send many,
many messages with kernel patches is intimidating to new people (and
somewhat spammy) which makes it harder to convince my team to sign up
for the list. At the same time, I've appreciated being able to see
what's happening on patches as well as questions and discussions.

Would it make sense/be possible to create a mailing list for the
maintainers file and discussions on patches that is separate from the
newbies channel? I have to say, the newbies channel is the only newbie
friendly kernel mailing list I've seen, and it's a big part of why I
pushed for my company to use XDP over DPDK.

--Zvi
