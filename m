Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8822A7F529
	for <lists+xdp-newbies@lfdr.de>; Fri,  2 Aug 2019 12:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfHBKfe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 2 Aug 2019 06:35:34 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:43668 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHBKfe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 2 Aug 2019 06:35:34 -0400
Received: by mail-qt1-f171.google.com with SMTP id w17so29032300qto.10
        for <xdp-newbies@vger.kernel.org>; Fri, 02 Aug 2019 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6YlTvp2hyxGGSb5IcmU563fgq5Gvppeg5CwhBrcaXC0=;
        b=sxDx2WXqmAJ6M9Eg8VpA5Te9BFwrfQXLUuFMRx2rV/B+ftPm78i1QpYbKLoGPvXCZD
         AXyA1xLBUz1XdeMUwG8RsaJVazYQjZ36Is4Gtp5Z3vEyT4IlwpxXwIjxZGZv3qopGcVW
         uFozWIixEqHT+cSP0SEHnDZHEpvgVrd2hOaKcJ/UoytK8xh1hMMbZG14fPbzYusRgVn1
         Y1mzBH1RRTc19uQL7VsJ2rYzkF4sJzb9Nc780LT9RATw0wGaFGUHxgZiNPXRJ9N9NTSo
         d8lG74mq9ABaMYKfjNquNtXjrgGXTx8tBNVhOnJfAQaTpzLfkEM1SWH0hwlssfcdt8wK
         Ztzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6YlTvp2hyxGGSb5IcmU563fgq5Gvppeg5CwhBrcaXC0=;
        b=MIL0kbsfDqgRGqn4Eth0BMLPBUxja06NPsGwp5WVhGdVgs2IhumLnRGBqpRXYe7uGx
         4aND7prRSe+dryjX2eqlLOGIGU5ApH5iDXtx9NLlK6F7wPHE1EIAxhBdgVXHGWFsQO1P
         3lf1yoVV28i8O9LdsEzWTwA4/RWgbG+6JTSi3ICsL/omU3xqThbx5pRMdMQGQJ5TE1MI
         l1Xiavv78TFhALm18o+r/l9vtItVSXt5jOLXgVbUGY7vVot07r9M4dA+4JEPETqS7YnS
         SwS52v7YeKl2Tw6RAKuLkfB4zhmwg0INMrFSUlJnSa7TXu3Rf/u4xrKyvK7WvBe+ucrb
         tErw==
X-Gm-Message-State: APjAAAVjfmT7oZm0IDrQ1+26HMP3t3K2HMXaiD+YLeylqV6UOnZZJ9fR
        m+vDXn+eZ+VgsQGR36KV1pVtmvN+C6W8Cfe3gTIwLqYer9k=
X-Google-Smtp-Source: APXvYqzuM25GeDiIQhQhjaBqsYKEEyLtd6O5z713kb/d8jYaXx2+QLBlHu1B7dfnFT3X2PpK22VvcwSPUA1eqdYr0MY=
X-Received: by 2002:ac8:4442:: with SMTP id m2mr37628740qtn.107.1564742133385;
 Fri, 02 Aug 2019 03:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaYocbC=x=fzXVJoKpHRXmK74-buEoqpSAvyuODRm3CH4k+Sw@mail.gmail.com>
In-Reply-To: <CAEaYocbC=x=fzXVJoKpHRXmK74-buEoqpSAvyuODRm3CH4k+Sw@mail.gmail.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Fri, 2 Aug 2019 12:35:22 +0200
Message-ID: <CAJ+HfNgF-ncUeAc_004DB73aSaxS3X0cwqzYhwEFtPTYwQxPTw@mail.gmail.com>
Subject: Re: Ajusting XSKMAP max_entries value
To:     Rafael Vargas <vargas@khomp.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 31 Jul 2019 at 01:43, Rafael Vargas <vargas@khomp.com> wrote:
>
> Hi,
>

Hi Rafael,

> I'm using AF_XDP sockets to bulk read from the network device and it
> seems to work fine.
>
> Now I'm fine tuning my code in order to compatible in a broader range
> of scenarios.
>
> How should I set the size of my XSKMAP? As I'm creating one AF_XDP
> socket for each RX queue, and using this as the map size, is this
> correct?
>

There's really no right or wrong here, since the XDP program decides
which slot of XSKMAP to redirect to. The "builtin" libbpf XDP program
uses an XSKMAP with as many entries as there are enabled queues
(ethtool -l) on the device.


> As I'm using programs compiled using clang-bpf, is there a way to
> change this value without having to recompile the program?
>

You mean changing the size of the map? You can't do that, but you can
create a *new* map and swap that in. But that would require that your
XDP program would be a bit more complex (handling the XSKMAP
swapping).

> What would be the recommended way to setting this value correctly for
> each interface?
>

Again, hard to say in general. For one socket per queue, scenario,
then # entries would be the same as # queues.


Bj=C3=B6rn

> Thanks!
>
> Rafael Vargas
