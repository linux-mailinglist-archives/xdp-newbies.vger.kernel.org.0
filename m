Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E6B26AC54
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Sep 2020 20:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgIOSmw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Sep 2020 14:42:52 -0400
Received: from mx0b-00169c01.pphosted.com ([67.231.156.123]:19374 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727924AbgIORf5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Sep 2020 13:35:57 -0400
Received: from pps.filterd (m0048189.ppops.net [127.0.0.1])
        by mx0b-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08FGxBtC012122
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Sep 2020 10:00:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : from : date : message-id : subject : to : content-type;
 s=PPS12012017; bh=9FZBMTEPhC46KFZ5mWaHIv9oLLjUh2Iy4HC0iMwVc3s=;
 b=DUp7vECh6NTRspAGfB65T3eVFoMF02OLqFU5/9fF+O8DRLWdHKvtE0m+PrRanf3dFZgW
 SMB65SmkdCXRRQQEA7drdF6dSUc7z+zdBiMNam5CWzjhgUTnLTQBTFIJ0c18HTAkTt+s
 m6FMrZkWiBDwMm6uc7zTQ5w4lilQvFFnDctTgcbvbQgFtubKHFkXf76zfnIWW7+ecAWt
 hH8kXoX5QDVKrB+x8BhfEBhuXFKy14vMYLjYX2n81mlHEdxkhjATp/PD4ImPJYl5HpRp
 tddoN3S4jw8T1ke27p/n53b1FGszW4+RMPPEOdhrPlxuff8u4Ulxh8XzILuAoq4OsGnB OQ== 
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
        by mx0b-00169c01.pphosted.com with ESMTP id 33gwu42j01-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Sep 2020 10:00:24 -0700
Received: by mail-ua1-f71.google.com with SMTP id t10so398742uap.4
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Sep 2020 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=9FZBMTEPhC46KFZ5mWaHIv9oLLjUh2Iy4HC0iMwVc3s=;
        b=eXUEryFfmrB0/BcNYmng3iAB3jhYFeDRRmwr4kptDlDKaXkEYA0S/WHpWk1ec4Vh2k
         owSOwz6YzSFZnnRsVIHEkxDM9maku8uxY+kuvnxgRlKHY64Eh8WnbkckuDnzuQEUGqNv
         67qg22UhrCOtHPpvRcHWytZYWRucdmN6mwQPLgEeL3qrLBPZ6t8jGq7wDAkqqIvaqm9r
         95obJvlsMmEk9nguhT5geRhAgGQa1Lz+v+2oK44xV6kQ1fGP8eh0wX7K6voF7VaJzQp5
         /yYDGA4HE61kwcNjNtJVB/2tNtrI5PUvVA4Zq0gpYOSMCRXnwdxHpOZKvFYoPEdyrYV7
         oePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9FZBMTEPhC46KFZ5mWaHIv9oLLjUh2Iy4HC0iMwVc3s=;
        b=c9D/gdVYOydMaVeU5swOw+7EirTz+YJW5pcmzmQv+Z2flR5pJVCjOUH1K/pKK3gSga
         HVBXgdU+4bXq6y4J1XZOxMW4F8Fyvqh2B1nRZlhd3nip6o+9ZWl4QOfRQOpWws19w0mj
         qCA0v+p49YrxmFfNCpDWc4IJSc934y1RfzO4YIGWZBQB1NhpEjyr62OqL1+QlI0IcPJK
         cEOo765wn0Sl1Njc5a3tXVPxVVYpWtzuhlhgZsndTgC44W7WtEJLlNAe5iQ2q74ste6r
         VUlrVm3VNUjbq/WT0Yq1SQWagWDC6sHidDshlMymO33uY5Kc/qt3h077lJXZragOW+J0
         NkVA==
X-Gm-Message-State: AOAM5338nxjGZBaApWggpqXMXkZ0mboHPQgg4uPs71tbQyht0HDxmTTU
        jepGYDJbPnwn95PUWwseR6gTq7pL/O940vGtTyItNyD+Q9zc1f+XR+s9CrGJej7B6RHTP+f7NbM
        NBfneCFg7Mjf+D8ocpb0/FR/vuJPj7W/HGvPvEoA=
X-Received: by 2002:a67:17c6:: with SMTP id 189mr2115136vsx.36.1600189222994;
        Tue, 15 Sep 2020 10:00:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxDRIrmFozP/vYWnBQnw0w0J8RFFZ9+DQ+O1AujJKaqWljWI8Er7w7MfNZ032jJ5mX0Oo/a1p4DNau8B0xmNY=
X-Received: by 2002:a67:17c6:: with SMTP id 189mr2115108vsx.36.1600189222520;
 Tue, 15 Sep 2020 10:00:22 -0700 (PDT)
MIME-Version: 1.0
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Tue, 15 Sep 2020 10:00:11 -0700
Message-ID: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
Subject: Using pinned maps within a network namespace
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_12:2020-09-15,2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxlogscore=806
 lowpriorityscore=0 bulkscore=0 suspectscore=1 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009150137
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi everyone,

This may be a dumb question, I have set up a simple test environment
with multiple network namespaces running on a ubuntu 20.04 vagrant
box, with the latest github libbpf.

I want to use a pinned map, I can make /sys/fs/bpf shared by:

$ mount mount --make-shared /sys/fs/bpf
$ mount --bind /sys/fs/bpf /sys/fs/bpf

but when I try access the maps from a C program running in a namespace
using bpf I get

 Access to /sys/fs/bpf/lwtconfig map failed obj_pin errno: No such
file or directory

The code snippet is:

mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
        if (mapfd < 0) {
            jed_info(jed_logfile,"Access to %s map failed obj_pin ",
CONFIG_MAP_PATH);
            pin_fd = bpf_obj_get(CONFIG_MAP_PATH);
            if (pin_fd < 0){
             jed_error(jed_logfile,"Access to %s map failed with
obj_get ", CONFIG_MAP_PATH);
            }
        }

Is this possible, and if so what am I missing?

Regards

John
