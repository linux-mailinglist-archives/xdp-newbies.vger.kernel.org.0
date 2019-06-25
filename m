Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7AB553EC
	for <lists+xdp-newbies@lfdr.de>; Tue, 25 Jun 2019 18:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbfFYQEr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 25 Jun 2019 12:04:47 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:37731 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfFYQEr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 25 Jun 2019 12:04:47 -0400
Received: by mail-qk1-f181.google.com with SMTP id d15so13029105qkl.4
        for <xdp-newbies@vger.kernel.org>; Tue, 25 Jun 2019 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekHbLIPlpJ9Say619fuOxIYTfAxeg+rP9jkDD16cC4g=;
        b=Vq957lE9ciG0GNcxyI5g6hkHGGkPYTQPs35vzzF545dXW2T9V4SVj6THIgwkVOBCsm
         6TWgyg8hNug/Gw7q1YylA2mbVSDUqmkaSk/BFIwfgplbhssQhpLKcM1AGRfivYroH1Wj
         ssDmIr8hu58wXzRfdXz3477eNw+0CqjzVW6wkrR6qLGx0wQ2I0P+ksOVXe1E+Geasz90
         MpdwYPQm9k5VwwrLg+M2oCiyl1nV5gNLqgtm2Q6CT0/RuX6NjTZ0fo9ITbGfapBjctgo
         /i7o6u2W6DQBr+wc6p9AdEo3M1+zT20Ds3fiI7MKFrM30CwlMUGkgaegL8oQfnHC5D/r
         8l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekHbLIPlpJ9Say619fuOxIYTfAxeg+rP9jkDD16cC4g=;
        b=sL+yqwDDfOBoDBBjpN5JM6GPhGiJPno68bU5wRQdnzpWPHz7HUytXpCT0g2FN/aAtp
         usCcAbMFRibTBKBCpeFy3ZeK63Irmrc66dMm7SzOmEbQ5TQTfz9yt24nQi6xhMZe7uCY
         QacMY89WLu/oyj26oxPX6jZKSK8W6A2DqCLFDE5qZ253SXsPZuYmI1A834J7eIfrMNxQ
         zONljinbEpgd9Xbb3rAVG5I2prmPh2LEbze+UU31dhPE90UwPB6Hb8KgidgjeGp8hnAB
         fkYPecP7vbRoeNt0cggoPpbeCqYxpjRsObMvY7ZrP/2qTIzidZuDnDf6btS8VHKSYusN
         UfaQ==
X-Gm-Message-State: APjAAAXCpUw40DuUwlxdy3hUpomRLD4v/cRjVXVVEC1b/W3jjovoWwCi
        Qf2z19Y4LjjJd5vQX5NqC/8NO8Oj9WPF/+ieIl0=
X-Google-Smtp-Source: APXvYqwh0Iw1hhKDF1DbabIHAkdBeGDnUHYzm8cgKv1SkutB/BBnPTFPHMuLWRKkS1aATeb74kuYnEONuRvvdgLqjXg=
X-Received: by 2002:a05:620a:5b1:: with SMTP id q17mr61368188qkq.174.1561478686088;
 Tue, 25 Jun 2019 09:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ8uoz2o5jxnUbtKjCbYe+QGffgCtLO05qXHFVfUHFiN3FXvvA@mail.gmail.com>
In-Reply-To: <CAJ8uoz2o5jxnUbtKjCbYe+QGffgCtLO05qXHFVfUHFiN3FXvvA@mail.gmail.com>
From:   William Tu <u9012063@gmail.com>
Date:   Tue, 25 Jun 2019 09:04:07 -0700
Message-ID: <CALDO+SbBfevJi1AD9bRWMcyhSae2TusT=xdEmpqoq0Mk8Tx=Ug@mail.gmail.com>
Subject: Re: Question/Bug about AF_XDP idx_cq from xsk_ring_cons__peek?
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jun 24, 2019 at 2:51 AM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Sat, 15 Jun 2019 at 01:25, William Tu <u9012063@xxxxxxxxx> wrote:
> >
> > Hi,
> >
> > In my implementation[1], I'm doing s.t like
> >     tx_done = xsk_ring_cons__peek(&xsk->umem->cq, BATCH_SIZE, &idx_cq);
> >     if (tx_done > 0) {
> >         xsk_ring_cons__release(&xsk->umem->cq, tx_done);
> >         xsk->outstanding_tx -= tx_done;
> >     }
> >
> > I expect if tx_done returns 32, then after calling xsk_ring_cons__release,
> > the next time I call xsk_ring_cons__peek, I should get idx_cq + 32.
> > However, sometimes I see the same value of idx_cq is returned as previous, even
> > when tx_done > 0. Is this the expected behavior?
> >
> > I experiment with xdpsock_user.c with the patch below and run
> > ~/bpf-next/samples/bpf# ./xdpsock -l -N -z -i eth3
> > using bpf-next commit 5e2ac390fbd08b2a462db66cef2663e4db0d5191
> >
> > --- a/samples/bpf/xdpsock_user.c
> > +++ b/samples/bpf/xdpsock_user.c
> > @@ -444,6 +443,8 @@ static void kick_tx(struct xsk_socket_info *xsk)
> >         exit_with_error(errno);
> >  }
> >
> > +static int prev_idx_cq;
> > +
> >  static inline void complete_tx_l2fwd(struct xsk_socket_info *xsk)
> >  {
> >         u32 idx_cq = 0, idx_fq = 0;
> > @@ -463,6 +464,15 @@ static inline void complete_tx_l2fwd(struct
> > xsk_socket_info *xsk)
> >                 unsigned int i;
> >                 int ret;
> >
> > +        if (idx_cq == prev_idx_cq) {
> > +            printf("\n\n ERROR \n\n");
> > +        }
> > +        if (idx_cq - prev_idx_cq != rcvd) {
>
> William,
>
> You need to compare with prev_rcvd (and introduce that variable) here
> as the difference in index should be the same as the amount you
> received last time. If you do this change, you will get no errors. You
> can also see this pattern in your printouts. The diff is always equal
> to rcvd during the previous iteration.
>
> /Magnus
>

Hi Magnus,

Thanks for the clarification! Now I understand it's my mistake.
So:
 rcvd1 = xsk_ring_cons__peek(&xsk->umem->cq, ndescs, &idx1_cq);
 ...
 rcvd2 = xsk_ring_cons__peek(&xsk->umem->cq, ndescs, &idx2_cq);

and idx2_cq - idx1_cq == rcvd1.

--William
