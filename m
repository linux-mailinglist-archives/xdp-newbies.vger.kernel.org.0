Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81313343B5
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Mar 2021 17:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbhCJQxQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Mar 2021 11:53:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhCJQw6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Mar 2021 11:52:58 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10DCC061760
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Mar 2021 08:52:57 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id n14so18661480iog.3
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Mar 2021 08:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=awL0WbK0z8dQ3jpN2g7x7CTck2CTHmXE4U3LNvYOvj0=;
        b=Qw3QMiaaWl/NiB8xYaRO0zETajZThKPl19DxAsbOXONEJiZYmYHDIBIp/7bZOJS2pa
         cg1bS3gsmOSxyCiBQoEQ5MF7InnX0fmem9mgLV466vVVxU0WOXlFLSwdSgHwpmH8npDc
         //z69EKjVhuOmlDQLZX2PRAAPGEsg14ldh+Mlz3LtT32pSEtDwVsksK3Rqe7WNCbq9ya
         jdRkCp42Qb/FmSkB4xhoBO6l1atIuGdEcWVJ9HCErzaQNovT7NqDhMnsXwAEatWONeGl
         DowU/42xlvquXY+TMs6rwXx9Ylhuc7g4saRp6/qPsGHrXfjlKpTBji43Wlg5gMx1z/3N
         s5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=awL0WbK0z8dQ3jpN2g7x7CTck2CTHmXE4U3LNvYOvj0=;
        b=OsdUZoDMr96cSz4Tzn7EsPoxA24SD5j5PZLtRJynlQdR/4hs61ziBxFJ0/SO3mYQzm
         Qz/WAh4bddaF08Y9Y8VIP0ZkKJEhvOlSmVdlitPTPSl3e+cae3+7azGGMcSWTIRMZsFS
         /MbC26jILoIpYmDieJUnbDPNuZ1IJn/aiVmv13st3Z0YfJpKv9BS/V/qx/I7w6pCStiu
         GT/HJMKu8pw0qbk2mq3WxIqgXg5L1OoWIOg3dwD6wk9UOoB6+LNPUxzARpxOP/ib+uZG
         WCZXm/mmdGHZiI001RmwQ41fac4Cdf35oD71x+QgO2XLnpDfKBafnLnv0eMPFhfnbK3N
         br7g==
X-Gm-Message-State: AOAM532O5Ntawa7c6Gf98N/47pi/bQeXUliJFRxTrZ2rTBVq0JNzSpIb
        toTGS0BnBNUe4gV9vM+xJFzWA+vHCmzltj+tDJUW0Hrwd8laVA==
X-Google-Smtp-Source: ABdhPJzeQuanicozR7XukgOo61EKPt+xyXmPSBOFrAk3C3ue23rYJn3uIprj2NIsVEk2UzVumF9FCjOfIFtsldfDI2o=
X-Received: by 2002:a5e:c00a:: with SMTP id u10mr2928687iol.165.1615395177097;
 Wed, 10 Mar 2021 08:52:57 -0800 (PST)
MIME-Version: 1.0
References: <CAFQY-shyWTWk0+uf95G-5m-9FmMzQ2kcCdjFx+heWq3ko1KhmA@mail.gmail.com>
In-Reply-To: <CAFQY-shyWTWk0+uf95G-5m-9FmMzQ2kcCdjFx+heWq3ko1KhmA@mail.gmail.com>
From:   Rob Sherwood <rob.sherwood@gmail.com>
Date:   Wed, 10 Mar 2021 08:52:46 -0800
Message-ID: <CAFg6RxvDPN6mCuyL5u4uzj_THa2O7AsPFdPX7uLV2uk3Heq0pQ@mail.gmail.com>
Subject: Re: Queuing disciplines with XDP_REDIRECT
To:     Rohit M P <rohitmp99@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

If you're interested in using the kernel's queuing features (e.g., tc)
there's a separate eBPF attachment point for tc that you might use
directly.  Check out
https://man7.org/linux/man-pages/man8/tc-bpf.8.html if that's of
interest.

- Rob
.

On Wed, Mar 10, 2021 at 7:32 AM Rohit M P <rohitmp99@gmail.com> wrote:
>
> Hi folks,
>
> I was experimenting with XDP where I'm able to route the packets using
> XDP_REDIRECT.
> Could anyone point me towards using kernel queuing disciplines along
> with this if it's possible, or other possible alternatives for queuing
> disciplines while using XDP_REDIRECT?
>
> Regards,
> Rohit M P
