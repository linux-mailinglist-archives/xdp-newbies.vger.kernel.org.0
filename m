Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8335099D
	for <lists+xdp-newbies@lfdr.de>; Mon, 24 Jun 2019 13:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbfFXLSC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 24 Jun 2019 07:18:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45080 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfFXLSC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 24 Jun 2019 07:18:02 -0400
Received: by mail-ot1-f65.google.com with SMTP id x21so13031271otq.12
        for <xdp-newbies@vger.kernel.org>; Mon, 24 Jun 2019 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MleWixtbDnNBeYt/2xW20wL0fyrX6Ywh+x9pfLuv9Vk=;
        b=iHBFprEfMnKp+h8gOOaD/vaCvbUoe8SYzPVhId0zfLCtR+iY0pvM16jCg0urqW6sS4
         BF2NoWVI6gP8AJZxwIbk2u4iSxcPWz+1wiZJwUvX/ZPf8mkhdjM4F0e0C9ZCWa8pYj+n
         QxzSTFFnGqplk3kOWItgBv5I1vtARYiPTbGVy5pDvfyHDHgImMRmtd9f2kdvdzGi9ygE
         wKyiJPmi9bkmnaSOfsuu4H+gTh2/g6K1SQNLVh81qs4avF1q5btGV4Q7vwkBKoakzzP6
         XonZ5KZpUrUKdhhVDhIAztoB13XILECHWy7t/awND19dVAckYpbRycQ46zCFTnbpgD1N
         DS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MleWixtbDnNBeYt/2xW20wL0fyrX6Ywh+x9pfLuv9Vk=;
        b=r14rfrJND32aiLC8wKb8MPLu884FWZKFBBSeTwJ6VLJ6GcflUXflBrS8ooIA/EUENI
         0Hy0eceNdOj7okrOYOjhaSCtlG30aSL11uOI8kwYo/EdGydvVOPe8XGhEJ4ptbNiULGd
         omK4mtRrKS2/PW45pJGAWNl8SfN2QY2dem31fS51MFzekXt/TDoFHenKG7yeJ6cPG15l
         sqcCNRuKbV8yqtg+YVb26I0YCuPEmcRdDE+svxzXy0zRvkUPa22bm3XpNtX7NeKZFfpe
         dwa8ROcxcGDkEhYaAUfbnoDxDVq0TjbsWsQ+SKdWErASkXYm8/kghftESDunp2z7xhdW
         fOUQ==
X-Gm-Message-State: APjAAAVaW4yhMYszUgVx1o56XhpwGwptvcwDlcWv9/sPWBhAJr6S9v4B
        vDN8BmBnJ1890WQF6cxEQlszo2BcJFP72LAoOUOGHo28T5s=
X-Google-Smtp-Source: APXvYqxhp627rXu2/ukjmfMcr5FK1XoRUD3E/xjNiZTJbB51mSBBwuujIbWPaUnGObHERCv1F71+gpIhKzN1bcGnpt4=
X-Received: by 2002:a9d:77c2:: with SMTP id w2mr25186831otl.192.1561375082005;
 Mon, 24 Jun 2019 04:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaYocYhic1UC2p60gO6rzJYzHaHob=0-GUN1Z2e0XgMaPoMBg@mail.gmail.com>
 <28F29E84-6392-4794-A1AB-0566B8ADE5A1@redhat.com>
In-Reply-To: <28F29E84-6392-4794-A1AB-0566B8ADE5A1@redhat.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 24 Jun 2019 13:17:50 +0200
Message-ID: <CAJ8uoz0nQxXXBwKsVCgK=_oJRgUrnVNNQz_FYQFm93mFCLb29Q@mail.gmail.com>
Subject: Re: AF_XDP only releasing from FQ in batches
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     Rafael Vargas <vargas@khomp.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jun 24, 2019 at 12:24 PM Eelco Chaudron <echaudro@redhat.com> wrote:
>
>
>
> On 21 Jun 2019, at 21:20, Rafael Vargas wrote:
>
> > Hi,
> >
> > I'm trying to use AF_XDP and I'm using the xdpsock sample
> > implementation as a guide.
> >
> > I've noticed that the Fill Queue slots are released in batches of 16
> > (kernel 5.1)
> >
> > The xdpsock (rx_drop) implementation will lock waiting for the space
> > in the FQ.
> > This seems it will work fine when receiving lots of packets, but will
> > loop indefinetely if traffic stops.
>
> Yes I was running into the same problem, and you should not wait wait
> for the free slots, as that will put you in a loop waiting, and not
> processing packets until 16 are received.
>
> This is how I solved it:
>
>
> static void rx_pkts(struct xsk_socket_info *xsk)
> {
>         unsigned int rcvd, stock_frames, i;
>         uint32_t idx_rx = 0, idx_fq = 0;
>         int ret;
>
>         rcvd = xsk_ring_cons__peek(&xsk->rx, RX_BATCH_SIZE, &idx_rx);
>         if (!rcvd)
>                 return;
>
>         /* Stuff the ring with as much frames as possible */
>         stock_frames = xsk_ring_prod__free(&xsk->umem->fq);
>         stock_frames = MIN(stock_frames, xsk_umem_free_frames(xsk));
>
>         if (stock_frames > 0) {
>
>                 ret = xsk_ring_prod__reserve(&xsk->umem->fq, stock_frames,
>                                              &idx_fq);
>                 while (ret != stock_frames)
>                         ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd,
>                                                      &idx_fq);
>
>                 for (i = 0; i < stock_frames; i++)
>                         *xsk_ring_prod__fill_addr(&xsk->umem->fq, idx_fq++) =
>                                 xsk_alloc_umem_frame(xsk);
>
>                 xsk_ring_prod__submit(&xsk->umem->fq, stock_frames);
>         }
>
>         /* Process received packets */
>         for (i = 0; i < rcvd; i++) {
>                 uint64_t addr = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx)->addr;
>                 uint32_t len = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx++)->len;
>                 char *pkt = xsk_umem__get_data(xsk->umem->buffer, addr);
>
>                 // Handle packet
>
>                 xsk_free_umem_frame(xsk, addr);
>         }
>
>         xsk_ring_cons__release(&xsk->rx, rcvd);
>         xsk->stats.rx_packets += rcvd;
>    }
>
>
> Where  xsk_ring_prod__free() is as follows (sent patch upstream for
> adding it as an API):

Eelco,

In the patch you sent, why not make it a patch set by adding these
improvements (using your new function) to the xdpsock sample app?
Please :-).

/Magnus

> static inline __u32 xsk_ring_prod__free(struct xsk_ring_prod *r)
> {
>         r->cached_cons = *r->consumer + r->size;
>         return r->cached_cons - r->cached_prod;
> }
>
> And the following is an API around my UMEM frame handling:
>
> xsk_umem_free_frames() -> How many buffers do I have available on my
> stack
>
> xsk_free_umem_frame()  -> return a buffer to my buffer stack
>
> xsk_alloc_umem_frame() -> Get a buffer from my buffer stack
>
> > This is the expected behavior for the FQ?
> > Should I keep the FQ always with free slots in order to avoid blocking
> > when waiting for more packets?
> >
> > Rafael Vargas
