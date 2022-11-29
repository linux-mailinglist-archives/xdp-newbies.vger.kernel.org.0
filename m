Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C550663BFE9
	for <lists+xdp-newbies@lfdr.de>; Tue, 29 Nov 2022 13:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiK2MUy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 29 Nov 2022 07:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbiK2MUx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 29 Nov 2022 07:20:53 -0500
X-Greylist: delayed 335 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Nov 2022 04:20:30 PST
Received: from umail2.aei.mpg.de (umail2.aei.mpg.de [194.94.224.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9055D6B6
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 04:20:30 -0800 (PST)
Received: from mephisto.aei.uni-hannover.de (p5dccef90.dip0.t-ipconnect.de [93.204.239.144])
        by umail2.aei.mpg.de (Postfix) with ESMTPSA id 9DA7922A349C
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 13:14:52 +0100 (CET)
Date:   Tue, 29 Nov 2022 13:14:51 +0100
From:   Henning Fehrmann <henning.fehrmann@aei.mpg.de>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: make XDP program aware of multi buffer
Message-ID: <Y4X3u39irCVmVxZx@mephisto.aei.uni-hannover.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_50,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

we use XDP/BPF programs to redirect and record network data.
We run the 6.0.9 vanilla kernel with the delivered Mellanox driver.
We mounted MT28800 NICs.

As this scheme seems to work reliably we'd like to step forward and
enable multi buffer packets. We get the following message from the driver:

mlx5_core 0000:01:00.0 enp1s0f0np0: XDP is not allowed with striding RQ and MTU(9000) > 3498

We turned striding off and now we get:

mlx5_core 0000:01:00.0 enp1s0f0np0: MTU(9000) > 3498, too big for an XDP program not aware of multi buffer

It seems that we have to make the XDP program aware of multi buffer.
What would be the correct way to do it?

Thank you,
Henning
