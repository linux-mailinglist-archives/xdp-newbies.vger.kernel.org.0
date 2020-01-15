Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318C013CE94
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 22:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgAOVDl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 16:03:41 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42423 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729134AbgAOVDk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 16:03:40 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id F3B4721EAE
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 16:03:39 -0500 (EST)
Received: from imap38 ([10.202.2.88])
  by compute5.internal (MEProxy); Wed, 15 Jan 2020 16:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jibi.io; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        mesmtp; bh=hBME1k8CVmyzvO6sToIWP3/JfgAKFAvFljUXIDsNAnQ=; b=qNVcZ
        b5xRRyjUGV5+9vNPuajWR3YARFV+A6tQdxQ0hK5lpFUxPAbXZ+Z0kNO+CScm06+V
        onup1stvZxma8HZr1P8I9EeIFq3O8Sn8O4vplgr6G9tyrH6YCaghVg75ppkFq3KT
        gwj01K9tREJRvR6YhrkTvBooLxZ+POd0Z4bmuE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=hBME1k8CVmyzvO6sToIWP3/JfgAKF
        AvFljUXIDsNAnQ=; b=kVVuhLxTCwAnmTYFvVoiBkn1QB5Erz9EUPfenEmlSfsrs
        +XvMsz0FYx5xnJYj9Gnk7GpXiYhzymfP/M9vm6+Iy5vdDrVxMHgHMUxeGvXUtxDU
        VOGpkeRxKwvNEFiodJbuVnCO8DirKSbyxq9QM7CH7vyVWCF08N8h7d4dU0j1nuHe
        YqxABTyIQrrPrVaavGf5j51gvBFig2zgsRvCuLpg+jANg31z6YlVvjPDq8kpjRiC
        dLEOBYqM4CisnJTqm0Y5NDDZHp/dTkH6CnuQVhIGBg/7p4Ta2kS0vbdeLYaTV/PS
        fWqqkjF1W1/R0/zN9K7bDD1rMhWp3e0BO1tIGgQzw==
X-ME-Sender: <xms:K34fXgAtyCihGJQpOLGPqiR_-EsNhgN8ArkZSt5L_DOT8FMuqpVYcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdefgddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfifhilhgsvghrthhouceuvghrthhinhdfuceomhgvsehjihgs
    ihdrihhoqeenucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehjihgsihdrihhonecuve
    hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:K34fXjxFAy0tRm5fhtRHz5G91pHoxQEXd0NW8eiP3S96AG6J_0t8xw>
    <xmx:K34fXsBmsHiYjGUCK4jKthQ5Gtq21t628ata6DsuA2sh3JKjIKtN7Q>
    <xmx:K34fXs9Q3Wr1TosMJFyiwULj9whmikhQqcCcaf5kKM0lJSH3nCxcBA>
    <xmx:K34fXq7SPa8d4xw8HaYZCJo0StkOrBuVuuAAsXqziU5DNG6ZIS7gvQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A79F44C000A4; Wed, 15 Jan 2020 16:03:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <ee5e4155-f060-4836-bc00-58979c004421@www.fastmail.com>
Date:   Wed, 15 Jan 2020 22:03:19 +0100
From:   "Gilberto Bertin" <me@jibi.io>
To:     xdp-newbies@vger.kernel.org
Subject: Transmitting packets with AF_XDP on lo iface
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all,

I'm playing with AF_XDP with a program based on the sample one in the
xdp-tutorial repo.

The program is a simple UDP echo server, and works fine on any interface
_but_ the loopback one!

When I run it on lo, I can:

* receive packets
* send the responses
* see the UDP packets I'm sending from AF_xDP in tcpdump

but the actual application does not receive any traffic.

I also tried the original example in xdp-tutorial (which replies to ICMP
echo requests rather than UDP packets) and I can observe the same
behaviour.

I'm using:

* xdp-tutorial from master
* Ubuntu 19.10
* kernel 5.3.0

Is this a known issue? Does lo require any special configuration to work
with AF_XDP?

Cheers,
Gilberto
