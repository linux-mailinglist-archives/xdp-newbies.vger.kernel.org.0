Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C478D6C242A
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Mar 2023 22:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjCTV5Y (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Mar 2023 17:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCTV5Y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Mar 2023 17:57:24 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5053431C
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 14:57:23 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id cu12so2625719pfb.13
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679349442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3oIhbzHlDHndvsQ/ts059gzzmEQFw8T9pTrf9CB8nM=;
        b=Gjm5OBIkkXER7j/s32lNGZWL5RkKkSQ5GKDemyfB4hLZMt/vDWi2LFib91BklZFl7G
         vPFLYP5qW12A2Tjh1/GnTMCWt1vuja+k1Tn4098z24h6TLFXcpv6ukKEGWJKMvZDmVdC
         YX1uIT0jn/qzh3WZD7eooM9LZmus+dUUpoE3ly4WzZC2RyR1wLSlSePKa989n55NPl/A
         t47LrCrYya9Iz5CLgER4b+QT25SxZ43KGIZC/kfTP2Y4ALXJkPNt7mBkG864dTJc8mFr
         x9uNk42zNL2vsny7pCFRzDv0h5QVU4DkiQjauVzPOQZXrhZKaEz+nvmit3veQgCRGzha
         Vj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679349442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3oIhbzHlDHndvsQ/ts059gzzmEQFw8T9pTrf9CB8nM=;
        b=2C/QUGBnqAXcqGS7XkIkTEhrgI4Z6zBFFXCYJpJUwpj5zhUCtgIrvBiLf024dRjtJc
         /Y5jElwRSJqYxs1vSEoVNWR20/F2ATcO7Pi3XtI2I45rhZAbFDlCW0au9E6g4dKUOg9Q
         k1c7M7OQi1zug5og9egA1EexmVgXCwXL+SFF3aGeNKWiad5HCQqZwxpEXHr/DfuwqWtB
         Y122m+jGedfp5WBHyT9Pz+CWxkLS8sbUacrqFoP8avfuUbgmXb99hq20OS9svthvauq3
         JMP6EPFLzQ3QEdD17sHEtxgBNPhUsyZWdzVsD8rz72uRJOl3fHVfUU1SAK6Au5RbsqJG
         88vA==
X-Gm-Message-State: AO0yUKWx79J0G+np4K3fLOZ5zOYlAtot7deYfPLXVKGTVVtKRWttVVSp
        4zffBy1yT6aTV0Vyu6l2rG4tDAY1TvAjPpOfDxXkSp0eNLI=
X-Google-Smtp-Source: AK7set+UAxcuPQ/ieAgmUl59uaoG3Ur30ryp4kKJrN9WcMGzmrWpdKvTSiN0IHcczc7YxSumaheDJDiKXYdULCrqTE8=
X-Received: by 2002:a65:63c6:0:b0:50f:53aa:f662 with SMTP id
 n6-20020a6563c6000000b0050f53aaf662mr54048pgv.5.1679349442441; Mon, 20 Mar
 2023 14:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
 <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com>
In-Reply-To: <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Mon, 20 Mar 2023 14:57:11 -0700
Message-ID: <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
Subject: Re: How to get system localtime/wall time from eBPF?
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Mar 20, 2023 at 10:15=E2=80=AFAM Jesper Dangaard Brouer
<jbrouer@redhat.com> wrote:
>
>
> On 20/03/2023 16.33, Vincent Li wrote:
> >
> > if I have a XDP based firewall to block ip  access based on system
> > localtime/wall time, is it still impossible like what mentioned here
> > https://github.com/xdp-project/xdp-tutorial/issues/204#issuecomment-819=
419800?
> > If so, is there any way to workaround this?
>
> You could use the BPF-helper named: bpf_ktime_get_tai_ns()
>
> See man clock_gettime(2). It is the same as CLOCK_TAI, which is
> (currently) offset with 37 sec to CLOCK_REALTIME which is wall-clock.
>
> Perhaps kernel should be extended with a bpf_ktime_get_wall_ns() ?
>
I guess it would be useful, I have a scenario that only allow ip
access between 07:00AM - 10:30PM for middle school kids everyday. now
I use cron job to run an user space program to add/delete IP from eBPF
map pinned by the XDP firewall program :)

> --Jesper
>
