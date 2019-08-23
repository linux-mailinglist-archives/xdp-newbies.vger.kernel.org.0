Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 616739B08F
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2019 15:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730886AbfHWNQS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Aug 2019 09:16:18 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]:36601 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbfHWNQS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Aug 2019 09:16:18 -0400
Received: by mail-qk1-f171.google.com with SMTP id d23so8146398qko.3
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2019 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qpJccLKbJJqtkicsrS+vjDekUBm/EqtGHjdgVQWDtMI=;
        b=XMFRjlEBtgcEuJTD0b5IgoKlEzLZIuXGeKieYqqtumvuYFsOSegyYNU1UzwR+Zoo2V
         ME1bK/KAADgJsInu1z8GBYJCpfirD711iO2kDXu3e06xRX7FC5oo//H2YcKMk0UXW50K
         cW7LWhY3SZYOx7vnJfYb+r0zTL1kEY/kXggIHeuLLAO7DNGWNs/TsJpqYwuMqv4bSMdB
         3hkjoEbJA5MUW9DRBAEZNL/dQb0uiWd9c5nGAe1aP81gscR2quVHt4Yn+f1AXSpv2Z8v
         bWBaJ5Lly0iV8j6FwWonHAfqOLk+c7WVnbDdGNEAjhQgO37ZptoPXDK3NKIbjpfBsixf
         ACig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qpJccLKbJJqtkicsrS+vjDekUBm/EqtGHjdgVQWDtMI=;
        b=f4Gasg37BFEh7HnddcUNv0sMh15IxyBhurQ0BLlE4f/CUoknPQmbhVcHDEb7fagG3h
         50AEuiXD2I1nqaFJZl0mqa1akk/NlOZBXo6oU3sbiYuhHd9pUjp8A6wk9uxrxRD1aIJO
         bAcGxOv4yWsVFPXsXEGsGXArOVNSkEW0gt48QKb3RuebUEFpfAX2dnJh2esUlgp2jbAE
         E4L2QoceSFscszotyTb6QT2NvXWrkcivimXH8mmmdhb0WfXhrp1GJfQZOikvdGj9RHQQ
         19yy8fQaKnfeaShhh/ylXkzFSknOND2pt3xKCTpT43phGTRAeDl7ag+TAdPrhGRAuW3K
         Xoiw==
X-Gm-Message-State: APjAAAWr8F5wBSBPKDe/Nf296j69+f0cc38IrwddRBq2LON2d0HWQmeC
        OwgCJWVmtH3cj9qpvjJHYdzTj4Dw+QQ/P3u4Mt4=
X-Google-Smtp-Source: APXvYqzTdXFacb18MKbGdrVyx9yZTe/5yndF4pRq1MAdBbB6O8OnI0Afenu6HRfyZn5+9Nzk6PNnNtlsiOTW7CTP/yY=
X-Received: by 2002:a37:808:: with SMTP id 8mr3786394qki.291.1566566177702;
 Fri, 23 Aug 2019 06:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com> <20190823102224.16141c87@carbon>
In-Reply-To: <20190823102224.16141c87@carbon>
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 23 Aug 2019 06:15:39 -0700
Message-ID: <CALDO+SZeLFXyLct2NNME_FmtgsUmuOAjB9q1n3jZ6dDHvAiWCw@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>
Cc:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Aug 23, 2019 at 1:22 AM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
>
> Bringing these questions to the xdp-newbies list, where they belong.
> Answers inlined below.
>
> On Tue, 20 Aug 2019 21:17:57 +0200 J=C3=BAlius Milan <Julius.Milan@panthe=
on.tech>
> >
> > I am writing AF_XDP driver for FDio VPP. I have 2 questions.
> >
>
> That sounds excellent.  I was hoping someone would do this for FDio VPP.
> Do notice that DPDK now also got AF_XDP support.  IHMO it makes a lot
> of sense to implement AF_XDP for FDio, and avoid the DPDK dependency.
> (AFAIK FDio already got other back-ends than DPDK).
>
Hi Marek,

But isn't most of the VPP deployment use DPDK as back-ends?
If that's the case, why not use DPDK's AF_XDP implementation?

Regards,
William
