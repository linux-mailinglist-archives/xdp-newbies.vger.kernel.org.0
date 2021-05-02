Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02156370A4D
	for <lists+xdp-newbies@lfdr.de>; Sun,  2 May 2021 07:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhEBFSy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 2 May 2021 01:18:54 -0400
Received: from mx0b-00000d04.pphosted.com ([148.163.153.235]:10180 "EHLO
        mx0b-00000d04.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbhEBFSx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 2 May 2021 01:18:53 -0400
X-Greylist: delayed 1629 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 May 2021 01:18:53 EDT
Received: from pps.filterd (m0102892.ppops.net [127.0.0.1])
        by mx0a-00000d04.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1424lbvc005605
        for <xdp-newbies@vger.kernel.org>; Sat, 1 May 2021 21:50:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stanford.edu; h=mime-version : from
 : date : message-id : subject : to : content-type; s=pps05272020;
 bh=Uh4XRcmSCYWO/lDzp3CGmxSrmmzU1EgIQHYn8+ulgEU=;
 b=LTB9tC51cNOxc9BSONYDewuORgbNk8IGg6sTDU2Ptd9d39e82jm1VIdez0211SQrjPJS
 TuFmZVV6x0IlZxOWbXA/ZowzLiJ4kZEPVeB4qTsagbVRntPL5yAlbG3+drLxhD0Uqk03
 SNb4z6+bRH/1Veo8M46jSpWjJwKLLfZiP3d4xtu57N4mw2QvL3NHAzAMeTmJnz6fSJZX
 uHW760AVNSbbdLu6kJGoJYmQ0P1dvSvu6ga4R5jcGNd47LWcBIYP60UFzic4sUqy+382
 Jkuo/LMXiSuncN88pYaIst2bxtjife1g8r14h+ou9+2N/HmfFA86OviZl2XJm1dk1XCp fw== 
Received: from mx0b-00000d03.pphosted.com (mx0b-00000d03.pphosted.com [148.163.153.234])
        by mx0a-00000d04.pphosted.com with ESMTP id 3893mttfud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Sat, 01 May 2021 21:50:52 -0700
Received: from pps.filterd (m0102883.ppops.net [127.0.0.1])
        by mx0a-00000d03.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1424mCQg015320
        for <xdp-newbies@vger.kernel.org>; Sat, 1 May 2021 21:50:52 -0700
Received: from mx0a-00000d06.pphosted.com (mx0a-00000d06.pphosted.com [148.163.135.119])
        by mx0a-00000d03.pphosted.com with ESMTP id 3895f7jr4x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Sat, 01 May 2021 21:50:52 -0700
Received: from pps.filterd (m0167933.ppops.net [127.0.0.1])
        by mx0a-00000d06.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1424lBJO001251
        for <xdp-newbies@vger.kernel.org>; Sat, 1 May 2021 21:50:51 -0700
Received: from smtp.stanford.edu (smtp6.stanford.edu [171.67.219.73])
        by mx0a-00000d06.pphosted.com with ESMTP id 3892h9ru04-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Sat, 01 May 2021 21:50:51 -0700
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kkaffes)
        by smtp.stanford.edu (Postfix) with ESMTPSA id 2176480F8B
        for <xdp-newbies@vger.kernel.org>; Sat,  1 May 2021 21:50:51 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id w3so3036680ejc.4
        for <xdp-newbies@vger.kernel.org>; Sat, 01 May 2021 21:50:51 -0700 (PDT)
X-Gm-Message-State: AOAM531hbHDMoSFQYwklYR29wF1ciJfnydCK8CjUQRSSwLh6Meil7m3g
        N901CtFqJjN/ZOuNqfKjNVb74v5zGzOz91155d8=
X-Google-Smtp-Source: ABdhPJzXPBxawJyUsL4mW+kB1HeJ2Jg6xp+4H6V2gVbThifovrNTqFdsj+Sn/lSIrb+VMcZ5sr/mEDZo1xfif2ke8BU=
X-Received: by 2002:a17:906:a20c:: with SMTP id r12mr11111682ejy.554.1619931041715;
 Sat, 01 May 2021 21:50:41 -0700 (PDT)
MIME-Version: 1.0
From:   Kostis Kaffes <kkaffes@stanford.edu>
Date:   Sat, 1 May 2021 21:50:31 -0700
X-Gmail-Original-Message-ID: <CAHAzn3pDuXPtE=S2PNgu_pdmDfY-tPjNZYMF8ZrvCs6GSRROxg@mail.gmail.com>
Message-ID: <CAHAzn3pDuXPtE=S2PNgu_pdmDfY-tPjNZYMF8ZrvCs6GSRROxg@mail.gmail.com>
Subject: KCM Multithreading Issue
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
x-proofpoint-stanford-dir: outbound
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-02_02:2021-04-30,2021-05-02 signatures=0
X-Proofpoint-GUID: O4OLk2OUxc3p4a686ci0H95MkHIgVGlQ
X-Proofpoint-ORIG-GUID: O4OLk2OUxc3p4a686ci0H95MkHIgVGlQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-02_02:2021-04-30,2021-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=852 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=100
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105020035
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I have been trying to use the Kernel Connection Multiplexor (KCM) for
request-level scheduling on top of TCP streams. The parent thread of a
multi-threaded server creates and clones KCM sockets. It then listens
for a pre-determined number of connections and attaches the connected
sockets to the first KCM socket it created. Finally, it spins up
threads that each uses one KCM socket to read() requests and write()
responses.

I observe that often the threads stop receiving, getting stuck in
read(), a couple of seconds after the program start.  This behavior is
non-deterministic but it becomes more likely the more KCM sockets I
create.

Is there any known KCM bug or is this most likely an error from my side?

I apologize in advance if this is not the right channel for this question.

Best,
Kostis
