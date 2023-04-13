Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70586E15B0
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Apr 2023 22:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjDMURf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Apr 2023 16:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjDMURf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Apr 2023 16:17:35 -0400
X-Greylist: delayed 357 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Apr 2023 13:17:32 PDT
Received: from one.firstfloor.org (one.firstfloor.org [65.21.254.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC126A7C
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 13:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
        s=mail; t=1681416694;
        bh=2wfVp8wrs2n2AUSQRr0g1VYVcntFpugwOJUSQkIuvhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F6G5B+iikbT8AOixMlna7YmO46iYYGCECeHU3td2Vo3Qv+stDxMwb7uys8gfTCyAI
         RlO6R0cg6rSLPXlgaDRdO6qQoMs9nDhdOPQq1n9FxhG+Kj2newn/dRMAzKgDpYZmDq
         r2ZX+XxnJ5arvvIy9Tu5VCkQrndCpC19CChZtTE8=
Received: by one.firstfloor.org (Postfix, from userid 503)
        id 32A725DA47; Thu, 13 Apr 2023 22:11:34 +0200 (CEST)
Date:   Thu, 13 Apr 2023 13:11:34 -0700
From:   Andi Kleen <andi@firstfloor.org>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     Arnaldo Carvalho de Melo <acme@redhat.com>, brouer@redhat.com,
        Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>,
        Tariq Toukan <tariqt@nvidia.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Qiongwen Xu <qx51@cs.rutgers.edu>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: Question about xdp: how to figure out the throughput is limited
 by pcie
Message-ID: <ZDhh9u+Eqn7Pf0od@firstfloor.org>
References: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
 <b8fa06c4-1074-7b48-6868-4be6fecb4791@redhat.com>
 <CH2PR14MB3657EF09F9A2BE7C08E4C9DBE3989@CH2PR14MB3657.namprd14.prod.outlook.com>
 <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
 <a3e3d310-e234-d3d8-acf4-4ff98fceb593@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3e3d310-e234-d3d8-acf4-4ff98fceb593@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Apr 13, 2023 at 01:59:44PM +0200, Jesper Dangaard Brouer wrote:
> Hi Andi and Acme,
> 
> Regarding below discussion and subj (top-posting as you don't need to
> read discussion to answer my perf questions).
> 
> Can we somehow use perf to profile things happening in PCIe ?
> E.g. Are there any PMU counters "uncore" events for PCIe ?
> 
>   Hint, we can list more PMU counter via Andi's ocperf tool[42].
>   # sudo ./ocperf list
> 
> Could we use the TopDown [toplev] model, to indicate/detect that the
> PCIe device (or PCIe root complex) is the bottleneck?

perf list uncore_iio_free_running has the bandwidth counters 
on Intel servers.

It can be tricky to identify the device for that, there was a patchkit
from Alexander Andronov to make it easier, but I'm not sure if it
made it in.

-Andi
