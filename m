Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA2B590BB3
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 Aug 2022 08:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbiHLGAD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 Aug 2022 02:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237078AbiHLF7u (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 Aug 2022 01:59:50 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C012AA4B06
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 22:59:49 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id z187so68474pfb.12
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 22:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=GcjBAR09LggfPfodZRsCmwFJLdRqpzlVacX6D2YDS3E=;
        b=dBrkRURugwfCJA0OlAYC6KSVVF9j1k0mWPoV+v2t/DD2Lz03X/0ueuW8ck6si4jDq+
         uoPZZ8GvSWapiRbduq9C7EGip6FAhr0YlGGNkSSOR5WeSkXIVId1KuHwG+7qsuR9zbcW
         QM8yOsK1YFRABMEdR3KFsS0LKU7oxxaxmTm9qzfYQy9RH7gVgYdQlrh+gqAqc08wxhO8
         2CbMnOdZejsRWZt+CT9V170savKdtO7La3EyICsq+HOZJpzUQVrDqElmQf+8ZCRx2nOY
         uecflBwETKEUh9NK0a9LF8Qlqfmp8cXBkSnwZaUFXw9X+TuhsxNlXGnDJfDvJ0N4uGVK
         Gaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=GcjBAR09LggfPfodZRsCmwFJLdRqpzlVacX6D2YDS3E=;
        b=32G8fC0trWlqBaKqtTyDgpnhKwlO8lvzpKztabPP8ArE2ct8f7eBQgOyVnF6HPsROF
         4bfJchtin9EUX2JEY2hHQs70H6AX5IILejqY+Z904o3XfTyQuaQeB6SewUeXGssEmW50
         uP4EBKvV5+zQ2cupwbTDWUavjH1Q0oltMimGk8hLKSN5pjApJkOwwtEjWoOW2ak0E5Dx
         QbLg/7De+p8IKOkIPNfGTo6TAYkW8DWPGcP5g21jzebawn96gXqE6gOq1zn6tfI1tXzq
         n9moIOkKcRGT9uXS5clJQHTu8BywvLF7uh5Ax2YqtwINwxe1mEser+tPvpTJy1tJSNbZ
         kfGg==
X-Gm-Message-State: ACgBeo0/nZ/Mafdr6SKQurHSChKO5+W10mCGjruSXk0949o13Ds/LsbY
        ATI3VNjlpABsCmA0FsbDKcQj/oV7oaXZNzoaqUw=
X-Google-Smtp-Source: AA6agR45pt8WkGKNAM8kg0mxEaVA1bZU2IruUHB8zQHap8RdVNAJd0lI27iqNLa4pbLyfF4uvrqbRmovXLJv5jQNfW8=
X-Received: by 2002:a63:3d1:0:b0:41d:f1e0:c15e with SMTP id
 200-20020a6303d1000000b0041df1e0c15emr2008316pgd.156.1660283989047; Thu, 11
 Aug 2022 22:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220811115523.30742-1-magnus.karlsson@gmail.com>
 <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com> <YvVI3BKjmXUBhd8N@boxer>
In-Reply-To: <YvVI3BKjmXUBhd8N@boxer>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 12 Aug 2022 07:59:37 +0200
Message-ID: <CAJ8uoz0tFG0bpFFpWymyPOJ7Nfmw2Ns5dLLki+NDQHeUWtwS0Q@mail.gmail.com>
Subject: Re: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Aug 11, 2022 at 8:22 PM Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Thu, Aug 11, 2022 at 05:20:30PM +0000, Alasdair McWilliam wrote:
> > Thanks Magnus,
> >
> > Results on E810 is mixed.
> >
> > In terms of RSS:
> >
> > Tested with 8 channels, 4 channels and 2 channels, processing a low vol=
ume of packets first (e.g. 8kpps, 4kpps, 2kpps per setup).
> >
> > * On an 8 channel setup, it is usually channels 0-3 see traffic, but 4-=
7 do not. (I=E2=80=99ve since observed a test where queues 0-3 and queue 5 =
see packets, whereas queues 4 and 6-7 do not.
> >
> > * On a 4 channel setup, I=E2=80=99ve had it where channels 0 and 3 see =
traffic, but 1 and 2 do not.
> >
> > * On a 2 channel setup I can=E2=80=99t replicate the behaviour of only =
1 channel getting traffic. Both always seem to work.
> >
> > If a queue does not see any packets on a test run, I see what I think i=
s a proportional increase on ethtool rx_dropped counter.
>
> Alasdair,
>
> I have just sent patches and CCed you on them which should address the
> issue you are observing. I will be grateful if you could test them on you=
r
> side and get back to us with results. If this won't help then we'll need
> to dig this more.
>
> >
> > In a very low PPS test (e.g. 8 channels, 800pps) I can actually observe=
 broadly the right proportion of traffic, to the queues that work. E.G. ~10=
0pps up to the 4096 limit before stall. I don=E2=80=99t know if that=E2=80=
=99s good enough data to infer that RSS itself is working.
> >
> > In terms of queue stalls:
> >
> > Each queue seems to be able to process at most 4096 packets before stal=
ling, and the ethtool rx_dropped counter starts incrementing. (It may have =
already started incrementing if the queue fails to work at all in the RSS n=
otes above).
> >
> > Interestingly, sometimes they stall slightly below this - I=E2=80=99ve =
observed 4091, 4093, 4095 etc. I=E2=80=99d have to do more repeated testing=
 to try find the threshold before it stops servicing the queue, but once it=
 reaches around 4096 or just below, it stops.
> >
> > I can reproduce this even with a single queue.
> >
> > Also worth noting this behaviour is seen with and without --poll and --=
busy-poll. It=E2=80=99s also observed if I don=E2=80=99t specify --zero-cop=
y, but goes away if I force copy mode with --copy. Off the top of my head I=
=E2=80=99m not sure if the XDP infrastructure will default to XDP_ZEROCOPY =
if capable and XDP_COPY is not explicitly set on the bind flags though. But=
, putting it here anyway.
> >
>
> What ring size you're using?
>
> Thanks,
> Maciej
>
> >
> > Results on MLX5 (hw is ConnectX-4 Lx)
> >
> > The patch seems to have resolved issues on MLX and I can reliably rx/tx=
 2Mpps per queue with xdpsock_multi which is good news. (Same parameters as=
 per testing on E810: poll, busy-poll, zero-copy).
> >
> > I unfortunately cannot test beyond 2 queues in my current rig as I have=
 to manually program flow-steering rules for 2 source MAC addresses into 2 =
different channels, and I only have 2 source ports on my load generator!
> >
> > I could see if someone can generate a test pattern that comes from 8x s=
ource IPs, and flow steer each IP into its own queue, but I=E2=80=99m not s=
ure this is useful re. the comment on RSS above. Let me know?
> >
> > I will do some more thorough testing on the E810/ICE setup tomorrow to =
see if I can get a change in behaviour or observe what the exact stall thre=
shold is.
> >
> > Thanks
> > Alasdair

Thank you so much for testing Alasdair. I believe your tests are
successful in terms of not getting corrupted packets anymore, which is
the only thing the patch I sent will fix. So we still have two
problems to fix for you:

1: RSS not working correctly for E810, which is what Maciej is
addressing in his patch set
2: The queue stalls after 4K packets.

I can take a look at #2 using the application you sent, but after
applying my patch and Maciej's.

> >
> >
> >
> > > On 11 Aug 2022, at 12:55, Magnus Karlsson <magnus.karlsson@gmail.com>=
 wrote:
> > >
> > > From: Magnus Karlsson <magnus.karlsson@intel.com>
> > >
> > > Fix an issue in XDP_SHARED_UMEM mode together with aligned mode were
> > > packets are corrupted for the second and any further sockets bound to
> > > the same umem. In other words, this does not affect the first socket
> > > bound to the umem. The culprit for this bug is that the initializatio=
n
> > > of the DMA addresses for the pre-populated xsk buffer pool entries wa=
s
> > > not performed for any socket but the first one bound to the umem. Onl=
y
> > > the linear array of DMA addresses was populated. Fix this by
> > > populating the DMA addresses in the xsk buffer pool for every socket
> > > bound to the same umem.
> > >
> > > Fixes: 94033cd8e73b8 ("xsk: Optimize for aligned case")
> > > Reported-by: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
> > > Tested-by: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
> > > Link: https://lore.kernel.org/xdp-newbies/6205E10C-292E-4995-9D10-409=
649354226@outlook.com/
> > > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > > ---
> > > net/xdp/xsk_buff_pool.c | 14 ++++++++------
> > > 1 file changed, 8 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> > > index f70112176b7c..9b09da63a7c3 100644
> > > --- a/net/xdp/xsk_buff_pool.c
> > > +++ b/net/xdp/xsk_buff_pool.c
> > > @@ -379,6 +379,14 @@ static void xp_check_dma_contiguity(struct xsk_d=
ma_map *dma_map)
> > >
> > > static int xp_init_dma_info(struct xsk_buff_pool *pool, struct xsk_dm=
a_map *dma_map)
> > > {
> > > +   u32 i;
> > > +
> > > +   for (i =3D 0; i < pool->heads_cnt; i++) {
> > > +           struct xdp_buff_xsk *xskb =3D &pool->heads[i];
> > > +
> > > +           xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->or=
ig_addr);
> > > +   }
> > > +

This for loop needs to be protected with an if (!pool->unaligned), but
I will not send out a new version here. It will be in the version sent
to the netdev mailing list.

> > >     pool->dma_pages =3D kvcalloc(dma_map->dma_pages_cnt, sizeof(*pool=
->dma_pages), GFP_KERNEL);
> > >     if (!pool->dma_pages)
> > >             return -ENOMEM;
> > > @@ -428,12 +436,6 @@ int xp_dma_map(struct xsk_buff_pool *pool, struc=
t device *dev,
> > >
> > >     if (pool->unaligned)
> > >             xp_check_dma_contiguity(dma_map);
> > > -   else
> > > -           for (i =3D 0; i < pool->heads_cnt; i++) {
> > > -                   struct xdp_buff_xsk *xskb =3D &pool->heads[i];
> > > -
> > > -                   xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, =
xskb->orig_addr);
> > > -           }
> > >
> > >     err =3D xp_init_dma_info(pool, dma_map);
> > >     if (err) {
> > >
> > > base-commit: 46c8229c4317ba8576a206d285a34783390ba6ab
> > > --
> > > 2.34.1
> > >
> >
