Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14580AECDF
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2019 16:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfIJOVy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Tue, 10 Sep 2019 10:21:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38182 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730779AbfIJOVv (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Sep 2019 10:21:51 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 769B789AC2
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2019 14:21:51 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id p55so10519765edc.5
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2019 07:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=k+YOxrrPUHbsyC/ZHR9oKoNsAiPY8f1OB++5nte8R0c=;
        b=lBFKDJ7GDAJzc9Ini0t4ezWzH/1p3XcG6cPn4A0d2JVPgcoNSMmD86EVroZVpvW+8N
         bg7kFs0VIsHY6WU02BC9ZwlQncUl6f/NN0l4jEzwE/TuW5k9oGtGRpHVMZfcEhs9tx/r
         04WDau+1HAAzC8/YUFE6Wky9dAvK5a/RNYqD0Ye/rQdiFzv0fnr7E79wRFp7fRLeoV7o
         644NuUhOAISTchAtFTjkkEGwDGi7DXSrECSlznA2126xbh+E2Qe+JeySdRpVPoGoTyED
         DNTo0p32kEHRhhpOe8oaEhMtEpojq+DOIIwIJf6FI2jWArMDLkJ1w/f6Hqf4c7wkzkNC
         TcrQ==
X-Gm-Message-State: APjAAAWYrNzZRoiZiWQtxNum+jQb21KGaskOrcqILrq5p9uZnMo9Ju/x
        j50BMOcCrNaryc/MxkJOU0XdrCMrAa1RC95vY4clsNyBfagVyYsW4lZ/B2exqiu5S8GvkRw9COX
        6mATecmAAGXZ80vAu/vWFZAA=
X-Received: by 2002:a17:906:3fc7:: with SMTP id k7mr25520479ejj.208.1568125309850;
        Tue, 10 Sep 2019 07:21:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx273arVC324L/G2Q0tNrif92XJXHP+3wntkJX5n/n3KtdLi/64pILh+7JCjolWNyPHOUpIiw==
X-Received: by 2002:a17:906:3fc7:: with SMTP id k7mr25520458ejj.208.1568125309652;
        Tue, 10 Sep 2019 07:21:49 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id z20sm402099edb.3.2019.09.10.07.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 07:21:48 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id A7BFF1804C7; Tue, 10 Sep 2019 15:21:46 +0100 (WEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Ilya Goslhtein <ilejn@yandex.ru>, xdp-newbies@vger.kernel.org
Subject: Re: bidirectional: => AF_XDP , <= XDP_REDIRECT
In-Reply-To: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
References: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 10 Sep 2019 15:21:46 +0100
Message-ID: <87imq0ut8l.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Ilya Goslhtein <ilejn@yandex.ru> writes:

> Hello,
>
> I am trying to use a network interface to
> (1) send packets via AF_XDP
> (2) receive packets and redirect to another interface via xdp_redirect_map
>
> Basically, I am making xdpbridge https://github.com/ilejn/xdpbridge.
>   bidirectional. My goal is to process packets in one direction in 
> kernelspace (xdp_redirect_map) and to pass packets in opposite direction 
> via userspace (recieve via AF_XDP then send via AF_XDP, rings are not 
> shared, so I perform memcpy).
>
> For test purposes I ran two applications: my xdpbridge and 
> xdp_redirect_map bpf sample.
>
> It does not work. Only few packets are received, then the thing stops. 
> Redirecting works until xdpbridge does 'bind' against the interface.

This is because the AF_XDP application loads another XDP program on the
interface that redirects the traffic into the socket. It is possible to
write an XDP program that can do both (i.e., for each packet, decide
whether to redirect it into the AF_XDP socket, or to another interface),
but obviously none of the example programs know how to do this, so they
end up stepping on each other's toes...

-Toke
