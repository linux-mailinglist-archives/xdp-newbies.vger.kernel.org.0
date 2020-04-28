Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC501BC63E
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Apr 2020 19:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgD1RMJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Apr 2020 13:12:09 -0400
Received: from mx0a-00169c01.pphosted.com ([67.231.148.124]:37684 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728191AbgD1RMI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Apr 2020 13:12:08 -0400
Received: from pps.filterd (m0048493.ppops.net [127.0.0.1])
        by mx0a-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03SHBWtd018094
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 10:12:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : from : date : message-id : subject : to : content-type;
 s=PPS12012017; bh=9IkoSl6gUeAPNRllx9TD+MMPZvc8LVRj3PYB0BGuflw=;
 b=VIJsl6omosX1L8w8/1nWjpjYqxnd5jAn802MMV1SIaXEMxWgBBeB03tFxI/WH2fdJq5h
 hhsls03ptej9gNuR2BOSHgEx7QHHg3s8HIvtWZtPmFGuyYv13Up3qO2PMKyq4+4+2/0c
 bq9UQemLvQ4Z3oFIwHwi/HNZNXJxEOuBDyTYmqPinLj85H1dtEn4tUykL3lohuTZk0sf
 P60KpZEOj4SVMIZWz71e9o6mTe4ZwUkO/1hPYCPdM1V/sWkMfREsslnmRlCCsHz7KNBC
 mAF4jkk7tqSv8dO55EoV9X85XX/OYF2voGR2OYGJ0T06s1gbeQc95gHu97alJj0enHsz sg== 
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
        by mx0a-00169c01.pphosted.com with ESMTP id 30mm8q305p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 10:12:08 -0700
Received: by mail-vk1-f197.google.com with SMTP id j206so5230589vke.11
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=9IkoSl6gUeAPNRllx9TD+MMPZvc8LVRj3PYB0BGuflw=;
        b=mUZtJnsQqcNb5P+Emm/PSgHIaO+EpMyNl7PMMjppT8SiTt10qu+fNYAVAv04QyP7RU
         H5hthLTqgbvv74+I+WJV1zfMzqGVVFu6IpQ+pnAqlOLjnhk6EVsvOdp6jMuHVBYw1WwF
         ceit6NP1OsITpTQlwsUcjiP/7RLziuwMDneGq+f1wxsa3R/+0Rjn7qonlXvmeAyCP38g
         EUyIexsllgqxaM7VD4/7pKYIukctFi9Z9M62RtAzhOzEcthOcYgciB2iZA1HBoPD/DWD
         MeK8ZtoEeQr4q1AEyF4r7DK3KdbXb/WgP5VOZO3pmlwH2Ns3XQTYvQY+NtkZQUkWnsOO
         RZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9IkoSl6gUeAPNRllx9TD+MMPZvc8LVRj3PYB0BGuflw=;
        b=Hfw3fFBzpihaCaEcs2qrN/fFi1HWp1dqKqrKXVCkMR5cb5PAU9MNnEVn4AdaRS/AZz
         eJmAmOOF8KyZCkEB2povaNNEIXxcY8ICIDnFHRzdwM57fff486LnQt/oTLp2oRoKuIdu
         zsjhGWFaTFSkIWFShXwLMmF0vGfJonVRmCuSf7JJWUnnOotud7wOjk+3P8f2vgL6Dchz
         pkrBsj7WML2juv56oEfHFsCt4tyBFZJl1RnGQWei/WaIywqMIhGhQBMrlyzXyYj8FE3X
         UA2SHniWPtw2Wj1oQo7US75c8riN3G09U7y+IaNZDe8+4/4myEnLiF7UpM5zpweb9Iix
         AO5w==
X-Gm-Message-State: AGi0PuYxdoh0yqDACvSIi+2+jwYM4IVqpwnL0JzEqjWo1jweJ8YHnPOy
        B9zJJHkvcKXQbePGAAuTl90OPqewQpPkL/F6+Fe8ssbjRlaXdGfTKOAcqKvg2QaZlPt7qHyGmht
        nZur/JoDtcCikSK4b9GJCRyGuODMAGLTMY5j9z6k=
X-Received: by 2002:a67:fe8c:: with SMTP id b12mr21428815vsr.186.1588093924883;
        Tue, 28 Apr 2020 10:12:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ93lbdgwDsDBl9dQZgsOiHAWGEembFgCeXe3Sl1r+Q6O+voFP+C/BfHuDZ81u3QHAQwwI/iODyzMKSHLzyUdM=
X-Received: by 2002:a67:fe8c:: with SMTP id b12mr21428788vsr.186.1588093924518;
 Tue, 28 Apr 2020 10:12:04 -0700 (PDT)
MIME-Version: 1.0
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Tue, 28 Apr 2020 10:11:53 -0700
Message-ID: <CAHQoOTZGdLYZ=qjF8+Rwi+E5y_st1u1CwMPiP65UHWpvRXvhZA@mail.gmail.com>
Subject: XDP Native mode with public cloud (GCP)
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-28_12:2020-04-28,2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=1 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=832 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280136
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I am running the XDP redirect example on Google Cloud Platform using
the GCP provided Ubuntu 20.04 image as my host. The code works fine in
SKB_MODE (xdpgeneric). When I go to DRV_MODE I get the following error
message:   "libbpf: Kernel error message: virtio_net: XDP expects
header/data in single page, any_header_sg required".

For all images on GCP that I have looked at the number of RX and TX
channels are set to 0 and the combined is the number of cores (ethtool
-l dev). My question is then, is there any way to run XDP native on
GCP images or do I need to try and create a custom image with re and
tx queues set?

Second question, does anyone have experience running native XDP on AWS
and Azure?

Regards

John
