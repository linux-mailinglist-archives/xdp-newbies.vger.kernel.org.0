Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC10C8A3C
	for <lists+xdp-newbies@lfdr.de>; Wed,  2 Oct 2019 15:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfJBNwQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 2 Oct 2019 09:52:16 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33008 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfJBNwQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 2 Oct 2019 09:52:16 -0400
Received: by mail-qt1-f194.google.com with SMTP id r5so26454690qtd.0
        for <xdp-newbies@vger.kernel.org>; Wed, 02 Oct 2019 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nnNCq14fiGZ0pkGkd/eQNi3uBUVVcjjuEO+Qig1bNyo=;
        b=E5IUzLwHbnviLKvefltLxchpYrPZb9GBjKVd8EQIzrCxR1FPyaZXsdTOnl9v+GN6CB
         1VniYtJetzO1Gtws4V5QiO7sVf/Q+uRUz/cRWr/BLIVMJm7DBM1LX6GfStpLmgLvXa9U
         nx6wm0pBWlRAyL7Phfj+LCKSE2aaiqOwYbBdHsXBqiP9sDmFTD9RqcuIp2M2VZEdG2SQ
         R0Hnp6W+XpLbG94WF1/Nh6qqf0FpGzuM/k1Zh1rg/K6FOeI59zq7yxaxLFvinmVU7y0j
         p6I+PczsmS/Ms9fmFTXN3nJ2aFOnvLDy7arT25OGjYPfOdqjoacVVF4yP/wwLRUAFSto
         f/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nnNCq14fiGZ0pkGkd/eQNi3uBUVVcjjuEO+Qig1bNyo=;
        b=O1+eszSPDqAiNKgwDU/HU2E7OO9wHE2rsnX6dOzSfl/jxTl2TiJjB9RzpwEEel6e89
         tQbY+r2kJEG7GwN8p5zkgHKbsKJU1LgGjQUPIwfaUTGVTgoCztMLmv6ooPDVFWR2oa9U
         ChK+2DYQSiDXFOm2PPf2Lwz10eBJq037ChUEOsGSQS/J8RXQdJ2kF5sQfTKBuSoFNi88
         L1tnzMQ5p8yHUd2V5hRf1j/Lzw45zDFjwm33BRwJAuJSX/VQlN+t8XNTrfhbX0Br0r1d
         YfUvvr24Q39NAEivyZVVn17FCw2z9KcbbNUvF1rSc14BBXUAzDL47W90PfEgRjUaId5e
         ux+A==
X-Gm-Message-State: APjAAAVV6FbCmDudjW4lu0fqT1YBgnNAZrB5r56YRGYCWV4j58o1en7m
        giS7/3LH41L9Zy3EQLREitvtJE+/Gg/pOHqadfg=
X-Google-Smtp-Source: APXvYqw1RMxX/+LtPDZ/kocG2sTq5X5Tn8y6TwuZlOJGTlUGEA0cNkaSiJ8z5UIB+UeqOc2HF4h9nvEqaCUamla9NnU=
X-Received: by 2002:ac8:3f96:: with SMTP id d22mr4190353qtk.36.1570024335535;
 Wed, 02 Oct 2019 06:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
In-Reply-To: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Wed, 2 Oct 2019 15:52:04 +0200
Message-ID: <CAJ+HfNh58fN=BU5ADzTs=vbCD1j5fs0i1EKhAQQdByjiVHz4BQ@mail.gmail.com>
Subject: Re: xdpsock problem testing multiple queues
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        William Tu <u9012063@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 2 Oct 2019 at 14:11, J=C3=BAlius Milan <Julius.Milan@pantheon.tech>=
 wrote:
>
> Hi all
>
> We are trying to test multiple RX queues with sample program xdpsock from=
 kernel on vmware virtual machine with 2 queues.
> The driver on the NIC is:
> # ethtool -i ens192
> driver: vmxnet3
> version: 1.4.16.0-k-NAPI
>
> NIC has 2 queues, I can check it by ethtool -S.
>
> But when I try to use queue 1, I am getting following:
> # ./xdpsock -i ens192 -q 1
> /home/jmilan/ws/pt-xdp/linux/samples/bpf/xdpsock_user.c:xsk_configure_soc=
ket:315: errno: 1/"Operation not permitted"
>
> Any ideas what the problem could be? Maybe vmxnet3 driver does not suppor=
t some necessary operations related to queues?
>

XDP support is missing for that driver, but the XDP_SKB/generic mode
is available, and should work.

Can you run the xdp1 application in the samples directory, to rule out
that you can run XDP.


Bj=C3=B6rn

> Best Regards
> J=C3=BAlius
