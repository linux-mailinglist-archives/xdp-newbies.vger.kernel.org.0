Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD08BDACE
	for <lists+xdp-newbies@lfdr.de>; Wed, 25 Sep 2019 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfIYJTd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 25 Sep 2019 05:19:33 -0400
Received: from mx1.univ-lille.fr ([194.254.129.33]:39560 "EHLO
        mx1.univ-lille.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbfIYJSW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 25 Sep 2019 05:18:22 -0400
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Sep 2019 05:18:21 EDT
Received: from smtp2.univ-lille.fr (smtp2.univ-lille.fr [10.140.10.73])
        by mx1.univ-lille.fr (LA PUISSANCE) with ESMTP id 74DFC4A39C
        for <xdp-newbies@vger.kernel.org>; Wed, 25 Sep 2019 11:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=univ-lille.fr; s=dkim;
        t=1569402644; bh=rAQZO8lgjXuvgcTflubyzQhIIvzjE2xvA4zPsMGtpMw=;
        h=To:From:Subject:Date:From;
        b=2WvUCYnCMLUdsM1gc6qL8vG6MVPx/IelYfwUmZMC+36us9xFXDWomG9jT8V6CTw3A
         xrhP8op5Yv6eanHIXWFT0Ee6Z5XaZz7CMJTUU96iQALefW106EGZ0vZMrhlWS4OkCi
         FEW+9WfuviRO6hi0vT2N3MgoXiQzr2SBh7xY1aFA=
Received: from [10.147.1.182] (238.ip-137-74-40.eu [137.74.40.238])
        (Authenticated sender: theo.mainguet.etu)
        by smtp2.univ-lille.fr (Postfix) with ESMTPSA id 1CE343FFE0
        for <xdp-newbies@vger.kernel.org>; Wed, 25 Sep 2019 11:10:44 +0200 (CEST)
To:     xdp-newbies@vger.kernel.org
From:   =?UTF-8?Q?Th=c3=a9o_Mainguet?= <theo.mainguet.etu@univ-lille.fr>
Subject: [xdp-tutorial] : permission denied when I try to execute a program
Message-ID: <0cbbc2e2-9eba-ad40-d819-d092b2015707@univ-lille.fr>
Date:   Wed, 25 Sep 2019 11:10:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-UDL-MailScanner-Information: Please contact the ISP for more information
X-UDL-MailScanner-ID: 74DFC4A39C.ADC80
X-UDL-MailScanner: Found to be clean
X-UDL-MailScanner-SpamCheck: n'est pas un polluriel (inscrit sur la liste blanche),
        SpamAssassin (not cached, score=-3, requis 7, autolearn=not spam,
        ALL_TRUSTED -1.00, BAYES_00 -1.90, DKIM_SIGNED 0.10,
        DKIM_VALID -0.10, DKIM_VALID_AU -0.10)
X-UDL-MailScanner-From: theo.mainguet.etu@univ-lille.fr
X-Spam-Status: No
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,


Thank you very much for your xdp tutorial. Currently, I try to write a 
simple xdp program to count the number of TCP and UDP packets I receive. 
For that, I created a BPF_MAP_TYPE_ARRAY map in my kern.c file. I can 
read into this map with the bpf_map_lookup_elem function but when I try 
to update a value, I have an error message "libbpf: load bpf program 
failed: Permission denied". To solve this issue, I've try to run it in 
sudo, I've verify my kernel configuration (everything needed seems 
enable) ....

I searched a solution on the internet but I didn't found anything 
relevant. I hope you can help me.

Théo Mainguet


My kernel configuration :

$ cat /boot/config-4.19.0-6-amd64 | grep BPF

CONFIG_CGROUP_BPF=y
CONFIG_BPF=y
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT_ALWAYS_ON is not set
CONFIG_IPV6_SEG6_BPF=y
CONFIG_NETFILTER_XT_MATCH_BPF=m
# CONFIG_BPFILTER is not set
CONFIG_NET_CLS_BPF=m
CONFIG_NET_ACT_BPF=m
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_BPF_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_TEST_BPF=m

