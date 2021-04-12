Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B01535C871
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Apr 2021 16:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238727AbhDLOPe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 12 Apr 2021 10:15:34 -0400
Received: from fm2nodo5.polito.it ([130.192.180.19]:56840 "EHLO
        fm2nodo5.polito.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237579AbhDLOPe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 12 Apr 2021 10:15:34 -0400
X-Greylist: delayed 1623 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Apr 2021 10:15:33 EDT
Received: from polito.it (frontmail2.polito.it [130.192.180.42])
        by fm2nodo5.polito.it  with ESMTP id 13CDmArr002262-13CDmArv002262
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=CAFAIL)
        for <xdp-newbies@vger.kernel.org>; Mon, 12 Apr 2021 15:48:10 +0200
X-ExtScanner: Niversoft's FindAttachments (free)
X-Polito: internal-cgp
Received: from [93.88.125.241] (account d036901@polito.it HELO [192.168.1.60])
  by polito.it (CommuniGate Pro SMTP 6.2.15)
  with ESMTPSA id 139775656 for xdp-newbies@vger.kernel.org; Mon, 12 Apr 2021 15:48:10 +0200
To:     xdp-newbies@vger.kernel.org
From:   Federico Parola <federico.parola@polito.it>
Subject: XDP redirect max rate on Intel XL710
Message-ID: <8f897fd2-5ac1-a86f-2db1-6c4a45e144ad@polito.it>
Date:   Mon, 12 Apr 2021 15:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everybody,
when I redirect packets between two ports of an Intel XL710 40Gb card 
(e.g. with the xdp_redirect_map example fo the kernel) I can not achieve 
throughputs higher than ~31 Mpps.
This NIC is not able to reach the theoretical ~60 Mpps with small 
packets ([1] p. 23) but with DPDK I'm able to achieve ~40 Mpps with the 
testpmd application and 2 cores.
In XDP when dropping packets I achieve more or less the same throughput 
with 3 cores, but I'm not able to exceed 31 Mpps when forwarding, no 
matter how many cores I use.
I tried tuning the size of the RX/TX rings and the DDIO occupancy but 
with no success. I can scale with the number of cores more linearly but 
as soon as I reach the 31 threshold cores usage decreases and throughput 
remains the same.
I don't know if this is just related to my setup or my specific NIC (I 
exprimented on kernels 5.11 and 5.9), does anybody know what the reason 
could be?

Best regards,
Federico Parola

[1] 
https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwicv__o6_jvAhWUwQIHHQtpBu8QFjABegQIBhAD&url=https%3A%2F%2Fwww.intel.com%2Fcontent%2Fdam%2Fwww%2Fpublic%2Fus%2Fen%2Fdocuments%2Fspecification-updates%2Fxl710-10-40-controller-spec-update.pdf&usg=AOvVaw27anCuRwRX25h8Dg3epgoy
