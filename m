Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8911B97CB
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Apr 2020 08:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0GxO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Apr 2020 02:53:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:9165 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbgD0GxO (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Apr 2020 02:53:14 -0400
IronPort-SDR: Sbz+zVz6nIC7GKMYJWKWPyULKc1M4JfSxsn2Gr0VAj2Fzg0qGlOAx8Gx8k/+eKisO0jcS70vXD
 KzC+KMjzKcMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2020 23:53:13 -0700
IronPort-SDR: VSprQeKRlealBeZxewc4UqK2keFnjAtL5rS3moRhKtovOATPcEwYTaZHV4tR2WZALtTF9dM67u
 SmZ/VBY4lvTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; 
   d="scan'208";a="404153448"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by orsmga004.jf.intel.com with ESMTP; 26 Apr 2020 23:53:12 -0700
Date:   Mon, 27 Apr 2020 08:50:29 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Jesse DuMond <suttonshiredev@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Error creating a AF_XDP socket after deleting
Message-ID: <20200427065029.GA19189@ranger.igk.intel.com>
References: <CAJEJvEW31-O9x-0WsipVqSf-kPy8HnWnB6gG2jeQTH5WWm2iqw@mail.gmail.com>
 <CAJ8uoz0mcu=6_Czw-Y=v-MgRcCRxspkPfFJ4SaQamE-6jCwfkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8uoz0mcu=6_Czw-Y=v-MgRcCRxspkPfFJ4SaQamE-6jCwfkQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, Apr 26, 2020 at 08:38:03PM +0200, Magnus Karlsson wrote:
> On Sun, Apr 26, 2020 at 6:08 PM Jesse DuMond <suttonshiredev@gmail.com> wrote:
> >
> > Hi there,
> >
> > I am writing some test code that tries  repeatedly to create a umem
> > and socket and then deletes them both. I'm using the libbpf function
> > xsk_umem__create/delete and xsk_socket__create/xsk_socket__delete. I
> > am getting an EBUSY from xsk_socket__create when trying to create a
> > socket after deleting a socket on the same interface and queue number.
> > The attached program reproduces the error.
> >
> > I've traced the EBUSY error to this call to xdp_umem_assign_dev in the
> > kernel: https://github.com/torvalds/linux/blob/v5.3/net/xdp/xsk.c#L500
> > That call is made during the bind call in xsk_socket__create. As far
> > as I can tell this error is because the work of xdp_umem_clear_dev is
> > actually called asynchronously after xsk_socket__delete. Putting a
> > sleep between xsk_socket__delete and xsk_socket__create makes this
> > code succeed.
> >
> > Am I trying to do something that is not supposed to be supported?
> 
> No, you are doing everything correctly. The tear down of a socket is
> unfortunately asynchronous due to legacy reasons that are not true
> anymore. We do have a item in the backlog to make this synchronous,
> but have not gotten around to it yet. So sorry, we have to live with
> this for a while more.

For now I guess that in case of EBUSY the application can just repeat the
call to xsk_socket__create?

> 
> /Magnus
