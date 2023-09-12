Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3CC279D939
	for <lists+xdp-newbies@lfdr.de>; Tue, 12 Sep 2023 20:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjILSzl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 12 Sep 2023 14:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbjILSzk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 12 Sep 2023 14:55:40 -0400
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0ADB125;
        Tue, 12 Sep 2023 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
        bh=H3/XY/jv4icK4NgBoiigxpPa2AsF3Mqwv5r97vJFS/w=; b=RA/wx0tUm3Vp9scFBNIDz5aBad
        57SO6Le9cPhQkKGGqL0nuOWzThcfhm/53JrwETkK8H/mmRCQ0ZrhvuD7f+ydRQcrPNZH6SWygJGf3
        8STCqlopXi0x3/sePJEWe0YZiQ6luUOP89ZHecuzQQfMdlpdNHFCdtgv2F+XEw9hKwIvMnXiYUpal
        sQDaWolmVS4DnMULSTLViflt+VJXZKjtKQgA5++MOrXm4tfD4ids5GZQVvi41ZmaowzFaCjhGr09r
        9GYGDGgQ4R2OHXpmQT1XdfKzrDs1nWBMvk17ipTFo2pTenXGGcFs4UcPHC3n5bbBM0pyXPbrEQdo0
        34HuguIQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <daniel@iogearbox.net>)
        id 1qg8Xp-000FQs-8e; Tue, 12 Sep 2023 20:55:29 +0200
Received: from [194.230.161.182] (helo=localhost.localdomain)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1qg8Xo-00041T-OO; Tue, 12 Sep 2023 20:55:29 +0200
Subject: LPC 2023 Networking and BPF Track CFP (Reminder)
From:   Daniel Borkmann <daniel@iogearbox.net>
To:     netdev@vger.kernel.org, bpf@vger.kernel.org
Cc:     xdp-newbies@vger.kernel.org, linux-wireless@vger.kernel.org,
        netfilter-devel@vger.kernel.org
References: <1515db2c-f517-76da-8aad-127a67da802f@iogearbox.net>
 <db3003d6-733b-099f-ef73-abce750d66c6@iogearbox.net>
Message-ID: <5c9482c9-1f61-2886-4137-a2e2679b2662@iogearbox.net>
Date:   Tue, 12 Sep 2023 20:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <db3003d6-733b-099f-ef73-abce750d66c6@iogearbox.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/27029/Tue Sep 12 09:38:51 2023)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This is a reminder for the Call for Proposals (CFP) for the Networking and
BPF track at the 2023 edition of the Linux Plumbers Conference (LPC) which is
taking place in Richmond, VA, United States, on November 13th - 15th, 2023.

Note that the conference is planned to be both in person and remote (hybrid).
CFP submitters should ideally be able to give their presentation in person to
minimize technical issues, although presenting remotely will also be possible.

The Networking and BPF track technical committee consists of:

     David S. Miller <davem@davemloft.net>
     Jakub Kicinski <kuba@kernel.org>
     Paolo Abeni <pabeni@redhat.com>
     Eric Dumazet <edumazet@google.com>
     Alexei Starovoitov <ast@kernel.org>
     Daniel Borkmann <daniel@iogearbox.net>
     Andrii Nakryiko <andrii@kernel.org>
     Martin Lau <martin.lau@linux.dev>

We are seeking proposals of 30 minutes in length (including Q&A discussion). Any
kind of advanced Linux networking and/or BPF related topic will be considered.

Please submit your proposals through the official LPC website at:

     https://lpc.events/event/17/abstracts/

Make sure to select "eBPF & Networking Track" in the track pull-down menu.

Proposals must be submitted by September 27th, and submitters will be notified
of acceptance by October 2nd. Final slides (as PDF) are due on the first day of
the conference.

We are very much looking forward to a great conference and seeing you all!
