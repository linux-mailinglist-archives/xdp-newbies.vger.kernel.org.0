Return-Path: <xdp-newbies+bounces-195-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73ED0C5B0
	for <lists+xdp-newbies@lfdr.de>; Fri, 09 Jan 2026 22:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 511CC3010514
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Jan 2026 21:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3C433D6C7;
	Fri,  9 Jan 2026 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZInFtlVU"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31648500952
	for <xdp-newbies@vger.kernel.org>; Fri,  9 Jan 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767994970; cv=none; b=tn0NHXWad3tKXPdbzBLrqv5smogPEJ17tQP+RSK9V2H69blJ9SgTEoHuMDP7VltHpSbZbm8lM15VhHpJKaml3IlqnHlg7CWr0RIqMdruYSFKuONmgQbjkGd+skwFu3uUu0cvBoAc5z4Pf+TbTbqHdWvTxT1rPHY0jub38Om3rRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767994970; c=relaxed/simple;
	bh=wQh6dOyPF7lm8BhcT9o4Qbx9iPMPvnzl2IF15Tc6/C0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=gVPB77WEVWafZ00NUkjM/uNCuQsK794Qj+o7TV/uF4fNNtCipgPc19D29XfQTyrcvYFX4j66OJ0YLtk47hNUNL+kC2GeEP9brNuR/VrLWKUMau5vGGo925G8+hFQ9oqYYDVDDmqpuSnK+uYi/pNps2ZYiyrcEPlEk4Xcnoxk75M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZInFtlVU; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1767994959; x=1768254159;
	bh=oIGL+9IOtrZ90f4hDRGABxmXBcVccKbvBIhC6i1pE/I=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZInFtlVU3isw9MK4716iG4YKNzXgR0mkiRvpobCw9k/QZeauqyr1FvI5gIbg4Kz6C
	 s0LfLyxhnwrv9Y0WI1Rd2bL+E6nyL1CRf5Zcq4gwPQDkfp7wB2LdbRShUDxqnZcecV
	 0S1oiW19W6V9wzSw02xMQsXKZXKb40hpZiXLGT7b01Chb1QWJW9hjllKlvISHIlyBr
	 OiRJ1+mLOzeiYvNGc3YuNYtSuWctI1sgrJP0FyJigX4g/MGOPoQqe5K4Z19QJGTey9
	 wIJ596Vnlx4H7vtRMKJLjaj199FtTAYNFtSfoHIVD3Oud42y7KItFcMMNYMiz5MLfU
	 Jd5ixWZMWd1Bg==
Date: Fri, 09 Jan 2026 21:42:35 +0000
To: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
From: Nahla <Nahla.nee@protonmail.com>
Subject: descriptor marked as invalid, tx_ring_empty_descs
Message-ID: <ZalFnB0f9nzP17TjeXcgI8_2dj1pDZrTMxeeQVi5v93LkbdsrMXwWl6OdWRS8vHHINVAZNL2VjKN3ko9KKkCnGtlJyCYwYgu_TVKcRdN9g4=@protonmail.com>
Feedback-ID: 93832026:user:proton
X-Pm-Message-ID: d432e2bca831541152504f3cc1483fe8ac4ba365
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm currently trying to figure out how to use an AF_XDP socket without rely=
ing on libxdp as I want to learn how it works under the hood. I'm having an=
 issue where the packet is seemingly getting swallowed up somewhere in the =
stack and I'm not sure why. I write a packet to the UMEM buffer's 0th chunk=
, fill out the 0th entry in the tx ring, and then increment the producer. H=
owever I don't see a packet come out at all at the end of that process and =
checking XDP_STATISTICS indicates that tx_ring_empty_descs was incremented =
by 1.

As it stands I'm creating a UMEM buffer with 4096 chunks, each being 4096 b=
ytes long, and when registering it I use no flags, headroom, or tx_metadata=
_len. There is one of each type of ring, and they all have a size of 512. W=
hen binding the socket I put it into XDP_COPY mode, bind it to the 0th queu=
e, and pass 0 for the UMEM fd. The actual code showing the write and send o=
peration is given below, thought it is written in Rust. I heavily commented=
 for the sake of anyone who might not know Rust. All types such as Umem are=
 more or less just thin wrappers around memory returned by libc/syscalls.

pub=C2=A0fn=C2=A0send(&mut=C2=A0self,=C2=A0data:=C2=A0&[u8],=C2=A0chunk_idx=
:=C2=A0usize)=C2=A0{
    // write data to the nth chunk of the umem buffer
=C2=A0 =C2=A0 self.umem[(Umem::CHUNK_SIZE=C2=A0*=C2=A0chunk_idx)..(Umem::CH=
UNK_SIZE=C2=A0*=C2=A0(chunk_idx+1))]
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .copy_within(0..data.len(),=C2=A00);

=C2=A0 =C2=A0 // get the last known value of producer without interacting w=
ith the atomic's address
=C2=A0 =C2=A0 let=C2=A0entry_idx=C2=A0=3D=C2=A0self.tx.cached_prod as=C2=
=A0usize;
=C2=A0 =C2=A0 // get a reference to the entry indexed by the cached produce=
r
=C2=A0 =C2=A0 let=C2=A0tx_entry=C2=A0=3D=C2=A0self.tx.data.get_mut(entry_id=
x).expect("Failed to get first umem chunk");

=C2=A0 =C2=A0 // set the entry's addr field to the index nth chunk
=C2=A0 =C2=A0 tx_entry.addr =3D=C2=A0(Umem::CHUNK_SIZE=C2=A0*=C2=A0chunk_id=
x)=C2=A0as=C2=A0_;
=C2=A0 =C2=A0 // set the length to be that of the data we just wrote to ume=
m
=C2=A0 =C2=A0 tx_entry.len =3D=C2=A0data.len()=C2=A0as=C2=A0_;
=C2=A0 =C2=A0 // no flags/options
=C2=A0 =C2=A0 tx_entry.options =3D=C2=A00;

=C2=A0 =C2=A0 // store/release to the producer the value of cached_prod + 1
=C2=A0 =C2=A0 self.tx.producer.store(self.tx.cached_prod +=C2=A01,=C2=A0Ord=
ering::Release);
=C2=A0 =C2=A0 // updated cached_prod
=C2=A0 =C2=A0 self.tx.cached_prod +=3D=C2=A01;

=C2=A0 =C2=A0 // sendto call to let the kernel know we have something ready=
 to go out
=C2=A0 =C2=A0 unsafe=C2=A0{
=C2=A0 =C2=A0 =C2=A0 =C2=A0 let=C2=A0ret=C2=A0=3D=C2=A0libc::sendto(
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fd.as_raw_fd(),
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::ptr::null(),
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc::MSG_DONTWAIT,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::ptr::null(),
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 );

=C2=A0 =C2=A0 =C2=A0 =C2=A0 // print the errno error string
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if=C2=A0ret=C2=A0<=C2=A00=C2=A0{
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 println!("sendto issue: {}",=
=C2=A0ioError::last_os_error());
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
=C2=A0 =C2=A0 }
}

I have tried running this in XDP_ZEROCOPY mode as well with an Intel NIC us=
ing the igb driver, the end result is that the sendto call returns EINVAL r=
ather than marking it as an invalid descriptor. When running in XDP_COPY mo=
de sendto returns 0 and the behavior described above occurs.

Best,
Nahla

