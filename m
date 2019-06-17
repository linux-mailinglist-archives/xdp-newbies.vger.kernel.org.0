Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87FAC48021
	for <lists+xdp-newbies@lfdr.de>; Mon, 17 Jun 2019 13:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfFQLDR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 17 Jun 2019 07:03:17 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36666 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfFQLDR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 17 Jun 2019 07:03:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id k21so15579057edq.3
        for <xdp-newbies@vger.kernel.org>; Mon, 17 Jun 2019 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=W+3z4k89Cojm593snB0gDXnwAiJwZIM4rH4iwY7g/v0=;
        b=aT9eIovKfP5aj8MyeGFaGhGxeVePs9Uu+8C1BaThcY/Vpw+JenkisNsALBVwrktaLt
         1jQ8B2H34hsnIkp3Xm7XsyNw5GUhjO6JDaDoZaIoae3mFFqgAWpScNuaUXy9QWvQ5obf
         WUl7nGDsptSDaX9j8l5NQfy47nQRT0XiINkwEK+WaQHyRDJkdiarIMfv0ucrFc2IRbTz
         De1ZmdmTzENCZ02QGHZ35jmu9Cu4V05NBldD9klb//I2qWjVvaKSvQlRTwRp8P0OgqCY
         rc/Kka3hTa2wGQhHEOWl+mmttRxJeYeOreFl9jkWdDt2R77T8nc5aYF61T/jdh8v/lIF
         tSig==
X-Gm-Message-State: APjAAAXBuinkNTgutDaQpLT/34A7o1TTwCk65Or0gTeef+ID02VvMeQI
        0EdZodnwPbLU5P3AuksOfmr7ZURej0E=
X-Google-Smtp-Source: APXvYqzPTRqUWlYFRFpuq2I8rWwCG4/OpfhMdAbvJOxLJipoP88L1YYZ1raJxLpYJrsBXeJxHVSh7A==
X-Received: by 2002:a50:fa83:: with SMTP id w3mr40256711edr.47.1560769395848;
        Mon, 17 Jun 2019 04:03:15 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id m31sm3697551edd.42.2019.06.17.04.03.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 04:03:15 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7E6F71804AF; Mon, 17 Jun 2019 13:03:14 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Eric Leblond <eric@regit.org>, xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP and packet timestamp
In-Reply-To: <86f135475a7820adadb05e7ac9a05c71846bebd6.camel@regit.org>
References: <86f135475a7820adadb05e7ac9a05c71846bebd6.camel@regit.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 17 Jun 2019 13:03:14 +0200
Message-ID: <87d0jca2z1.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Eric Leblond <eric@regit.org> writes:

> Hello,
>
> I did start to work on AF_XDP support for Suricata. API was really easy
> to use via libbpf.
>
> From Suricata point of view, the current system with default
> configuration is lacking an important information. I don't have access
> to the timestamp of the packet. I'm in particular interested by the
> hardware timestamp as it would allow to do reordering in some capture
> cases.
>
> Is there a way to get the information via AF_XDP. I've seen the
> discussion on hardware hints but there was no code example I was able
> to find.

Making more information from the hardware available to XDP is currently
on our list of things we plan to enable in the future:
https://github.com/xdp-project/xdp-project/blob/master/xdp-project.org#metadata-available-to-programs

I just added timestamps as a field we want in there (so we don't
forget).

I.e., no, there is no way to get this information from XDP (and thus not
from AF_XDP either) yet...

-Toke
