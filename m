Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3269E1394C0
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Jan 2020 16:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgAMPZd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Jan 2020 10:25:33 -0500
Received: from mail-d.ads.isi.edu ([128.9.180.199]:62502 "EHLO
        mail-d.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgAMPZd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Jan 2020 10:25:33 -0500
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="20779584"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-d.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2020 07:25:32 -0800
Date:   Mon, 13 Jan 2020 10:25:30 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
Message-ID: <20200113152530.GC68570@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <87k15vwsax.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k15vwsax.fsf@toke.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 13, 2020 at 11:43:02AM +0100, Toke Høiland-Jørgensen wrote:
>> Magnus Karlsson <magnus.karlsson@gmail.com> writes:
>>> On Mon, Jan 13, 2020 at 1:28 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>>>  The reason for wanting large memory maps is that our use case for XDP is network
>>>  emulation - and sometimes that means introducing delay factors that can require
>>>  a rather large in-memory packet buffers.
>>> 
>>>  If there is interest in including this program in the official BPF samples I'm happy to
>>>  submit a patch. Any comments on the program are also much appreciated.
>> 
>>  More examples are always useful, but the question is if it should
>>  reside in samples or outside the kernel in some other repo? Is there
>>  some good place in xdp-project github that could be used for this
>>  purpose?
>
> We could certainly create something; either a new xdp-samples
> repository, or an example-programs/ subdir of the xdp-tutorial? Which of
> those makes the most sense depends on the size of the program I think...
> 
> -Toke
> 

I'm happy to provide patches or pull-requests in either case. The userspace
program is 1 file with 555 lines and the BPF program is 28 lines. I've 
tested the userspace program with the 5.5 kernel. The BPF program requires 
clang-9 to work properly (due to BTF features IIRC).

- https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-moa/samples/bpf/xdpsock_multidev.c
- https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-moa/samples/bpf/xdpsock_multidev_kern.c

The primary usefulness of this program relative to what's out there is that it
pushes packets between interfaces using a common memory map.

-- 
~ ry
