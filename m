Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF4913EC21
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 18:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394118AbgAPRoQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Jan 2020 12:44:16 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33428 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394115AbgAPRoQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Jan 2020 12:44:16 -0500
Received: by mail-pg1-f194.google.com with SMTP id 6so10260809pgk.0
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Jan 2020 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=iBWpF4zomPD3a9yVz5ElJ1HRthxnMAvV3znqX7Te4TQ=;
        b=kyp4AmNQUEXeAx6z7jjaP/CpIG5Mtws3dk9ERU+Au8oRv1SfXbhBPigdt0eDEycduT
         mHtZQ/i6o3U65+KxNQ+JpQedxCWEokle/IDAOA2YhAeiUzsoCMpGVup0p/a9frueKGNS
         eghAjiKumbeSv9lW836jLPptvob8LWEDRXmZ0pOn/ZuwCDpaBnDBKfEy7o614CR/I/HD
         gQGF5il4HpsKAV47PQGqN+Xc4lOVQW1YCxSIpw3L1wXPQTxpYutnLvmFrxHB2GlIgLR4
         yQWymiIXAbRWhSHir/3cbV6whWQxVI+sZkneWakrPyw+7zz+CgfRvRHukBD4j2zyn/P9
         2EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=iBWpF4zomPD3a9yVz5ElJ1HRthxnMAvV3znqX7Te4TQ=;
        b=IbJLTjVD0jjM1E1klbHfW9WjeQFAkAuYElyKZQ+HD3PaVd7SP9eajY5lCQU7/IOcAN
         UGG4WJy5eMAek9wguWZ+SFCSIx2k8s7KqDB2+5/6j7xKVsVt8uPcljySAcifAvHJU6H3
         rSPKdAbrWqIPO/bYCBy01fKM3meZOiyZPHtqPNSCBiFYSlzwlewz7hq6Ufmw3rj6irt5
         X4cBsuLGDb/77s7rjqN9FeEvn1Qsume4CZ2xaWp3r69dFUh1J2vliDzJ7SbRQoSPlXKh
         hjkEt9zgf4LrVQ8C6NJs8gDCT0mFv4qy4pIYdqVqN2xnd3u8RlSWUVGOVCtVfpMxxI5Q
         cVHg==
X-Gm-Message-State: APjAAAVk1YsQFDPbjYYaRt/IdTzCWeMpJ/CpaK3PXm6BtR69gCwIEBmq
        FwQ8GrNrTHq4Qhvbma+iCBY=
X-Google-Smtp-Source: APXvYqyDgROiJEnsKZW4vunwBTbP4bONxcAWdjxsXRhfhg6qjQ2nTMzispgYhE8Rw3N571m/WD27lw==
X-Received: by 2002:a63:f403:: with SMTP id g3mr41068696pgi.62.1579196655241;
        Thu, 16 Jan 2020 09:44:15 -0800 (PST)
Received: from [192.168.1.25] (c-71-231-121-172.hsd1.wa.comcast.net. [71.231.121.172])
        by smtp.gmail.com with ESMTPSA id s131sm28771203pfs.135.2020.01.16.09.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 09:44:14 -0800 (PST)
From:   Vincent Li <mchun.li@gmail.com>
X-Google-Original-From: Vincent Li <guzheng@gmail.com>
Date:   Thu, 16 Jan 2020 09:44:13 -0800 (PST)
X-X-Sender: guzheng@jiadeimac.local
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
cc:     xdp-newbies@vger.kernel.org, daniel@iogearbox.net, andriin@fb.com,
        dsahern@gmail.com
Subject: Re: XDP invalid memory access
In-Reply-To: <20200116022459.GA2853@ranger.igk.intel.com>
Message-ID: <alpine.OSX.2.21.2001160937570.5059@jiadeimac.local>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com> <20200116022459.GA2853@ranger.igk.intel.com>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On Thu, 16 Jan 2020, Maciej Fijalkowski wrote:

> 
> I see that optlen is a global variable. This line might be valid but
> you're using iproute2's loader for your XDP program, right? AFAIK it
> doesn't have support for BPF global variables, only libbpf does (Daniel,
> Andrii? is that true?).
> 
> So you have to either make the optlen a local variable or go with writing
> the loader part that is based on libbpf usage (see samples/bpf directory
> in kernel tree, for example xdp1_user.c).

ok I will try use optlen as local variable or use libbpf

> 
> Could you next time try a little better with the format of data you're
> providing? I'm pretty sure other folks would have spotted earlier that
> optlen is global if the code was properly formatted :)

I am using gmail from chrome browser in plain text mode, seems still not 
good with the text format. I switched to alpine now, not sure I have the 
proper alpine setting, let me know next time if you still see not properly 
format :)

