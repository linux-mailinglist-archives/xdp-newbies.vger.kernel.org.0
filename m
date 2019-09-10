Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35FD4AED42
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2019 16:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732971AbfIJOi4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Sep 2019 10:38:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49346 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728244AbfIJOi4 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Sep 2019 10:38:56 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0D427D9820
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2019 14:38:56 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id a7so6435019edt.13
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2019 07:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=MGx+E7/vDr8q/xK+PtRwNKtWVheVGgkIU63AMYMD22E=;
        b=ujZI+cIMMRxokH1Imo9/ozW4La1/ifal3n9dimcC+VJEInLlF+JEX1cEjjBeaUEvMH
         THKIUAaAv2iHQ1p02GjJLbhibJbaTcJ3cy+WlaroeDqoDV0zqtsOb1/JhySTY+lz98ET
         1yuE1J5F51Ez8Xve7HBvEyoWYe1QpeosRVomwacPhFk3eneRQqvsWhFdR9gA2wN1lRaY
         7mikQCl/HEQFZ5u4nwwv1+MzHngK2fqi1yKvTQksKD544JkNiuVJNSgHpDmkGbPkiRr/
         C5sEh7HW94XmmOktSfi9T8yJ2SiFESLWDRyS9Tww0pGYo0y2QrDIKFneQgRTClaJlUmb
         ldWg==
X-Gm-Message-State: APjAAAVg6Livk1x41X4mwwt8Auby7oxZ0LE417/70XRKU+y+fbbvU6tG
        fjY0hfsZaWrMIkhB0xM7xoQI/NbuICN+GSVYfieAR0I03/6JiDD45Vo5sU+1Smx+OL94Qdz7sbZ
        VMFgdypKYdg3FP/RCGd9qCYU=
X-Received: by 2002:a17:906:4cc3:: with SMTP id q3mr25421321ejt.127.1568126334539;
        Tue, 10 Sep 2019 07:38:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfg57776JSQUnvbOFJyxBun6d4Zcdu772R+KIgNo22SpNeVG01WtQz/xIa7/5D5PKpDogrdQ==
X-Received: by 2002:a17:906:4cc3:: with SMTP id q3mr25421304ejt.127.1568126334388;
        Tue, 10 Sep 2019 07:38:54 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id h11sm3577549edq.74.2019.09.10.07.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 07:38:53 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 81E9F1804C6; Tue, 10 Sep 2019 15:38:52 +0100 (WEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Ilya Goslhtein <ilejn@yandex.ru>, xdp-newbies@vger.kernel.org
Subject: Re: bidirectional: => AF_XDP , <= XDP_REDIRECT
In-Reply-To: <e83a6f5d-785e-d3c7-6bd8-63d972973427@yandex.ru>
References: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru> <87imq0ut8l.fsf@toke.dk> <e83a6f5d-785e-d3c7-6bd8-63d972973427@yandex.ru>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 10 Sep 2019 15:38:52 +0100
Message-ID: <87a7bcusg3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Ilya Goslhtein <ilejn@yandex.ru> writes:

> Hello Toke,
>
> thanks for the response.
>
> I do not think that it is the case.
>
> The interface I am trying to share is outgoing for xdpbridge and 
> incoming for xdp_bridge_map.
>
> xdpbridge does not load xdp program for outgoing interface (while loads 
> for incoming).
>
> xdp_bridge_map loads dummy XDP program for outgoing redirect, while it 
> is Ok if it is already exists.
>
>
> It seems that if I use different queues for incoming and outgoing 
> packets, everything is Ok, while I am not 100% sure yet. Does it look 
> realistic?

Oh, right, yeah, the AF_XDP socket will need to configure a hardware
queue to use; depending on your hardware, that could be incompatible
with running a regular XDP program on the same hardware queue.

Incidently, we are working on a way to make this work better; talk
starts in five minutes at LPC:
https://linuxplumbersconf.org/event/4/contributions/462/

-Toke
