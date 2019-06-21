Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A374EF52
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Jun 2019 21:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfFUTUP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Jun 2019 15:20:15 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:43465 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfFUTUP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Jun 2019 15:20:15 -0400
Received: by mail-lj1-f179.google.com with SMTP id 16so6893921ljv.10
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Jun 2019 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khomp.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=xDzEchOq4hfddL0yuHmPt+nxBOPvWxWvXkJsPNiBN+M=;
        b=W4c8zjaZ8BmMoORAvRpWDobpT1t2opXRkWutiBbLV9mIzsa9bYo7W3/CyPW8F8/qte
         Fm9FURnDSK2XpLfh2vAbFlxGoDBGPhxf0MDrO5ArA9f9ZWoIZMlnlAw6y3P5IIm09CfN
         Ef0OnGpTNERdqLIzgOHS3NbC/q+QLU4cp0b0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xDzEchOq4hfddL0yuHmPt+nxBOPvWxWvXkJsPNiBN+M=;
        b=c72MF/cRWN+p2JtSiODFTR/WSBMU1Y3AfgZGYZc2jiq7TXAbsk0dDu40KkVxEI6/1Z
         +itzS31+QWpN40nSXaRh9spwEzYQdeuSIoqaG2HCUDwKJp1HKu89Z11j6ekr+RcOOXGP
         uFFypB9ocoVAnPv4S1SRcGMj3jFLstWFK5OwevOTyI1prtyIoFnrtStehLyaSlkuid6U
         ZxY3E1t2sVTfpXBROJZP7ZIDPydHmH9Ped/oUDZCeQm1XY5a541tEW7uPNiof0MiThRe
         D7aVIxn9IwJLfeCnfTvu3hSLN2u1+gK0TnjTyf6bD7pm4W+vAgHE1vGLkpcvWqA0dWB6
         OX1w==
X-Gm-Message-State: APjAAAVocby7z7zIhzEEg+h5A2b6AQ+C5XgZtMMdOk6sJkahtUYdnx8W
        lZ/pA7otnY2jPv+6Y4igbWStXJ5tT4UVd++P/6LUSBbpee/4dg==
X-Google-Smtp-Source: APXvYqyuYZtQRsg+Y8DwI9tE3vFygyo/mnR0tSQEhxoYZmPTL0F4G1+2FurMJdUnibYe3hb+81zTtc/jgfCNBxcdBKM=
X-Received: by 2002:a2e:890a:: with SMTP id d10mr31313558lji.145.1561144812259;
 Fri, 21 Jun 2019 12:20:12 -0700 (PDT)
MIME-Version: 1.0
From:   Rafael Vargas <vargas@khomp.com>
Date:   Fri, 21 Jun 2019 16:20:00 -0300
Message-ID: <CAEaYocYhic1UC2p60gO6rzJYzHaHob=0-GUN1Z2e0XgMaPoMBg@mail.gmail.com>
Subject: AF_XDP only releasing from FQ in batches
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'm trying to use AF_XDP and I'm using the xdpsock sample
implementation as a guide.

I've noticed that the Fill Queue slots are released in batches of 16
(kernel 5.1)

The xdpsock (rx_drop) implementation will lock waiting for the space in the FQ.
This seems it will work fine when receiving lots of packets, but will
loop indefinetely if traffic stops.

This is the expected behavior for the FQ?
Should I keep the FQ always with free slots in order to avoid blocking
when waiting for more packets?

Rafael Vargas
