Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BFD590659
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Aug 2022 20:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbiHKSV7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Aug 2022 14:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbiHKSV6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Aug 2022 14:21:58 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA25D624F
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660242117; x=1691778117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wNGtd33mNlaPsi6uTyYY9xYtLMfRyQAIvuGLR+bepOY=;
  b=MxqZoK+zDsqzXO1WPqkrBD3DuxEoUevxoko3ZLIKPikrpbaRsgqr80TO
   LMihj5tWnr8cz6KJmG+FmUJHchUHYM6LVrwyTiTiPd7XMLIkRsWx8A/PA
   /onYkX7OEMwleGeraRHUF+4GEGPPmkiBLcYSVuAixZhpZcOCOWpkGwcVi
   TZebW3oyE84ppLMBj5gEDTH24eRQ6ZSgdvi0AxAZSlAUoPig5v5+n3vH3
   w8Lw4QKvzJx0qdqZhfye4Crd0xm+HX9+hZ3+Kk2cJ8aRT7UKiyaQeLHqr
   MYNX2M6IzEe3YGM59/EW+PEKNLxz8RiIjHiUD1URhDDQFwbcxsRRn2LHd
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="377719598"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="377719598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 11:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="933426138"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2022 11:21:56 -0700
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     intel-wired-lan@lists.osuosl.org
Cc:     magnus.karlsson@intel.com, alasdair.mcwilliam@outlook.com,
        xdp-newbies@vger.kernel.org,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH intel-net 0/2] ice: xsk: reduced queue count fixes
Date:   Thu, 11 Aug 2022 20:21:47 +0200
Message-Id: <20220811182149.145358-1-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

this small series is supposed to fix the issues around AF_XDP usage with
reduced queue count on interface. Due to the XDP rings setup, some
configurations can result in sockets not seeing traffic flowing. More
about this in description of patch 2.

Thanks!
Maciej

Maciej Fijalkowski (2):
  ice: xsk: prohibit usage of non-balanced queue id
  ice: xsk: use Rx ring's XDP ring when picking NAPI context

 drivers/net/ethernet/intel/ice/ice.h      | 36 +++++++++++++++--------
 drivers/net/ethernet/intel/ice/ice_lib.c  |  4 +--
 drivers/net/ethernet/intel/ice/ice_main.c | 25 +++++++++++-----
 drivers/net/ethernet/intel/ice/ice_xsk.c  | 18 ++++++++----
 4 files changed, 54 insertions(+), 29 deletions(-)

-- 
2.27.0

