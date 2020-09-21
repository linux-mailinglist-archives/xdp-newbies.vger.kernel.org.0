Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50051272690
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Sep 2020 16:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgIUODB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Sep 2020 10:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37120 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726471AbgIUODB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Sep 2020 10:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600696979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=irugmeZPkJBve4bl1/ih/x0SZ/grodhCRJYHqK7pe/o=;
        b=eHYo/fBMr7U32BxXycFXZZpU3ebHqKWq60Ytbox6nckDvQjQZ8Yy1/cHnCuK/W/7Gb/cxG
        JwfBScw3s3tQ1HeJr6fPfgsEI9ynHHLj2b++phmIxG5ZQsmS979H45uEUOU3i32SzsxPVe
        zXmSrNZlq5MiSDMfmVlTZMBWD/9WOrg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-LpnjBFhwOsqJbU8VDO8wEQ-1; Mon, 21 Sep 2020 10:02:57 -0400
X-MC-Unique: LpnjBFhwOsqJbU8VDO8wEQ-1
Received: by mail-ed1-f71.google.com with SMTP id x23so4680718eds.5
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 07:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=irugmeZPkJBve4bl1/ih/x0SZ/grodhCRJYHqK7pe/o=;
        b=FI3JMSK0ovRMi0njL9V8jPDCdnvpt4aLO+W9TFJJPG0hCjRaYPVLEI6f+kO92kMjNx
         J9NyGrdfS7xXG5lNh4tW2V+LUD20wAmettQYO753EvqfFEY0S/PEz+O+EWYgVduGHcNU
         GxYJ/P79EC3jGijuELPKEozkExADSkdIyoNfbHkdLNO5dAMTlFFP1hFk3uV0OIn1pISF
         2rXdIA+VwdcS+AW2WHuSMIPLuWGpJTxJJjsVePiqeJUil5Q6HoCkpBmxszJlk3P8Ku8/
         RuL5GwZwn2WwXFWMrrD60igTtg613oWU6JblhXuxC5INkwbjD7FVRLItpQqnngRoCVsi
         yTcQ==
X-Gm-Message-State: AOAM533oE2hWy27rQdC9KXDWwJ63IKeRN2f1Jn4ki9uRyO3/A3pbWoZc
        trCtUc4LHm/89h//3Jb2tw2gVrb6zPP3KQBdr5OtlqiG4TOTGX9md49KEvQYN82PwfVDRYFUZWU
        RyHc/V07rY/Vhr18XCzC11rA=
X-Received: by 2002:a17:907:948b:: with SMTP id dm11mr11868817ejc.94.1600696976270;
        Mon, 21 Sep 2020 07:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ2SeqCHh2vGr6GcuMDXKZ1vwIWWMOBvOwFrbBuaCsWWSfN8b4Gx9TSgIUfJHugaL72iZcZw==
X-Received: by 2002:a17:907:948b:: with SMTP id dm11mr11868787ejc.94.1600696975948;
        Mon, 21 Sep 2020 07:02:55 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id d13sm8652572edu.54.2020.09.21.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:02:55 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D7169183A99; Mon, 21 Sep 2020 16:02:54 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Topi Wala <walatopi@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: xdp-filter troubles
In-Reply-To: <CAOfgOft3xQgpxDmrExdJdPoiqcYD=yL0DNRHA6FRkgGKePQTQQ@mail.gmail.com>
References: <CAOfgOfuNuRo_dNO=RJcz1XiK_=hZmdopG12XcUFB_s0No3vsRw@mail.gmail.com>
 <87blhzqxa2.fsf@toke.dk>
 <CAOfgOft3xQgpxDmrExdJdPoiqcYD=yL0DNRHA6FRkgGKePQTQQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 21 Sep 2020 16:02:54 +0200
Message-ID: <87zh5jp6r5.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Topi Wala <walatopi@gmail.com> writes:

> Sorry about the subject. I had to forward after using text (default is
> http in gmail).
> My kernel version is 5.7.17 (quite new). I am using xdp (ip link show
> on the device shows the xdp, not xdpgeneric).
> I'm using bpftool, since this is to deploy to a third party, and using
> standard linux tools (bpftool, iproute2) is fine, userspace binaries
> are not.

Heh, that's an interesting policy - I'm guessing whoever set it doesn't
really understand BPF... :)

> Is there anything I miss by not using the xdp-filter binary?

Well, a nicer user interface?
But no, technically the BPF side should work just fine, as long as you
populate the maps correctly. Just don't expect any future changes to
xdp-filter to take your... interesting... use case into account :)

> However, I think I have figured out the issue, and I'm quite surprised by it.
> It appears that as soon as the xdpfilter program is attached, the arp
> entry for that IP is discarded from all the entities connected to that
> bridge.
> The peer node consequently does an ARP before ping, and since ARP is
> not an IP packet, it doesn't show up in the bpf log.
> Since the remote node doesn't get an ARP response (arp request is
> dropped), it doesn't send the ping packet at all.

Hmm, installing an XDP program does call the netdev notifiers, so I
guess the iface state can flip, causing the neighbour entries to be
evicted. In general, it's probably safest to consider loading an XDP
program to be a potentially destructive event (some physical devices
will even reconfigure the hardware when this happens). This is only on
first install, though, swapping between already-installed XDP programs
should not have such issues.

You're not the first person to run into the ARP behaviour, BTW. I guess
it may make sense to parse neighbour requests and include them in the IP
filter; feel free to open an issue in the xdp-tools repo for this (or
even better, a pull request!).

-Toke

