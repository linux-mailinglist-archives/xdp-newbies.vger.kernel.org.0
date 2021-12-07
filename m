Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B0D46C1B8
	for <lists+xdp-newbies@lfdr.de>; Tue,  7 Dec 2021 18:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239990AbhLGRbr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 Dec 2021 12:31:47 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:44822 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239986AbhLGRbr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 7 Dec 2021 12:31:47 -0500
Date:   Tue, 07 Dec 2021 17:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
        s=protonmail2; t=1638898091;
        bh=NptX2N5ozhMGsRpRlk3KpjyRBcB6DIDF/IpLQOQOzZE=;
        h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
        b=eEmEHeBa2PdLdzMD9LArOE8jD9MAJPHFbFkKZic30wqJky1ppRVNqmvhHHt1pZ7oW
         UBkhn1W2UQbpJLXcoPwEgyyTvLr0mFF35mt4hbU/9Uim/O6Ccu0kvdCgUhWdfSjOEI
         B0+5tfoW8HI3nZd6IilbkSOYddgzcSqpqGb4BQIecQm2DXz9tIn33Of78UpzknjkZY
         xqLp8+tT3jTWOyhOAXWgfs4e6Iq/BtgbVNpaD/TvTohCEw6b2G0C5kRZBXQJffxtZJ
         IJ59ueejPRJoe3wz3zdZjNOjc2zqEHHm9a+JsstLRfEUdG+CSyA0l/A+pEHELG+pqj
         VCq6/qSBmn8CA==
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
From:   Bastien Dhiver <bastn@pm.me>
Reply-To: Bastien Dhiver <bastn@pm.me>
Subject: Shared UMEM with interfaces in different network namespaces
Message-ID: <7TYahw4vLEn_ahN4sB_sKjFiELK94NO6CBlyVLuVEZ6Rh_phtSSluM-6JamEldEprn1vkaPltRNhuxP9H9AsE905JuXTRHgPadDJqHifY0o=@pm.me>
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

Hi,

I am using AF_XDP to forward packets between two Veth interfaces that are i=
n two different network namespaces. The way I am currently doing this is by=
 having one UMEM and one AF_XDP socket handled by a thread in each network =
namespace. When a packet arrives on the XSK RX ring in network namespace A,=
 a pointer to the data frame (with the data length) is shared with thread B=
, which then copies it into a new descriptor in the XSK TX ring and submits=
 it.

My goal is to reduce the memory consumption and improve performance by havi=
ng a single UMEM shared between both Veth interfaces in order to forward pa=
ckets without copying them from one interface to the other.

The first idea that I had was to create the UMEM in the root namespace and =
then to create the XSK in the threads with the same UMEM pointer. No errors=
 arise from wiring it this way, but peeking on the RXQ always returns 0.

Here is a code snippet to illustrate the previous paragraph: https://gist.g=
ithub.com/Dhiver/b821006c0166834a871fb00d50274770. Descriptors are only rec=
eived when the UMEM is also created in "test-ns" network namespace.

What am I doing wrong? Is it even possible?

Best regards,
Bastien
