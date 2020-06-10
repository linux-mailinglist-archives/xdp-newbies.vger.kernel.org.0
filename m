Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D901F5D7F
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgFJVIQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgFJVIP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:08:15 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93614C03E96B
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:08:15 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id y123so2161344vsb.6
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=THCr+bHPkwZaOB9aGAZHidVtjtUNuy1KR5F5p+tYMc8=;
        b=kJwtp3TK2aCPYmEgYpj9e3iZmhsxtxNCCDt90kY+V43ayqY1+usui5Ri2MaWLYq5uM
         UrDsiuaHXNOt4KFk3qmXE20uEkbDB7Inf0vgx85EPlqFTkC6NVqeia6N/8nKH1uQVV7G
         sSm/JvvveLImuPKqXnEBo4tcoHFL6xf17lgIOYROIrjl5VRpo3tWnur+IekeTmrn07jv
         Cpvg7E75Bf/3Jqp71uVO+g7W2qPdUj/SwxAuKl99odUM3p4AYY1x+6AJVznoCQ7R3kBb
         w9SKrF9mI37KCxmT2Vx6yMT1zlwz18icN99cuJ2IjqKuZ8ZFrF/Ue9MQxGl/xbDAZ3Oc
         9M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=THCr+bHPkwZaOB9aGAZHidVtjtUNuy1KR5F5p+tYMc8=;
        b=PvnrwekDs4tdMPdVD3Sll9CRYTOFnOr8sH1pzLx9cm55mZMHFkrIk5ziHQPV59spQr
         tzTpuG6vVo5Vwgr9mhq2u0c2saRVYGxYuM+BI+2fPpz2WvdeASwZY+AzqMpBaMX4MB/J
         m3uCd7BgvUXvYysgpxHylzuy9fz+7RLOHHCeTfBVv5lF+9dAfmHyVLELPn1OPl8pUDf4
         9OR4gCLNFuioLVfCOParM6bss6vxnPmB/FWo5sxfOcgf2LRtsl0v4EmPRVK76TZ90Y51
         siP9en1srCuyvoeUPY+7GI0USOMFBvHNrGGNuKx42GQ6YRgS5zJPJf26bGz5FncaFYU9
         y9zg==
X-Gm-Message-State: AOAM533NVv0d827Vq0hNYyEj57JwIYC3SZY6jvoJA+XfiBeQD/EWTboX
        APHegfQhY84xUpB44yWdHQr3kW5rzsSE6ZodJIMuNJJq
X-Google-Smtp-Source: ABdhPJyEJx97HPRgF478Iv09Htzvd4MOB68ioKt9X5mscBCHSwCKSNVOM98ctO31WYRGXATGGPhwwjd49F0ZvTxVgQ0=
X-Received: by 2002:a67:684:: with SMTP id 126mr4003095vsg.183.1591823294348;
 Wed, 10 Jun 2020 14:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk>
In-Reply-To: <87imfy7hrx.fsf@toke.dk>
From:   Elerion <elerion1000@gmail.com>
Date:   Wed, 10 Jun 2020 14:08:03 -0700
Message-ID: <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Here is the full dump.

bpf_object__open
libbpf: Error loading BTF: Invalid argument(22)
libbpf: magic: 0xeb9f
version: 1
flags: 0x0
hdr_len: 24
type_off: 0
type_len: 2088
str_off: 2088
str_len: 11234
btf_total_size: 13346
[1] STRUCT (anon) size=3D32 vlen=3D4
        type type_id=3D2 bits_offset=3D0
        max_entries type_id=3D6 bits_offset=3D64
        key type_id=3D8 bits_offset=3D128
        value type_id=3D12 bits_offset=3D192
[2] PTR (anon) type_id=3D4
[3] INT int size=3D4 bits_offset=3D0 nr_bits=3D32 encoding=3DSIGNED
[4] ARRAY (anon) type_id=3D3 index_type_id=3D5 nr_elems=3D2
[5] INT __ARRAY_SIZE_TYPE__ size=3D4 bits_offset=3D0 nr_bits=3D32 encoding=
=3D(none)
[6] PTR (anon) type_id=3D7
[7] ARRAY (anon) type_id=3D3 index_type_id=3D5 nr_elems=3D1
[8] PTR (anon) type_id=3D9
[9] TYPEDEF uint32_t type_id=3D10
[10] TYPEDEF __uint32_t type_id=3D11
[11] INT unsigned int size=3D4 bits_offset=3D0 nr_bits=3D32 encoding=3D(non=
e)
[12] PTR (anon) type_id=3D13
[13] STRUCT config size=3D48 vlen=3D6
        lock type_id=3D14 bits_offset=3D0
        new_conn_limit type_id=3D16 bits_offset=3D64
        rate_limit type_id=3D16 bits_offset=3D128
        main_ip type_id=3D18 bits_offset=3D192
        new_ip_count type_id=3D16 bits_offset=3D256
        new_ip_timestamp type_id=3D16 bits_offset=3D320
[14] STRUCT bpf_spin_lock size=3D4 vlen=3D1
        val type_id=3D15 bits_offset=3D0
[15] TYPEDEF __u32 type_id=3D11
[16] TYPEDEF uint_fast64_t type_id=3D17
[17] INT long long unsigned int size=3D8 bits_offset=3D0 nr_bits=3D64 encod=
ing=3D(none)
[18] TYPEDEF uint_fast32_t type_id=3D11
[19] VAR config_map type_id=3D1 linkage=3D1
[20] STRUCT (anon) size=3D32 vlen=3D4
        type type_id=3D21 bits_offset=3D0
        max_entries type_id=3D6 bits_offset=3D64
        key type_id=3D8 bits_offset=3D128
        value type_id=3D23 bits_offset=3D192
[21] PTR (anon) type_id=3D22

        value type_id=3D8 bits_offset=3D192
[49] PTR (anon) type_id=3D50
[50] ARRAY (anon) type_id=3D3 index_type_id=3D5 nr_elems=3D17
[51] PTR (anon) type_id=3D52
[52] ARRAY (anon) type_id=3D3 index_type_id=3D5 nr_elems=3D128
[53] VAR xsk_map type_id=3D48 linkage=3D1
[54] STRUCT (anon) size=3D32 vlen=3D4
        type type_id=3D6 bits_offset=3D0
        max_entries type_id=3D27 bits_offset=3D64
        key type_id=3D8 bits_offset=3D128
        value type_id=3D55 bits_offset=3D192
[55] PTR (anon) type_id=3D56
[56] STRUCT server_rate_limit_entry size=3D72 vlen=3D9
        under_attack_start type_id=3D16 bits_offset=3D0
        under_attack_last type_id=3D16 bits_offset=3D64
        packets_sent type_id=3D16 bits_offset=3D128
        packets_sent_time type_id=3D16 bits_offset=3D192
        tcp_packets type_id=3D16 bits_offset=3D256
        misc_packets type_id=3D16 bits_offset=3D320
        a2s_packets type_id=3D16 bits_offset=3D384
        a2sinfo_packets type_id=3D16 bits_offset=3D448
        syn_packets type_id=3D16 bits_offset=3D512
[57] VAR server_rate_limits type_id=3D54 linkage=3D1
[58] STRUCT (anon) size=3D32 vlen=3D4
        type type_id=3D59 bits_offset=3D0
        max_entries type_id=3D61 bits_offset=3D64
        key type_id=3D8 bits_offset=3D128
        value type_id=3D63 bits_offset=3D192
[59] PTR (anon) type_id=3D60
[60] ARRAY (anon) type_id=3D3 index_type_id=3D5 nr_elems=3D9
[61] PTR (anon) type_id=3D62
[62] ARRAY (anon) type_id=3D3 index_type_id=3D5 nr_elems=3D65536
[63] PTR (anon) type_id=3D64
[64] STRUCT ip_addr_history size=3D24 vlen=3D3
        timestamp type_id=3D16 bits_offset=3D0
        hits type_id=3D16 bits_offset=3D64
        created type_id=3D16 bits_offset=3D128
[65] VAR client_rate_limits type_id=3D58 linkage=3D1
[66] PTR (anon) type_id=3D67
[67] STRUCT xdp_md size=3D20 vlen=3D5
        data type_id=3D15 bits_offset=3D0
        data_end type_id=3D15 bits_offset=3D32
        data_meta type_id=3D15 bits_offset=3D64
        ingress_ifindex type_id=3D15 bits_offset=3D96
        rx_queue_index type_id=3D15 bits_offset=3D128
[68] FUNC_PROTO (anon) return=3D3 args=3D(66 ctx)
[69] FUNC xdp_program type_id=3D68 vlen !=3D 0

libbpf: Error loading .BTF into kernel: -22.
bpf_object__find_program_by_title
Segmentation fault (core dumped)

On Wed, Jun 10, 2020 at 2:06 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Elerion <elerion1000@gmail.com> writes:
>
> > I used this to load my xdp program
> > https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c
> > but it doesn't seem to work on new style maps so I am using libbpf
> > bpf_object__open now.
> >
> > But now it shows this
> >
> > libbpf: Error loading BTF: Invalid argument(22)
> > libbpf: magic: 0xeb9f
> > version: 1
> > flags: 0x0
> > hdr_len: 24
> > type_off: 0
> > type_len: 2088
> > str_off: 2088
> > str_len: 11234
> > btf_total_size: 13346
> > [1] STRUCT (anon) size=3D32 vlen=3D4
> >         type type_id=3D2 bits_offset=3D0
> >         max_entries type_id=3D6 bits_offset=3D64
> >         key type_id=3D8 bits_offset=3D128
> >         value type_id=3D12 bits_offset=3D192
> > [2] PTR (anon) type_id=3D4
> > [3] INT int size=3D4 bits_offset=3D0 nr_bits=3D32 encoding=3DSIGNED
> > more type information....
> > libbpf: Error loading .BTF into kernel: -22.
> >
> > How do I fix this?
>
> Usually the last line of type information (which it looks like you
> snipped above?) contains the error, although sometimes it can be hard to
> spot because it looks like part of the type...
>
> -Toke
>
