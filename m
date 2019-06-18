Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C224A3E1
	for <lists+xdp-newbies@lfdr.de>; Tue, 18 Jun 2019 16:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfFRO0Q (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 18 Jun 2019 10:26:16 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]:43714 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbfFRO0Q (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 18 Jun 2019 10:26:16 -0400
Received: by mail-qt1-f175.google.com with SMTP id w17so9122242qto.10
        for <xdp-newbies@vger.kernel.org>; Tue, 18 Jun 2019 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OZpSZmETnW4KnVw9IlnjXm58af7U+FNOOdwYoyBB6DM=;
        b=PW4ncJrMlUtnSjDfAwD2fmCfzlKudRPVB6g0cldpRfqK+gljZmz82tpnsvelRfeS7U
         hJ54dQ0yJ+A1rjF8xQWTG//qNY2ZXgl1xrXimKklfiZDlebbrQk9UttT0HrGToJk5ib3
         +dpYc9KRCEF42rj1OX5mATieutxrC0rzu8OyaPMOR0diRYVSCOZlJYVnajfy63BVsaio
         DgPg1e7fu/31z8KF5FHSjgj5D9ubELfHyzAzzGDyk4p3xIs/VOgxEHOdrZD2LlM1EML/
         txAbN08fYjhh+o5rSimtdbiMNT4mLQ/cOK1tp1C+kafImWZfMCgxgtZFUYSexnXdEBii
         3LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OZpSZmETnW4KnVw9IlnjXm58af7U+FNOOdwYoyBB6DM=;
        b=btLH2auQFGOEN/RFs6/BDhj54oj78wZcORlErwgzc0OZsBiPfVmIGtUEVLmegbyLHv
         uJeMUys4bmwKDFfR1wyXqlBf541RP11i1cT7RFwhusf1g5b675KBTvQ0Ej6PaavxDPC+
         lAm2bDpXVRfnZM3amnkv89HUGUYYY6u9q0JdwSNHSa+Mr1pRCJcZyqR5F/UijdJb+ImD
         ng94kocEjZrPivp83OaJnVV2cj0ch0b6qiPKsJ0rBw7FkjXM7V2tWc4wxB1uNDC1lYgq
         ZsEAJyi83S48Se/kCbqp+qguDFDnbiT7P9orZ2MpD0qQYcJv3EmZzwhUbihdPusX9Cl1
         YRKw==
X-Gm-Message-State: APjAAAXa73RR4sRzwMsrCpFN7gX0WrNeZscvKMt3Ke87HainEppvkMJ3
        /chGb+9NbponryjzD9p9w31amBnTIemNff9SBUA=
X-Google-Smtp-Source: APXvYqzA5Pc1F9avPuvJMEWsgMs9wAavBq7s5b+iezTjY6xiGkJYTyaHYWfbtbcFTRYUVZwDCEjiFZ0SE/S8g7g7Fzo=
X-Received: by 2002:a0c:c586:: with SMTP id a6mr25338630qvj.177.1560867975543;
 Tue, 18 Jun 2019 07:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <CALDO+SYgZ1ZJx31iU+ZNnd5v3-V0kWwT3nqk+X6NuD8VWk1Tnw@mail.gmail.com>
 <CAJ+HfNgr-39L1-Q5w3pw4WOGqKs_F-vZP6Yj37s9EiJD_BQ7GQ@mail.gmail.com>
In-Reply-To: <CAJ+HfNgr-39L1-Q5w3pw4WOGqKs_F-vZP6Yj37s9EiJD_BQ7GQ@mail.gmail.com>
From:   William Tu <u9012063@gmail.com>
Date:   Tue, 18 Jun 2019 07:25:39 -0700
Message-ID: <CALDO+Sadm5JEqUw_1Toc52Z9+GyPe25iAJbtN=7AtTTQg_JB6Q@mail.gmail.com>
Subject: Re: Question/Bug about AF_XDP idx_cq from xsk_ring_cons__peek?
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jun 18, 2019 at 5:51 AM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.co=
m> wrote:
>
> On Sat, 15 Jun 2019 at 01:25, William Tu <u9012063@gmail.com> wrote:
> >
> > Hi,
> >
> > In my implementation[1], I'm doing s.t like
> >     tx_done =3D xsk_ring_cons__peek(&xsk->umem->cq, BATCH_SIZE, &idx_cq=
);
> >     if (tx_done > 0) {
> >         xsk_ring_cons__release(&xsk->umem->cq, tx_done);
> >         xsk->outstanding_tx -=3D tx_done;
> >     }
> >
> > I expect if tx_done returns 32, then after calling xsk_ring_cons__relea=
se,
> > the next time I call xsk_ring_cons__peek, I should get idx_cq + 32.
> > However, sometimes I see the same value of idx_cq is returned as previo=
us, even
> > when tx_done > 0. Is this the expected behavior?
> >
> > I experiment with xdpsock_user.c with the patch below and run
> > ~/bpf-next/samples/bpf# ./xdpsock -l -N -z -i eth3
> > using bpf-next commit 5e2ac390fbd08b2a462db66cef2663e4db0d5191
> >
>
> Will, apologies for the slow response.
>
> Hmm, it looks like a bug. We'll take a look!
>
No worries, thanks for the update!
Or let me know if I can try something to get more info.

the xsk_ring_cons__peek just keeps doing
        *idx =3D cons->cached_cons;
        cons->cached_cons +=3D entries;

It's weird to see idx value not advancing 'entries' occasionally.

Regards,
William
