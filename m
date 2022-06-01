Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841D453A52E
	for <lists+xdp-newbies@lfdr.de>; Wed,  1 Jun 2022 14:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346776AbiFAMhO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 1 Jun 2022 08:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243634AbiFAMhN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 1 Jun 2022 08:37:13 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E944393D6
        for <xdp-newbies@vger.kernel.org>; Wed,  1 Jun 2022 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654087032; x=1685623032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VPgn1PYz03JZm2Lp1T2glIohGoU5PPcBVh0yP6RoxBo=;
  b=hCrd/MRi8xjdwjE5F+qdJJTjNo3IB7sQHn674y9vc2FD8yhceZnlREr/
   gzW9JVwArmCgQva8k4LLsXqRSGC92RFgTJIvG0ry9TL9Ge/y3XhcEFWK6
   BvslTpM4kw8YOBdBUa0efCEDQjCg+I+1X6L/csAS/ffzXZMZWdRfgxqaf
   GXwPUxYLXlqqyC60H5da+lWY2YYFkD/8lUqBgdN/BknVMPqJ+wPKzxEvs
   F+Rqjmke23sDZlyvJMTiqopc+WjuubMuDDPerhOQzGsl+M+hjVeUXGhjx
   YG43XXwBwSFg6eIGXezE0PRy08rQt4z4xR6s+iiaNKq2znStBxwtnDYlr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="257641411"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="257641411"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 05:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="904434692"
Received: from boxer.igk.intel.com (HELO boxer) ([10.102.20.173])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2022 05:37:10 -0700
Date:   Wed, 1 Jun 2022 14:37:10 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Howard Lum <hlum@synamedia.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: af_xdp_user.c limits
Message-ID: <YpdddqZdAWl3QZUK@boxer>
References: <CWXP265MB55671EE214D9307E179AE3F3C8DC9@CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CWXP265MB55671EE214D9307E179AE3F3C8DC9@CWXP265MB5567.GBRP265.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, May 31, 2022 at 10:32:57PM +0000, Howard Lum wrote:
> I have some questions regarding the limits in
> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/af_xdp_user.c
> 
> NUM_FRAMES is hard-coded to 4096. Can I change NUM_FRAMES to 65536 to buffer a large number of packets?

I think that you can, as long as mmap() call succeeds that is supposed to
map the umem memory between user and kernel space.

> 
> FRAME_SIZE is hard-coded to XSK_UMEM__DEFAULT_FRAME_SIZE which is 4096 bytes in my setup. Can I just change FRAME_SIZE to 2048 to save memory?

For aligned mode, both 2k and 4k frames are supported. You can also use
unaligned mode, but that requires huge pages under the hood.

> 
> XSK_RING_CONS__DEFAULT_NUM_DESCS is used to set the rx ring size to 2048. I have a NIC that can handle 8192 packets. Should I adjust the rx ring size to match?
> 
> XSK_RING_PROD__DEFAULT_NUM_DESCS is used to set the tx ring size to 2048. Similarly, should I adjust the tx ring size to match the NIC?

Only thing we suggest is to keep the fill queue length >= HW Rx + XSK Rx
lengths. See:
https://elixir.bootlin.com/linux/latest/source/samples/bpf/xdpsock_user.c#L955

Besides that, XSK ring lenghts don't have to match HW ring lenghts. Up to
your setup and environment.

> 
> Howard
> 
> 
> This message and any attachment are confidential and may be privileged or otherwise protected from disclosure. If you are not the intended recipient, please notify the sender immediately and delete this message and any attachment from your system. Do not copy them or disclose the contents to any other person.
