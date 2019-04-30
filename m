Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F01BF6E0
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Apr 2019 13:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfD3LxS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Apr 2019 07:53:18 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36971 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731283AbfD3Lu4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Apr 2019 07:50:56 -0400
Received: by mail-qt1-f193.google.com with SMTP id e2so14941893qtb.4
        for <xdp-newbies@vger.kernel.org>; Tue, 30 Apr 2019 04:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6kcSxsDBwLVVJ+T/on8j29khpMeJLBMjL+rX4rEDwQs=;
        b=XzoRLvAAEqzrCwcvESV/9wuHZgzfry9pTXKqpf/vv9q8Hsw5+EZw94MtLlc74dmTfM
         p1K0kUyIYKAIQwi6TXlyGGjHY7Szkp6+Lm1gn/S4/VUTHRW43u8BjtF1Hn7FYDSdRwBC
         keG576VjujThp7pPlIM97qN3KlbLMmgQCQCtw09Mh4kO324/tgjIHSEpyBFoZv5O53pH
         iHYNGolS7r5XJpRSZqTiAZkP+ML0hoy+HVVGsCU8QA8pYh7MBdgx2H2lhZA8QlkcGYp3
         cued8y9H2mimbieGjuYUzh1/YgQDoFS4XKDwS8MIrRcrsKaN5BFyddEnMc+Z60JbQ77m
         JQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6kcSxsDBwLVVJ+T/on8j29khpMeJLBMjL+rX4rEDwQs=;
        b=TzKEGCbY4U6si0oaAcPIQF0VqCAxN65+ew/aZ4SNT6a54a98zh2XDtZs5fpGV7bKCM
         19EG4QdZhul32ipWTVQeTJf1GDiqPXmUYx/95SurMOhDQJGhh6Ekqq0tHKv6Ei1Dupx1
         K5uXuO/9XCp8R6PIV4A5PpV59/L5XsOLhtab41QHskiGcinXTnVu7zhhSRoWSV306rUQ
         kueeAj5SenmP2SI3VqbaOHXtasWNvxeZvGmJ162G4ZSoQwYw4cmgn+Jhpkp5bSjJBFfT
         fTHQGoa04DTaubETeQ7F/swDUKE3fu3uOZYBwNek/JsC3GicfG71qNA1vb+8rq2bUO68
         JEiQ==
X-Gm-Message-State: APjAAAVnbyTzTNE1MgVCQdPLF3g15ZTMuuRH4geEIQkThilb9o9CgbO9
        Ybq5hoW2SEAXUc9h82sgskjH5pAGqQ4ms03Lhg4=
X-Google-Smtp-Source: APXvYqyKw+AktRJWlbNyAYDiMQHABnqGkxS5AQWrPQNDphP+Y4jBI0OvCTB2+G12qXJe4K51BmrjQsYyE1q1Cgf2t1w=
X-Received: by 2002:a0c:88b5:: with SMTP id 50mr9984383qvn.12.1556625055534;
 Tue, 30 Apr 2019 04:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALDO+Sa4XsVXYq9szxws5PtX_mRFcioq0wXeNn0S6k+OZwx3Qw@mail.gmail.com>
In-Reply-To: <CALDO+Sa4XsVXYq9szxws5PtX_mRFcioq0wXeNn0S6k+OZwx3Qw@mail.gmail.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Tue, 30 Apr 2019 13:50:43 +0200
Message-ID: <CAJ+HfNgLUAwXPEO4Up2Zn4=smir6mff+k7rh1piKk3cBySRqjg@mail.gmail.com>
Subject: Re: AF_XDP tear down and up fail
To:     William Tu <u9012063@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 29 Apr 2019 at 22:20, William Tu <u9012063@gmail.com> wrote:
>
> Hi,
>
> I'm adding AF_XDP support to OVS but hit a problem when users
> reconfigure the AF_XDP.  Ex: users can use SKB mode in the beginning
> and then switch to DRV mode. So I want to cleanup the XSK and
> re-initialize everything. However it always fails.
>
> I simplifies the issue using xdpsock_user.c below:
> Assume user want to delete the previous xsk and recreate a new one.
> Now it fails at bind() returning "Device or resource busy"
>
> diff --git a/samples/bpf/xdpsock_user.c b/samples/bpf/xdpsock_user.c
> index d08ee1ab7bb4..f3e37f0451b5 100644
> --- a/samples/bpf/xdpsock_user.c
> +++ b/samples/bpf/xdpsock_user.c
> @@ -644,6 +644,17 @@ static void l2fwd(struct xsk_socket_info *xsk)
>         }
>  }
>
> +void cleanup(void)
> +{
> +       struct xsk_umem *umem =3D xsks[0]->umem->umem;
> +    printf("cleanup\n");
> +
> +       xsk_socket__delete(xsks[0]->xsk);
> +       (void)xsk_umem__delete(umem);
> +       remove_xdp_program();
> +    printf("cleanup done\n");
> +}
> +
>  int main(int argc, char **argv)
>  {
>         struct rlimit r =3D {RLIM_INFINITY, RLIM_INFINITY};
> @@ -670,6 +681,23 @@ int main(int argc, char **argv)
>                                   NUM_FRAMES * XSK_UMEM__DEFAULT_FRAME_SI=
ZE);
>         xsks[num_socks++] =3D xsk_configure_socket(umem);
>
> +    cleanup();
> +    num_socks =3D 0;
> +    umem =3D NULL;
> +
> +    printf("create again\n");
> +       ret =3D posix_memalign(&bufs, getpagesize(), /* PAGE_SIZE aligned=
 */
> +                            NUM_FRAMES * XSK_UMEM__DEFAULT_FRAME_SIZE);
> +       if (ret)
> +               exit_with_error(ret);
> +
> +       /* Create sockets... */
> +       umem =3D xsk_configure_umem(bufs,
> +                                 NUM_FRAMES * XSK_UMEM__DEFAULT_FRAME_SI=
ZE);
> +       xsks[num_socks++] =3D xsk_configure_socket(umem);
> +
> +    printf("create again done\n");
> +
>         if (opt_bench =3D=3D BENCH_TXONLY) {
>                 int i;
> ----
> // How to reproduce
> ip link add p0 type veth peer name afxdp-p0
> ip link set dev afxdp-p0 up
> ./xdpsock -S -r -i afxdp-p0
> /root/bpf-next/samples/bpf/xdpsock_user.c:xsk_configure_socket:315: errno=
: 16/"Device or resource busy"
>
> I think at net/xdp/xsk.c the xsk_release does not get invoke, so the
> xs->dev is not NULL.
>
> Still debugging and any suggestions are welcome.
>
> btw: tested on bpf-next commit a21b48a2f2afa53bbc989c
>
> Regards,
> William

Nice catch William!

You triggered two bugs in libbpf; munmap was broken, and the map
descriptors were leaking, leading to incorrect cleanup.

I'll send out fixes for that ASAP.


Bj=C3=B6rn
