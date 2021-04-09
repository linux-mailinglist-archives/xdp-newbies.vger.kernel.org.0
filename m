Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07AA359BB4
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 12:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbhDIKPp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 06:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhDIKOg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 06:14:36 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F116DC0613AB
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 03:12:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 12so8742284lfq.13
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cpnIquOUjSwRSiL5vofR8vyGy+pUfDeYzoqBUBL/giA=;
        b=tXuYlmM/V/I3j+1iUy/R4osJrYPI15DfuZQzKfBU3/eKxc/S088+IGU0YuFAEbNVPl
         OY3F4BF455fvQlmWFr2ElRyxtyBlb/v48n1a/19fm2n74sZsvpAwj4IMHferlqLDTloo
         0o384tgIThbhX8R82QIrNB7xSztIqF4bJoPMQhnwYMLqQVwrVQmjIbdZzB/rAMx2XRFd
         UqxmnvwvYpFOg0Azo2XWTFH9nmKeEpK7pe4/ZEaHZTr2WjB1rBOOJ8c3OMYseNJ63c+i
         IVErMvrshNi6r8MQiiRlgJj082UH+CZRB2liEl43VpDufxqFurt9zr6Z9tK06Tc6ozi5
         1rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cpnIquOUjSwRSiL5vofR8vyGy+pUfDeYzoqBUBL/giA=;
        b=lot+6YCyj3HCbhpvWCp33nncvQX0iIq5bfJbLA89w3BqHyZt8Uma8a7W65dDdcBjkW
         1pCr6vrTajg9Rs79W0c70FKyC/h/9cBpin2SCkQ40k+yJlbP2KxySRKKuAuhQhJ90zIa
         Rom4hRiknFcUOiqmEWiNFSD0w4z0P1uY6O0TXHuKTBHgU9wNMTxEQCMOTv1XhDQelAu2
         sES2SlKtl/HXBlwmp2YU5/G5Z/wId6arjuGuSlw39ZGHuXcAiw6FSjXx1VoOQu0FKTbd
         JEYOp+K+uMOw3f+mPksn+ZeX3OJ2+inp7b54Mm5AXg5O28fTTF9MGa0MjByvWnCoenXg
         Q9UA==
X-Gm-Message-State: AOAM531XSyBDWy2S4GeTEC8NoZaZB3NReTSKvk2+Z3DGVUXdn5uPcZrk
        UUErs4X+EKu4AyLSKUgtpSWA9F2VL6vhB8G8S4j6T/DZ
X-Google-Smtp-Source: ABdhPJwTq1fcNDdwSkWNK9rgHB1rJtBvHQ4Zr+LlA90oxg8IUvClXs2GJ4n+qfdT0RQh/EehoFnGaizH8MFY787vo1U=
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr9723210lfu.465.1617963155547;
 Fri, 09 Apr 2021 03:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
 <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com> <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
In-Reply-To: <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
From:   ratheesh kannoth <ratheesh.ksz@gmail.com>
Date:   Fri, 9 Apr 2021 15:42:24 +0530
Message-ID: <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 3:37 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
> Only if you are writing your own kernel driver for a NIC. Are you doing that?
Yes.

> > > /Magnus
