Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3ED3C8955
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Jul 2021 19:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhGNRJx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Jul 2021 13:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhGNRJw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Jul 2021 13:09:52 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B56C06175F
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Jul 2021 10:07:01 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i94so4126693wri.4
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Jul 2021 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QC3nLWZ6C5LS8Ky24/fjIcAacKfgOterLRUI9pDhzEk=;
        b=SnXKIKPNBF/Kj4wtPPgM/ItIaylsE+H1hiV+YuyVRHKNrkJKbFyWQEnYBWG3vM75bD
         QAJ0GJS9LaGu8B+rRM0XwzsOvgidke79VwyGqq5TLP2jH8zZ5Tr6kXv7+uQ1+L6I/2Yk
         fkM1YWTGe2vWf4eCgJN2hXtqTUm2G2Fm/fSOgkTY0Jg2a8p3tXsyJybV/b+8QdCVZQeW
         T38SDkcGtpp1Fp7X2F/nqnN7Tyess+zDJSGGiYM0gGwIqV0AiU4JQPDzjMjPOLzq2P/t
         pZsNvRBS3vX1+kxA0EszNu/sm/1pJBtWRdwBU0MRo0kfQ88bdkuY9e5ldyAXF49RCvZg
         0H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QC3nLWZ6C5LS8Ky24/fjIcAacKfgOterLRUI9pDhzEk=;
        b=C84qwRp2Wu6e0WlOuH9cLxuMQ1XJpLUs9D8Hv6O3bBugVnPQV71qJL8Yjv7AmUlRpv
         W2mLXtKJWM8D3aYy02XoFPG7SDg5wiLAUAKBowct76zJ0j2TaJsyNLOX0QBOxOwgzuyy
         7JP6325tdm+zBJQ2WBBzuTdGBR4aD0H8i5ax3ySiOTAHceqO3YbFPfHXf/f26nv/jEs5
         ivh1P1Xmb0vrK8oJ5B8LEi2wK1+i/wEeR2K6jgocBowjIiojKGZna6O665JiUpDtZlnl
         eD9i6dQlkl1FHirRXtvmDfqxEgLJRlyrDH5GUNC5U3PYVmYANRFt7gQzfZlK1dzx0Vq9
         OF0w==
X-Gm-Message-State: AOAM530uw3bD7XDYtGp2d/Kc+iNEHy0m+tli6dDqa5Ok3w8MRZoQVMKi
        7b7NtMafc6irnIAP7E3s/MG2D3d4Pfk2QpoY3G0=
X-Google-Smtp-Source: ABdhPJwGrgOOlF9wSUdSapOfQToIixWMEHhkPhXa4zte7cIm4vhZt/K/s1e0sWfL/xGhO4h7PY9MuP+GonOFg7Pnecw=
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr14167470wrm.220.1626282419729;
 Wed, 14 Jul 2021 10:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210714000804.426ed1f5@babalu>
In-Reply-To: <20210714000804.426ed1f5@babalu>
From:   Ivan Koveshnikov <ikoveshnik@gmail.com>
Date:   Wed, 14 Jul 2021 22:06:48 +0500
Message-ID: <CAHQrGVPbu8WVEaGWV1ytuOwx=-yam0OHD2fpOQdVVHTUz9F2GQ@mail.gmail.com>
Subject: Re: bpf_debug output
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Ethy,

Correct. The output is available via file
`/sys/kernel/debug/tracing/trace_pipe`. There are other helper
programs that can also read it, like `bpftool prog tracelog` or `tc
exec bpf dbg`.

But you need to pay attention, what you're trying to print, since
`bpf_printk()` supports much fewer formats than usual `printk()`. I.e.
only  `%d %i %u %x %ld %li %lu %lx %lld %lli %llu %llx %p %s`
conversion specifiers are allowed. If an unsupported specifier is
spotted, the string is silently dropped and never appears in trace
log.

Here you can find some examples:
https://github.com/xdp-project/xdp-tutorial/tree/master/tracing03-xdp-debug-print


Best regards,
Ivan Koveshnikov

On Wed, 14 Jul 2021 at 08:08, Ethy H. Brito <ethy.brito@inexo.com.br> wrote:
>
>
> Hi!
>
> I am working on some minor modifications in xdp-cpumap-tc to accommodate NAT at WAN side.
> But the things are not working as expected.
>
> How can bpf_debug be used to help debugging?
>
> I read that its output ends-up in /sys/kernel/debug/tracing/trace_pipe.
> But how can it be read?
> I tried "cat trace_pipe" but this produced no output whatsoever.
>
> Any hints will be appreciated.
>
> Thanx
>
> Regards
>
> Ethy
