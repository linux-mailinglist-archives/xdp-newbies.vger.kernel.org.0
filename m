Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1F43623AE
	for <lists+xdp-newbies@lfdr.de>; Fri, 16 Apr 2021 17:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343622AbhDPPRM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 16 Apr 2021 11:17:12 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:15120 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343535AbhDPPPz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 16 Apr 2021 11:15:55 -0400
Date:   Fri, 16 Apr 2021 15:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zemek.io;
        s=protonmail3; t=1618586127;
        bh=xarriiCLoFSVhqTS6cK6BE2q8R8pB/+w1IXQed83HHs=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=TRCfN4ZzJXbbNr34MXXxGQ8GQkzgxtP90JDZqdgoyKaUos5Pd6WdoGEEbPazCcHRY
         WMKL/lz7bkQ0+JVRRDUaK+UXoqE4U3/0Km2eM5JiakXcQ6wqNSaOxJvtMnNTJL21kc
         uti/WjBZWa6efITDN4tLFTgqpl/NL+DN9D/MECD80oXvyiTcBcjM691QCa0nyDqA0A
         3RhIBQLqa0tMX6f6QXaiAj0xRs7+jHFvZxph3rEe3Nxp+7CQhudYmOAkrL7NZnzdPA
         eP/UPfBm0+bq8rbewcj3RLgSRXwKDAREPJHtEDPnmvpvXjqVMIEQgDGYRmeAqKFEsl
         kqUGwS7lhv+MQ==
To:     xdp-newbies@vger.kernel.org
From:   Konrad Zemek <konrad@zemek.io>
Reply-To: Konrad Zemek <konrad@zemek.io>
Subject: RE: bpf_fib_lookup VLAN
Message-ID: <008601d732d3$4fc88ab0$ef59a010$@zemek.io>
In-Reply-To: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io>
References: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io>
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

> Do you have any proposals for a workaround? Right now I'm thinking of cre=
ating a BPF map that would map ifindex->vlan, populated in the userspace
- but that assumes the output (struct bpf_fib_lookup*)->ifindex will be an =
index of the vlan device and not the physical device the vlan is attached o=
n, which I'm not sure is the case yet.

I've confirmed that the ifindex returned is of the virtual/vlan device, so =
the userspace solution seems to be a good workaround for now.



