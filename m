Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D131ECE05
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jun 2020 13:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgFCLLf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jun 2020 07:11:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:31637 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCLLf (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 3 Jun 2020 07:11:35 -0400
IronPort-SDR: Vwa901945q/I0FM9m3z8OGVSRjf5ldknINeGp/XBCQej9jVBRbKRag8wH1A64O+ZULzJPxO50z
 sJzjEraJhRQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 04:11:33 -0700
IronPort-SDR: AaYbDgI6BWK+2A6PqGZs4SD6TSCJDbIqSHNFQA+eiH8Kl67TmgnctotjeGqZRWKmS2QRHV7Ta3
 wJ12LZY0qYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; 
   d="scan'208";a="304574229"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2020 04:11:32 -0700
Date:   Wed, 3 Jun 2020 13:07:26 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     maharishi bhargava <bhargavamaharishi@gmail.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
Message-ID: <20200603110726.GA55184@ranger.igk.intel.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk>
 <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
 <877dwpmp7f.fsf@toke.dk>
 <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
 <87lfl4l8zu.fsf@toke.dk>
 <20200603104833.GA14391@ranger.igk.intel.com>
 <87ftbcl86e.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ftbcl86e.fsf@toke.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke Høiland-Jørgensen wrote:
> Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
> 
> > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke HÃƒÂ¸iland-JÃƒÂ¸rgensen wrote:
> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> 
> >> > On Tue, Jun 2, 2020 at 9:31 PM Toke HÃƒÂ¸iland-JÃƒÂ¸rgensen <toke@redhat.com> wrote:
> >> >>
> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> >>
> >> >> > On Tue 2 Jun, 2020, 14:31 Toke HÃƒÂ¸iland-JÃƒÂ¸rgensen, <toke@redhat.com> wrote:
> >> >> >>
> >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> >> >>
> >> >> >> > Hi, in my XDP program, I want to redirect some packets using AF_XDP
> >> >> >> > and redirect other packets directly from driver space.
> >> >> >> > Redirection through AF_XDP works fine, but redirection through dev map
> >> >> >> > stops after some packets are processed.
> >> >> >>
> >> >> >> Do you mean it stops even if you are *only* redirecting to a devmap, or
> >> >> >> if you are first redirecting a few packets to AF_XDP, then to devmap?
> >> >> >>
> >> >> >> Also, which driver(s) are the physical NICs you're redirecting to/from
> >> >> >> using, and which kernel version are you on?
> >> >> >>
> >> >> >> -Toke
> >> >> >
> >> >> >
> >> >> >
> >> >> > Currently, I'm trying to redirect packets only using devmap. But also
> >> >> > have code for redirection using AF_XDP(only when a given condition is
> >> >> > satisfied). A DPDK program is running in userspace which will receive
> >> >> > packets from AF_XDP.
> >> >>
> >> >> Right, so it's just devmap redirect that breaks. What do you mean
> >> >> 'redirection stops', exactly? How are you seeing this? Does xdp_monitor
> >> >> (from samples/bpf) report any exceptions?
> >> >>
> >> >> -Toke
> >> >>
> >> > So, In my setup, there are three systems, Let's Assume A, B, C. System
> >> > B is acting as a forwarder between A and C. So I can see the number of
> >> > packets received at system C. To be specific, only 1024 packets are
> >> > received. If I remove the xsks_map part from the code and don't run
> >> > DPDK in userspace. This problem does not occur. Also if I forward all
> >> > the packets using AF_XDP, there is no such issue.
> >> 
> >> I thought you said you were seeing the problem when only redirecting to
> >> a devmap? So why does the xsk_map code impact this? I think you may have
> >> to share some code...
> >
> > Isn't the case here that either xsk_map or dev_map consumes the frame and
> > therefore the latter doesn't see it? so cloning might be needed here?
> 
> Yeah, certainly you can't redirect *the same packet* to both xsk_map and
> devmap - but that wasn't what I understood was the use case here?

Maybe the best would be if Maharishi shared the code as you requested :)

> 
> -Toke
> 
