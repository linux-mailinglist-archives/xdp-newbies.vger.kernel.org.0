Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1416533732
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Jun 2019 19:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfFCRth (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Jun 2019 13:49:37 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34869 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFCRtg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 Jun 2019 13:49:36 -0400
Received: by mail-qt1-f195.google.com with SMTP id d23so10480386qto.2
        for <xdp-newbies@vger.kernel.org>; Mon, 03 Jun 2019 10:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=YGNZXdoeRNmz7BqeF0/v3i59X3wiJHrSCMaZEz5idac=;
        b=UaVuEr/kuy5hiq44Vf2xKm1Yj7c+f/OmHOwwwaNBE+hEEHXF2JMkizF7W0TNG0ZqOV
         vAVGiZfmwhJNGAgCvAwCEhC1PlGwzWbBUyCLkgOrSi7zvR0FxhY8W1dJelfaN/00dRWc
         97P8ELdZwEXFh0hdUXrMdmEPvlEVZ51R4ltg0ecUrBNziApYmpfYaVpnkP+bkP2otft+
         lmVLkL3cATiX1Uxg1dV/nKaKl5/rore1zlk0dVi5wn/2NoB6BLWN4UFAlG2KYsqcomDC
         iSM/Vgcuf5WgI+Kxky6hG1HH47rBWZ0MWU2MSoJ5sSqrZ21p0sl7SGN6kTgzFeEOlqww
         nQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=YGNZXdoeRNmz7BqeF0/v3i59X3wiJHrSCMaZEz5idac=;
        b=ZmqTd0IyJrd94qRltHY/pzeb7or/TvOewVDe8pkTV8v+UTv01pX7PwQU8V519jDIU1
         r0jQNyCglF3MNsLR+kt9RFqIU9jZIRS0NbEV1TaYWzfRWPsoUDcP+A8Us6NWypwSqlT8
         AAwP6uTvNdydwT6ydXxyNEo4ECCyJrlDDVPUgTiIsaM0PGgQtYc9MfO9OeEMerzs5Wwd
         SrpgJ8oYbXiTTQFuJx9LuxffzO3vNbNK44N7SU3ol4p5ZX3pLelT3KgXqkbLSlqXNTCq
         3X6pSCL5fLW2zaNN+z5Y7wEph46EkDRI9L+P0MeaRsqKcF43ohS1a9/clJLaS4F2yuhp
         cm7Q==
X-Gm-Message-State: APjAAAW+6BNW8b4l+2NJbpxphrr9txJPvWxbivEpuG9L1bo5q1o+qsBX
        zSHnwR7+XNFMmcbSweI9P1K8BLWZYzo=
X-Google-Smtp-Source: APXvYqy/e+Icc90gZvRu6SLe47LtjkZ15LHtXZ8eD5H9j0kECFuBEjDcn8Vx5zAwaodVM/Kr93ev9Q==
X-Received: by 2002:a0c:b5c7:: with SMTP id o7mr22920460qvf.220.1559584175979;
        Mon, 03 Jun 2019 10:49:35 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id e133sm11972673qkb.76.2019.06.03.10.49.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 10:49:35 -0700 (PDT)
Date:   Mon, 3 Jun 2019 10:49:30 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S . Miller" <davem@davemloft.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bpf: remove redundant assignment to err
Message-ID: <20190603104930.466a306b@cakuba.netronome.com>
In-Reply-To: <276525bd-dd79-052e-7663-9acc92621853@canonical.com>
References: <20190603170247.9951-1-colin.king@canonical.com>
        <20190603102140.70fee157@cakuba.netronome.com>
        <276525bd-dd79-052e-7663-9acc92621853@canonical.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 3 Jun 2019 18:39:16 +0100, Colin Ian King wrote:
> On 03/06/2019 18:21, Jakub Kicinski wrote:
> > On Mon,  3 Jun 2019 18:02:47 +0100, Colin King wrote:  
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The variable err is assigned with the value -EINVAL that is never
> >> read and it is re-assigned a new value later on.  The assignment is
> >> redundant and can be removed.
> >>
> >> Addresses-Coverity: ("Unused value")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>  kernel/bpf/devmap.c | 2 +-
> >>  kernel/bpf/xskmap.c | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> >> index 5ae7cce5ef16..a76cc6412fc4 100644
> >> --- a/kernel/bpf/devmap.c
> >> +++ b/kernel/bpf/devmap.c
> >> @@ -88,7 +88,7 @@ static u64 dev_map_bitmap_size(const union bpf_attr *attr)
> >>  static struct bpf_map *dev_map_alloc(union bpf_attr *attr)
> >>  {
> >>  	struct bpf_dtab *dtab;
> >> -	int err = -EINVAL;
> >> +	int err;
> >>  	u64 cost;  
> > 
> > Perhaps keep the variables ordered longest to shortest?  
> 
> Is that a required coding standard?

For networking code, yes.  Just look around the files you're changing
and see for yourself.

> >>  	if (!capable(CAP_NET_ADMIN))
> >> diff --git a/kernel/bpf/xskmap.c b/kernel/bpf/xskmap.c
> >> index 22066c28ba61..26859c6c9491 100644
> >> --- a/kernel/bpf/xskmap.c
> >> +++ b/kernel/bpf/xskmap.c
> >> @@ -17,7 +17,7 @@ struct xsk_map {
> >>  
> >>  static struct bpf_map *xsk_map_alloc(union bpf_attr *attr)
> >>  {
> >> -	int cpu, err = -EINVAL;
> >> +	int cpu, err;
> >>  	struct xsk_map *m;
> >>  	u64 cost;  
> > 
> > And here.
