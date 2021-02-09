Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287FE314C25
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Feb 2021 10:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhBIJxb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Feb 2021 04:53:31 -0500
Received: from mga17.intel.com ([192.55.52.151]:47824 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230320AbhBIJvk (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 9 Feb 2021 04:51:40 -0500
IronPort-SDR: r3Jirp4HaH2nhsi/AYsKpzlLrFuwafftcnedd/yDUIoY0A6G3CSByyysew4zJQHAjKh3wRvQBl
 QtJZAWGXHYaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="161605380"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="161605380"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 01:50:58 -0800
IronPort-SDR: LFW3C/1TaJbTuH09B2PV5YN218ApxpZd1+DhaJ9VVK4oW8/JADuww1fWGtAjOF3CfRUlB/JWaL
 iBd5nSGszH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="487973719"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2021 01:50:57 -0800
Date:   Tue, 9 Feb 2021 10:41:37 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Radu Stoenescu <radu.stoe@gmail.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        simon.horman@netronome.com
Subject: Re: Redirect from NIC to TAP
Message-ID: <20210209094137.GA14290@ranger.igk.intel.com>
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon>
 <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Feb 09, 2021 at 11:26:06AM +0200, Radu Stoenescu wrote:
> Hello
> 
> My physical NIC is a Netronome (I can come back with exact model type
> and driver version).
> 
> Redirect NIC to TAP doesn't work when XDP is attached in driver mode.
> It works when they are both in generic mode. I haven't tried other
> combinations of attachment modes (one driver, other generic etc.).

Looks like Netronome driver still doesn't support XDP_REDIRECT in native
mode.

CC: Simon

Simon, any plans on adding support for redirect?

> 
> Thanks
> 
> On Tue, Feb 9, 2021 at 11:21 AM Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
> >
> > On Tue, 9 Feb 2021 10:31:50 +0200
> > Radu Stoenescu <radu.stoe@gmail.com> wrote:
> >
> > > Is it possible to redirect packets from XDP program attached in driver
> > > mode to a physical NIC to a TAP interface?
> >
> > Cc. Jason Wang as I think he implemented this, but I'm not 100% sure.
> > Maybe Jason can remember?
> > (or point me to the relevant code that I can check).
> >
> > > The same works fine if the XDP programs are attached in generic mode.
> >
> > So, you have tried and it doesn't work.
> >
> > What is your setup?
> >
> > --
> > Best regards,
> >   Jesper Dangaard Brouer
> >   MSc.CS, Principal Kernel Engineer at Red Hat
> >   LinkedIn: http://www.linkedin.com/in/brouer
> >
> 
> 
> -- 
> Radu Stoenescu
