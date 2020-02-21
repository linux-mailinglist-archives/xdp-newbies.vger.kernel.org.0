Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5D7167360
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 09:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732733AbgBUILn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 03:11:43 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42328 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732716AbgBUILm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 03:11:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id j132so775641oih.9
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Feb 2020 00:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z940N9RYLq+1T+kyMV+92Ui9a1htsIz99nnaFKM7TR8=;
        b=suUuOWOUaL4T5s0YVQF2RfydDVIkZRY9ZCWDLBG4K5QHlk+9dPYS6qmY3kgj6pdWhJ
         jFTonWfWjfWsKl6z2CkPqJD26j16naIzIpeal2XVxO3g6/vH4OVMD9maaYCxEb/h9Dt5
         R8XKRhWXW3ejryEXfTHbLOdMkjmvBkLWa14oEBij9xi/y6Z2cbCg201oCx+aopEuINKE
         +m0IfSO27gUshFuGHIj+xEHC6b4Qcmo2BnOojkgSQpB2yveIFy+Y3prvhWgByxFXwxeh
         316E7m9XosaMj5anLN19onAFI+sVRmgtQLYtNzyxoTUvdnz7ap7AlV/gQEkcY8rOiZTA
         1ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z940N9RYLq+1T+kyMV+92Ui9a1htsIz99nnaFKM7TR8=;
        b=NQ/W5FBGwiIR1Ce4qBaY9RYNuDPuAhJSDpTYuE1M4KvzIk6Goirz+/sm5NFOD0FJbc
         nZZaRPF+d3D95O8eao5Pr2Ig06Y68wOctUUERY0gMS+uzDnbpO40GMb6HDe4a3+EVCPZ
         iOgTwYPf4L+IATW2kmKwDDGxfd5tznQUagjifQubkqwqUbTfrjHNCW8783TqhACOL31a
         groDqGeug/LhGcMJEuBIkMZGxG6T/O0YWFabEcI4dFDMGRrDKMFuqM7Zvp3CduOmgWWI
         QOjAmDqzLVVbI7AFS5VCJJN16pYDujiXWQAUladxS8IO2XyinAZMjbFvjeONDznILF0w
         OhsQ==
X-Gm-Message-State: APjAAAVUgCFMuz4pDOwV8Hdw0XDByuqSrrJo5OJl6KJY/9xpiYi281Ez
        2+vSZL3ph840iGB3NQXdozTr00SmhstjwuqJ+7p2H05/
X-Google-Smtp-Source: APXvYqySfqpKi7Mz4/nRB14UtGx1gC1+0ju50iJaXg+hFgzM3OhGH8xOn+uPMcSP8zbOuDgP20a3cSJ832xEF0xlNoM=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr1000636oid.98.1582272702195;
 Fri, 21 Feb 2020 00:11:42 -0800 (PST)
MIME-Version: 1.0
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
In-Reply-To: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 21 Feb 2020 09:11:30 +0100
Message-ID: <CAJ8uoz1UiYDFNPpv7iq0QDGCBGZ-GZwY8jtxO6StWwr5Ht6WTQ@mail.gmail.com>
Subject: Re: xdpsock poll syscall CPU 100%
To:     William Tu <u9012063@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Feb 20, 2020 at 11:50 PM William Tu <u9012063@gmail.com> wrote:
>
> Hi,
>
> I'm trying to save some CPU cycles when there is no packet arrives.
> I enable the poll syscall option of xdpsock, by doing
>
> $ ./xdpsock -r -p -S -i ens16
>  sock0@ens160:0 rxdrop xdp-skb poll()
>                 pps         pkts        1.00
> rx              0           0
> tx              0           0
>
> Since there is no packet coming, I though by calling poll()
> system call, the xdpsock process will be blocked and CPU utilization
> should be way under 100%. However, I'm still seeing 100%
> CPU utilization. Am I understanding this correctly?

Yes, something seems to be wrong here. Calling poll() should put you
in sleep for the timeout period, here 1000 ms. Let me take a look at
it. What version of the kernel are you running?

/Magnus

> Thanks,
> William
