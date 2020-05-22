Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9601DEBCB
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 May 2020 17:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgEVP1Z (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 May 2020 11:27:25 -0400
Received: from dal2relay170.mxroute.com ([64.40.26.170]:39453 "EHLO
        dal2relay170.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729929AbgEVP1Z (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 May 2020 11:27:25 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 May 2020 11:27:25 EDT
Received: from filter004.mxroute.com ([149.28.56.236] 149.28.56.236.vultr.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal2relay170.mxroute.com (ZoneMTA) with ESMTPSA id 1723cfa5bfa00054f2.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 22 May 2020 15:22:20 +0000
X-Zone-Loop: d7f6bde63efc735afa3597c5529fe68323ac228625a7
X-Originating-IP: [149.28.56.236]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter004.mxroute.com (Postfix) with ESMTPS id C56773ED9C
        for <xdp-newbies@vger.kernel.org>; Fri, 22 May 2020 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9wBy8OpbQKpaUBxISLzeYxprltT+N2cAeGNj75SvsZg=; b=pvQ8BajNxbe3zKvXjtXq24Z+gn
        HaD9DPIX7Wn3yRfIEdieErFR4cXTUhmwH7+kmcRwNBnw5fnrnzedW154dYnzK4ifwFRDBffoDFI2A
        0Tq62JKhq5uPeejf0YRIBdmAQEtf8dJw0Otbi2clbUsWUzd0EPsaGzEEdYgZfs8c6zpJvcEsSJpVK
        h6Vp3DKBY926pNALELEdwv8quTLOTTiDt8Q1PC7VY+oaDxkfINh59X3yYvpW37+3DIV6BCa4+ehCS
        HD87T9nRC/5mqSVfxXLErzb4AX3oFondWk/lRAuSgQQIINzqw6zYGjMAaWDOZg1UolaGKWGB1elMm
        4f6WdSFQ==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: AF_XDP Side Of Project Breaking With XDP-Native
Message-ID: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
Date:   Fri, 22 May 2020 10:22:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,

I have a VPS hosted by Vultr that appears to support XDP-native. I'm 
trying to get an XDP project loaded onto this VPS and while the XDP 
program itself works fine with XDP-native, the AF_XDP side of the 
project breaks. Loading everything in SKB/XDP-generic mode doesn't 
result in the AF_XDP side breaking.

Initially, I thought this may be due to the project using an outdated 
LibBPF submodule and outdated AF_XDP code. Therefore, I tried creating a 
test AF_XDP project using the latest code from XDP-Tutorial:

https://github.com/gamemann/AF_XDP-Test

When loading the test XDP program using SKB/XDP-generic mode, all 
traffic goes over RX queue #0. However, when XDP-native is loaded, all 
traffic goes over RX queue #1. When XDP-native is loaded, I can still 
attach the AF_XDP sockets to RX queues #0 and #1 (RX queue #0 sees no 
traffic, though).

The problem I'm having is after the first load, I cannot reattach the 
AF_XDP socket to RX queue #1. I receive the error "Device or resource 
busy". Here's an image showing this:

https://g.gflclan.com/2764-05-22-2020-BLkiLcUW.png

I have to reboot the VPS if I want to reattach the AF_XDP socket to 
queue #1.

I believe I'm cleaning up the AF_XDP socket(s) correctly here:

https://github.com/gamemann/AF_XDP-Test/blob/master/src/afxdp_user.c#L428

https://github.com/gamemann/AF_XDP-Test/blob/master/src/afxdp_user.c#L307

Initially, I only cleaned up the interface on line 307. However, I've 
been trying to add more cleanup code to see if it makes any difference.

I've tried kernels `5.4.0-21-generic`, `5.4.0-26-generic`, and 
`5.6.14-050614-generic` (current). The VPS is also running on Ubuntu 
20.04 LTS.

I'm honestly not sure what I'm doing wrong here. I'm new to AF_XDP. 
Therefore, I do apologize if I'm missing something obvious.

If I'm not doing anything wrong here, is it possible there's a bug with 
the NIC's driver? Unfortunately, I'm not sure which driver the cluster's 
NIC is using. If my code is fine, I will try reaching out to our hosting 
provider to see if I can get this information. If this is the case, I'd 
think there's a bug with the NIC driver's cleanup code.

Here's the output from `ethtool -l ens3`:

```
root@SEAV21:~/AF_XDP-Test# ethtool -l ens3
Channel parameters for ens3:
Pre-set maximums:
RX:             0
TX:             0
Other:          0
Combined:       8
Current hardware settings:
RX:             0
TX:             0
Other:          0
Combined:       1
```

One other question I have is if anyone knows of a way to get the exact 
RX queue count. As of right now, I make the same amount of AF_XDP 
sockets as cores. However, sometimes servers have less RX queues than CPUs.

If you need additional information, please let me know.

Any help is highly appreciated and thank you for your time!

