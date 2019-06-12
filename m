Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913A641D09
	for <lists+xdp-newbies@lfdr.de>; Wed, 12 Jun 2019 08:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407620AbfFLG5P (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 12 Jun 2019 02:57:15 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:40520 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407244AbfFLG5P (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 12 Jun 2019 02:57:15 -0400
Received: by mail-it1-f194.google.com with SMTP id q14so8886785itc.5
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0J0j/pKIGHgs0nVWLMsOc/eUiGdpieVxl9IN1uSv2Rk=;
        b=o27uS8x5DuAaeW2aadyLRsJKl/o5cyA8xHSwMkbQd9N7CvdugeZCjc7kpFqz2fWJhM
         g7FSJySh5Jcil9Hs+aRPJFTACV+L8+x8HVZspX6ShCHRnvGwHnFtYhijy8i/DP9YHGQ7
         x/5oX8hww7fGRtBf0zHxT+9Xtgw8uaa/9v3PhU/tDpcIlgyxhoe+GJ4k6v7RtA5g5aWG
         Po2UlqclaTYw2B0GfN2bdIi6WAJga0uFCiwzph7oPUGSMnjoqGaL59K6H5FquqzVWNFu
         c3pQWggfnxKLyAGMLvqVGxrsEYoBukjIPLVFYFpKqf+aRI/mPaBR8KzfX+YWEZH2GDE1
         DCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0J0j/pKIGHgs0nVWLMsOc/eUiGdpieVxl9IN1uSv2Rk=;
        b=WVy+iQHFdi/ZnhX5EvOiexwPK0KeHYZxGLubEtneMs0+Qj2sPDaw+efnczaJv/RYxe
         W4A0fV+xDfoGSGcZDwJrTVBFm+ZKevz50QN9+8kYx5UlbITtYRKQqXMMjbo33wXXy2Z8
         q9Y+f0cTG3zHWBvEZp5n/a65n/nj3UBD08knveQ6+BUeoEiPDv7vCQXRsiViD7fSI53n
         Y9VyKOF7iDsdO2I3//RuzxqnLmJRDDW2L/HbFhnViclSrbeJYK+b28aKbrxRtd/d+Gnp
         i1lG1aeTnPN05Ngi0LTg5ZTaMmDY9KiG5NQ/MiQXXjXdfI1Lmuv3YF/PR/fuarSfyMI7
         SUrA==
X-Gm-Message-State: APjAAAUV2DnX7mADvHCalq2BxSithaX5nwoHeWKzV3QKI4VbtwqVWTDo
        XZPYuE2g4E0dEAZNs4jNPDIkzoz7oP5Ygd8rh2o=
X-Google-Smtp-Source: APXvYqwhKNs3xou6mi05PnFRGoPjNYbNlQWJMHlWwOrZRS1sWWB5RvZzGLWllPXBKi3Af7E98wOWMLVESWsMLXb/A2M=
X-Received: by 2002:a24:2407:: with SMTP id f7mr16668368ita.21.1560322634015;
 Tue, 11 Jun 2019 23:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
 <20190610121540.36391dc3@carbon> <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
 <20190611124119.49a0e440@carbon> <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
 <20190611164525.6f8e845c@carbon>
In-Reply-To: <20190611164525.6f8e845c@carbon>
From:   =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Date:   Wed, 12 Jun 2019 09:57:02 +0300
Message-ID: <CAK6Qs9kbWdRSer1LTz53BunJkvpQaa02YExen65Tha3HpGrW+w@mail.gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I removed bridge and did same tests again. Unfortunately result is same :/

On Tue, Jun 11, 2019 at 5:45 PM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:

>
> I would recommend removing the bridge setup, for isolation the issue,
> as this could be the issue.  XDP doesn't cooperate with the bridge
> code, and it works on a layer before the bridge.
>
> For the ixgbe driver it does a full link down/up (to reconfigure all
> the NIC queues), which is why you likely you see this 5 sec issue, as
> you have enabled STP on your bridge.  (Note, replacing an XDP-prog with
> another XDP-prog does not require this link down/up).
>
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
