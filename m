Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6339A4DD126
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Mar 2022 00:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiCQX2U (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 19:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiCQX2T (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 19:28:19 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BCB28AC7E
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 16:27:02 -0700 (PDT)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8EFCA3F193
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647559620;
        bh=sxYC2q8R3I3Yz0wmUx6hlxXazZ7bG8AzAcx86b0hNys=;
        h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
         Content-Type:Date:Message-ID;
        b=u5zso7kIgsiLfkL31KRw5Ghzpuqz9JLDapZkj02tySMyRD+8O32cWG9tfJlj8Wfr/
         Bn6Z8WMC/41G1upIMG6UrXZ+p8TQSmGdvF0tBRxQH95YFqrUe5l9iiwSzJWrVmwJk4
         TUo80l+4UysnAU7mKJxQpc76xw5OBB2bdvgzcmPPzt7+qvXZkzPcwbwG9s8l7dIFPE
         txyNq1TpTiHV1IHuw2ZCFd7L8SfxFhcTY+7dwV/LWkHOpVBYoTigkayQgMGQF8l+Bo
         s8RG2iV5EXVjIaPL6EP7+aE75wax2fMKxYxK4IuXy9Gpwid4mKOwGpOXPX8Tjqv9iz
         9JqU0To+ffEqg==
Received: by mail-pj1-f71.google.com with SMTP id ge20-20020a17090b0e1400b001c64f568305so4045810pjb.8
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 16:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :comments:mime-version:content-transfer-encoding:date:message-id;
        bh=sxYC2q8R3I3Yz0wmUx6hlxXazZ7bG8AzAcx86b0hNys=;
        b=IwiDAVUYxAR710Pr4w4uTTsdgcPEw6h34nnRCgIJ/NrzWRCNJAKOcRW8cDSscvUBnv
         aZ789X6tdJuZbg8qt3w/cdoXhePiSVhU/w74lIqcdl7mF0CvLEZHHTw++swnbTGcZ89R
         C22wkZ1e4HVUQrXLNlxi5MMY0/46gYFaALWvo02hV/NSOPoyV9b4sFVtwrcCMtuD5ST2
         I0guHoYQ92qRjn2y7ltEvRUvnayiVYM7zbBTFcFsO643kbEf5ugKHiiI8XGvSTRk4Gin
         Fb1yrC/XZkbJlLvMwxKAUHmcM4BdpOC24TZCUGKn5xI6CpkXFq/t0AGwuJHJaV9kGAQ3
         PmXw==
X-Gm-Message-State: AOAM532Oq+bPVY1KbSfEh1o9ghsH/M/3ZAFuf/14B7Ewi1MtpY2vIWI8
        7ULVObonW4WYLHGcW1Lg1ZJl/IntVbav7IGMWFn4Q2o6RDKVG6N1fsDthl0Ekq4XkEcRe54qx7+
        ZV04x1Der9aYMFs1niUzqKVLhwwCdqQgiU0JsAv2y
X-Received: by 2002:a05:6a00:852:b0:4f6:feac:9c3e with SMTP id q18-20020a056a00085200b004f6feac9c3emr7432002pfk.1.1647559619111;
        Thu, 17 Mar 2022 16:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq+vKm3qAQNKkpxlo7n589syHdIJ02cF9GDeHnGHhM4DczzxyR0YaDxITqOLDK85gpObIe6A==
X-Received: by 2002:a05:6a00:852:b0:4f6:feac:9c3e with SMTP id q18-20020a056a00085200b004f6feac9c3emr7431978pfk.1.1647559618833;
        Thu, 17 Mar 2022 16:26:58 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.157])
        by smtp.gmail.com with ESMTPSA id l20-20020a17090b079400b001c6a410d71csm784475pjz.47.2022.03.17.16.26.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Mar 2022 16:26:58 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
        id E6E5F5FDEE; Thu, 17 Mar 2022 16:26:57 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
        by famine.localdomain (Postfix) with ESMTP id DF6F0A0B18;
        Thu, 17 Mar 2022 16:26:57 -0700 (PDT)
From:   Jay Vosburgh <jay.vosburgh@canonical.com>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>
cc:     Federico Parola <federico.parola@polito.it>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        xdp-newbies@vger.kernel.org,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
In-reply-to: <86baadd1-daac-09fa-c3df-50308272ef77@intel.com>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it> <6736.1647529145@famine> <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it> <86baadd1-daac-09fa-c3df-50308272ef77@intel.com>
Comments: In-reply-to Jesse Brandeburg <jesse.brandeburg@intel.com>
   message dated "Thu, 17 Mar 2022 09:41:06 -0700."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 17 Mar 2022 16:26:57 -0700
Message-ID: <2430.1647559617@famine>
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jesse Brandeburg <jesse.brandeburg@intel.com> wrote:

>On 3/17/2022 8:34 AM, Federico Parola wrote:
>>> =C2=A0=C2=A0=C2=A0=C2=A0We observed similar "batching" behavior on i40e=
 devices late
>>> last year in ordinary use (not XDP, but using SR-IOV VFs).=C2=A0 We
>>> instrumented the drivers at the send and receive sides, and determined
>>> that it appeared to be a behavior of the receiving device itself, i.e.,
>>> packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
>>> update of the RX ring pointers) until packet 8 arrives, at which point
>>> all 8 were delivered simultaneously.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0The issue was evidently in the firmware, and wa=
s resolved after
>>> a firmware upgrade.
>> Hi Jay,
>> I just updated the firmware to the latest version (v8.50 from v8.30) but
>> unfortunately the problem is still there.
>> However I'm experiencing the problem only when using AF_XDP in busy poll
>> mode, all other modes (standard AF_XDP and normal packet reception) work
>> just fine.
>> Maybe the two problems are correlated in some way.
>
>This sounds related to the WB_ON_ITR feature in our hardware. If
>interrupts are disabled the driver needs to set that bit (and an ITR
>value) so that packets get written back in a timely manner and don't just
>wait for a cache line edge (I bet your Cache Line Size value in PCIe space
>(lspci) is set to 128?)

	FWIW, in the case we had, driver changes (5.14 upstream, the
then-current Intel out of tree driver) didn't change the behavior.  The
PCI Cache Line Size was 64 bytes; the device was

13:00.0 Ethernet controller: Intel Corporation Ethernet Controller X710 for=
 10GbE SFP+ (rev 02)
        Subsystem: Hewlett-Packard Company Ethernet 10Gb 2-port 562SFP+ Ada=
pter

	From an lspci -vvv perspective, failing and non-failing cards
differed only in the serial numbers.

>Maybe something to chase there? We may also be able to look into it if it
>wasn't fixed already upstream.

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
