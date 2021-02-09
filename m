Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEF0314B8E
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Feb 2021 10:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhBIJ1A (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Feb 2021 04:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25151 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230029AbhBIJWz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 9 Feb 2021 04:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612862488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mxvJL71tGnMsM8g7FI+iy4lPI9CgQGtW5sztFeb5sPI=;
        b=E4/yZ4JbEz5uQs72H9dBJsajghOrsZI/grtaN+N0167yFIf5G5XhWaFaYhu+1h/jLfpUiP
        LUDtNz8S/4w01rDFxPllbOFYCueVGUjZLQOhGN7AYUJnjEqGz4CGr70dF8GLmHvtOCSFUc
        liKAYOEuuYyEZsF1Y591HwTqHb8ldLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-cLNZCUdTNW-AfwAR6TqY7Q-1; Tue, 09 Feb 2021 04:21:25 -0500
X-MC-Unique: cLNZCUdTNW-AfwAR6TqY7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BC7801965;
        Tue,  9 Feb 2021 09:21:24 +0000 (UTC)
Received: from carbon (unknown [10.36.110.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4347119C66;
        Tue,  9 Feb 2021 09:21:19 +0000 (UTC)
Date:   Tue, 9 Feb 2021 10:21:18 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Radu Stoenescu <radu.stoe@gmail.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     brouer@redhat.com,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Redirect from NIC to TAP
Message-ID: <20210209102118.476f507d@carbon>
In-Reply-To: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 9 Feb 2021 10:31:50 +0200
Radu Stoenescu <radu.stoe@gmail.com> wrote:

> Is it possible to redirect packets from XDP program attached in driver
> mode to a physical NIC to a TAP interface?

Cc. Jason Wang as I think he implemented this, but I'm not 100% sure.
Maybe Jason can remember?
(or point me to the relevant code that I can check).

> The same works fine if the XDP programs are attached in generic mode.

So, you have tried and it doesn't work.

What is your setup?

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

