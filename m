Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02E93500AE
	for <lists+xdp-newbies@lfdr.de>; Wed, 31 Mar 2021 14:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhCaMwA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 31 Mar 2021 08:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59558 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235568AbhCaMvf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 31 Mar 2021 08:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617195094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TXxz73TYcs7uK5w5ecPd5LBBBdPlBS21CqBieT4WxJo=;
        b=TFxnDOyi9rYeb+QSs5ke/DjaTwQvMXxIrO+wyUo+AykyxKJb8QugxGO4YmGVoT//poR6uL
        9s9RC9bdi25quUpHOMTRaBze35bbJEEpMdtyjmde4EHDL0J4CwdtOYQvXPWs+SAPAMJBxc
        GD1Pg3U39N/OOMvdi+PjDZZU8SsSECg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-OLYm965BOPShiG36QeX9EA-1; Wed, 31 Mar 2021 08:51:32 -0400
X-MC-Unique: OLYm965BOPShiG36QeX9EA-1
Received: by mail-ed1-f71.google.com with SMTP id w16so1042405edc.22
        for <xdp-newbies@vger.kernel.org>; Wed, 31 Mar 2021 05:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=TXxz73TYcs7uK5w5ecPd5LBBBdPlBS21CqBieT4WxJo=;
        b=YB6uhJBrom1SusL+XQ+MyMndyKm8w51ZZc978ATIWwkQyjUP5g4ytB0mld5tZjUs7N
         V+bW22Dyoz0D1dvvqeTgn9KlHS/jgQ/aXMUHXFaYGZ7YEMU6uJMmOeSazIjttpQbBwz5
         CBhC8vi/C+4/AJ3SEpi80DsU2qudCmHvaF5b4di/fJiceYmBqjQv3dIUn1svdIXQFj3Y
         evdJuL2n0pv5MHp23dxBSVpx0tZfI3LTJ7GlEL6nzAvmdE+xq5Pf3hL4MTr7uAvChDYw
         YBHawiwz77ZnNJdNfkZV4ZctvsDOk3LaIlKB+ZecntWEyXqzLoKdc3LXdMkfh4Ncr1iz
         QqLQ==
X-Gm-Message-State: AOAM533P02siLLPkKy7Y8feFZttmmEGW3YIpLQqC6sdNmxaIVT687FCm
        8yYWPY1FkTw7D4xk23jzvL2MaPgk6MSOnvQcFhxvTVSYlv/FYPvClEEf3GFwsKe9GEbI5c5r0zV
        ayNeRkq9ZR4lf2u2s/2Ox8x0=
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr3342605eds.375.1617195091454;
        Wed, 31 Mar 2021 05:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygI6pPDvH70svjVyFnog1EKoMczeMEAXKCYZLuDWbPdkz0VbJgFMIKP2pe6LSqNOjWN/U1qA==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr3342586eds.375.1617195091272;
        Wed, 31 Mar 2021 05:51:31 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id u59sm1601276edc.73.2021.03.31.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:51:30 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 3441C1801A8; Wed, 31 Mar 2021 14:51:30 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Srivats P <pstavirs@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP - why setrlimit() ?
In-Reply-To: <CANzUK5_NfMLh9+se3hdJ176Ow_At6bwPqUSUD8XOSO0yc4vYig@mail.gmail.com>
References: <CANzUK5_NfMLh9+se3hdJ176Ow_At6bwPqUSUD8XOSO0yc4vYig@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 31 Mar 2021 14:51:30 +0200
Message-ID: <87r1jvpju5.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Srivats P <pstavirs@gmail.com> writes:

> Hi,
>
> The sample xdpsock_user.c program does a setrlimit(RLIMIT_MEMLOCK) but
> subsequently doesn't do a mlock or pass MAP_LOCKED flag to mmap().
> Same with xdp-tutorial which has the following comment but I don't see
> any locking happening anywhere in the code.
>
> /* Allow unlimited locking of memory, so all memory needed for packet
> * buffers can be locked.
> */
>
> What is the purpose behind this setrlimit? Does the libbpf/xdp library
> do a mlock internally?
>
> I came to know that BPF maps need the setrlimit and I assume the xsk
> APIs create a XSK map internally - so is that the only reason?

Yes, the setrlimit() is there because all BPF objects in the kernel
(including maps and programs) were accounted against that limit, and it
was a global limit, making it basically impossible to predict what a
good value was. Thankfully, this has since been fixed and maps are now
accounted using memcgs, as of commit: 97306be45fbe ("Merge branch
'switch to memcg-based memory accounting'") which was included in the
5.11 kernel release. So if your kernel is new enough you don't need the
setrlimit() anymore; but I guess no one has bothered to update the
samples yet :)

-Toke

