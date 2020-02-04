Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41951520B4
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 20:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgBDTAs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 14:00:48 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:62216 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727308AbgBDTAr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 4 Feb 2020 14:00:47 -0500
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 014IwXeA016295;
        Tue, 4 Feb 2020 11:00:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=subject : to : references
 : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=h3Vm8gnZQnElPQUpKm+lLfFISDDIxWg5HBiTh0xI2w4=;
 b=TDo1i1BfzZIPvSQLi7pF526NX2x/3mjlY4gmqWFgVEZ+T0KOB6hSMrb2F+S5fJF4pkK+
 1r+4CnXSr+Nxs+kx6OUaVWOg3HcaVGlR+T36IMxbQ47v7bBL5rPJ3oXJhAGf6ezjgMi3
 3W6rxV54xhyTGNPjQSawqvwXDpOVY6TKIFQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2xxvs14c59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 04 Feb 2020 11:00:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 4 Feb 2020 11:00:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlCoTBwHvW0q4tclo1vAfXhhBoN8HdHbnN3qgo4Yx02ZMOW4YW2FjmACImaya/zlsHden72y33ulYcij7SbACNcg43VvFl2/oxOoQwmGEYY5I/Ay6zPujnPtKIy/Q2YhXCK7ihiHAjYor9LOVnUjtPhgz4xX3ShXV+rVBdd55vk7d8fZu4WGqF1h75j/Zut7kAzbWz6boTeLvbAK8Bweh93iP6lc4tYfLNN6B5s9S919Q9N85YHWnLnBvT0SLb5YSkHmNHMSO/Shayjd1vlioPOPDn//PKSO3aJd/0VfTRtWP13OBee7iLBfVJcZ+96tMde9B11W8MOYsByK8Mlyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3Vm8gnZQnElPQUpKm+lLfFISDDIxWg5HBiTh0xI2w4=;
 b=GR0xslChMIMbOtWe4wulqsmY2F+0+PEjIUKGxu2ZRpWcXVgB66G4fg0XI7U0YK/dkIkXkQuhPlQlsorXtTCYzn0Q0h1YYOqe5jvjH+4qRxM64Ir/kGNuC1x8DiRP1bxpho4qvbM2ywcslQPv3OCwPJhIZOoJfzZbXqq6YBawVbJcw0LU5nNyVqk9WkDIs8T1hfQlucXbBZzFkcAU+5F2e89fC+zWz42L4++YzsFAKxKN9bkXGpjEgvR8h5/ZzlmdTMm6OkTXl2elIQuel52NJLb0Fiwu1jm9aeQQDgj1TAuKsLsxVxzGJIIjdK79xpZLHZ70LNXOwz85kr+2I5mg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3Vm8gnZQnElPQUpKm+lLfFISDDIxWg5HBiTh0xI2w4=;
 b=ZGCrLNa1k0pUDuTLJ1Ym25Atjb2OAb5+r3F4JwLw+yDF21QmWy9mphYh1daYFCBpzBQiVAk3RwfVGR4a2Sdjk7okHf+62L5DdlIGGIK9lczCoDAH17aBikYcls1nFry7eu8Sx28BetHKCrCaDCmwCJKn2B8+H8NccEeANb+n8oE=
Received: from CY4PR15MB1304.namprd15.prod.outlook.com (10.172.181.135) by
 CY4PR15MB1270.namprd15.prod.outlook.com (10.172.177.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Tue, 4 Feb 2020 19:00:39 +0000
Received: from CY4PR15MB1304.namprd15.prod.outlook.com
 ([fe80::d8e:7375:a261:6e38]) by CY4PR15MB1304.namprd15.prod.outlook.com
 ([fe80::d8e:7375:a261:6e38%5]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 19:00:38 +0000
Subject: Re: Need a way to modify the section name for a read program object
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        <xdp-newbies@vger.kernel.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com>
 <874kw664dy.fsf@toke.dk>
From:   Andrii Nakryiko <andriin@fb.com>
Message-ID: <f1fa48b7-8096-b4f2-51cc-bcb4c1da0cd4@fb.com>
Date:   Tue, 4 Feb 2020 11:00:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
In-Reply-To: <874kw664dy.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:300:c0::21) To CY4PR15MB1304.namprd15.prod.outlook.com
 (2603:10b6:903:113::7)
MIME-Version: 1.0
Received: from [IPv6:2620:10d:c083:1309:c13:c9a5:618e:9452] (2620:10d:c090:200::1:88e0) by MWHPR08CA0047.namprd08.prod.outlook.com (2603:10b6:300:c0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.32 via Frontend Transport; Tue, 4 Feb 2020 19:00:38 +0000
X-Originating-IP: [2620:10d:c090:200::1:88e0]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8133755-d40c-4b07-af28-08d7a9a4861a
X-MS-TrafficTypeDiagnostic: CY4PR15MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR15MB12706D6D45F7150DE2DA825EC6030@CY4PR15MB1270.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(366004)(346002)(396003)(199004)(189003)(2906002)(66946007)(66476007)(66556008)(8936002)(6666004)(66574012)(6486002)(110136005)(316002)(16526019)(186003)(36756003)(81166006)(86362001)(31696002)(2616005)(52116002)(31686004)(478600001)(81156014)(8676002)(5660300002)(53546011)(43043002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR15MB1270;H:CY4PR15MB1304.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCPGPdIT2XjyxIVV6MIyC87xpJNytLVQCgTZeWQntg8eTIHVV3/sLdFitPxg/o+RwrtMsD1LLiaCW+obEkUC+hl1QxO33IuWLuBf0AppY0m8coH83Hwtbosr9GIe2I0PiRlkyHQ8Txk1xK8+M0D+wGzcQpQF3b0Sz6LTSo2YmfreKkgbf9Fz9S3JUl/lt/loedb5kSdzm/WtjuO1lqmjYjCPC0AIB3Espev6VJz0si800hZtNAiAB+Pp7iyP5zm3WMGMofL6JGHyClZuJcMA0ELwzAX3rKE4Y2SMkeGgJVW0JewVH59s+vXLnSnoP6dj3Q61So+BVkmM6u/Zxwj5xGyz/eRz1FS39uMXIlI9MAkPVfRuKE6XLx/I2FFLcsk+cA10WttJwDIutXyOinaw/CSnxKBwVkEI1rrCyqkJhX3iMWnJMECJxEDmCgr64yqxY9//mml5WEdy+WNfxSSpVrr6w/HfKWJ5yMao6wn41lK3CNybX8Iw9cqp1OTLTTM1
X-MS-Exchange-AntiSpam-MessageData: 7odhrRKR93tcM+G2J8cQLzj0bWX6SBUqDW3hg6WhUCGk4B9R9jhkSanBd+9zTJ6J+mBlb9kvMi9Uxc8/E4pMsm8CSFW3pOKvXNc0PZJol2ss2I64dYVd7DxZTCIu67AiUOGWzgtdRZWxQHK4++TfAHrxm/WRAX8QEtLWd6PIM8tASYSsVikk5nqlUmJxOfKl
X-MS-Exchange-CrossTenant-Network-Message-Id: d8133755-d40c-4b07-af28-08d7a9a4861a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 19:00:38.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqX3QxB6pnQybkQrm1gNOXr6IvfbMFqO0iDfd0cr6fLfvJ0CcXWjZSEyKEiHoUnb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1270
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-04_07:2020-02-04,2020-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 mlxlogscore=944 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002040126
X-FB-Internal: deliver
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2/4/20 2:19 AM, Toke Høiland-Jørgensen wrote:
> "Eelco Chaudron" <echaudro@redhat.com> writes:
> 
>> Hi All,
>>
>> I'm trying to write an xdpdump like utility and have some missing part
>> in libbpf to change the fentry/FUNCTION section name before loading the
>> trace program.
>>
>> In short, I have an eBPF program that has a section name like
>> "fentry/FUNCTION" where FUNCTION needs to be replaced by the name of the
>> XDP program loaded in the interfaces its start function.
>>
>> The code for loading the ftrace part is something like:
>>
>> 	open_opts.attach_prog_fd = bpf_prog_get_fd_by_id(info.id);
>> 	trace_obj = bpf_object__open_file("xdpdump_bpf.o", &open_opts);
>>
>> 	trace_prog_fentry = bpf_object__find_program_by_title(trace_obj,
>> "fentry/FUNCTION");
>>
>> 	/* Here I need to replace the trace_prog_fentry->section_name =
>> "fentry/<INTERFACE PROG NAME> */
>>
>> 	bpf_object__load(trace_obj);
>> 	trace_link_fentry = bpf_program__attach_trace(trace_prog_fentry);
>>
>>
>> See the above, I would like to change the section_name but there is no
>> API to do this, and of course, the struct bpf_program is
>> implementation-specific.
>>
>> Any idea how I would work around this, or what extension to libbpf can
>> be suggested to support this?
> 
> I think what's missing is a way for the caller to set the attach_btf_id.
> Currently, libbpf always tries to discover this based on the section
> name (see libbpf_find_attach_btf_id()). I think the right way to let the
> caller specify this is not to change the section name, though, but just
> to expose a way to explicitly set the btf_id (which the caller can then
> go find on its own).

Yes, I agree, section name should be treated as an immutable identifier 
and a (overrideable) hint to libbpf.

> 
> Not sure if it would be better with a new open_opt (to mirror
> attach_prog_fd), or just a setter (bpf_program__set_attach_btf_id()?).
> Or maybe both? Andrii, WDYT?

open_opts is definitely wrong way to do this, because open_opts apply to 
all BPF programs, while this should be per-program. I'm also not sure 
having API that allows to specify BTF type ID is the best, probably 
better to let libbpf perform the search by name. So I'd say something 
like this:

int bpf_program__set_attach_target(int attach_prog_fd, const char 
*attach_func_name)

This should handle customizing all the tp_btf/fentry/fexit/freplace BPF 
programs we have. We might add extra attach_target_ops for future 
extensibility, if we anticipate that we'll need more knobs in the 
future, I haven't thought too much about that.

> 
> -Toke
> 

