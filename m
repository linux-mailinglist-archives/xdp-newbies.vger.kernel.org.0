Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4192F140FBC
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 18:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgAQRQk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 12:16:40 -0500
Received: from mail-c.ads.isi.edu ([128.9.180.198]:16697 "EHLO
        mail-c.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgAQRQk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 12:16:40 -0500
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; 
   d="scan'208";a="22258381"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-c.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 17 Jan 2020 09:16:39 -0800
Date:   Fri, 17 Jan 2020 12:16:37 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Subject: Re: zero-copy between interfaces
Message-ID: <20200117171637.GB69024@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jan 17, 2020 at 01:32:07PM +0100, Björn Töpel wrote:
> On Mon, 13 Jan 2020 at 01:28, Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> >
> [...]
> >
> > I could not get zero-copy to work with the i40e driver as it would crash. I've
> > attached the corresponding traces from dmesg.
> 
> Thanks Ryan! I had a look at the crash, and it's in the XDP setup:
> 
> i40e_xdp_setup:
> ...
>  for (i = 0; i < vsi->num_queue_pairs; i++)
>      WRITE_ONCE(vsi->rx_rings[i]->xdp_prog, vsi->xdp_prog);
> 
> and the vsi->rx_ring[0] is NULL. This is clearly broken.
> 
> It would help with more lines from your dmesg: the cut i40e log hints
> that something is really broken:
> 
> [  328.579154] i40e 0000:b7:00.2: failed to get tracking for 256
> queues for VSI 0 err -12
> [  328.579280] i40e 0000:b7:00.2: setup of MAIN VSI failed
> [  328.579367] i40e 0000:b7:00.2: can't remove VEB 162 with 0 VSIs left
> 
> Is it possible to dig out the complete log?

Hi Björn,

I've linked a full dmesg log from an XDP setup crash. Note that there are 
two i40e cards on this machine. The X710 (0000:65:00.0, 0000:65:00.1) works 
fine, the X722 (0000:b7:00.0, 0000:b7:00.1, 0000:b7:00.2, 0000:b7:00.3) is the
one that is crashing on XDP setup.

https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1931080

Some info that may be useful:

ry@turbine:~$ sudo ethtool -i eno7
driver: i40e
version: 2.8.20-k
firmware-version: 3.33 0x80001006 1.1747.0
expansion-rom-version:
bus-info: 0000:b7:00.2
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes

The firmware version 3.33 was the latest I could find as of a few weeks ago.

ry@turbine:~$ sudo lspci -vvv | grep 722
b7:00.0 Ethernet controller: Intel Corporation Ethernet Connection X722 for 10GBASE-T (rev 04)
	DeviceName: Intel LAN X722 #1
	Subsystem: Super Micro Computer Inc Ethernet Connection X722 for 10GBASE-T
b7:00.1 Ethernet controller: Intel Corporation Ethernet Connection X722 for 10GBASE-T (rev 04)
	DeviceName: Intel LAN X722 #2
	Subsystem: Super Micro Computer Inc Ethernet Connection X722 for 10GBASE-T
b7:00.2 Ethernet controller: Intel Corporation Ethernet Connection X722 for 10GbE SFP+ (rev 04)
	DeviceName: Intel LAN X722 #3
	Subsystem: Super Micro Computer Inc Ethernet Connection X722 for 10GbE SFP+
b7:00.3 Ethernet controller: Intel Corporation Ethernet Connection X722 for 10GbE SFP+ (rev 04)
	DeviceName: Intel LAN X722 #4
	Subsystem: Super Micro Computer Inc Ethernet Connection X722 for 10GbE SFP+

ry@ryzen:~$ uname -a
Linux ryzen 4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux

ry@turbine:~/kmoa/bpf-next$ git log -2
commit 60d71397d27e7859fdaaaaab6594e4d977ae46e2 (HEAD -> master)
Author: Ryan Goodfellow <rgoodfel@isi.edu>
Date:   Wed Jan 15 16:54:39 2020 -0500

    add xdpsock_multidev sample program

    This is a simple program that uses AF_XDP sockets to forward packets
    between two interfaces using a common memory region and no copying of
    packets.

    Signed-off-by: Ryan Goodfellow <rgoodfel@isi.edu>

commit 9173cac3b64e6785dd604f5075e6035b045a0026 (origin/master, origin/HEAD)
Author: Andrii Nakryiko <andriin@fb.com>
Date:   Wed Jan 15 11:08:56 2020 -0800

    libbpf: Support .text sub-calls relocations

    The LLVM patch https://reviews.llvm.org/D72197 makes LLVM emit function call
    relocations within the same section. This includes a default .text section,
    which contains any BPF sub-programs. This wasn't the case before and so libbpf
    was able to get a way with slightly simpler handling of subprogram call
    relocations.

    This patch adds support for .text section relocations. It needs to ensure
    correct order of relocations, so does two passes:
    - first, relocate .text instructions, if there are any relocations in it;
    - then process all the other programs and copy over patched .text instructions
    for all sub-program calls.

    v1->v2:
    - break early once .text program is processed.

    Signed-off-by: Andrii Nakryiko <andriin@fb.com>
    Signed-off-by: Alexei Starovoitov <ast@kernel.org>
    Acked-by: Yonghong Song <yhs@fb.com>
    Cc: Alexei Starovoitov <ast@kernel.org>
    Link: https://lore.kernel.org/bpf/20200115190856.2391325-1-andriin@fb.com

-- 
~ ry
