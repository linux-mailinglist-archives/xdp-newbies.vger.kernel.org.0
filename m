Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4500B151E94
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 17:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgBDQzx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 11:55:53 -0500
Received: from mga05.intel.com ([192.55.52.43]:14551 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727321AbgBDQzx (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 4 Feb 2020 11:55:53 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="403846824"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by orsmga005.jf.intel.com with ESMTP; 04 Feb 2020 08:54:24 -0800
Date:   Tue, 4 Feb 2020 10:46:40 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Cc:     Maxim Mikityanskiy <maximmi@mellanox.com>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        Cameron Elliott <cameron@cameronelliott.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Subject: Re: Cannot run multiple 'xdpsock' concurrently?
Message-ID: <20200204094640.GA46254@ranger.igk.intel.com>
References: <CAMyc9bVixUDEJ-WHLJaCCTF3iV4pFF2j+RPM0hM1XOKh6S2yBw@mail.gmail.com>
 <CAJ8uoz0btU4L80d2DHv+=ivL3RJmunnAsmetL=2zBo_2xfpgAA@mail.gmail.com>
 <20200203031104.GA19512@ranger.igk.intel.com>
 <afcf4030-aee3-7e9c-a57f-c5458c285b74@mellanox.com>
 <20200204065000.GA44903@ranger.igk.intel.com>
 <CAJ+HfNj0+o3A9TM+K=Eiqrj_wwSOsnPw2f00u_P-sX_-ckp5=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+HfNj0+o3A9TM+K=Eiqrj_wwSOsnPw2f00u_P-sX_-ckp5=g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Feb 04, 2020 at 04:41:31PM +0100, Björn Töpel wrote:
> On Tue, 4 Feb 2020 at 14:58, Maciej Fijalkowski
> <maciej.fijalkowski@intel.com> wrote:
> >
> > On Mon, Feb 03, 2020 at 01:49:11PM +0200, Maxim Mikityanskiy wrote:
> [...]
> > > Right, we shouldn't drop this check, at least it's needed to sync on
> > > xsk_wakeup when closing a socket. I think there are two issues here, and I
> > > suggest this way of solving them:
> > >
> > > 1. __I40E_CONFIG_BUSY is set while a single QP is being recreated, e.g.,
> > > when opening/closing an XSK. I considered it as a flag for global
> > > configuration changes, but apparently it's also needed when a single XSK is
> > > being configured. Probably xsk_wakeup shouldn't return ENETDOWN when this
> > > flag is set, but something lighter like EAGAIN. xdpsock will need to repeat
> > > the syscall instead of bailing out.
> > >
> > Haven't yet checked the l2fwd case since I broke my hw setup, but do we
> > really need the syscall repetition? For tx only scenario skipping the
> > syscall would mean that we wouldn't post entries to completion queue and
> > in case tx ring gets full we would call complete_tx_only() again. So there
> > we have syscall being repeated?
> >
> 
> I sort of like EAGAIN, as Max suggested, is better. Kind of nice for a
> user to know that "hey, for some reason the driver couldn't service
> you ATM, please try again".
> 
> > > 2. Should xdpsock stop on ENETDOWN? Normal network sockets don't close as
> > > soon as the carrier is lost, so why should xdpsock fail on ENETDOWN? IMO,
> > > xdpsock should handle it more gracefully (wait with some timeout?).
> > >
> > > Does it sound like the right direction?
> >
> > It does! :) But in general I would allow ENETDOWN to the set of errnos
> > checked in kick_tx(). Not sure about repeating syscall though.
> >
> 
> The fact that xdpsock die() on errors are a bit harsh, can't argue
> there. So, I'm all in for simplifying the sample error checking for
> kick_tx().

So to summarize that:
- return EAGAIN instead of ENETDOWN within ndo_xsk_wakeup implementations
  in i40e/ixgbe,
- check for ENETDOWN in kick_tx() as well

Do you guys agree?

What about timeout and syscall repetition? That's the last question.

> 
> 
> Björn
