Return-Path: <xdp-newbies+bounces-158-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 787DD9B12A4
	for <lists+xdp-newbies@lfdr.de>; Sat, 26 Oct 2024 00:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2304F1F2177F
	for <lists+xdp-newbies@lfdr.de>; Fri, 25 Oct 2024 22:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEB7217F31;
	Fri, 25 Oct 2024 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaaxKlwn"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D51217F5B;
	Fri, 25 Oct 2024 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895555; cv=none; b=vCp3aMP5+pdgH8bBzP9TYGc+USjPgtnW4qhV6Kkge228fjXNJzunhKi2DOD34ixvCe7hy5TKy105WwCWMVB+HVoxT/8A7MIUkzCv5pdIhrGpUPafKMM0NRQaCXqDdvfqnKAQ7Mt98muLH8j8CFtQnPzTFrNXFE8S6UCVVEkBfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895555; c=relaxed/simple;
	bh=cBF+1dc1YuPA6i/wurtmA1xBN7bZ7fiqbS4p7GRgLco=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=C5kwIn+VD8JLUk2BifiwbATRHTYPUtDQL3lp1L9OyAfI7FDd80DpdQ/gbjWfQMIiZJ1aZyFQ//CFY42Nl0sBHBgKuDz4a7GVG1nLaaJ9soVG8TURgj1VgVlVAwC9pqXWoq82cmz2iQGAdEupx+HEOFGv5JAqW1vdqzgWXDj9xVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaaxKlwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9129DC4CEC3;
	Fri, 25 Oct 2024 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729895555;
	bh=cBF+1dc1YuPA6i/wurtmA1xBN7bZ7fiqbS4p7GRgLco=;
	h=Date:From:To:Subject:From;
	b=FaaxKlwnV1rAudCAp++GEnCe0D5rJMbscsqyBHVk0ypgDifzCewCxDPuiuK6BSXFg
	 zChMBbBqWERgxyiCnmlaOgHUgy0z1CjLt3/5djdp+s1rU/PAg5jrZ8V54lFVG/Qj//
	 c/ofgobOIQgx+7wZLvNoAz5Z+/sszy9CLrNwZfyH1iOlmEeNtNGboHVDMGy/z2NQ5q
	 To/YevDY0YHIL/55WaVh3QQ7IsYLUTLNYFGZX0qkIOptSUpfHrT4aL+/u795sq4YMH
	 dRz6DlikpvFtkNcOy5/Foo38LkXA4imli4MNSboA82Gm3cj8HP1B2iHDVmcI9sBV8p
	 3IuXeRFheqANw==
Message-ID: <12b6a2f7-a677-449d-b4f3-e2c29046229a@kernel.org>
Date: Fri, 25 Oct 2024 23:32:32 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
To: bpf <bpf@vger.kernel.org>, xdp-newbies <xdp-newbies@vger.kernel.org>
Subject: FOSDEM 2025 eBPF Devroom Call for Participation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We are delighted to announce the Call for Participation (CFP) for the
very first eBPF Devroom at FOSDEM!

Mark the Dates
--------------

- December 1st, 2024: Submission deadline
- December 15th, 2024: Announcement of accepted talks and schedule
- February 1st, 2025 (Saturday afternoon): eBPF Devroom at FOSDEM

eBPF at FOSDEM
--------------

FOSDEM is a free, community-organized event focusing on open source, and
aiming at gathering open source software developers and communities to
meet, learn, and share. It takes place annually in Brussels, Belgium.
After hosting a number of eBPF-related talks in various devrooms over
the years, FOSDEM 2025 welcomes a devroom dedicated to eBPF for the
first time! This devroom aims at gathering talks about various aspects
of eBPF, ideally on multiple platforms.

Topics of Interest
------------------

If you have something to present about eBPF, we would love for you to
consider submitting a proposal to the Devroom.

The projects or technologies discussed in the talks MUST be open-source.

Topics of interest for the Devroom include (but are not limited to):

- eBPF development: recent or proposed features (on Linux, on other
  platforms, or even cross-platform), such as:
    - eBPF program signing and supply chain security
    - Profiling eBPF with eBPF
    - eBPF-based process schedulers
    - eBPF in storage devices
    - eBPF verifier improvements or alternative implementations
    - Memory management for eBPF
- Deep-dives on existing eBPF features
- Working with eBPF: best practices, common mistakes, debugging, etc.
- eBPF toolchain, for compiling, managing, debugging, packaging, and
  deploying eBPF programs and related objects
- eBPF libraries, in C/C++, Go, Rust, or other languages
- eBPF in the real world, production use cases and their impact
- eBPF community efforts (documentation, standardization, cross-platform
  initiatives)

The list is not exhaustive, don't hesitate to submit your proposal!

Format
------

FOSDEM 2025 will be an in-person event in Brussels, Belgium.
We do not accept remote presentations.

We're looking for presentations in one of the following sizes:

- 10 minutes (for example, a short demo)
- 20 minutes (for example, a project update)
- 30 minutes (for example, an introduction to a new technology or a deep
  dive on a complex feature)

The durations above include time for questions: allow at least 5 to 10
minutes, depending on the total length, to answer questions from the
public.

How to Submit
-------------

Please submit your proposals on Pretalx, FOSDEM's submissions tool, at
https://pretalx.fosdem.org/fosdem-2025/cfp

Make sure to select "eBPF" as the track.

The official communication channel for the Devroom is the dedicated
FOSDEM mailing list, ebpf-devroom@lists.fosdem.org. If you submit a
talk, please make sure to join the list:
https://lists.fosdem.org/listinfo/ebpf-devroom

Code of Conduct
---------------

All participants at FOSDEM are expected to abide by the FOSDEM's Code of
Conduct. If your proposal is accepted, you will be required to confirm
that you accept this Code of Conduct. You can find this code at
https://fosdem.org/2025/practical/conduct/

Devroom Organisers
------------------

- Alan Jowett
- Alexei Starovoitov
- Andrii Nakryiko
- Bill Mulligan
- Daniel Borkmann
- Dimitar Kanaliev
- Quentin Monnet
- Yusheng Zheng

If you have questions about any aspects of this Call for Participation,
please email us at ebpf-devroom-manager@fosdem.org, and we will do our
best to assist you.

We keep an up-to-date version of this Call for Participation at
https://ebpf.io/fosdem-2025.html

