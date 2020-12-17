Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9E62DD1C8
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Dec 2020 14:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgLQNAs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Dec 2020 08:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59920 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726601AbgLQNAr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Dec 2020 08:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608209960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aiJtt9dVVWyLu0jj+zXjLg/9unnfcN+8zcBMv14XJeU=;
        b=ghd0NBbfHgtrzyegNtvMYxT/445nccYV8ZBk2hgSPldZybXrczrWSnlPFN1sGCy+lFHHGE
        sOO1CAnPzvtlaPEn0RlKNZzk5IA9LEGXkUdt2go1G4izbh6emU448Zhcb/aaZG7YGbrqyx
        K35uCbTlgAKhRrwvvLMzDvX9TI7ns6c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-xKqtY9UAMa6vHI69_jpKkg-1; Thu, 17 Dec 2020 07:59:18 -0500
X-MC-Unique: xKqtY9UAMa6vHI69_jpKkg-1
Received: by mail-wr1-f71.google.com with SMTP id r11so10946342wrs.23
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Dec 2020 04:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=aiJtt9dVVWyLu0jj+zXjLg/9unnfcN+8zcBMv14XJeU=;
        b=UzTEPwgJZyFeTZGJAhmq+xfKDIcVzti4WF0kJcD+APFPKDwUZbO3MKx3N17kmr5ePZ
         yShsXUSDbdOZkSVHh0m7O171ZEVyBbsG4Cfd7iSZP+9ojU/6DBS2+BZ4xWG4L9A24OCi
         ppvvt6nwTPtN0fDI5bynMZWW7QHQpi8aQ/+H0YqpB1ST6CONGNFmBSc4Y5hcHPM0ciKa
         wkM+ntICwsmtHLTGUJWo1+ZykLTWZ9YOcQELSQ+Ca5xZ1JnCLoZ6BcDE2iYNam0MSplJ
         zKetDP5T8CRkPkk5Q5VTuBOMZui0SVWsNdqoZan6FcT4FRz5ITj0JiusijZnSun4dR7z
         oBNQ==
X-Gm-Message-State: AOAM5322Gg91noZm/ieYXHFreDqBHJ70O243/0CHlEQwwFHLvNtYEk62
        eshBLgnmAD1IPyLV6zQmwcQBtcK+h+Ow84tpmy/DTFx/Oj6G+ojEds8l7yvtcbTMiSga+gvuhbx
        cYaUu66To2eSYEbVwhQx4EE4=
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr8724344wmi.45.1608209956665;
        Thu, 17 Dec 2020 04:59:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1ZeIQPQ/ylOnYR7dZJX2ccSxVBg+TYsLiHPeN72mA0awglxRNK8I6Vkgs2ZhtD6HZ79VEBg==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr8724301wmi.45.1608209956180;
        Thu, 17 Dec 2020 04:59:16 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id v11sm8733786wrt.25.2020.12.17.04.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 04:59:15 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 2D68B1802A7; Thu, 17 Dec 2020 13:59:15 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: libxdp with bpf_stats_enabled question
In-Reply-To: <20201216222914.ugxw3kuajficsebc@snout.localdomain>
References: <20201216222914.ugxw3kuajficsebc@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 17 Dec 2020 13:59:15 +0100
Message-ID: <874kkkbnbw.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> Hi,
>
> I've been playing around with the new xdp-loader to chain xdp programs
> with kernel.bpf_stats_enabled set. This is what I see (from bpftool
> prog):
>
> 22: xdp  name xdp_dispatcher  tag d51e469e988d81da  gpl run_time_ns 105086 run_cnt 24
>         loaded_at 2020-12-15T07:52:27+0000  uid 0
>         xlated 720B  jited 535B  memlock 4096B  map_ids 5
>         btf_id 8
> 24: ext  name xdp_pass  tag 3b185187f1855c4c  gpl
>         loaded_at 2020-12-15T07:52:27+0000  uid 0
>         xlated 16B  jited 18B  memlock 4096B
>         btf_id 9
> 26: ext  name xdp_drop  tag 57cd311f2e27366b  gpl
>         loaded_at 2020-12-15T07:52:27+0000  uid 0
>         xlated 16B  jited 18B  memlock 4096B
>         btf_id 10
>
> You'll notice that the run_time_ns and run_cnt stats are only populated
> for the xdp_dispatcher. This is basically the same behavior we see today
> with bpf_tail_call chaining, so it's not a regression or anything. It
> would be really nice, though, if we could see those stats for each
> individual xdp program in the chain. Does anyone know what it would take
> for that to happen?

The stats are computed by the bits behind the static_branch_unlikely()
calls here:

https://elixir.bootlin.com/linux/latest/source/kernel/bpf/trampoline.c#L391

The calls to __bpf_prog_enter() and __bpf_prog_exit() is emitted in the
top-level dispatcher code that invokes a BPF program from whatever
kernel hook it runs at. Which is why it only shows up for the
dispatcher: From the kernel PoV that's the top-level BPF program being
run, the other programs are patched in as substitutions for function
calls inside the top-level BPF program.

That being said, the trampoline code that does the function-level
patching could conceivably add the same conditional stats update code
before and after each jump. Not sure how complicated it would be to add
this, but it would mean that stats would automatically appear for each
freplace program.

> Would it be more feasible for xdplib to optionally report separate
> runtime stats itself for chained programs?

The dispatcher program could certainly track this by just calling
bpf_ktime_get_ns() before and after each sub-program and sticking the
results in a map. It wouldn't be reported by the kernel and bpftool, but
libxdp and xdp-tools could expose it. The drawback with this approach is
that it would be tied to a particular dispatcher instance, so either
they would be reset whenever you load an additional program, or the
library has to copy over the old stats, which would probably not be
doable atomically. For stats that may not matter too much, but it's
something to consider.

-Toke

