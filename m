Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED2B4F3DCC
	for <lists+xdp-newbies@lfdr.de>; Tue,  5 Apr 2022 22:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236385AbiDEOIs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 5 Apr 2022 10:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355718AbiDELzZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 5 Apr 2022 07:55:25 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491FC2AC5C
        for <xdp-newbies@vger.kernel.org>; Tue,  5 Apr 2022 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649157118; x=1680693118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YVRZC4U8rMslT/5Iog9XJ07fPUIoCPEmNYXhmpq5F3A=;
  b=Sw9aak2Yz0ID/9QN4IIq1jMFoOiQHLnwbX2+wsUT6nFyIJO63unb57Vp
   5Y1alnsGIG2dZDC2DejPRyou6qlQ6ik/ahccQvSuM5sTgFOboZZGVbLL1
   JQZiotZA+kZtDGyW/HzaX3R6Svh1Rug8e/T/GvXwyRaBOXHxi5D5Bu06Y
   p/bvfXO2sJxqiGx0rd5dX8Idw2QYfk8/slr9UJAJ6caXxWz5ZhLZO002/
   0DQR6gzDffEiwf4qzQSSI8tbGPlXn9ghQnzYIxkDae7f9tFOeTe9Lj0iZ
   hk3/3RVpprX6ahw3AZTxSiBPIeBR5C2BCqysT+XAQp10UdzWhCfF6Q1ap
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258307694"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="258307694"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 04:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="722008888"
Received: from boxer.igk.intel.com (HELO boxer) ([10.102.20.173])
  by orsmga005.jf.intel.com with ESMTP; 05 Apr 2022 04:11:55 -0700
Date:   Tue, 5 Apr 2022 13:11:55 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     "eric@sage.org" <eric@sage.org>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
        Kal Cutter Conley <kal.conley@dectris.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
Subject: Re: XDP multi-buffer and AF_XDP
Message-ID: <Ykwj+ycjc+F70iko@boxer>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk>
 <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
 <YkcDgmldUGWoFWmQ@sage-macbook-pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkcDgmldUGWoFWmQ@sage-macbook-pro.local>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 01, 2022 at 09:52:02AM -0400, eric@sage.org wrote:
> On Fri, Apr 01, 2022 at 01:26:12PM +0000, Karlsson, Magnus wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Jesper Dangaard Brouer <jbrouer@redhat.com>
> > > Sent: Friday, April 1, 2022 3:13 PM
> > > To: Toke Høiland-Jørgensen <toke@redhat.com>; Kal Cutter Conley
> > > <kal.conley@dectris.com>; Xdp <xdp-newbies@vger.kernel.org>
> > > Cc: Brouer, Jesper <brouer@redhat.com>; Lorenzo Bianconi
> > > <lorenzo.bianconi@redhat.com>; Karlsson, Magnus
> > > <magnus.karlsson@intel.com>; eric.david.sage@gmail.com
> > > Subject: Re: XDP multi-buffer and AF_XDP
> > > 
> > > 
> > > On 01/04/2022 13.39, Toke Høiland-Jørgensen wrote:
> > > > Kal Cutter Conley <kal.conley@dectris.com> writes:
> > > >
> > > >>>
> > > >>> Hi,
> > > >>> We are very interested in receiving jumbo frames (> 8000 bytes) over
> > > >>> AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP?
> > > What
> > > >>> about in zero-copy mode?
> > > >>>
> > > >>> Cheers,
> > > >>> Kal
> > > >>
> > > >> Looking into this more I found this comment in the mlx5 driver:
> > > >>
> > > >> /* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not yet
> > > >> * supported by upstream, and there is no defined trigger to allow
> > > >> * transmitting redirected multi-buffer frames.
> > > >> */
> > > >>
> > > >> So at least mlx5 does not yet support XDP multi-buffer with
> > > >> XDP_REDIRECT. What "upstream" support is required to get
> > > XDP_REDIRECT
> > > >> to work with XSKs?
> > > >
> > > > Well, the initial patch set for multibuf explicitly blocked
> > > > XDP_REDIRECT between interfaces, which is what that comment is
> > > > referring to (the TX side).
> > > >
> > > > For AF_XDP we'd also need to define the UAPI, and maybe add a socket
> > > > flag so the userspace program can signal to the kernel that it
> > > > understands it? Not sure about the details.
> > > >
> > > > You're definitely not the only person who wants this, though; adding
> > > > in some people who may have a better idea of the exact steps needed.
> > > 
> > > Cc. Eric Sage, as he also expressed interest in implementing this...
> > 
> > Adding Tirtha that has patches for the AF_XDP support of multi-buffer.
> > Though, he is currently integrating his i40e multi-buffer driver
> > support with Lorenzo's TX-patches that he sent as an RFC. Latest I
> > heard is that Tirtha is planning on submitting this in a couple of
> > weeks as a proper patch to the mailing list. And after that, the focus
> > is to brush up the AF_XDP and ZC support patches as we stopped trying
> > to track Lorenzo's multi-buffer patches at version 13 out of 23 ;-).
> > We just could not keep up.
> 
> Ah, if there is anything I can do to help please let me know. My company needs this
> feature so I can work on it full time. I would love to help out however I can.

Hey Eric! We'll keep you in loop in terms of progress around this work.

> 
> Thanks,
> Eric Sage
> > 
> > > --Jesper
> > 
