Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7975B1408A1
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 12:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgAQLHJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 06:07:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39975 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726343AbgAQLHI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 06:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579259227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FD/DgNcM1GLD79brHZ4ucrevIm2zv6khR/Sdh/iU+qM=;
        b=Ln42xij2j492CRS8wAVHKLxJWXaQe6n8uvUwNwAc5hONuJqu0GjuHhsh7gEyKk6PvEnaWF
        hbvSScDIrEQ8WpE/Ns8gdhSWd0WfCGQK9zMvpYgYKXRXdLdKZXbZtabySpz350uaJuJSor
        7lMTeCrI++XV9QcsjyW4x6OFHeY4CXo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-A5i5R8jXMmClccD1cjksUQ-1; Fri, 17 Jan 2020 06:07:06 -0500
X-MC-Unique: A5i5R8jXMmClccD1cjksUQ-1
Received: by mail-lj1-f200.google.com with SMTP id k21so6130141ljg.3
        for <xdp-newbies@vger.kernel.org>; Fri, 17 Jan 2020 03:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=FD/DgNcM1GLD79brHZ4ucrevIm2zv6khR/Sdh/iU+qM=;
        b=GEawped0FiN936BB+BtHEXnjkki9FF9zDZqok18u+Z3np35lK4EdH4KBENe1S4ekmP
         7FhON9NJWyBhHDxZajhylr4IFiJ/aWx1nlaT4OhYM2B1XJ4qcI6qLQ1NvUQFhkxghcMB
         7uoTOoSlkzIiP1VdSwmU66GKlXQOUw1ifLIeGJ9XTQhW5B7EXWE0Wc5o1o5DoMRrWyzy
         aKT7G25U7fMoeWDxdyb0QiIufmud/biHLafdzT8ee+6beRH2gPb86aXuNQMO5uML/0gW
         Cn1x/PUG8XeRe9PNAIkFWG7hF4Ee8Keavp9KTJesaDRUf0mGEVQcEdlBtvAO3rmmvWFL
         tGag==
X-Gm-Message-State: APjAAAUG+ykV4D8G9KhNY6y11HfwbRIB0QRVDPwtpVP9lON97UQvnDdV
        s3VhfKc4EOKq3h8/xlqr8MO6uf/fe28ruUaPDZ1Nia7g1LvFrEXcJ7lll0Ad2jf3GhiLOHcL2Pi
        Q+JLX0YgwndE5K/EnlsvKuq0=
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr5147559lfq.176.1579259224473;
        Fri, 17 Jan 2020 03:07:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLtSDX6E2Zxd2jCBD9EgPbkh8WsMi984qwk3z5d11iErVkCJcVP/GlCslSEB+QKmVt/T8SLg==
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr5147546lfq.176.1579259224267;
        Fri, 17 Jan 2020 03:07:04 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id d24sm12131827lja.82.2020.01.17.03.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 03:07:02 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 1AA911804D6; Fri, 17 Jan 2020 12:07:02 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <mchun.li@gmail.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Vincent Li <mchun.li@gmail.com>, xdp-newbies@vger.kernel.org,
        daniel@iogearbox.net, andriin@fb.com, dsahern@gmail.com
Subject: Re: XDP invalid memory access
In-Reply-To: <alpine.OSX.2.21.2001161059220.5400@jiadeimac.local>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com> <20200116022459.GA2853@ranger.igk.intel.com> <87y2u7spj3.fsf@toke.dk> <alpine.OSX.2.21.2001161059220.5400@jiadeimac.local>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 17 Jan 2020 12:07:02 +0100
Message-ID: <87blr2qr3d.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Vincent Li <mchun.li@gmail.com> writes:

> On Thu, 16 Jan 2020, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>
> Hi Toke,
>
>>=20
>> You could also try the xdp-loader in xdp-tools:
>> https://github.com/xdp-project/xdp-tools
>>=20
>> It's somewhat basic still, but should be able to at least load a basic
>> program - please file a bug report if it fails.
>
> I tried the xdp-tools xdp-loader, when the optlen is global variable, I=20
> got:
> # xdp-loader load enp3s0 tcp_option.o
> Couldn't load BPF program: Relocation failed
>
> if I move the optlen, i variable to local variable, I got:
>
> # xdp-loader load enp3s0 tcp_option.o
> Couldn't load eBPF object: Invalid argument(-22)

OK, I tried this, and there were a couple of issues:

- The xdp-loader didn't set the BPF program type to XDP, and since your
  section name doesn't have an xdp_ prefix libbpf couldn't auto-detect
  it. I've pushed a fix for this to the xdp-tools repo so the loader
  will always set the program type to XDP now.

- There are a couple of bugs in your program:

First, when compiling with warnings turned on, I get this:

tcp_options.c:64:29: error: variable 'op' is uninitialized when used here [=
-Werror,-Wuninitialized]
                        if (op[i] =3D=3D TCPOPT_EOL ) {
                            ^~
tcp_options.c:43:23: note: initialize the variable 'op' to silence this war=
ning
        const __u8 *op;
                      ^
                       =3D 0

after fixing that (adding this line after the optlen =3D assignment):

                op =3D (const __u8 *)(tcphdr + 1);

the verifier then complains about out-of-bounds reading of the packet
data (pass -vv to xdp-loader to get the full debug output from libbpf).
You are not checking that the op pointer doesn't read out-of-bounds.

I fixed that by adding a couple of bounds checks inside the for loop.
The whole thing now looks like this:

                optlen =3D tcphdr->doff*4 - sizeof(*tcphdr);
                op =3D (const __u8 *)(tcphdr + 1);
                for (i =3D 0; i < optlen; ) {
                        if ((void *)op + i + 1 > data_end)
                                return 0;
                        if (op[i] =3D=3D TCPOPT_EOL ) {
                                char fmt[] =3D "XDP: tcp source : %d tcp op=
tion eol\n";
                                bpf_trace_printk(fmt, sizeof(fmt), (int)tcp=
hdr->source);
                                return 1;
                        }
                        if (op[i] < 2)
                                i++;
                        else
                                i +=3D ((void *)op + 2 < data_end && op[i+1=
]) ? : 1;
                }


With this, I can successfully load the program using xdp-loader. Turning
the variables back into globals still doesn't work, but I think that
error message should be fairly obvious:

libbpf: invalid relo for 'op' in special section 0xfff2; forgot to initiali=
ze global var?..

-Toke

