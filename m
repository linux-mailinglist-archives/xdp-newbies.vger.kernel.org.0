Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1040B2729BE
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Sep 2020 17:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgIUPQI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Sep 2020 11:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44007 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726413AbgIUPQE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Sep 2020 11:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600701362;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aWjMwhE6aHxeWjB9Pk+XJTiCNVvadEUONZuh0drq79U=;
        b=RIA2+yQcAVpJfyAbDxRbsUkUgZ/JyYg3k12zd4CflBZx64pe68wBdRyN1BIhuJCwuqRxc/
        Nq1gy1IOEJBZOhrvVXdxCig0OWeIgTrm97242cRAMNTFCqnpULpKNoicwPMwf1h/C3Rcht
        /46xUOzDIBnUjlC80s/WpufucaIRtXg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-hiC-EZzDOQ-Fv9AWeWsntw-1; Mon, 21 Sep 2020 11:16:00 -0400
X-MC-Unique: hiC-EZzDOQ-Fv9AWeWsntw-1
Received: by mail-ed1-f72.google.com with SMTP id r19so4718481edq.12
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 08:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=aWjMwhE6aHxeWjB9Pk+XJTiCNVvadEUONZuh0drq79U=;
        b=FDS0alqWc5TGs2QBJOmklHEjumH86+WSbIWSj4RcQawJ42a6w/Wig9v+hj0mF1EF9+
         QnQGYYklRK/Y4Lb27h5049FnHZ7CP5VMvle9P2GOMos/aXVak2JrPsFThOTXHHeGJ239
         UluTfE+1eGxCPL96WmVjj7X7kP496u11HXybt2gx99S0DKg7cB4EQFRngU4RXQ1IJLZi
         RTrnXrpQ2iX3c4nmrBFOFlsYlG/EA0KzSIGJSYVsGGnme0hlrQgBvuJrDavgCoHXRnxI
         cV54LdjjXsnUl+XByL9aND9tPwLWerDiWKoKX3wLKgYN09Ovh+mlA/F7/wyqsZ06FJvA
         bJkA==
X-Gm-Message-State: AOAM532uepWYdpRekqmJZlRNjRnF3lI4Ki2Dm2JmxJLVrhGpmkkcq7+Q
        8lAuV/eLmUlEVyQIpxqeyIIF7g0o4D2nEnCMnEPBaC0tGabQ3gwRjYviKcFTVp0XUK1zlx9bi4i
        s1WohATRqxv53XYWcq966704=
X-Received: by 2002:a50:9f6f:: with SMTP id b102mr147645edf.272.1600701359178;
        Mon, 21 Sep 2020 08:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNV8R6jcITqOj6VVNK/vQM904ECDYe1F5gTH2euy8gT2lq+Wgid43TKO4Qm1EFDafq/tcZyw==
X-Received: by 2002:a50:9f6f:: with SMTP id b102mr147600edf.272.1600701358758;
        Mon, 21 Sep 2020 08:15:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 16sm8933371edx.72.2020.09.21.08.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 08:15:58 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id CEC37183A99; Mon, 21 Sep 2020 17:15:56 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Tugce Ozturk <tugceozturk.5@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP program unloads by itself
In-Reply-To: <CAAL8+sW1=kjnPJ1UEDZsxbe1QfSwL5YszNYipT7kBgYOBOAC6Q@mail.gmail.com>
References: <CAAL8+sW1=kjnPJ1UEDZsxbe1QfSwL5YszNYipT7kBgYOBOAC6Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 21 Sep 2020 17:15:56 +0200
Message-ID: <87wo0np3df.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Tugce Ozturk <tugceozturk.5@gmail.com> writes:

> Hello,
>
> I am trying to run the XDP router program from xdp-tutorials. I
> successfully load the program with xdp_loader provided, and I can
> verify that the program is loaded with ip command. However, after a
> few seconds (this duration is random) the xdp program unloads by
> itself without any error. It just disappears.
>
> I tried with different XDP programs, different XDP modes and different
> interfaces as well. But the same issue persists. So, could you suggest
> me a way to troubleshoot this issue? for e.g. where can I find some
> related logs or how can I monitor the behaviour of an XDP program?
> Have you ever come across such a problem?
>
> My kernel is 5.4.0-47-generic. NIC driver i40e (tried with ixgbe too).

Sounds like you have a daemon reconfiguring the interface in the
background? Do you have NetworkManager, systemd-networkd or similar
running?

-Toke

