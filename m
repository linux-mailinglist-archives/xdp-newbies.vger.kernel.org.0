Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B225153F0C
	for <lists+xdp-newbies@lfdr.de>; Thu,  6 Feb 2020 08:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgBFHDH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 6 Feb 2020 02:03:07 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:40757 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgBFHDH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 6 Feb 2020 02:03:07 -0500
Received: by mail-ot1-f42.google.com with SMTP id i6so4516789otr.7
        for <xdp-newbies@vger.kernel.org>; Wed, 05 Feb 2020 23:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AfnHB06zHi2EKCQq20idKYoDmD/ZS3ZQTzCtZomFxbo=;
        b=eEkDX/r5MP+1bg8Avnjjq6iyFIyhA996NLbk+WtXiXDixyhUwqi1ksvkwXH2B6Ma3U
         BJFHCaF+Xv5N104IqsMQBeD9NRYWOzq9bBMQYUr1nq6zVUWVc2PlPHqLwexl5saakJqR
         xoBzHoh/OitsbdnnMfsIkzW1BvJQ90Clgrz31n7+IlA8cc/oPvDOyD52sjTOHieIH+x3
         GHZsINXeTxA9n7REbbp+73pjFlzrgXNo/d4GrsH2B+c6bzL44m7YHDYQ4/N/VKZB5kEv
         Oe54+LQb7W/VNkE81W8v2sPVx9iRu2OsrRWmoW9RIEnZRu+yjsDIrvstNFzt75qlOIiy
         tNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AfnHB06zHi2EKCQq20idKYoDmD/ZS3ZQTzCtZomFxbo=;
        b=nlcbUdl8+HcfXHdIxna7i3ANVgBCo65ZyUgqMyo+5WdxFI7Da2TOoY1qfyZk1Amx8/
         Qdi0dMOLSVQc+NXhU8eENLd3ES3wbul1AB9bCuvOnIBJApOxNtVGJEisqYHVuAvVtEn0
         m2cg8ym2aCRdgwxJKCphmPLhOrS+HKcsZQh6mlwvgtN0U4rVZoA3NLfQNYSP2y2p7p9j
         DCs4BO3zwz5OdhUFwXuEzokHhpN9B2vgII1gWdia0hx9Im8fqSIXzNs9Psm4IGH6gz3S
         4IVQ5ZjJSECNH8nGV8rgeQXcf5obCxg4lPFC+84i0w0VWKx39tydIBhnLSb4ladGYCU9
         D4mQ==
X-Gm-Message-State: APjAAAXXJki8Gly/Mf0dXdFb1iW4S+nepzNmeYzP5H4ltrv2rj8MPiUX
        ArwHC8Ko+uFKffuGidAwc16e5Q80zQEpjrH81Bw=
X-Google-Smtp-Source: APXvYqyMr9HOXdeujPNx/NMNlTpxvdXwmo/hzt4RZdd5G96Hv3By+XEy7wDBnQlIMyHbpuLh7SakBye4H+2D5iJP+dE=
X-Received: by 2002:a9d:5607:: with SMTP id e7mr19078739oti.196.1580972586125;
 Wed, 05 Feb 2020 23:03:06 -0800 (PST)
MIME-Version: 1.0
References: <CAMyc9bVixUDEJ-WHLJaCCTF3iV4pFF2j+RPM0hM1XOKh6S2yBw@mail.gmail.com>
 <CAJ8uoz0btU4L80d2DHv+=ivL3RJmunnAsmetL=2zBo_2xfpgAA@mail.gmail.com>
 <20200203031104.GA19512@ranger.igk.intel.com> <afcf4030-aee3-7e9c-a57f-c5458c285b74@mellanox.com>
 <20200204065000.GA44903@ranger.igk.intel.com> <CAJ+HfNj0+o3A9TM+K=Eiqrj_wwSOsnPw2f00u_P-sX_-ckp5=g@mail.gmail.com>
 <20200204094640.GA46254@ranger.igk.intel.com> <c92afb6b-28a3-3ec5-f358-b434d73617c4@intel.com>
In-Reply-To: <c92afb6b-28a3-3ec5-f358-b434d73617c4@intel.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 6 Feb 2020 08:02:55 +0100
Message-ID: <CAJ8uoz2qLq_nN+gNT6da0cy6xf_evw=fHDkszxuVzP_n88tA_A@mail.gmail.com>
Subject: Re: Cannot run multiple 'xdpsock' concurrently?
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        Maxim Mikityanskiy <maximmi@mellanox.com>,
        Cameron Elliott <cameron@cameronelliott.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Feb 4, 2020 at 6:20 PM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com=
> wrote:
>
>
>
> On 2020-02-04 10:46, Maciej Fijalkowski wrote:
> > On Tue, Feb 04, 2020 at 04:41:31PM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> [...]
> >
> > So to summarize that:
> > - return EAGAIN instead of ENETDOWN within ndo_xsk_wakeup implementatio=
ns
> >    in i40e/ixgbe,
> > - check for ENETDOWN in kick_tx() as well
> >
> > Do you guys agree?
> >
>
> Well, start with latter. From some perspective, changing the return
> value is ABI breakage, no?
>
> > What about timeout and syscall repetition? That's the last question.
> >
>
> Hmm, timeout in what context? When to redo the syscall?

Cameron,

FYI: https://lore.kernel.org/netdev/20200205212147.GA5358@pc-9.home/T/#r715=
e0a78ae13c0fc1ce67b3219e9a532b2bfd011

/Magnus
