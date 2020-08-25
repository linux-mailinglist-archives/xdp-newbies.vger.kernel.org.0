Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A64250CCD
	for <lists+xdp-newbies@lfdr.de>; Tue, 25 Aug 2020 02:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgHYAO2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 24 Aug 2020 20:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgHYAO2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 24 Aug 2020 20:14:28 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0892C061574
        for <xdp-newbies@vger.kernel.org>; Mon, 24 Aug 2020 17:14:27 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id l191so3426555pgd.5
        for <xdp-newbies@vger.kernel.org>; Mon, 24 Aug 2020 17:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRJVhTjiHJJIFnEelHfXjaXrA9SEPwNLx6y6ACidTjY=;
        b=jsS6fEAFXe+p26IID2Lf7ksEPgiKsBibthic7myT0nPUrhWlvm3/g9gjlZEfl7Ip2N
         11Tk7BcigLWZR62/fhEyLD1gaf7NAmB27Mwj8mn40JzSqJ5HiX/b1kq53dok+Otz3huI
         rTZ1HjW7/FNMimdubAjQUO4DUCFMGOXoZWLXDQ8u8RxM/Oa8gABN1aMUTYrJz0AWNWwa
         dEFN3+9oIYPQCkFZ9thex0ytKuB9jp8MgliTa+BZcmGXBwDPInQDnbv+djQyqkRJ2h3S
         YxVN9TmvM/21diEZMPLAXPINJDvDyX5EI/Ci1g+nbS/mVziC+lKA7AP4//JrTZbeu7Am
         vT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRJVhTjiHJJIFnEelHfXjaXrA9SEPwNLx6y6ACidTjY=;
        b=ebefxtw1yoWkSGMqTs5MbolBgZOHkppb1I8vsOt6nnW1We0G9plLMuGmCNOEIItoNb
         Z80Ap1HSTxqnZUjRnHHs9HDL+TwH20ysdtCtc/T/8dSNq4ywkgPQR4NbPtOTqU/OvDm6
         /HXvsk6yKf2gzmGHoDMXs5UCFoeH/MFPU3q2a0hMzmqGm6Um4/t9vxSu7rTs53eLPSjh
         dyJlJzd94Mfkjirb3UpvJgtDMOAqa1uagTvW9f/3mMMD3QQ0osasGjgtymdCR11pWQ38
         nILDGuDDIdShfght/v5cy3Uq83ozGZtIGjgBedWOpoCa1WHhA9dXKy4Lb/KXOYxzgXXu
         Y+XA==
X-Gm-Message-State: AOAM533Wewt4SXR+Tz3JeY9odeO6DDxbaRMgw4jYM0zB/G4+nyPnXJaK
        ADqVBYxKwURfWFJ/qYGJZjdglg==
X-Google-Smtp-Source: ABdhPJxcqtd7ECH9urE5cTn8DBstS7rtz5NgshSsnAn6Btywj3cRlnKodld93XrXBeThN7qQ7+/I1w==
X-Received: by 2002:a17:902:bcca:: with SMTP id o10mr5759533pls.132.1598314467260;
        Mon, 24 Aug 2020 17:14:27 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id w9sm10786269pgg.76.2020.08.24.17.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 17:14:26 -0700 (PDT)
Date:   Mon, 24 Aug 2020 17:14:18 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk2@gmail.com>
Subject: Re: Using XDP for Cloud VMs by David Ahern
Message-ID: <20200824171418.1b2cffa0@hermes.lan>
In-Reply-To: <20200821115614.40fa7eb0@carbon>
References: <20200821115614.40fa7eb0@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 21 Aug 2020 11:56:14 +0200
Jesper Dangaard Brouer <brouer@redhat.com> wrote:

> is measured read [Blogpost#1]. He have even released the [Code] on GitHub,
> and encourage people to reproduce his results.
> 
> I encourage other cloud providers to collaborate with Ahern. XDP is a core
> kernel building block, but we need to create FOSS projects that explore
> different use-case (e.g xdp-cloud-provider). XDP is still early days, and as
> Ahern already discovered, trying out this Cloud-VMs use-case have identified
> several gotchas and missing XDP features that we should work on
> adding/fixing in upstream kernels.
> 
>  --

Was this normal OVS (kernel based) or OVS-DPDK (userspace).
OVS-DPDK is much faster if you can afford to burn CPU.

Also would be interesting to compare XDP vs VPP but this is very much
an apples to orange kind of exercise.
