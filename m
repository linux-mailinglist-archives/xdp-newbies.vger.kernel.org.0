Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFDB1F5D75
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgFJVBV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgFJVBV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:01:21 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278B2C03E96B
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:01:21 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id d21so2128828vsh.12
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jZNMS2ummiZRov9pQ+SqxcRPU1U+Nehm4NVnvm1l9XA=;
        b=fXyx5Uik/jHwTFpVjcM6/9w6cG107sO0l6jBs0k0no3/IL3vtoZN6CSyumEVHTHEtK
         4hphyJzy3OBD2eLRZEEuSsht1hxIDpqBTgxi+16NI2y8wrfigEZ6hIqh1T5j5J1iO+tF
         QtGyzHrd6pxjCzsuTlb2veT2L63OrDFIFGmbacOTyUNtGVNn89lmffyJX1ZS3AuX9XoG
         KE8M6STRnLqgFCGZvXNDgWi1zdXRrVaglrXcrDOSZanfNDE4jcLtw5dx6SLIE3HcKveX
         /FvomSy9FZ+j7s7EycYWHinHYUBBHLYWIxG5K64WjeNAhRR+9o/etgEQzhmeWPwaBxQw
         1zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=jZNMS2ummiZRov9pQ+SqxcRPU1U+Nehm4NVnvm1l9XA=;
        b=VQmYeNlK0jaedXawnCZKn8W6FLrc2SJuVAavJyu6o3tc10IZ2h3iujZ14suoJ96/nV
         WQ/D+3i/BZV+UQMCm3lI2ZClq1ma6Tq0jj5CBY5Owt8ozAuu/cn6skZcZ3LzPhsZgtzF
         w4H1aE3C052+yZU6doI4g+plHvkl0i11JjUvF6b5zN5d54KCoHq2LWVDUIN58ySFpX27
         bRJOYiT44S3/QXlMvrxvuOVJmy/Hu2ENuntwVY9evvs0nmzbnwPJPD9zlRV46i2bG1ij
         aQmCAiYomrwvF4vx7fqjeMz/s5Pi/eiD8d76DLr9jI/ERVf/Ct6GFOXtLbVwtd5QFA3s
         GhUg==
X-Gm-Message-State: AOAM5304M9cuwMe+AKXnb7XW+Pc2DLVPL1t2EIVamWlH6vkvvVOAtYeQ
        FIDetV+Zian8xwsHp8n3Ig88MBAV2b/6WQk0AlBh3iWo
X-Google-Smtp-Source: ABdhPJzuGzGSoekHqkyMOc5w7RpNjfnAJw5f+UxQhaBvMaGSjqrFKIoSEYvFoybX/+i45K/rcUDNYJGxFNwMfeW6Dek=
X-Received: by 2002:a05:6102:21b4:: with SMTP id i20mr4301523vsb.162.1591822879796;
 Wed, 10 Jun 2020 14:01:19 -0700 (PDT)
MIME-Version: 1.0
From:   Elerion <elerion1000@gmail.com>
Date:   Wed, 10 Jun 2020 14:01:09 -0700
Message-ID: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
Subject: Error loading xdp program that worked with bpf_load
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I used this to load my xdp program
https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c
but it doesn't seem to work on new style maps so I am using libbpf
bpf_object__open now.

But now it shows this

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
[1] STRUCT (anon) size=32 vlen=4
        type type_id=2 bits_offset=0
        max_entries type_id=6 bits_offset=64
        key type_id=8 bits_offset=128
        value type_id=12 bits_offset=192
[2] PTR (anon) type_id=4
[3] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
more type information....
libbpf: Error loading .BTF into kernel: -22.

How do I fix this?

5.3.0-53-generic #47~18.04.1-Ubuntu SMP Thu May 7 13:10:50 UTC 2020
x86_64 x86_64 x86_64 GNU/Linux
Ubuntu clang version
10.0.1-++20200529024103+a634a80615b-1~exp1~20200529124721.169
Target: x86_64-pc-linux-gnu
