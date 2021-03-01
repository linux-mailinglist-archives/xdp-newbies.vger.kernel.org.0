Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9615328120
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Mar 2021 15:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236119AbhCAOmS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Mar 2021 09:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58362 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234639AbhCAOmR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 1 Mar 2021 09:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614609651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=no/KojznK2Kk5EA2hOkhIhJE/pS1Wm+xOY/Q6SZqTgw=;
        b=ftno1xmxogr4v2zRanJucQQM48jdw4x0+OARSdPNNIQaAFiyH+6Si4tvcepm0ZY7N6L1eM
        DLFvaBjDiy3UzC7/JCRP05lq1L+S/N71IiN76J4WE+RAETlF5Rw6XkeJKZdVxSayh4w5bz
        ORdUtfpQSycVfkgYds8XMQ9lfBCVqyg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-UD4LgFgMN6qBxhOgFIXoBw-1; Mon, 01 Mar 2021 09:40:47 -0500
X-MC-Unique: UD4LgFgMN6qBxhOgFIXoBw-1
Received: by mail-ed1-f69.google.com with SMTP id a2so802328edx.0
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Mar 2021 06:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=no/KojznK2Kk5EA2hOkhIhJE/pS1Wm+xOY/Q6SZqTgw=;
        b=Zr2utDl6SRg/EhSIfU6O5KgKqcxJ/74cgod8PR6qjBHhmMHTQ+virl/tsr1M1EOWdQ
         YD+3gzeYDm6xoZ879N5AJESzB1VRXZNtn6ePlFH9EN+HAZ9anRJwy/Wz7ln0U/Ozqcgy
         dv01Egyh8BUQF4pKoR5XNuUv3+t2bcF9oOqobSA4HZJeHtg3bdEWCueRd4n3EderFG/0
         37aqvfXwoTGJICl2OOeGkolts6vMxNa0eUXugPFZKSTRjBIULLw5VPOJIpKU/oclRpNY
         EXnYoCXXe3CRshTH0b52+OjO7jn3TCrU2a22HM/j1+XxhTyqK9eGgVIB7/MP7yC7TksL
         5XBg==
X-Gm-Message-State: AOAM533NMZbrixUo9a1E7c4ZX/0meJXD/zKNwp9BYGUV2Qn6pKYt3DxT
        Oa1ktga++CgrAdJvrrWCCYj63bBNYOAjf5q+kCKH7ryZ8buJtsOijGclpnPYSFuArnEHjpAv6Gu
        Emrhxlr+wMLFWbxFhYsT4v5E=
X-Received: by 2002:a17:906:8614:: with SMTP id o20mr15716343ejx.386.1614609646030;
        Mon, 01 Mar 2021 06:40:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/v4DUfmo2EG/X1I9dp40zuUNEK4R8FDgR1BlS2OD+WDNerm67ichjQAYLB8z+2p/ObsCeMA==
X-Received: by 2002:a17:906:8614:: with SMTP id o20mr15716323ejx.386.1614609645778;
        Mon, 01 Mar 2021 06:40:45 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id e8sm11135568edq.77.2021.03.01.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 06:40:45 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id BE0951800F1; Mon,  1 Mar 2021 15:40:44 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Shwetha Vittal <cs19resch01001@iith.ac.in>,
        xdp-newbies@vger.kernel.org
Subject: Re: Query on eBPF Map iterator in Kernel space
In-Reply-To: <CADutbzUJrgLQvhyd7EGd2EQSJv13rQkCHFpfMJwJkAtYhGLtdw@mail.gmail.com>
References: <CADutbzUJrgLQvhyd7EGd2EQSJv13rQkCHFpfMJwJkAtYhGLtdw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 01 Mar 2021 15:40:44 +0100
Message-ID: <87pn0jvswj.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Shwetha Vittal <cs19resch01001@iith.ac.in> writes:

> Hi,
>
> Is there any way to iterate through eBPF Map elements in kernel space.
> I know that there is one at user space bpf_map_get_next_key(). But it
> doesn't work when tried in kernel space. I have a requirement to find
> the record in the eBPF map which has the least value in kernel space
> and pick it for further packet processing and therefore need to
> iterate through eBF Map .

There will be soon:
https://lore.kernel.org/bpf/20210226204920.3884074-1-yhs@fb.com/

-Toke

