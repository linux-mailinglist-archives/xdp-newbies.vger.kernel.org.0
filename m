Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10E23800CD
	for <lists+xdp-newbies@lfdr.de>; Fri, 14 May 2021 01:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhEMX2M (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 May 2021 19:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22665 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229544AbhEMX2M (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 May 2021 19:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620948421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BYHCTEJ54F/rQ2S/9u2RmVIHFjr35e0hCiuaxLXv528=;
        b=Pb+sBjr2Cm+7Io9KNhi9IKokd36WfDhlhWsblr5MQ04Ct+Uo7U2+hh68PS3L3G2hSkvwtD
        GiEI9U0xZ74/70tPbXI5Ioa/PZMU3f1W7Fml2Zaul2oYmLqiYBkc5kjjjlyA/I2WuWnh3w
        MT5geSzqHOVe1P3QvmTLBV5rOKrtj0o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-xu2ZwpQSOXSBFZIibYxgtw-1; Thu, 13 May 2021 19:27:00 -0400
X-MC-Unique: xu2ZwpQSOXSBFZIibYxgtw-1
Received: by mail-ed1-f72.google.com with SMTP id w20-20020aa7dcd40000b02903886b9b0013so15456037edu.22
        for <xdp-newbies@vger.kernel.org>; Thu, 13 May 2021 16:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=BYHCTEJ54F/rQ2S/9u2RmVIHFjr35e0hCiuaxLXv528=;
        b=gjTIicPvJHmUA4SFje2eqtLDEZhN9jBuMMG8FkJlVDYrrt448PZ8wePo5HY3vppzeO
         AS5KNS2oYP+aoWQlT9Xiu0wh5wVLK9SJ9KSUfniy7hTiSQWmLv94M5v3YLhBAd/Rd0FT
         wD0BIAUG/2pYqfzaHnl42Yet0M1918fj1KBex28Cn4SCrg1ElTo2JPv1fhqGG3hcPNSB
         RVkDDDn7QE0jfO+KszRRbPFmEn2oZ7d5RLB8VZK5MmNRx9bsP66hdgyYtK9G9QYYR1Zl
         09W8KcjhRhnXJZvBEcIhjVjKbyf+pTq/FesOUlIGpaGJk71JoFrYT9qBR8Nx4Iz9nkf2
         eKsQ==
X-Gm-Message-State: AOAM533GaqQbS8WagW9Wxsf788I5TPmCjuyE6dUrcQZRYlNRoB1bhH8d
        tEuPyNKwtjDnGcAyF1w9KWi6njqe1/JEN+QV51RD6/3leLEQAssprev0dv/EpqQabId68ibpchl
        BYsPuzBXN007Sr1XQlaxHcTI=
X-Received: by 2002:a17:906:71d8:: with SMTP id i24mr45842054ejk.444.1620948418699;
        Thu, 13 May 2021 16:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0SsbPbA+daS74txjz9HPpFhSYnV9oL4m5oQsDFCi7n5//xA6urHgaR3nKiZ1V7lpPdN4nPA==
X-Received: by 2002:a17:906:71d8:: with SMTP id i24mr45842042ejk.444.1620948418240;
        Thu, 13 May 2021 16:26:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id hz15sm2577753ejc.57.2021.05.13.16.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 16:26:57 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 6D15F18070E; Fri, 14 May 2021 01:26:56 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Srivats P <pstavirs@gmail.com>, Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Max MTU with XDP
In-Reply-To: <CANzUK5-vaz4_WtFbwdYoGJOjdh0c4p+bEZhpV2Pfuni5JKghrA@mail.gmail.com>
References: <CANzUK5-vaz4_WtFbwdYoGJOjdh0c4p+bEZhpV2Pfuni5JKghrA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 14 May 2021 01:26:56 +0200
Message-ID: <87im3mkyf3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Srivats P <pstavirs@gmail.com> writes:

> Hi,
>
> I'm aware that different drivers have different max MTU that they can
> support with XDP.
>
> Is there a way to programmatically retrieve what is the max MTU
> supported on a particular driver/interface with XDP/AF_XDP?
>
> Or is setting a MTU value and trying to attach a eBPF program in a
> binary search fashion wrt to MTU value between 1500 and 4096 is the
> only way?

Yup, currently it is, unfortunately. Querying this may eventually be
possible, along with which features an interface supports etc...

-Toke

