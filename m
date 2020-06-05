Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB231EF8B1
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jun 2020 15:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgFENL5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jun 2020 09:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFENL5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jun 2020 09:11:57 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B418C08C5C2
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 06:11:57 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id r11so5556673vsj.5
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jun 2020 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmop+dirhD4Ll41KkMmNT/V/SAI1wakRVE50e1bjySU=;
        b=XRA/NikupoPkU66ktcKZn0y3aqN3GtADXCbAuR6rVUbtdPWhL9llYwezb+4CFFZPB3
         dg0/TyId3QCnfvrVzlDxM6eTSbw/PvPuWdfyfgGOuWBRYXmD8fLWspYhzTwf0GGDDTpe
         raSAbhaTS+bAd3GURDb7bIaMsPKdRbBFxso1nTAhrJRnYCTH5gBQJLMWQGyEEOUSHsgi
         KUrOg5ZlvFJVw74p90/50oCh3Q1aCT/3PQIEsGKo2jAJoQdPEy43yyFD65VTX6RcCFMf
         FkXjOzYXn29K5ZJqdgAhmYuSxG3cRzALw1EUfOq93C+OYaCI3wBeZbRuRYYIXtad2pTa
         9LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmop+dirhD4Ll41KkMmNT/V/SAI1wakRVE50e1bjySU=;
        b=ibucIKSZ6HVEQWJM6NI6LDM4ZYx3ZNgwr7VRsR3ZaAKCFy3FOrmZy9KB284AedYxtS
         u9KboiIYzKdPjrcustLOSPdRPPMu/mRsjJFiv0pTCExi+uGDbh0Ln2bVUbBd01kDExNT
         SrL/6tZHSyZxUhS2OT8KKjlWILw483rydLv9gcJ/abips09ls1KxW46E8yYMyEYrkt2g
         dK6GG1Q9Fl/5YmHHyCum0Oz1A9ki6Nf/nJ73nyTR1P39XF95RkiX7Xrq5pXlLkwQiQ1H
         5GhagAkPDT7PNcCGc2fWhsjJBzj001Dq7PxgdnHXFJPL0NDjdcfLn/Jq1IO6VQyVBfMm
         YFoQ==
X-Gm-Message-State: AOAM531Ra95XzljNFXAxKEGyGBm+m3jl6/4RZ33T4WP49N/uyKNWxivL
        d2leOY8nuyNaAbX0QCKCOYhV6pKubOCvRA6VUgyZqZ/C3AE=
X-Google-Smtp-Source: ABdhPJxnVMIyHuW65aRyr1Z/URsqiO5y1MKiZURy0tdtALYLAbMp6l49uxK6Z3Ffh94iZdC0bF7vX/Z6r07Btxs7w04=
X-Received: by 2002:a67:b42:: with SMTP id 63mr7082482vsl.182.1591362716384;
 Fri, 05 Jun 2020 06:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <a5741e0f3b90422f8c53a8bd54f06d8a@hm.edu> <CAJ8uoz3V1F4MB9yprixAReFqPCW9bE4SbV58Gs-D7qdSXtz6sg@mail.gmail.com>
 <0d6aad4ae9f9484cb158845d73c37f5d@hm.edu> <CAJ8uoz3d3u0MxVAFxpRjZzVTR41aHBu879FPFA0Z4uUL=6sQqg@mail.gmail.com>
 <bf2f8889ebd343edaf44a43f0d1f4c8b@hm.edu>
In-Reply-To: <bf2f8889ebd343edaf44a43f0d1f4c8b@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 5 Jun 2020 15:11:45 +0200
Message-ID: <CAJ8uoz31d4iR-b44rsce21PYZARUKqLTO7i898V--jfQkcspWQ@mail.gmail.com>
Subject: Re: Intel X520 looses ethtool flow-type rule the moment a BPF / XDP
 program is loaded
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     "Raczynski, Piotr" <piotr.raczynski@intel.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "lihong.yang@intel.com" <lihong.yang@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jun 5, 2020 at 2:25 PM Gaul, Maximilian <maximilian.gaul@hm.edu> wrote:
>
> > I do not use this card in my AF_XDP lab setup, so unforuately I do not
> > know. I have included some persons from the networking division at
> > Intel. They might know of a "known issues" page or somewhere where you
> > can bug report this.
> >
> > /Magnus
>
> Thank you so much!
>
> One more question: Does the 82599ES 10Gbit/s NIC have similiar issues with XDP and ethtool?

I believe that is a Niantic card too, so yes it will have at least
have the XDP issue.

/Magnus

> Best regards
>
> Max
