Return-Path: <xdp-newbies+bounces-5-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CEF8006EB
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 10:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6E48B21165
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 09:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A627E1D52F;
	Fri,  1 Dec 2023 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="FL6M1IVx"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159B1326C;
	Fri,  1 Dec 2023 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:Cc:From:To:References:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hosGaHgn7Nx0kkivYehFzLNTC29CHl4XH0Uoe9fwnng=; b=FL6M1IVxSt+g4Puetdxv1NaFZx
	pe6pQPnod/z2u3rH143po9eU88faq1Xb3iCuC1d4QWQY5Mttry189tq5ODsfZEVKjeRfVNF1Tz6y6
	zTxmVfkuGxW+H0/N823ZY5aJYPlEVTpsuZrdPQMMdf/+zc+e9N52/T5hCWbbt6gb1B3pEpPz9X1HG
	66pdhz+MB0YBuhquXdok0gb9eRkmZpGfTwzZoKpKj9c943/8SCS/AWb0fSQFFwlodB1tJ+66GMHuQ
	RY3utoYYVmuzqQacdmUtgWXu/Twe/c38j1L6D1cwtgWSvf7L9mE4vK39nBHtNBLob3tqIIlRZSZ4o
	Ks/OKRBg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1r8zoZ-000Cj4-T8; Fri, 01 Dec 2023 10:28:03 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1r8zoZ-000Hv4-HK; Fri, 01 Dec 2023 10:28:03 +0100
Subject: FOSDEM 2024: Kernel Devroom CfP
References: <20231130200641.GL636165@kernel.org>
To: netdev@vger.kernel.org
From: Daniel Borkmann <daniel@iogearbox.net>
Cc: bpf@vger.kernel.org, xdp-newbies@vger.kernel.org, brauner@kernel.org,
 rppt@kernel.org, stgraber@ubuntu.com
X-Forwarded-Message-Id: <20231130200641.GL636165@kernel.org>
Message-ID: <3c3f4b40-0fdc-86ae-c88e-29c1a39a6759@iogearbox.net>
Date: Fri, 1 Dec 2023 10:28:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231130200641.GL636165@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27109/Thu Nov 30 09:44:04 2023)

Hi all,

We are pleased to announce the Call for Participation (CfP) for the FOSDEM
2024 Kernel Devroom.

FOSDEM 2024 will be over the weekend of the 3rd and 4th of February in
Brussels, Belgium.  FOSDEM is a free and non-commercial event organised by
the community for the community.  The goal is to provide free and open
source software developers and communities a place to meet to:

- get in touch with other developers and projects;
- be informed about the latest developments in the free software world;
- be informed about the latest developments in the open source world;
- attend interesting talks and presentations on various topics by project
   leaders and committers;
- to promote the development and benefits of free software and open source
   solutions.
- Participation and attendance is totally free, though the organisers
   gratefully accept donations and sponsorship.

## Format

The Kernel Devroom will be running an all day, exact day and time will be
clarified in the near future..

We’re looking for talk or demo proposals in one of the following 4 sizes:

- 10 minutes (e.g., a short demo)
- 20 minutes (e.g., a project update)
- 30 minutes (e.g., introduction to a new technology or a deep dive on a
   complex feature)
- 40 minutes (e.g., a deep dive on a complex feature)

In all cases, please allow for at least 5 minutes of questions (10min
preferred for the 30min slots).  In general, shorter content will be more
likely to get approved as we want to cover a wide range of topics.

## Proposals

Proposals should be sent through the FOSDEM scheduling system at:
https://pretalx.fosdem.org/fosdem-2024/cfp

Please select the "Kernel" as the __track__ and ensure you include the
following information when submitting a proposal:

| Section |  Field       |  Notes                                                                             |
| ------- | ------------ | ---------------------------------------------------------------------------------- |
| Person  |  Name(s)     |  Your first, last and public names.                                                |
| Person  |  Abstract    |  A short bio.                                                                      |
| Person  |  Photo       |  Please provide a photo.                                                           |
| Event   |  Event Title |  *This is the title of your talk* - please be descriptive to encourage attendance. |
| Event   |  Abstract    |  Short abstract of one or two paragraphs.                                          |
| Event   |  Duration    |  Please indicate the length of your talk; 10 min, 20 min, 30, or 40 min            |

__The CfP deadline is Saturday, 10 December 2024.__

## Topics

The Kernel Devroom aims to cover a wide range of different topics so don't
be shy. The following list should just serve as an inspiration:

- Filesystems and Storage
- io_uring
- Tracing
- eBPF
- Fuzzing
- System Boot
- Security
- Virtualization
- Rust in the Linux Kernel

## Code of Conduct

We'd like to remind all speakers and attendees that all of the
presentations and discussions in our devroom are held under the guidelines
set in the [FOSDEM Code of
Conduct](https://fosdem.org/2024/practical/conduct/) and we expect
attendees, speakers, and volunteers to follow the CoC at all times.

If you submit a proposal and it is accepted, you will be required to
confirm that you accept the FOSDEM CoC. If you have any questions about the
CoC or wish to have one of the devroom organizers review your presentation
slides or any other content for CoC compliance, please email us and we will
do our best to assist you.

An up to date version of the CfP can always be found at
https://uapi-group.org/docs/conferences/2024-02-04_fosdem-kernel-devroom/

Thanks!
Christian Brauner
Daniel Borkmann
Mike Rapoport
Stéphane Graber


