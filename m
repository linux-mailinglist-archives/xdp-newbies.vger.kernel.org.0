Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8EA81F5DCA
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgFJVpO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgFJVpN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:45:13 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ECDC03E96B
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:45:12 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id p187so989830vkf.0
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DTeHtPIZG0OjtkdbrE2e48jds7vvQgSHjnO4bQCi/6Y=;
        b=q44e7MGrK53TTWPWGWr6LWvoMmBO1ttY3/QEId9Aqj1bUHObRypuZKSpOOa5Jb2bcV
         eSujay/KRg7I28idfVDKD2OUiFxOhA6WpLxHVgAy913kIVCABLOq766V3xEwekscwATf
         erBvJnWQW6uSuqggB/x3jFF5UqnNDysqZZulMhAEfBgMQ0HrZ9HJOcT6h3lsMofCdF0r
         nJayQQDjn/fpGorVd37Idm5xhEsrIyoENYIN5cl9mE9OvIntNMyCZyBZ806t0NyD9Wd9
         4DYXqB+x/xN+ZX0u9EteGeleQ3NVfbOuDgfoxOWMpWZsJAPZu/ifCBYmWyl/B6ZwW78e
         zjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DTeHtPIZG0OjtkdbrE2e48jds7vvQgSHjnO4bQCi/6Y=;
        b=Mm8NMXhv0/S/53e4zA1Q4J684NbgAAil681GXbACxJ8vvFq35bdY+6QDU9G9UukId1
         YygEbdJlZDYJbdQdTX//8xeffFe5N9jNF4NezI2k+YfRe08cMyqqH+Zo3lhRR0s37Srs
         xoGhiZRt/plBbMFtGE+8pVuUypPAgRIbA1x9QDUY6Lb8JQax28n0itiaIncNAgS0fZAF
         lEVi7fMdhugKNhTaQLWs7X68wrIm0Aaifvi6aOTLC/yFwKWZ4Q9YC7IYK4XSjNZ9JCSY
         jbbDvlKrG4ws96ng1qkY4JADUoB8/M937+dZ6TIDFLs5UyMiAmEGj71y9ipm/Th2rLSP
         4cZg==
X-Gm-Message-State: AOAM531DxBjPR2rv8Dade6ZvL96YgB/tEtjNmP14mu4DuY4FQdaSqy2W
        Ttcvh8t2wbcoCnn1PlfP72GR41jRTzqsXagQBHs=
X-Google-Smtp-Source: ABdhPJywYvDu58J7bNaGuPThbvGbQtyGHlqvNh8emcBDkYTnIBs/NZJZd2qIQ/CQoPzo7rRGl60NIpsfFUmaeX+P7kQ=
X-Received: by 2002:a1f:1f4c:: with SMTP id f73mr2922961vkf.102.1591825509626;
 Wed, 10 Jun 2020 14:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
 <87a71a7gay.fsf@toke.dk>
In-Reply-To: <87a71a7gay.fsf@toke.dk>
From:   Elerion <elerion1000@gmail.com>
Date:   Wed, 10 Jun 2020 14:44:58 -0700
Message-ID: <CAMDScmkJNWXnYxJuFjUQSOte-Wh_kmO_M-b9raEE8Ban9nzpnQ@mail.gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

[1] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D2 bits_offset=3D0
        'max_entries' type_id=3D6 bits_offset=3D64
        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D12 bits_offset=3D192
[2] PTR '(anon)' type_id=3D4
[3] INT 'int' size=3D4 bits_offset=3D0 nr_bits=3D32 encoding=3DSIGNED
[4] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D2
[5] INT '__ARRAY_SIZE_TYPE__' size=3D4 bits_offset=3D0 nr_bits=3D32 encodin=
g=3D(none)
[6] PTR '(anon)' type_id=3D7
[7] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D1
[8] PTR '(anon)' type_id=3D9
[9] TYPEDEF 'uint32_t' type_id=3D10
[10] TYPEDEF '__uint32_t' type_id=3D11
[11] INT 'unsigned int' size=3D4 bits_offset=3D0 nr_bits=3D32 encoding=3D(n=
one)
[12] PTR '(anon)' type_id=3D13
[13] STRUCT 'config' size=3D48 vlen=3D6
        'lock' type_id=3D14 bits_offset=3D0
        'new_conn_limit' type_id=3D16 bits_offset=3D64
        'rate_limit' type_id=3D16 bits_offset=3D128
        'main_ip' type_id=3D18 bits_offset=3D192
        'new_ip_count' type_id=3D16 bits_offset=3D256
        'new_ip_timestamp' type_id=3D16 bits_offset=3D320
[14] STRUCT 'bpf_spin_lock' size=3D4 vlen=3D1
        'val' type_id=3D15 bits_offset=3D0
[15] TYPEDEF '__u32' type_id=3D11
[16] TYPEDEF 'uint_fast64_t' type_id=3D17
[17] INT 'long long unsigned int' size=3D8 bits_offset=3D0 nr_bits=3D64
encoding=3D(none)
[18] TYPEDEF 'uint_fast32_t' type_id=3D11
[19] VAR 'config_map' type_id=3D1, linkage=3Dglobal-alloc
[20] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D21 bits_offset=3D0
        'max_entries' type_id=3D6 bits_offset=3D64
        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D23 bits_offset=3D192
[21] PTR '(anon)' type_id=3D22
[22] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D6
[23] PTR '(anon)' type_id=3D24
[24] STRUCT 'global_stats' size=3D40 vlen=3D5
        'packet_in' type_id=3D16 bits_offset=3D0
        'packet_out' type_id=3D16 bits_offset=3D64
        'bytes_in' type_id=3D16 bits_offset=3D128
        'bytes_out' type_id=3D16 bits_offset=3D192
        'packets_dropped' type_id=3D16 bits_offset=3D256
[25] VAR 'stats_map' type_id=3D20, linkage=3Dglobal-alloc
[26] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D6 bits_offset=3D0
        'max_entries' type_id=3D27 bits_offset=3D64
        'key' type_id=3D29 bits_offset=3D128
        'value' type_id=3D32 bits_offset=3D192
[27] PTR '(anon)' type_id=3D28
[28] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D512
[29] PTR '(anon)' type_id=3D30
[30] TYPEDEF 'uint64_t' type_id=3D31
[31] TYPEDEF '__uint64_t' type_id=3D17
[32] PTR '(anon)' type_id=3D33
[33] STRUCT 'forwarding_rule' size=3D40 vlen=3D9
        'bind_addr' type_id=3D9 bits_offset=3D0
        'bind_port' type_id=3D34 bits_offset=3D32
        'to_addr' type_id=3D9 bits_offset=3D64
        'to_port' type_id=3D34 bits_offset=3D96
        'steam_port' type_id=3D34 bits_offset=3D112
        'inner_addr' type_id=3D9 bits_offset=3D128
        'a2s_info_cache' type_id=3D18 bits_offset=3D160
        'cache_time' type_id=3D16 bits_offset=3D192
        'tcp_port1' type_id=3D34 bits_offset=3D256
[34] TYPEDEF 'uint16_t' type_id=3D35
[35] TYPEDEF '__uint16_t' type_id=3D36
[36] INT 'unsigned short' size=3D2 bits_offset=3D0 nr_bits=3D16 encoding=3D=
(none)
[37] VAR 'tunnel_map' type_id=3D26, linkage=3Dglobal-alloc
[38] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D2 bits_offset=3D0
        'max_entries' type_id=3D27 bits_offset=3D64
        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D32 bits_offset=3D192
[39] VAR 'forwarding_map' type_id=3D38, linkage=3Dglobal-alloc
[40] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D6 bits_offset=3D0
        'max_entries' type_id=3D27 bits_offset=3D64
        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D41 bits_offset=3D192
[41] PTR '(anon)' type_id=3D42
[42] STRUCT 'a2s_info_cache_entry' size=3D40 vlen=3D6
        'age' type_id=3D30 bits_offset=3D0
        'misses' type_id=3D30 bits_offset=3D64
        'hits' type_id=3D30 bits_offset=3D128
        'udp_data' type_id=3D43 bits_offset=3D192
        'len' type_id=3D34 bits_offset=3D256
        'csum' type_id=3D9 bits_offset=3D288
[43] PTR '(anon)' type_id=3D44
[44] TYPEDEF 'uint8_t' type_id=3D45
[45] TYPEDEF '__uint8_t' type_id=3D46
[46] INT 'unsigned char' size=3D1 bits_offset=3D0 nr_bits=3D8 encoding=3D(n=
one)
[47] VAR 'a2s_info_cache_map' type_id=3D40, linkage=3Dglobal-alloc
[48] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D49 bits_offset=3D0

        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D8 bits_offset=3D192
[49] PTR '(anon)' type_id=3D50
[50] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D17
[51] PTR '(anon)' type_id=3D52
[52] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D128
[53] VAR 'xsk_map' type_id=3D48, linkage=3Dglobal-alloc
[54] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D6 bits_offset=3D0
        'max_entries' type_id=3D27 bits_offset=3D64
        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D55 bits_offset=3D192
[55] PTR '(anon)' type_id=3D56
[56] STRUCT 'server_rate_limit_entry' size=3D72 vlen=3D9
        'under_attack_start' type_id=3D16 bits_offset=3D0
        'under_attack_last' type_id=3D16 bits_offset=3D64
        'packets_sent' type_id=3D16 bits_offset=3D128
        'packets_sent_time' type_id=3D16 bits_offset=3D192
        'tcp_packets' type_id=3D16 bits_offset=3D256
        'misc_packets' type_id=3D16 bits_offset=3D320
        'a2s_packets' type_id=3D16 bits_offset=3D384
        'a2sinfo_packets' type_id=3D16 bits_offset=3D448
        'syn_packets' type_id=3D16 bits_offset=3D512
[57] VAR 'server_rate_limits' type_id=3D54, linkage=3Dglobal-alloc
[58] STRUCT '(anon)' size=3D32 vlen=3D4
        'type' type_id=3D59 bits_offset=3D0
        'max_entries' type_id=3D61 bits_offset=3D64
        'key' type_id=3D8 bits_offset=3D128
        'value' type_id=3D63 bits_offset=3D192
[59] PTR '(anon)' type_id=3D60
[60] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D9
[61] PTR '(anon)' type_id=3D62
[62] ARRAY '(anon)' type_id=3D3 index_type_id=3D5 nr_elems=3D65536
[63] PTR '(anon)' type_id=3D64
[64] STRUCT 'ip_addr_history' size=3D24 vlen=3D3
        'timestamp' type_id=3D16 bits_offset=3D0
        'hits' type_id=3D16 bits_offset=3D64
        'created' type_id=3D16 bits_offset=3D128
[65] VAR 'client_rate_limits' type_id=3D58, linkage=3Dglobal-alloc
[66] PTR '(anon)' type_id=3D67
[67] STRUCT 'xdp_md' size=3D20 vlen=3D5
        'data' type_id=3D15 bits_offset=3D0
        'data_end' type_id=3D15 bits_offset=3D32
        'data_meta' type_id=3D15 bits_offset=3D64
        'ingress_ifindex' type_id=3D15 bits_offset=3D96
        'rx_queue_index' type_id=3D15 bits_offset=3D128
[68] FUNC_PROTO '(anon)' ret_type_id=3D3 vlen=3D1
        'ctx' type_id=3D66
[69] FUNC 'xdp_program' type_id=3D68
[70] INT 'char' size=3D1 bits_offset=3D0 nr_bits=3D8 encoding=3DSIGNED
[71] ARRAY '(anon)' type_id=3D70 index_type_id=3D5 nr_elems=3D4
[72] VAR '_license' type_id=3D71, linkage=3Dglobal-alloc
[73] DATASEC '.maps' size=3D0 vlen=3D8
        type_id=3D19 offset=3D0 size=3D32
        type_id=3D25 offset=3D0 size=3D32
        type_id=3D37 offset=3D0 size=3D32
        type_id=3D39 offset=3D0 size=3D32
        type_id=3D47 offset=3D0 size=3D32
        type_id=3D53 offset=3D0 size=3D32
        type_id=3D57 offset=3D0 size=3D32
        type_id=3D65 offset=3D0 size=3D32
[74] DATASEC 'license' size=3D0 vlen=3D1
        type_id=3D72 offset=3D0 size=3D4

On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Elerion <elerion1000@gmail.com> writes:
>
> > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0
>
> 'vlen !=3D 0' is the error. Not sure why you hit that; what's the output
> of 'bpftool btf dump file yourprog.o' ?
>
> -Toke
>
