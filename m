Return-Path: <xdp-newbies+bounces-25-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3C82197B
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Jan 2024 11:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627D6282E1E
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Jan 2024 10:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A323FD27E;
	Tue,  2 Jan 2024 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+qax1SZ"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A1D262
	for <xdp-newbies@vger.kernel.org>; Tue,  2 Jan 2024 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bc14577a8eso30323b6e.1
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Jan 2024 02:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704190536; x=1704795336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2q0zcW8KO1Jv/bbiDSKSfPNRgRrQn4RW6I3e9SGOHA=;
        b=g+qax1SZMfX5rfreGrSEFWGXvi5sNXbzUOxhv4AsuwFRbW+1Tl+uS1S3AY/loh3w94
         ZDGi92n/oaq5rjxP83NOU78uIAbXruhU1M8feEUZQxLfQgn6d0x94c2KxwA1iOj71I+0
         CVDiVbqQRBlIy/tvJvMBWndzwxrdXqqDTeR2/aqOUBnrruLZiDOZxQWCWtOH5VSulSFA
         Pug30CdnfIVqsorHu0pOvlZXp2Qbn6NAceeWYQF4FKb0MEUOaT/HIDBogboiA9hxbxgx
         s/KswyUOVvxEGbbXad1r7b7K3B6Pgdyb4U014O4boyRlrEBmB1KhSLnF3g6i+HuODLzV
         iQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704190536; x=1704795336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2q0zcW8KO1Jv/bbiDSKSfPNRgRrQn4RW6I3e9SGOHA=;
        b=nihv6QazVFp8fpPK7EL8oOh0ywrRUL+Czy+Cv1/vUlGSZCyVrCkYo7UpAS+3uvfl9+
         edXPIoU+nh+4OzblV2LZINooOam/jS8IUYfcg8Hjt2EAYYP7vz+F74N8H4QhbBRvNFFb
         HJ7ZBsuNeayCjnLp/1I/ToJ3ClyYdtHXv7UG4Ii6gj9/5QumxPnKBBR2x4QBRbc0noqL
         PcF3SLHTRbFlz8DFq9+WLV6u5sKLo4rmAOqGc3xpQnB8475WE50ZrQ3ttp3+mjeS367z
         AzXYLDlCLd4voh4KbsGWvpSjTpTttGfxbdUEpG7xwyn9Z35uU7ovuNp3qMor7v5tN9Hv
         8Yuw==
X-Gm-Message-State: AOJu0Yw77H9sROJ7hF0sqQlzTmW5EmPNy0RL+h+r1i+NTZqhxJYILJNl
	9QCVE2GEpCYotg+V4AJ36uq+MXs+le+XFlv14Fk=
X-Google-Smtp-Source: AGHT+IGZyYuojTE6gSsFocl0htD1/0ljc3n4TwvnfzjqGohMsR1Vl8D610tcGdmkmgnsRJBSDlRhRChPnR9ob6GgDp4=
X-Received: by 2002:aca:2303:0:b0:3bb:cc74:c20e with SMTP id
 e3-20020aca2303000000b003bbcc74c20emr14678282oie.1.1704190536077; Tue, 02 Jan
 2024 02:15:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <52605D3E-4242-46D9-BFA8-50DDA0F6A84F@radware.com>
In-Reply-To: <52605D3E-4242-46D9-BFA8-50DDA0F6A84F@radware.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 2 Jan 2024 11:15:24 +0100
Message-ID: <CAJ8uoz3GxW8bzrLhw8+=cbVVmYV3PXFEJNWt=Rbru0x8AR8UJw@mail.gmail.com>
Subject: Re: Switching packets between queues in XDP program
To: Yuval El-Hanany <yuvale@radware.com>, 
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 23 Dec 2023 at 23:25, Yuval El-Hanany <yuvale@radware.com> wrote:
>
> Hi,
>         I=E2=80=99m designing a POC to port a large application from DPDK=
 to XDP. Switching ingressing packets between different processes is part o=
f the core concept of the POC. I saw a question in the Q&A of AF_XDP but th=
e question and answer seem a bit mismatched. The question is about switchin=
g umems in copy mode and the answer is generic about switching queues.
>
> Q: Can I use the XSKMAP to implement a switch between different umems in =
copy mode?
> A: The short answer is no, that is not supported at the moment. The XSKMA=
P can only be used to switch traffic coming in on queue id X to sockets bou=
nd to the same queue id X. The XSKMAP can contain sockets bound to differen=
t queue ids, for example X and Y, but only traffic goming in from queue id =
Y can be directed to sockets bound to the same queue id Y. In zero-copy mod=
e, you should use the switch, or other distribution mechanism, in your NIC =
to direct traffic to the correct queue id and socket.
>
>         My follow up question is whether this applies if I use a shared u=
mem to all queues and devices. Obviously, it does not apply in user mode, a=
s it=E2=80=99s possible to send the packets to any device and queue sharing=
 the umem. Is it impossible to send packets to different queues even if the=
y share umem in the XDP program using the XSKMAP? Is this a hard limit or a=
 safety measure, that may be lifted using some kernel patch? For the POC, t=
he limitation may fail the whole port. I've tried to switch packets between=
 queues in a simple single process application in skb mode with a shared um=
em and indeed it seems the packets did not reach their destination.

Sorry for the delay, but now I am finally back from the holidays.

In zero-copy mode, it should be possible to lift this restriction when
the umem is shared between different netdevs and queue ids. My guess
is that this restriction in the code is there from before the time the
shared umem concept was introduced and it was not lifted when I
introduced that. The only complication I can see is that in
user-space, you do not know from what fill ring the buffer came from.
So a simple scheme such as: "after processing a buffer from the Rx
ring, return the buffer to the corresponding fill ring" does not work
anymore. But that is easy to solve, so should not be a problem.

Do you want to take a stab at a patch or do you prefer me to do it?

There is also the case of copy-mode that we should support, but we
might get that for free as it amounts to the same thing when the umem
is shared. However, it is also possible to support your use case (in
copy-mode) when the umem is not shared as we are copying the packet
anyway in copy-mode. Just have to pick the correct umem as the
destination.

>
>         Thanks,
>                 Yuval.

