Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A18723AA73
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Aug 2020 18:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgHCQ3A (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Aug 2020 12:29:00 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:21934 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbgHCQ27 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 3 Aug 2020 12:28:59 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 073GQkG5029131;
        Mon, 3 Aug 2020 09:28:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=L1FPCXztb3eMovH/36cx5o+1vjxFLrf8lzzw7M9wVhM=;
 b=Cq8kRFWzy0Nkopj2ksm2EJwRPDbXLvqcExLujIYEapLOUkP4XHiPoE1l033QqD1rfTwU
 +LCsyBAFx+qIF747WslKPJ+fWbHVK3b02i7+ESxVU44uCTogcZCA6LYN6YVGQUZlcxKn
 rIWTvYL+ViT6iLfAVOy5TdnYqMjIq4I4EuU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 32nrnnw87m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 03 Aug 2020 09:28:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 3 Aug 2020 09:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZAWRzceXhnP/aO6wRjkXF71olpATkN6U/G4dXPoL2WTqxYmpU496cxJfi1WdS8FJ4mKDu+DJQ2EdSlXcUVVPfhQCg0FRqmyp9dSN4ft5gVvLyImaE+A2pMa9JmyPUS0hM04bsB+ciU5uQ/SFzBUC/yCiQO8hVubiFATA7wpzjT3tzob93hPQ7sLyEJaCdSVrrXVIikyQ5aLup2rb+ZXPE59PGCKvFPWY5TZCVk9O9FtLdbiMyuxG547PtKOw4OIbEltFZ8M3GHxE0ffIMBRTwKLRAqysLq9tOB6+kQVbMdm2ErofJepYzen7F4H4Z/GsztA2O4hLO+SgMPNnIfYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1FPCXztb3eMovH/36cx5o+1vjxFLrf8lzzw7M9wVhM=;
 b=b5hJuOCttUZ2saFMUZulCmtR4CCY7jonb2D5fCmz+6p1gP/b8EwE9Hav24X0UdZqfkeYu9CYyaC4ReAvn1dKBtSjQ5Xr5J82z+vOKlZbxXDZjNIiPmn+suDZeAvtxkve45CucRZBzVwPMyWKiKaM+ICSkXfGiAkONi1qaSlT1JViafnk8AW07YU+pRse2Uq2EhTNhOz8OOFO/6dLGEwVV5VqKdVmk3/1SNof2lAFcTLNUYZdL34UwB63fsB2QKzqpP0uy49297dYD0a0zqaga5GJtWROObdriuzQIJ2af2cM4Y59y1tCiULpRT+1VxZPK1tauDRPbp9+iGuSn/yQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1FPCXztb3eMovH/36cx5o+1vjxFLrf8lzzw7M9wVhM=;
 b=JWCR4OW0BBs/yORzUqVTE3ONFjihsyo1J3QVM8fof0pgu00LlXRPswksqXmSF+bhfnB6wepp714W/9EiSPI7q1Q9p9OG75TKs0qTAH99eP7NXaDtXJggoRyhvPgrEesVmf+XjigGEsCNBzK0hmaeReYQzo8br7basht4kcFtM3I=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4088.namprd15.prod.outlook.com (2603:10b6:a02:c3::18)
 by BYAPR15MB3512.namprd15.prod.outlook.com (2603:10b6:a03:10a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Mon, 3 Aug
 2020 16:28:32 +0000
Received: from BYAPR15MB4088.namprd15.prod.outlook.com
 ([fe80::56b:2925:8762:2d80]) by BYAPR15MB4088.namprd15.prod.outlook.com
 ([fe80::56b:2925:8762:2d80%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 16:28:32 +0000
Subject: Re: Clang target bpf compile issue/fail on Ubuntu and Debian
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <borkmann@iogearbox.net>,
        BPF-dev-list <bpf@vger.kernel.org>,
        "iovisor-dev@lists.iovisor.org" <iovisor-dev@lists.iovisor.org>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Jiri Olsa <jolsa@redhat.com>, Shaun Crampton <shaun@tigera.io>,
        <steve.langasek@canonical.com>, <wookey@debian.org>,
        Yonghong Song <ys114321@gmail.com>
References: <20200729211341.1a713559@carbon>
From:   Yonghong Song <yhs@fb.com>
Message-ID: <c2bf6327-f9c5-b78e-ed7f-d4f78e216db3@fb.com>
Date:   Mon, 3 Aug 2020 09:28:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
In-Reply-To: <20200729211341.1a713559@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To BYAPR15MB4088.namprd15.prod.outlook.com
 (2603:10b6:a02:c3::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2620:10d:c085:21c1::1092] (2620:10d:c090:400::5:76f4) by BYAPR02CA0038.namprd02.prod.outlook.com (2603:10b6:a03:54::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 16:28:32 +0000
X-Originating-IP: [2620:10d:c090:400::5:76f4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72756198-0cf1-49c0-2a96-08d837ca4348
X-MS-TrafficTypeDiagnostic: BYAPR15MB3512:
X-Microsoft-Antispam-PRVS: <BYAPR15MB351298C0A679C74A3B4B7A6CD34D0@BYAPR15MB3512.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQlgBohwdRysDL89mhBczUsDpFJFDUOC0JC41/4PAgDx+Pwp6XICuSglaVGfGFEh1n988R4Eq/YjaQmLROGzjHydGhLZ6PqxcVw20Y8vklWKeLVYE9ubXCsRM+V+1Pw9s/Qp7CZpJxYl4HdWVmH6Fx9Dq1kMH0Mwfxu/aWjEEpm7INeSYSsvAmLOODw2/r1y8lfhWH9K9hpjEh3JwOsvph2MCBSAtKPDiVdjo+U4vkHsOIgct8NI+bwFpxV8Y+UJlGh3USwZ9Ld3h8+tEdRYEAy6rmgRmjsODulmS0lawwaDB2TSkbOQeGkHrcEolTrPxJhI3RWbSwcRSoSR0EMA8riT2Ufh2nLbxFCsQySkOmHXNpUDCr3DO3EKj6O7PZy3tAloxB3wkJsEIJJS6WM4/Tb39FwqZBXY82oL17XeM4cTOyGfUwBwuWUuLBydksWa+ul1wNwPJdVp34PaxhPA7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4088.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(366004)(136003)(376002)(396003)(31696002)(66946007)(36756003)(7416002)(31686004)(66476007)(53546011)(8936002)(66556008)(2616005)(4326008)(86362001)(2906002)(6486002)(186003)(16526019)(316002)(478600001)(966005)(8676002)(54906003)(52116002)(110136005)(83380400001)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 7iKb0+QvsgFnHMaVGmYflVwPeHKoezBIO4rNxfx2SVa8A+BvoE03CmF/0dS7bJ4r3XCrPEgn5Y//zXGP+drd8PoOBCsc+NILiL2Ghyj1Vb6GjVTexAgTgglpG/m9LfbKG8SBqguhZLA08Kga0E7bbXhoDRN0PSEHSxjW2SCB47lLX8N4r6CFcGqUGt8HviDWwZzwdthBX3e0t/RXPaAGSccKEvAhrlrbP0wPicMzHKWTI3d1gmd8M5RC2pRoANSbIa06RLy/gysv2oNZ76Z2o0LvaFRpnLMicJfGUOH3jaI1LdVg4yaBbYDbp2cND3/u14boXysLsiRgBtItRvoglZRp8z2vksbSD/peMba1zlG9z4dT4Onx/XynYYfPp2WHK7CDcK17RmLDSDOfsbhPbfHnC593UBU67hhKh1yBXGJjlay6RBk5cqqSMYAuMUq9AK7bBTgkWk8Oe5mbrhqJPdAclHFG/v61t2K7DAL2T4GiaGprG2RDnEzmdMssbX7eWNJ+oOUOkSeb+BAhnmTXG9+f1ZcILxpLZMhEFgcQeQxiWEBviyqW8YhxxD1XYfOEoc+wSwZg75flryWl+FbmADpF+4Qs/vNmGQ8vrX9pPdNsJdUWHm3AXrhio9Ez0lYM6AVy++H+mLvDDLHUjnXrCr7lnyEzIOHUPnq/QbaD/J0=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72756198-0cf1-49c0-2a96-08d837ca4348
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4088.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 16:28:32.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShhI4fx/BHjh5IUjPGnEeiJhOKg0p1G8f/TIeuDIt1qeyMR8VtRoSgLs1jbztNzi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3512
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_15:2020-08-03,2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=971
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030120
X-FB-Internal: deliver
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 7/29/20 12:13 PM, Jesper Dangaard Brouer wrote:
> 
> The BPF UAPI header file <linux/bpf.h> includes <linux/types.h>, which gives
> BPF-programs access to types e.g. __u32, __u64, __u8, etc.
> 
> On Ubuntu/Debian when compiling with clang option[1] "-target bpf" the
> compile fails because it cannot find the file <asm/types.h>, which is
> included from <linux/types.h>. This is because Ubuntu/Debian tries to
> support multiple architectures on a single system[2]. On x86_64 the file
> <asm/types.h> is located in /usr/include/x86_64-linux-gnu/, which the distro
> compiler will add to it's search path (/usr/include/<triplet> [3]). Note, it
> works if not specifying target bpf, but as explained in kernel doc[1] the
> clang target bpf should really be used (to avoid other issues).
> 
> There are two workarounds: (1) To have an extra include dir on Ubuntu (which
> seems too x86 specific) like: CFLAGS += -I/usr/include/x86_64-linux-gnu .

How about non x86 architecture? It will be something like 
/usr/include/aarch64-linux-gnu? Do you think we could have some header 
file conflict
since this directory may contain a lot other header files as well?

> Or (2) install the package gcc-multilib on Ubuntu.

I think having a /usr/include/bpf-unknown-none and the distro add this
path to the compiler has target bpf. In this way, only necessary header
files will be put there. Less potential issues.

But in either case, it will be good if this level of details are
hidden from the user.

I am not super familiar with the distro packaging of a particular 
compiler and its include directories. The above is just my 2 cents.

> 
> The question is: Should Ubuntu/Debian have a /usr/include/<triplet>
> directory for BPF? (as part of their multi-arch approach)
> 
> Or should clang use the compile-host's triplet for the /usr/include/triplet
> path even when giving clang -target bpf option?
> 
> p.s. GCC choose 'bpf-unknown-none' target triplet for BPF.
> 
> 
> Links:
> [1] https://www.kernel.org/doc/html/latest/bpf/bpf_devel_QA.html#q-clang-flag-for-target-bpf
> [2] https://urldefense.proofpoint.com/v2/url?u=https-3A__wiki.ubuntu.com_MultiarchSpec&d=DwICAg&c=5VD0RTtNlTh3ycd41b3MUw&r=DA8e1B5r073vIqRrFz7MRA&m=ZEguArah72427WZMt53NXZa8LuQEGJKvCOgjH96NggQ&s=5xL0VWya8ULHcj4pfw6oxqHoKWIXNfJnj2G7rdaQyR8&e=
> [3] https://urldefense.proofpoint.com/v2/url?u=https-3A__wiki.osdev.org_Target-5FTriplet&d=DwICAg&c=5VD0RTtNlTh3ycd41b3MUw&r=DA8e1B5r073vIqRrFz7MRA&m=ZEguArah72427WZMt53NXZa8LuQEGJKvCOgjH96NggQ&s=mym8eKus7o0PzfkC2-IMyPU84OwVb2_A4ky2JHcdexQ&e=
> 
