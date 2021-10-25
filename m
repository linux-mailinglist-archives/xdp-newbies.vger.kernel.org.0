Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B1A4393FA
	for <lists+xdp-newbies@lfdr.de>; Mon, 25 Oct 2021 12:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhJYKum (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 25 Oct 2021 06:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44575 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230111AbhJYKuj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 25 Oct 2021 06:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635158896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3AtyPCYVpZT6Q45ryT8t3StKfdvREJgxDRRUjm5vUUw=;
        b=C0+lDTujvrG4om86b589rBcPi10ETQEayIFzp8H9puaJ5JBK3P2aMs5Fnovo/PyLY4sOsB
        d9lrL7ufSbEXVtDU+pqXrPrzgDVnIbaoxDGOyb9cyHPKOj6mtyj4Xv3hvNby+VI4ObLVsl
        5j7bX7vt+HOmO+7g5yl2JWYMI7U810U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-N0IZQOapMbeRqxxl5FJoSg-1; Mon, 25 Oct 2021 06:48:15 -0400
X-MC-Unique: N0IZQOapMbeRqxxl5FJoSg-1
Received: by mail-ed1-f72.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so9437801edx.15
        for <xdp-newbies@vger.kernel.org>; Mon, 25 Oct 2021 03:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=3AtyPCYVpZT6Q45ryT8t3StKfdvREJgxDRRUjm5vUUw=;
        b=oxhz8jDy6Mu0xh7OSO743TLrkhkD8ZSNRFR03ZthpzpONJFoWmWOgzmYuKezQ0IiUo
         TwQmDed1qw7755jWcswDvynbcjSlzUuk6QUqVcTlgm06qfsZonRPukFz3BV2wpew9DGx
         zR3lnIftWYhxpQypdzhlC5TBy8+G2RQkvfM3Xp626aa/DHx/Y0JhZTJ47OXcLb2n6M+l
         pD301V4x+fE0CyySU2F+fTVNBqXkSB8LGB0rjrBKlWechYZ83YelxT3tsySSw+SbJey6
         nGY9k51YaA8OIlNFERfALBuekZRe50lc823Je7D92/DuoS8zEXUWQT2vb9DxT1LHSNq0
         LpzA==
X-Gm-Message-State: AOAM530GUmDqpnZvCFTRFpiTGVQi/aiEUUEfvcSAJmnPc9ljvNvrf/da
        0P0TORNR5IbT/6z83uvwn+WxWQUPb3qW6SJNz8K6RO+PJxQLvdsWK+kbzAzxm10cWKjC7W06R5Q
        E/P6zu5y+9oxWhXrkA4VZ4BU=
X-Received: by 2002:a17:907:6ea6:: with SMTP id sh38mr21416413ejc.388.1635158893144;
        Mon, 25 Oct 2021 03:48:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz24TkeUXuM+2YVlJZdFBav7LgAGLYWubfuzyii9IaJJS+MWj/Zpz1neba824DemO48PgyDdA==
X-Received: by 2002:a17:907:6ea6:: with SMTP id sh38mr21416186ejc.388.1635158890850;
        Mon, 25 Oct 2021 03:48:10 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id oz11sm7228071ejc.72.2021.10.25.03.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 03:48:10 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 66073180262; Mon, 25 Oct 2021 12:48:09 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jun Hu <hujun.work@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP socket TX path interact with TC?
In-Reply-To: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 25 Oct 2021 12:48:09 +0200
Message-ID: <875ytlcrdi.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jun Hu <hujun.work@gmail.com> writes:

> Hi,
> I want to put a timestamp in the egress packets, and I want to use
> AF_XDP socket for both sending and receiving packets; since a XDP
> kernel program only work in ingress direction, I wonder if I could use
> a tc kernel program to change a packet sent out via an AF_XDP socket?
> I searched around, but couldn't find any direct answer...

Nope, AF_XDP bypasses the stack completely, so TC won't see the packet
on egress...

-Toke

