Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3916D5EE469
	for <lists+xdp-newbies@lfdr.de>; Wed, 28 Sep 2022 20:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiI1ScJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Sep 2022 14:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbiI1ScI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Sep 2022 14:32:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B3B77573
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 11:32:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F3813B821C3
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AA1C433D6;
        Wed, 28 Sep 2022 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664389922;
        bh=NREs/e2OjV3S4mLKZh4Xy85Idb9iwNr5gRSmx/G4sRU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ClJ+iwOl2GHtGk/rdUXdEAnBeSWA7Cm75S39/SVTlbZvyUaMNuAPdb7sCdnAUIy80
         ewKWrD9CPBBbJ7ox3/RM5ckcolXHNiAr5Vac54UNmmyj2dWUItJnV8lq4/MZ/KfRb/
         D7f9kMrwW4r6TeLOvqjMNl8BbWaE7EpJnxQtFJOWaFt9I4VCQiIB1BNnU1diGTSeYN
         B8TLnfMMKh87FWOqisw8cUW0JEFaZ8IfTzI6WK09Ja1RDXaXQop4ekVsY+QO6yswQE
         kNb4h/kLqeYWqAdApKnri7YiiZ45WPgNnVrVtEmQ6I8Ug39E0VSMIOG2g/By0XmSrc
         KdPxcP+pLTBnA==
Message-ID: <2d2d13bd-da93-2e04-3fd1-a5fd4713d7df@kernel.org>
Date:   Wed, 28 Sep 2022 12:32:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [xdp-cloud] Questions about Offloads and XDP-Hints regarding a
 Cloud-Provider Use-Case
Content-Language: en-US
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jason Wang <jasowang@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
 <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
From:   David Ahern <dsahern@kernel.org>
In-Reply-To: <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 9/28/22 11:07 AM, Jesper Dangaard Brouer wrote:
> 
> On 28/09/2022 15.54, Marcus Wichelmann wrote:
>>
>> I'm working for a cloud hosting provider and we're working on a new
>> XDP-based networking stack for our VM-Hosts that uses XDP to
>> accelerate the connectivity of our qemu/KVM VMs to the outside.
>>
> 
> Welcome to the community! Sounds like an excellent use-case and
> opportunity for speeding up the RX packets from physical NIC into the
> VM.  Good to hear someone (again) having this use-case. I've personally

+1

> not been focused on this use-case lately, mostly because community
> members that I was interacting with changed jobs, away from cloud
> hosting companies. Good to have a user back in this area!
> 
> 
>> For this, we use XDP_REDIRECT to forward packets between the physical
>> host NIC and the VM tap devices. The main issue we have now is, that
>> our VM guests have some virtio NIC offloads enabled: rx/tx
>> checksumming, TSO/GSO, GRO and Scatter-Gather.
> 
> Supporting RX-checksumming is part of the plans for XDP-hints, although
> virtio_net is not part of my initial patchset.

Lorenzo and I both had versions of a patch to propagate rx csum
validation to the VM on xdp redirect. I do not recall a version after
this one:

https://lore.kernel.org/netdev/cover.1622222367.git.lorenzo@kernel.org/

and I lost of track of what change is needed for it to go in.

> 
> XDP-redirect with GRO and Scatter-Gather frames are part of the
> multi-buff effort (Cc Lorenzo), but currently XDP_REDIRECT with
> multi-buff is disabled (except for cpumap), because the lack of
> XDP-feature bits, meaning we cannot determine (in kernel) if receiving
> net_device supports multi-buff (Cc Kumar).
> 
>> Currently, these offloads (especially TSO/GSO) are incompatible with
>> XDP_REDIRECT and result in packets being dropped. Because disabling
>> these offloads in all our customer VMs is not a good option, we're
>> searching for ways to support these offloads with XDP.
>>
> 
> To David Ahern, didn't the kernel recently loosen up on having to
> disable these offloads for KVM virtio_net?

not that I am aware. Still need tx offloads disabled.


This summarizes what I was looking into back in 2020, along with the
current state of XDP for VM use case:

https://legacy.netdevconf.info/0x14/pub/slides/24/netdev-0x14-XDP-and-the-cloud.pdf

source code is still on github too.
