Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950035EECA0
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Sep 2022 06:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiI2EAT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Sep 2022 00:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiI2EAS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Sep 2022 00:00:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1146D6244
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 21:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BBCB7B8232D
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Sep 2022 04:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD55C433D6;
        Thu, 29 Sep 2022 04:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664424014;
        bh=x3PXbE3VAL8J9aXxW+M0tfozLj74lHfnFU6iZqvDur4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=STHqZRCf/1vmrap+mUkE7DrWygYggSxtbDveoPwkLaUBc7wDh0iMPz9BYQzbu9wdk
         m58nCyCF7+oHCuJwsTnSn0O2yGlxsTWhxTA3eLbKqol2TK9yEUr95f3o81AEbSSmol
         fTIMWi7gEncKRidB5sdjC5/VzlyJT2Uu0+88lhrKSn0p/1vEJ/R11f4J7svAbjk3Ql
         Qwfezm7+28UEII+G9+YFz2ciGprbZgue3n70azG5NBXtoTHYK4r8mDw9COkUNlS/G/
         pVIaFUWh2SdTzKuWqjvzl8965IwgmCfWodsrwWyGN0YfzxjGZdDSYe5vQnhOf1THew
         d0Hxc8BvcdqJQ==
Message-ID: <ee7fff23-17fb-810f-d532-64d74fb477c8@kernel.org>
Date:   Wed, 28 Sep 2022 22:00:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [xdp-cloud] Questions about Offloads and XDP-Hints regarding a
 Cloud-Provider Use-Case
Content-Language: en-US
To:     Jason Wang <jasowang@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net,
        brouer@redhat.com, Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
 <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
 <2d2d13bd-da93-2e04-3fd1-a5fd4713d7df@kernel.org>
 <YzTMmGuZjiO8+dVu@lore-desk>
 <CACGkMEuzJ_gupygHkdmuDkH-upgTjea6rucwt0z97LHLMfsCew@mail.gmail.com>
From:   David Ahern <dsahern@kernel.org>
In-Reply-To: <CACGkMEuzJ_gupygHkdmuDkH-upgTjea6rucwt0z97LHLMfsCew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 9/28/22 7:14 PM, Jason Wang wrote:
> How about other metadata like gso_type, gso_segs, csum_start and
> csum_offset etc? This looks like a must for GSO to work even if
> multi-buffer is supported.

XDP redirect on Rx, packet by packet, only needs checksum valid data.

Tx and GSO is a much bigger problem.
