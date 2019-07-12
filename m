Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037B866B1E
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 Jul 2019 12:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfGLKxW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 Jul 2019 06:53:22 -0400
Received: from mail-ed1-f46.google.com ([209.85.208.46]:38949 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfGLKxW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 Jul 2019 06:53:22 -0400
Received: by mail-ed1-f46.google.com with SMTP id m10so8809349edv.6
        for <xdp-newbies@vger.kernel.org>; Fri, 12 Jul 2019 03:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=x1rGW2KIt8gbhakbJaPkgnix7nFSeLCaNi1cNFarWQU=;
        b=DAchBlDzlQFNlpDWeid7El9kVpuxmpf+njmKhE7yCCP2SlfOgifTfedyGdzJed8Aua
         x3iO95K10p18CHwwtgrMS2JHEaAT8taueAc5//JIXaCVdp/i5llSWajTEePUzbjiAY+g
         fhWR1JUSriViq1iTkYA+tpbFtSeWXTF9yBDZ9Mx2ssYKgAAT4JgxLn5tzGKATlkfCEB7
         yXmCpf71vjd7na4+fjwZgjx3+umoxzC/+nVXWYC4keN44qth5UrUYpmZlFz9YqSZt2Kx
         Eq/U+/k9ACywknw5GJi5R7/eEnPzBUNhaRjll9ofgjta5lvhq9mmUYGEor1BoPGxDyjM
         ekcg==
X-Gm-Message-State: APjAAAVT0eQP3B0hMl2ZLexz3sz8sUQGi/3Mr3jDb2QcLerkieaDn0iC
        z4EUwFhgfYjFoLS9cHOTTspFSQ==
X-Google-Smtp-Source: APXvYqzaJmwTEb8jnQpYR6GXbRZ+w2ipZtuQH/M4oacYOtX91EDlsWmneTY/ORi9kdd4bj0vcYd0eQ==
X-Received: by 2002:a17:906:4354:: with SMTP id z20mr7397443ejm.163.1562928800419;
        Fri, 12 Jul 2019 03:53:20 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id r44sm2456293edd.20.2019.07.12.03.53.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 03:53:19 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0352F181CE6; Fri, 12 Jul 2019 12:53:18 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Cody Haas <chaas@riotgames.com>, xdp-newbies@vger.kernel.org
Subject: Re: x710 Checksum Offloading with XDP
In-Reply-To: <CAH7f-UJUTUT0YKYVMCjNaQzwN3=sFh62Bx7sBO85XyjuNyy4Fg@mail.gmail.com>
References: <CAH7f-UJUTUT0YKYVMCjNaQzwN3=sFh62Bx7sBO85XyjuNyy4Fg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 12 Jul 2019 12:53:18 +0200
Message-ID: <87ims7v80x.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Cody Haas <chaas@riotgames.com> writes:

> Hey,
>
> Trying to utilize TX checksum offloading while running an XDP
> application; We're running on Fedora 28, using Intel x710 Network
> Adapters in unison with the Intel i40e drivers and we've verified that
> the Fedora sees that TX checksum offloading is enabled. On the
> receiving side of an XDP_TX we don't see a proper checksum in the
> transmitted packet. Is this due to XDP bypassing the Linux network
> stack? If so, is there a way to have XDP instruct the driver to
> conduct the TX checksum? Or is this intended behavior?

You are quite right that this is because XDP bypasses the stack
entirely. There is currently no support for interacting with hardware
offload features from XDP, so if you're using XDP_TX you need to fix up
the checksum in your eBPF program. There's a bpf_csum_diff() helper
which may be helpful in this regard.

Getting better support for hardware offloads in concert with XDP is
something we'd like to get to eventually, but we're not there yet,
unfortunately.

-Toke
