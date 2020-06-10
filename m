Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BDE1F5D7A
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgFJVGT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:06:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36774 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726134AbgFJVGR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591823176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JJseaQ+dpsHGNk9wx3XQ11Yu2xS5dObZcnm00xBmVvI=;
        b=T9sUSgxykL3mzBd6cFUNOtUYFlFqGD4t3LGG+rgSkzUZs1Op61G+QYXWGAL6+DT8Cueb5F
        9ZbRUlcua5CdpjWK/7DDkwZdyUtY02JtgYx0F7UWGbdyHyGIkCs0RwJ8GYdsR0Ryc6YVQc
        JfyZ4YU9Si/O9VRJzB2DtUIsFUNNKsQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-B83budF9OFyBwmqB4MTFpg-1; Wed, 10 Jun 2020 17:06:13 -0400
X-MC-Unique: B83budF9OFyBwmqB4MTFpg-1
Received: by mail-ej1-f70.google.com with SMTP id i17so1670925ejb.9
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=JJseaQ+dpsHGNk9wx3XQ11Yu2xS5dObZcnm00xBmVvI=;
        b=sJRiQ07ggB7n462EBLgrguSOVIBfceOj+cK623yiSePBzl+PbvLtvMSw+305Bvhvkr
         oHf7QX7td6KAajjlfJ7pH41J4jjvGqfktyD4a59oElqnlEoGodQw/rHnBc4Ad78IbcBb
         gwW9LNFVKIPiSNp1S5bsT6dvtZkTTegWUMRgBB9e2/e23OE/fXsxZ0jOxe2qt0dyAyQs
         DjSSrUY6vs96N7vjgtqceUgv24L7CDEiBkVFKP6ghGA9dn/YGI73W3AUjm4iZ/0tnH/U
         Xr59t51nIG56zJjlWQYji1VXRAxj1SA52kaTeqFBYUGkXefGhT0/q2PQAzuXfLT6L929
         lOmg==
X-Gm-Message-State: AOAM533KJoJQvNZTAbMLJxapCuyEziz31lgI4US5kIUHVo+NiKsglYta
        VEhh9WpTXLO9Db1R4M4tYwTsrWf5reG6DQeIilyIwkfEmXhFELi5mpoeVEerePAz0hvxvk5VrOM
        S4dRMH8NBVofLilREQxN4BGk=
X-Received: by 2002:a17:906:ce30:: with SMTP id sd16mr5494036ejb.374.1591823171891;
        Wed, 10 Jun 2020 14:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0+rZy7e1V4Hfs2y4n9QPJpCUcKywhBUQ2uqSpc2rYiOMv17RLHTpQl2K8lW01Sdc9NetrNw==
X-Received: by 2002:a17:906:ce30:: with SMTP id sd16mr5494022ejb.374.1591823171705;
        Wed, 10 Jun 2020 14:06:11 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id k8sm448844edn.28.2020.06.10.14.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 14:06:11 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B1BE71814F0; Wed, 10 Jun 2020 23:06:10 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Elerion <elerion1000@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Error loading xdp program that worked with bpf_load
In-Reply-To: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 10 Jun 2020 23:06:10 +0200
Message-ID: <87imfy7hrx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Elerion <elerion1000@gmail.com> writes:

> I used this to load my xdp program
> https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c
> but it doesn't seem to work on new style maps so I am using libbpf
> bpf_object__open now.
>
> But now it shows this
>
> libbpf: Error loading BTF: Invalid argument(22)
> libbpf: magic: 0xeb9f
> version: 1
> flags: 0x0
> hdr_len: 24
> type_off: 0
> type_len: 2088
> str_off: 2088
> str_len: 11234
> btf_total_size: 13346
> [1] STRUCT (anon) size=32 vlen=4
>         type type_id=2 bits_offset=0
>         max_entries type_id=6 bits_offset=64
>         key type_id=8 bits_offset=128
>         value type_id=12 bits_offset=192
> [2] PTR (anon) type_id=4
> [3] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> more type information....
> libbpf: Error loading .BTF into kernel: -22.
>
> How do I fix this?

Usually the last line of type information (which it looks like you
snipped above?) contains the error, although sometimes it can be hard to
spot because it looks like part of the type...

-Toke

