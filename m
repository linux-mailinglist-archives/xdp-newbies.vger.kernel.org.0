Return-Path: <xdp-newbies+bounces-15-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4730B81857A
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 11:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D88D2287044
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 10:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9ED14F68;
	Tue, 19 Dec 2023 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCVM/wMY"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0414F67
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4277e257be3so737141cf.3
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 02:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702982767; x=1703587567; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U/kvv1Se0FEiFcIujgl+d5Nk4O1uN3G6PPX9z1saztY=;
        b=mCVM/wMYczlVVA+iiIdLUUyOSnfHomHHVxvFyMA5XY4spuPlu5E2TUXc3+5pErUfjV
         9jyT924Tk2r4LHKjOZWvbMTpG+xe8UeqPRxBvuYrKaSEAwn6th7zIy9DUXBnPQvWYsJN
         aHeHfPb9pttpBbFiggvENtL+zHJqMsPQcRq0dYHlhPj1iQ88ulBq1IvkoeJllr6Ni5oV
         yPlJz+j0R7VMaat+yUxfZvxfWBu0CSfr6rBAwbSzHhBVY0AGjzBEl6Z9aLCGWNj4g6vt
         jkrFNlrMykqIJouEChpzcRx4Yxde1VcZClS0P868WCXfIMBHzsNJFwdyu6Hec+eyZw4t
         UYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702982767; x=1703587567;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/kvv1Se0FEiFcIujgl+d5Nk4O1uN3G6PPX9z1saztY=;
        b=XcnsQbvlW4ERa24Vj7pztahYUsBdh6RRXV5dw3T3J/BCzlqQxdaIwWk6rAdZO35S8D
         DsFBM/Di2zZZs3TP6PxYYChn4zXNJzWX2IX079gUjYrVx9ssSo2e054oap7aW7jCcspa
         whTSjr8Zqv+ifUO2KPiAOldqCpSfHssp9at2Qc/sOT0uc+rI7q7tN7uzDhFfG9eChPhX
         2IHK6Ez7DrEfFCDB8aa25EPI3pVDBoblkyE3JVOaY/9VghfGi+dzHsQMIIwhiqQf8HFU
         yI0Xs8V2sx7X/4urO1zqnsnR9o9g8wiSScg6GZE4L7SQ3746RG90AMzfGbWAVsm4IhEm
         DKFg==
X-Gm-Message-State: AOJu0Yza8QMoOFc9ZijsgGsXY4n6okHSXD9gE/yOxosxpwyQaNpNgSQx
	WgI/WgVPnIWQZg0Y66HJTXwSvn0eEsqQXhJ+ASO2zxyeKvA=
X-Google-Smtp-Source: AGHT+IERyA08TClIckJEgPg/lWCeJW0IIDI5sPEf90P7Gt5yCOB08FbiFlOGVzk6I4HvYp8bG+q0PzQ08Tw35LbF6oA=
X-Received: by 2002:a05:622a:205:b0:423:98b9:3842 with SMTP id
 b5-20020a05622a020500b0042398b93842mr27258396qtx.23.1702982767452; Tue, 19
 Dec 2023 02:46:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Tue, 19 Dec 2023 16:15:56 +0530
Message-ID: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
Subject: Redirect to AF_XDP socket not working with bond interface in native mode
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am new to XDP and exploring it's working with different interface
types supported in linux. One of my use cases is to be able to receive
packets from the bond interface.
I used xdpsock sample program specifying the bond interface as the
input interface. However the packets received on the bond interface
are not handed over to the socket by the kernel if the socket is bound
in native mode. The packets are neither being passed to the kernel.
Note that the socket creation does succeed.
In skb mode this works and I am able to receive packets in the
userspace. But in skb mode as expected the performance is not that
great.

Is AF_XDP sockets on bond not supported in native mode? Or since the
packet has be to be handed over to the bond driver post reception on
the phy port, a skb allocation and copy to it is indeed a must?

Another thing I notice is that other XDP programs attached to bond
interface with targets like DROP, REDIRECT to other interface works
and perform better than AF_XDP (skb) based. Does this mean that these
are not allocating skb?

Kindly share your thoughts and advice.

Thanks,
Prashant

