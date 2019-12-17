Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31BEA1221B9
	for <lists+xdp-newbies@lfdr.de>; Tue, 17 Dec 2019 02:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfLQBzn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 16 Dec 2019 20:55:43 -0500
Received: from mail-pj1-f43.google.com ([209.85.216.43]:37616 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfLQBzn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 16 Dec 2019 20:55:43 -0500
Received: by mail-pj1-f43.google.com with SMTP id ep17so3827581pjb.4
        for <xdp-newbies@vger.kernel.org>; Mon, 16 Dec 2019 17:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=tPO+05CfaaML8U2opiCEZXiuPe9d/6rbDsxWknXlT9w=;
        b=gKX1NtBjVZPK6FnyQvRcY4ORSFvzya6UF8e1fFH18vce4AxrtLHVxxdc7SSyLV6vHL
         IOzLJldhOOCLFpumguw7Ig/W9/qSFbCYZEQVLaUQu2isoWXtsIeM7o+M8xLLdsHniczU
         x6zcHODMrKYDp9uQrNAkCa0snjbGHR6Toe50N0H7uo7Kr5tJBt2VJwcLZU21yJfa9C7y
         O9KtRLV2CKdz6Vo4EeuOlVDvgbezmOJQvqct20qff1h3Wr8p2fz/x8gzXvbIRFbt64BM
         kJWnRi5cvmMr/MmhLa1+spP/reJs4cGJttdgiHCLXP9d3wtEqjmuo19tqVn9SvEhFcdC
         vx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=tPO+05CfaaML8U2opiCEZXiuPe9d/6rbDsxWknXlT9w=;
        b=mJ57F7DJ7ZKmyMPejDC1CrC04QXReGM9MPmgCxQUAwMOOjsbeecBT+qsXiBUVELwVE
         DDMVKnAk3xu8s8CZ1E3qJob3nst7hfuUZLQcPNDButVr3PDP3SfoQhXSk0bf7vyj5As2
         LQQ/4wbaBmcyf9FfTZbFwv7kfgsIFEB4plK7CDc+oOptG4eUr4gHlpeKQv43+h9+2nDA
         fYRis03JTEC+d63Org0IOv1LDlNsiZhoLvYiKZ3j8wsYuIu1e4V79Z6aUor1w47WFqWB
         eTq/3qEBn3PWyEIcZFF8raWuwPxBPOMtQnSsTpbdnzL2qT7+v+t1YZwXW1GMp4Ab7v/J
         Yi9A==
X-Gm-Message-State: APjAAAWZhY0HEyHWChGLkP3AI+cdbAbhNJBANgXKNqTa9q6SPVIx5fIM
        /P3vtmFUra6n+gun9PkN1o80hg26
X-Google-Smtp-Source: APXvYqyAYkRXoSrokuJpyB3tlDNP4kbFmPxKBZeSOSvpnu3KXu/H+wDpmfrHoTaU+MSaAL82S/DnqA==
X-Received: by 2002:a17:902:6ac2:: with SMTP id i2mr17184480plt.221.1576547742506;
        Mon, 16 Dec 2019 17:55:42 -0800 (PST)
Received: from gmail.com ([172.58.92.96])
        by smtp.gmail.com with ESMTPSA id j14sm23490842pgs.57.2019.12.16.17.55.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2019 17:55:41 -0800 (PST)
Date:   Mon, 16 Dec 2019 17:55:38 -0800
From:   William Tu <u9012063@gmail.com>
To:     dev@openvswitch.org, xdp-newbies@vger.kernel.org,
        tom@herbertland.com
Subject: XDP/AF_XDP checksum use case in OVS
Message-ID: <20191217015538.GB43662@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

We are measuring the performance of OVS using AF_XDP, and
have the following use case for XDP checksum:

High level Topology, two physical machines (PM1,2):
  VM1 -> OVS encap with Geneve (PM1) -> physical NIC
  -> network ->
  physical NIC -> OVS decap (PM2) -> VM2

When running an iperf TCP client/tx in a VM1, a tcp packet goes
through:
VM1
  1) VM's virtio net device
  2) by default, tx offload is on
PM1 Hypervisor
  3) OVS receives the tcp packet (no checksum)
  4) OVS encap outer Geneve header (no inner, no outer checksum)
  5) AF_XDP sends this frame to network (no inner, no outer checksum)
PM2 Hypervisor
  6) OVS receives using af_xdp port
  7) OVS removes Geneve UDP header, send to VM port
VM2
  8) VM2 kernel drops the TCP packet

A software work around is at 2) disable tx offload by using
ethtool -K tx off. This cause VM1 vcpu calculates inner tcp
csum but drops performance.

If XDP hints can somehow support TX checksum offload at 5),
this overhead can be avoided.

Thanks!
William

