Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5834A125
	for <lists+xdp-newbies@lfdr.de>; Tue, 18 Jun 2019 14:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfFRMvX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 18 Jun 2019 08:51:23 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:34900 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRMvX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 18 Jun 2019 08:51:23 -0400
Received: by mail-qt1-f178.google.com with SMTP id d23so15098702qto.2
        for <xdp-newbies@vger.kernel.org>; Tue, 18 Jun 2019 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UdB0GfryeZhlRhnbeRzHpzYEzMaNVxOKcIOrFPklAFM=;
        b=uFN91U2PsnAp1LTqYCwJmqTfdzcVJD7WkibfvIE+/htSjE3C7PFwiH7AygTu/RMbZ7
         mkEd3OrWM42IAxC111WF+5mxJ/F6AefPY1fK+0Q2tY/DHu6Eip3MReXDZ9e0HgfNu0wl
         kG+zG62gh5o1Mk3xQU4tc4hTmk/JpFOe7LTuWesLkEMGhpyBxU8WuCZDt2V3iX85Z1w9
         +LxzNnzyUL/B6RbVlMJttVSOxK14CeM9pOWe6RzI6ODPj2aatgTP4N/XfMLLtZqf0K3b
         JYCL8AB9vkXkgE63EG6JVs9kdxfMH9rzABFWZR8krgHfIA0oPytBcL6/snjFHFJSF/PI
         ZV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UdB0GfryeZhlRhnbeRzHpzYEzMaNVxOKcIOrFPklAFM=;
        b=W56cCvEp4fFIvmZNjWZZxZrGCuNZxSXS6nd8b6MXHby4hWLLWYW5rhKmoxQZWUCGQv
         Wjsdr0GdiYqLnysa/H4xYP8+0Xch5X+lyd3VMUj9LYrAdiYYPMXLXTROLjhTYZkty0MS
         Z1Xk88iaXQlDvoE+uwdosSeIEEePbxm4FPXw1PwTkhFRNapcgl2XpigWrkP8uvkyuWuG
         BUQ9v/bIgNes3pkO3L9W5ZUXSVL2S86CkOHy4oNXy+kDRM0vrbWKUAjRsDRVKo1VItyb
         ZsvwxsltVYEgw1GQiYnkZ6JSXrYKNYaqAkuDMrprfQMeC2xN/x9B948XUGnefIsL/UrS
         f29w==
X-Gm-Message-State: APjAAAUllqz300A1dU2m8vvST0qdHjfoc+DFq2qCijlt/YlPKvA76YMm
        i3RwVCeSoccOtR+1HzrDwQAcE+DlZ+Da0w4ExLA=
X-Google-Smtp-Source: APXvYqyCgnoN7ONgkrWn3t6AwyiibKwRZn9AAp80MwKPmGjjH4TTnPvJByMBm/pjLkVo8OTjKkkFMX7yjU/o9qi5M9o=
X-Received: by 2002:ac8:19ac:: with SMTP id u41mr81361141qtj.46.1560862282095;
 Tue, 18 Jun 2019 05:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <CALDO+SYgZ1ZJx31iU+ZNnd5v3-V0kWwT3nqk+X6NuD8VWk1Tnw@mail.gmail.com>
In-Reply-To: <CALDO+SYgZ1ZJx31iU+ZNnd5v3-V0kWwT3nqk+X6NuD8VWk1Tnw@mail.gmail.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Tue, 18 Jun 2019 14:51:11 +0200
Message-ID: <CAJ+HfNgr-39L1-Q5w3pw4WOGqKs_F-vZP6Yj37s9EiJD_BQ7GQ@mail.gmail.com>
Subject: Re: Question/Bug about AF_XDP idx_cq from xsk_ring_cons__peek?
To:     William Tu <u9012063@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, 15 Jun 2019 at 01:25, William Tu <u9012063@gmail.com> wrote:
>
> Hi,
>
> In my implementation[1], I'm doing s.t like
>     tx_done =3D xsk_ring_cons__peek(&xsk->umem->cq, BATCH_SIZE, &idx_cq);
>     if (tx_done > 0) {
>         xsk_ring_cons__release(&xsk->umem->cq, tx_done);
>         xsk->outstanding_tx -=3D tx_done;
>     }
>
> I expect if tx_done returns 32, then after calling xsk_ring_cons__release=
,
> the next time I call xsk_ring_cons__peek, I should get idx_cq + 32.
> However, sometimes I see the same value of idx_cq is returned as previous=
, even
> when tx_done > 0. Is this the expected behavior?
>
> I experiment with xdpsock_user.c with the patch below and run
> ~/bpf-next/samples/bpf# ./xdpsock -l -N -z -i eth3
> using bpf-next commit 5e2ac390fbd08b2a462db66cef2663e4db0d5191
>

Will, apologies for the slow response.

Hmm, it looks like a bug. We'll take a look!


Thanks,
Bj=C3=B6rn


> --- a/samples/bpf/xdpsock_user.c
> +++ b/samples/bpf/xdpsock_user.c
> @@ -444,6 +443,8 @@ static void kick_tx(struct xsk_socket_info *xsk)
>         exit_with_error(errno);
>  }
>
> +static int prev_idx_cq;
> +
>  static inline void complete_tx_l2fwd(struct xsk_socket_info *xsk)
>  {
>         u32 idx_cq =3D 0, idx_fq =3D 0;
> @@ -463,6 +464,15 @@ static inline void complete_tx_l2fwd(struct
> xsk_socket_info *xsk)
>                 unsigned int i;
>                 int ret;
>
> +        if (idx_cq =3D=3D prev_idx_cq) {
> +            printf("\n\n ERROR \n\n");
> +        }
> +        if (idx_cq - prev_idx_cq !=3D rcvd) {
> +            printf("\n\n ERROR request %d return %d idx_cq %x prev_cq
> %x diff %d\n",
> +                   ndescs, rcvd, idx_cq, prev_idx_cq, idx_cq - prev_idx_=
cq);
> +        }
> +        prev_idx_cq =3D idx_cq;
> +
>                 ret =3D xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx=
_fq);
>                 while (ret !=3D rcvd) {
>                         if (ret < 0)
> @@ -599,7 +609,7 @@ static void tx_only(struct xsk_socket_info *xsk)
>         }
>  }
> Most of the time idx_cq - prev_idx_cq =3D=3D rcvd, but sometimes I got:
>  ERROR request 64 return 64 idx_cq 107f54 prev_cq 107f50 diff 4
>  ERROR request 64 return 4 idx_cq 2df794 prev_cq 2df754 diff 64
>  ERROR request 60 return 60 idx_cq 2df798 prev_cq 2df794 diff 4
>  ERROR request 64 return 64 idx_cq 2df7d4 prev_cq 2df798 diff 60
> I wonder if it is a bug?
> [1]https://github.com/williamtu/ovs-ebpf/blob/afxdp-v11/lib/netdev-afxdp.=
c#L719
>
> Thanks
> William
