Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4AF35EDE84
	for <lists+xdp-newbies@lfdr.de>; Wed, 28 Sep 2022 16:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbiI1ONt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Sep 2022 10:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiI1ONs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Sep 2022 10:13:48 -0400
X-Greylist: delayed 1181 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Sep 2022 07:13:46 PDT
Received: from dediextern.your-server.de (dediextern.your-server.de [85.10.215.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5949E0FC
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 07:13:46 -0700 (PDT)
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by dediextern.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <marcus.wichelmann@hetzner-cloud.de>)
        id 1odXVj-00041D-M5; Wed, 28 Sep 2022 15:54:03 +0200
Received: from [2a01:c22:851c:8e10:36fb:646:c1ce:2b51]
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <marcus.wichelmann@hetzner-cloud.de>)
        id 1odXVj-0004wG-IF; Wed, 28 Sep 2022 15:54:03 +0200
Message-ID: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
Date:   Wed, 28 Sep 2022 15:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     xdp-newbies@vger.kernel.org, cloud@xdp-project.net
From:   Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
Subject: Questions about Offloads and XDP-Hints regarding a Cloud-Provider
 Use-Case
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: marcus.wichelmann@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26672/Wed Sep 28 09:56:56 2022)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I'm working for a cloud hosting provider and we're working on a new 
XDP-based networking stack for our VM-Hosts that uses XDP to accelerate 
the connectivity of our qemu/KVM VMs to the outside.

For this, we use XDP_REDIRECT to forward packets between the physical 
host NIC and the VM tap devices. The main issue we have now is, that our 
VM guests have some virtio NIC offloads enabled: rx/tx checksumming, 
TSO/GSO, GRO and Scatter-Gather.
Currently, these offloads (especially TSO/GSO) are incompatible with 
XDP_REDIRECT and result in packets being dropped. Because disabling 
these offloads in all our customer VMs is not a good option, we're 
searching for ways to support these offloads with XDP.

The XDP multi-buffer support needed for TSO/GSO seems to be mostly there 
already, but, to our understanding, the last missing part for full 
TSO/GSO support is a way to tell the physical NIC to perform the TSO/GSO 
offload.

I've seen  the latest LPC 2022 talk from Jesper Dangaard Brouer 
regarding the planned XDP-Hints feature. But this was mainly about 
Checksum and VLAN offloads. Is supporting TSO/GSO also one of the goals 
you have in mind with these XDP-Hints proposals?

Will the multi-buffer and hints patches be all what's needed to make 
XDP_REDIRECT between a VM (without disabled offloads) and the host NIC 
possible, or are there more things missing in XDP that will become an 
issue in that use-case?

The "XDP Cloud-Provider" project page describes a very similar use-case 
to what we plan to do. What's the goal of this project?

We're very interested in the work on XDP-Hints and in the performance 
benefits that the offloading support could bring to XDP and I would be 
thankful if you could help us with some of our questions.

Best regards,
Marcus Wichelmann
Hetzner Cloud GmbH
