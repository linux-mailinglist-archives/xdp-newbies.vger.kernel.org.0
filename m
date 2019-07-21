Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38606F209
	for <lists+xdp-newbies@lfdr.de>; Sun, 21 Jul 2019 08:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfGUGnD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Sun, 21 Jul 2019 02:43:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45286 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfGUGnC (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 21 Jul 2019 02:43:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 556E8C18B2D9;
        Sun, 21 Jul 2019 06:43:02 +0000 (UTC)
Received: from carbon (ovpn-200-23.brq.redhat.com [10.40.200.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 651DA5C652;
        Sun, 21 Jul 2019 06:42:55 +0000 (UTC)
Date:   Sun, 21 Jul 2019 08:42:54 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Cc:     Eric Leblond <eric@regit.org>, xdp-newbies@vger.kernel.org,
        brouer@redhat.com
Subject: Re: AF_XDP and packet timestamp
Message-ID: <20190721084254.0fca2aaa@carbon>
In-Reply-To: <87d0jca2z1.fsf@toke.dk>
References: <86f135475a7820adadb05e7ac9a05c71846bebd6.camel@regit.org>
        <87d0jca2z1.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sun, 21 Jul 2019 06:43:02 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 17 Jun 2019 13:03:14 +0200
Toke Høiland-Jørgensen <toke@redhat.com> wrote:

> Eric Leblond <eric@regit.org> writes:
> 
> > Hello,
> >
> > I did start to work on AF_XDP support for Suricata. API was really easy
> > to use via libbpf.
> >
> > From Suricata point of view, the current system with default
> > configuration is lacking an important information. I don't have access
> > to the timestamp of the packet. I'm in particular interested by the
> > hardware timestamp as it would allow to do reordering in some capture
> > cases.
> >
> > Is there a way to get the information via AF_XDP. I've seen the
> > discussion on hardware hints but there was no code example I was able
> > to find.  
> 
> Making more information from the hardware available to XDP is currently
> on our list of things we plan to enable in the future:
> https://github.com/xdp-project/xdp-project/blob/master/xdp-project.org#metadata-available-to-programs
> 
> I just added timestamps as a field we want in there (so we don't
> forget).
> 
> I.e., no, there is no way to get this information from XDP (and thus not
> from AF_XDP either) yet...

We/XDP don't have access to hardware info, yet... BUT I plan to add
this, e.g. see my slides[1].  (Where to place this HW info, and how to
make it avail to both XDP and netstack, didn't reach a conclusion at
NetConf2019, so the "roadmap" is fuzzy).

To get a software timestamp into AF_XDP, simply use helper
bpf_ktime_get_ns() to get the time, and store info into metadata area
(placed in front of packet) via helper bpf_xdp_adjust_meta() example
see[2].  Then AF_XDP userspace can read this metadata area, which is
placed just in front of packet headers.


[1] http://vger.kernel.org/netconf2019_files/xdp-metadata-discussion.pdf
[2] https://github.com/torvalds/linux/blob/master/samples/bpf/xdp2skb_meta_kern.c
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
