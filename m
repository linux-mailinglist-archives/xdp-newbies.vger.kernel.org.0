Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62263361F47
	for <lists+xdp-newbies@lfdr.de>; Fri, 16 Apr 2021 14:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbhDPMER (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 16 Apr 2021 08:04:17 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:56748 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbhDPMER (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 16 Apr 2021 08:04:17 -0400
Date:   Fri, 16 Apr 2021 12:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zemek.io;
        s=protonmail3; t=1618574629;
        bh=1MYWQ/y6Qa5p1iKAzka+z2OJh+gWVVfcHmlawaLMyWs=;
        h=Date:To:From:Reply-To:Subject:From;
        b=Rt/RdqY/QTSUMzX70El6UNdErc0sHuxV/2sOxWW8s/zv96YaYfX8qg846NmAECW8C
         uaZR/IoeKCtg0c/buneWUlO37dHPfA8Wmm1w2tSrPSxn53nA+d+ktHMM8M5tmGUpB1
         36C3J+MLfUoxElLHE/GIbELnMWhVpt9vP07Xa87RdJPUXbQXSbU1BRFLVhF2GZqVRy
         Pm3/iUakhhVy3VrQQmTXH4VI65hftYkxUpmql7zDdt8e2VCxOTGqrfU99/RsrvPyPF
         vCXY5EUPm0dmushxLZxvQQhB7rZ+tmqpx0xGmMuo5k6GOfU4BzjlE5Ri2AjwBXeSkK
         LurUkcJnNRK7w==
To:     xdp-newbies@vger.kernel.org
From:   Konrad Zemek <konrad@zemek.io>
Reply-To: Konrad Zemek <konrad@zemek.io>
Subject: bpf_fib_lookup VLAN
Message-ID: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi everyone,

I've been bitten today by bpf_fib_lookup, which I use to lookup a new
neighbor after pushing some tunnel headers in XDP. Some of the tunneled
packets have to go through a specific VLAN or they get lost - and debugging
an issue today it looks like all my generated packets have no VLAN header a=
t
all! Digging through the kernel code, both the ipv4 and ipv6 lookup routine=
s
end with a `return bpf_fib_set_fwd_params`, which is defined as:

static int bpf_fib_set_fwd_params(struct bpf_fib_lookup *params,
=09=09=09=09  const struct neighbour *neigh,
=09=09=09=09  const struct net_device *dev, u32 mtu)
{
=09memcpy(params->dmac, neigh->ha, ETH_ALEN);
=09memcpy(params->smac, dev->dev_addr, ETH_ALEN);
=09params->h_vlan_TCI =3D 0;
=09params->h_vlan_proto =3D 0;
=09if (mtu)
=09=09params->mtu_result =3D mtu; /* union with tot_len */

=09return 0;
}

So both vlan fields in the output struct bpf_fib_lookup are always zero. I
haven't seen this commented on anywhere, including the discussion around
introducing bpf_fib_lookup, so I assume it's an accidental oversight.

Do you have any proposals for a workaround? Right now I'm thinking of
creating a BPF map that would map ifindex->vlan, populated in the userspace
- but that assumes the output (struct bpf_fib_lookup*)->ifindex will be an
index of the vlan device and not the physical device the vlan is attached
on, which I'm not sure is the case yet.

Thanks,
Konrad Zemek


