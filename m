Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B97BD1409C5
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 13:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgAQMcU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 07:32:20 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]:46969 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgAQMcT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 07:32:19 -0500
Received: by mail-qk1-f171.google.com with SMTP id r14so22436636qke.13
        for <xdp-newbies@vger.kernel.org>; Fri, 17 Jan 2020 04:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bDo76dKOnuzMEZoozXWQMHwLc/1xlavJZ+W7DLl98cA=;
        b=Zuu0U+4k8U3TD77N2gxENMofYswGIX7cAUtVza5colFEksaX5SB4mO8RaFQiZ0sz6I
         f/QfQjY00+2cPnqGozgWSiBjafKbOzsDuH+OEtrfBZBYGWEYKPhW/klR4C4LvXCSAz5r
         xnDht5j6I8hjqzR8NUNkUkzeecoKkD6XTJJt9AiRk33yuyQNdHfBMDydVVLE48k4r3cD
         8Bi78ttsu2qI5QpkioiQ7M0kuPUOXz4GT73zqyXUmXMAqDvQD2KSoj7mfDU8CRHHWHNk
         GjeBExZ2Qp8OTx/xVe+ZqTqJBUVhgFTO+T2xckmvSAPOdALBSJTIbDkrymed+Uy4ndF1
         0iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bDo76dKOnuzMEZoozXWQMHwLc/1xlavJZ+W7DLl98cA=;
        b=lSN7m5zvesO7CvpdcBJsxAlMFPjz/Eg0GIZMzp7x7IVP19+z5USz6Qg1x1fkfVW2TL
         MVpdfKEnfhNpJ8gEZ3qNr5GXZsPsdBJEyyoaopJpCAcv76SiHpZTb6HhD05Qi/9w5v6j
         GbFK/vw3OkQMpf0AiwsNw0qa455U8+oaHHr/ltvcmjW7iKYwJRs7mtSCJoIPFA4F/HE3
         JVFhVum8SXuX8N6NgnKWO9F892EUhtz1r15zBx1H9AmdOQzYXOWeCGOFSo4PCFB0YyJ3
         18/j7T6nrnY3Kh59qUcnnVcnhNDkwEfZRRJW6W8/XKOD83JOaTnxbhguo5G4NdE+GJu2
         yFsw==
X-Gm-Message-State: APjAAAWTKhXXHduflthbb4XQwNj0xr/IGhfAjbIoXPqEb7PVVJjqq1OR
        iN+DWi5rpojNALErb1JebfZMcVqKgmcWCbVPWEawsHEUX7U=
X-Google-Smtp-Source: APXvYqxTXWA54rmWZpLP6uGDCWOlZc+r+yABTf9LKI9AozCp3AplLW8CMhCxgL+4K2WT73qjLAzt1DUkxLTE72V/ueE=
X-Received: by 2002:ae9:ee11:: with SMTP id i17mr38169903qkg.333.1579264338781;
 Fri, 17 Jan 2020 04:32:18 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
In-Reply-To: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Fri, 17 Jan 2020 13:32:07 +0100
Message-ID: <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 13 Jan 2020 at 01:28, Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>
[...]
>
> I could not get zero-copy to work with the i40e driver as it would crash.=
 I've
> attached the corresponding traces from dmesg.

Thanks Ryan! I had a look at the crash, and it's in the XDP setup:

i40e_xdp_setup:
...
 for (i =3D 0; i < vsi->num_queue_pairs; i++)
     WRITE_ONCE(vsi->rx_rings[i]->xdp_prog, vsi->xdp_prog);

and the vsi->rx_ring[0] is NULL. This is clearly broken.

It would help with more lines from your dmesg: the cut i40e log hints
that something is really broken:

[  328.579154] i40e 0000:b7:00.2: failed to get tracking for 256
queues for VSI 0 err -12
[  328.579280] i40e 0000:b7:00.2: setup of MAIN VSI failed
[  328.579367] i40e 0000:b7:00.2: can't remove VEB 162 with 0 VSIs left

Is it possible to dig out the complete log?

Thanks!
Bj=C3=B6rn
