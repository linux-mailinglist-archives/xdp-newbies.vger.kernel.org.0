Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E016185587
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Aug 2019 00:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbfHGWJX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Aug 2019 18:09:23 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41140 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGWJW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 7 Aug 2019 18:09:22 -0400
Received: by mail-ed1-f68.google.com with SMTP id p15so87973769eds.8
        for <xdp-newbies@vger.kernel.org>; Wed, 07 Aug 2019 15:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=imRHRxFK0KdrPvCVXPkc4C1hTPr/ODzbF2EHdBfzMj8=;
        b=a4yLsz7ZKm0k39m29087w2h0gVJznGtGKS/tWxG9lU7fLN/0r0c1VcRxsHjQkG8nq6
         B48pK4zKz3MQwDegXrjla26tMrR+RJIRQSyB69SO4zRbGplIy/isAO2p9nnXI59eg1h0
         EWVF/JYd14vEzuqebs9Y01MPpjKKRMJhln5TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=imRHRxFK0KdrPvCVXPkc4C1hTPr/ODzbF2EHdBfzMj8=;
        b=TMnPfjhTMGslPizf3YSvWFp6XSXioawLPiUubQyAUpsZTYUJZ9zNmXAHmxidy0Embx
         WnkdQqCIry0mcH+ELi/bIMcEm63fyeFn4SAK3/e+EEjn+e8pYMwihEA1qPPb28Dm99ZZ
         O37y7INAttjH/yhbu8+E7j+vEgSevkhkc/++cH18/gUGUlg5IIKBxt1S69HRjqbhg++L
         /dHrJXuDOiiHLtjqjZj5P3tuM/rVrXYRb9gjkcR6lHKQGk+v7U5FiglBz4Cb8ZGPhoSf
         Rz5mGefuJAZw/fyU1wttzKLPVFI3DENF6Xn9SzqiztuYEAFzMGWlOIa3RC8fKvPXHB78
         MWIg==
X-Gm-Message-State: APjAAAUt2DEEcGx7dUZMDAhk0j+1E55uyYfX0yqu6nrTQMhET28czPXE
        w6p5LX8Puq0KXJSExrp1btDSwHS+NrbyzURt2n4oGA==
X-Google-Smtp-Source: APXvYqySQTQw7RPN6OUDfmBC2o0xccHltMM9im5HqxhA6mT4J9oIKYldQvSPugLNXHs6gQbLiwvkvTYT4cki9JK2QoY=
X-Received: by 2002:a17:906:b34d:: with SMTP id cd13mr10386329ejb.107.1565215761148;
 Wed, 07 Aug 2019 15:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <156518133219.5636.728822418668658886.stgit@firesoul> <20190807150010.1a58a1d2@carbon>
In-Reply-To: <20190807150010.1a58a1d2@carbon>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Wed, 7 Aug 2019 15:09:09 -0700
Message-ID: <CAC1LvL29KS9CKcXYwR4EHeNo7++i4hYQuXfY5OLtbPFDVUO2mw@mail.gmail.com>
Subject: Re: [bpf-next PATCH 0/3] bpf: improvements to xdp_fwd sample
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Anton Protopopov <a.s.protopopov@gmail.com>, dsahern@gmail.com,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Aug 7, 2019 at 6:00 AM Jesper Dangaard Brouer <brouer@redhat.com> wrote:
>
> Toke's devmap lookup improvement is first avail in kernel v5.3.
> Thus, not part of XDP-tutorial yet.
>
I probably missed this in an earlier email, but what are Toke's devmap
improvements? Performance? Capability?

Thanks!
--Zvi
