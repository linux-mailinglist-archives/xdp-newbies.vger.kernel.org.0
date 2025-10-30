Return-Path: <xdp-newbies+bounces-192-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70474C1FDC3
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Oct 2025 12:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A06E4E54BA
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Oct 2025 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C3233C53B;
	Thu, 30 Oct 2025 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPod6NX1"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800F313E1B;
	Thu, 30 Oct 2025 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824513; cv=none; b=YQ4DLT4km0ftKMePvmPpwQAtZdGsL+25zWihH1ndWRYQGBQLKwoCSXs2TGqh1YDXwnicDPobOT1YaKi0buRW35kdp1cglEh3ADpGM/gbPPXKeG/TfHyZQIjLi2W3ebQ3tR7rr0eRFVjP4Nzd4qogkVJfAF3/Qhk3zO2hs5Bcinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824513; c=relaxed/simple;
	bh=yVaHA930k5w1URigMaVlTNbgjAfUdrt64rj+JHld+lQ=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=UiKeoDJG8TmvOJe39UCMSd7Q6psmoGa88SL8PyTnW3pPmEPjQ2sNTbYae/2qMommy8ZqXz8NtNxS/g0XApJVEHN5pQa1/ZOAXUcJLasaxVtfqJ4gKZeDiC/b5ZKxd2U5Kz1VpkTf3S0VxVWM56fEUzn1cR2jnm0mp1raBwbzwIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPod6NX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DC7C4CEF1;
	Thu, 30 Oct 2025 11:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761824512;
	bh=yVaHA930k5w1URigMaVlTNbgjAfUdrt64rj+JHld+lQ=;
	h=Date:From:To:Subject:From;
	b=MPod6NX1p+itfu9GL+FMeeCvvvJDZcSaKxdiMwckH7oXhb4NB3+8AZ0uxUIn7pbJK
	 abDlW1ITw18bD6qDGZlBTnRc0xyeJZkHkHtoVJ73lTzvGF21y9zRnM8jFUjWYLdQQO
	 9Sa6fEJ2P9e4woFsI9J7D3Wnl3IYT/F47r3AnJP6fkKM2WwkIMxLm1KEOeP+lzvygS
	 aODMH19eoYwgpCVjiePlKvnvOtwDOh9XHPEPkb4DfVznGg5qKMmnYAg6ocYHud7OA3
	 4t9MqfomqvEAGtptAdY81di4k2u1klMtr89UBCtUVKKhMS1QLAJpWvVzR2o9q3+vYa
	 ktg20O1PQW+gg==
Message-ID: <571ea41f-a6e9-4574-b5c5-737f0a0a9965@kernel.org>
Date: Thu, 30 Oct 2025 12:41:49 +0100
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
Subject: FOSDEM 2026 eBPF Devroom Call for Participation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are delighted to announce the Call for Participation for the second
eBPF Devroom at FOSDEM!

Mark the Dates
--------------

* December 1st, 2025: Submission deadline
* December 15th, 2025: Announcement of accepted talks and schedule
* January 31st, 2026: eBPF Devroom at FOSDEM

eBPF at FOSDEM
--------------

FOSDEM is a free, community-organized event focusing on open source, and
aiming at gathering open source software developers and communities to
meet, learn, and share. It takes place annually in Brussels, Belgium.
After hosting a number of eBPF-related talks in various devrooms over
the years, FOSDEM 2026 welcomes a devroom dedicated to eBPF for the
second time! This devroom aims at gathering talks about various aspects
of eBPF, ideally on multiple platforms.

Topics of Interest
------------------

If you have something to present about eBPF, we would love for you to
consider submitting a proposal to the Devroom.

The projects or technologies discussed in the talks MUST be open-source.

Topics of interest for the Devroom include (but are not limited to):

* eBPF development: recent or proposed features (on Linux, on other
  platforms, or even cross-platform), such as:
    * eBPF program signing and supply chain security
    * Profiling eBPF with eBPF
    * eBPF-based process schedulers
    * eBPF in storage devices
    * eBPF verifier improvements or alternative implementations
    * eBPF for profiling AI workloads
* Deep-dives on existing eBPF features
* Working with eBPF: best practices, common mistakes, debugging, etc.
* eBPF toolchain, for compiling, managing, debugging, packaging, and
  deploying eBPF programs and related objects
* eBPF libraries, in C/C++, Go, Rust, or other languages
* eBPF in the real world, production use cases and their impact
* eBPF community efforts (documentation, standardization, cross-platform
  initiatives)

The list is not exhaustive, don’t hesitate to submit your proposal!

Format
------

FOSDEM 2026 will be an in-person event in Brussels, Belgium.
We do not accept remote presentations.

We’re looking for 20- to 30-minute presentations. The duration should
include time for questions: allow at least 5 to 10 minutes to answer
questions from the public.

Note that due to time constraints, we may end up offering a slot
duration different than the one requested when submitting. If you have
specific duration requirements, we encourage you to mention them in your
proposal.

You can look at last year's schedule for inspiration, at
https://archive.fosdem.org/2025/schedule/track/ebpf/

How to Submit
-------------

Please submit your proposals on Pretalx, FOSDEM’s submissions tool, at
https://pretalx.fosdem.org/fosdem-2026/cfp

Make sure to select “eBPF” as the track.

Code of Conduct
---------------

All participants at FOSDEM are expected to abide by the FOSDEM’s Code of
Conduct. If your proposal is accepted, you will be required to confirm
that you accept this Code of Conduct. You can find this code at
https://fosdem.org/2026/practical/conduct/

Devroom Organisers
------------------

* Alexei Starovoitov
* Andrii Nakryiko
* Bill Mulligan
* Daniel Borkmann
* Dimitar Kanaliev
* Quentin Monnet
* Yusheng Zheng

If you have questions about any aspects of this Call for Participation,
please email us at ebpf-devroom-manager@fosdem.org, and we will do our
best to assist you.

We keep an up-to-date version of this Call for Participation at
https://ebpf.io/fosdem-2026.html

