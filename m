Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A36A644246
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Dec 2022 12:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiLFLjr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 06:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234372AbiLFLj0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 06:39:26 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671CC15FF3
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670326765; x=1701862765;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0K0kwlpeKu2WWjVHWK7HiY1RrIUEliPgyw8ST4n/JiI=;
  b=nwKHXSbCHa4XoLRE/17AjRz1G+6vbZi6uxJOIEgGRxsKth9sAgYXwfvZ
   vnpAI2YYUmbbczfknNXUkJvmdNeAhJ2cJUZTJwC1X9xnqlOd6ZzG3p2fS
   btmsBzgEEjLCFXq24XDob4bxBKDBSeQthcP2I8JAeq9Vt73jqDS/KImW8
   qhLEpEPkYu3+WVKYgL5hDOs/JDbdeFfCbOX62elqRcsdkKUhxVaUDWuqe
   C5eyxRUSQOel2Q3pWoJJs7TnFDOZkDPbRd853KxsulC42kn3L4njQD+Ld
   cExlbhWAT4SaVoUXWmWPUTSQEQHkYkB7hMiSm3hnvtS5JPzsgB2Er7aGF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296955471"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="296955471"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 03:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="891349015"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="891349015"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2022 03:39:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 03:39:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 03:39:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 03:39:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 03:39:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDsVqq3sXHPpgOajzmcYJ03OP2fZl0eZTQe0G6Wa46YWkC8g9iWAXNbShp8A9WDbORAWUpnE1HyQbfy4gSw0qZVRXpO4NG9KiUvxUPDldUHpbItDMJLkOo0EQtq7fOjuq+bJaW6EJDEihL1Zdjq8MI+ibH3/wpOq/mvi0feQV3H9v7KP131WNLOjWM9MeMj3HLjEO847DFclQtwPCElC1XtwR/tkm0AL1s/aluSSxlLy2Lul708VfmTZpftNg7zcv+tXcfVTorH6cFUXv+I+9zC2pNDYJGX/VZPx1/tI9GafzWcXyJUYhDXdLpclZcfLZmR6V5y7PfBk8qgJBThWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qpnG3FNKp0vvmmLrgDs3uRYTb6VSbEnLhjIDKH9FAQ=;
 b=DkSSj1kRqOP9fM8aq/l2/8SpM74D2grl7HUz6OUfsfAHL1MtasLkaKezEjP3co45rlf9S2LcxyazhxWTK3jVPN2GfKHjnfyPMjW/iJmXDdbs8S2i1PivEMV7BqgwDIg0dHhM4FdUXbWiRo+ykyNFy7lEXq5FIHkoPuMn1xWSR0HdqnkFKb+MT3Jb7mOr8aEGlZ6xe4ZA+aMbqWBokAvkJAJRYD2p6f07FwHgpmrxUQsmpueXxEiBGRz/GQzo5DrGKC7DYB6bU1DhfQOV3UoOEmVYrJQZz/PpDgFkIq/vL3h8j1CErfzBzuhnV7Cmrcr0qPlQkEGCufDOYvL2sdaGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 11:39:21 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:39:21 +0000
Date:   Tue, 6 Dec 2022 12:39:11 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Robin Cowley <Robin.Cowley@thehutgroup.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Potential ICE driver bug when returning XDP_TX with multiple
 channels
Message-ID: <Y48p32+plvWxNCoX@boxer>
References: <LO4P265MB3758A4D43FB2F5EC0508231487179@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LO4P265MB3758A4D43FB2F5EC0508231487179@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|DM4PR11MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9236f277-b2d6-4f4d-052d-08dad77e843e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ie6oCP3IfFoz+jTKBwBUBq5twIh3MzbRpcg0a5aSqCu3HPr+1B6p0MxRmyW/GjC8kllqFvFBJvRTxAmihPmBlzJqV7AMuEU94NcdoKaXy1xCO3T87c3zRcloFMtpuxrgznhoZca8FFt5P1GFLn4SlIrp4DpXnzoxjmpLfvhSQMn7Ygo7V4/pE7z4Q5XpQQqO11RbC8blQQQPwtokI5WqlXeSeyecpHEi97mTod7owY6P/5mKtm1AMtG8JiDuHH/agaefj1JwGyIAzODCETWvp4z9joiuzIaA3fBQUy6tjcihSvhxVF5c2wul8wLLruF4hpqYuSQsoMPvuwwVFfmvRWp4ub2pg2KjhPAYLiXAtnbXLRzq6Rssx+LIDRMxgYt6S4TpsbgkjsXHiLMtkByMH9ZzvDxKIfDgC3Mp2wc5H7YCVjaieJEYEIs94pryaB0cCTPsAlhHQDvurW7bd/djN51r5oCoowGAuQI0Di9tBjz3SUstxalkMbRxUCj80xL/BCZNXGJdljqBS1ZnJi5LgYk4+BDua0SxJ/jpQ82HnesDfy+c8T55MnUfK1Mwu63IfCYRvki537471YqFpZZ95DudVa7aY/vI5xlUd0P2+/VYK6425Icsy40DzzAko0qh0DOkRycwChrcu/bBptk3n6Zxzv9/wyRL0RXvmh5p0XlSINpj0uanD/AXaAuYoSmNlU7IHm2lffy5MfYnsBckYeBA1hI1Y8VrFm5p19RlGofAMaID14zjg6KzoPP8Q2CV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(83380400001)(38100700002)(4326008)(41300700001)(66556008)(2906002)(44832011)(66476007)(8936002)(8676002)(66946007)(86362001)(33716001)(6506007)(478600001)(6512007)(26005)(9686003)(66574015)(6666004)(186003)(316002)(6916009)(6486002)(82960400001)(966005)(5660300002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXMwL1pNSmpTWUtkcGZhWXV5TnNFRTJ1WHAxZVk0LzhmaHJvUVVPQnVoUmZn?=
 =?utf-8?B?b1FCQ3l3WlNYclZKODJ4UkZvV1lIV0VWWmtWd2ZTZ0JDa1RzNlVLUkp1dHRw?=
 =?utf-8?B?ZEsrdUV2WktWdThLZXZPYkRjZm5ob1IrZDVIQ0h5dldLMVhObFZJR1NrZURZ?=
 =?utf-8?B?NmkwQ0ZXaWg3d2UrZG9tV1IwaDlkTGs4WkVITHcwYkNrdU9reW5yenlCemZo?=
 =?utf-8?B?OTFRM3BvMmxCSC81Y3l0cnpqU3ZGRDB2SzA0cm9qUkpRSmZyd05aNWgzWllS?=
 =?utf-8?B?U0JJU1RSWXNuMXAzNDNpT1ROZ015b1pGdnlwYTNCaHpHWXoydlB4NE1UajY0?=
 =?utf-8?B?U3VvVzhyNEgxcGRHblkrTTNJMW00aGhTTmd4bmZKa0ZDOGJkeUZoQ0x3YWlZ?=
 =?utf-8?B?R3V0THFtbzQ2a3pidTBlSGZuVXh3Q2lJeXBtVFZtdXhmalQ4bnp5Rnd1NjRO?=
 =?utf-8?B?MXcvWWRPaDRXNEliczZUTGpLcURmSGdHRjN3QzZ3ZCs4K0hIQjA3RTJyc1NP?=
 =?utf-8?B?V2d0UmJGaWJQWlhWQW42a1VMOFhNSkhaK2M0QWtFSGpaYjhRSDd0bGUyTE0v?=
 =?utf-8?B?Q0hyUXVLb1R2ZEpyei9uWW9IcnoyMXBFc3B3M3NLMzFsUFhteVBJY3Y5aTJn?=
 =?utf-8?B?RVQzcGhRbm4xSE9GWjNVMG5QTWg3MFNFaFJYWU1BdTFWd0YwUVJ2eTRQVkZs?=
 =?utf-8?B?NzFBcnhqZUtJa3orS3B0Y3ZKMlU2ZDFKUUhITmJsOWljc21nQWxKWGR2OUs5?=
 =?utf-8?B?dVhxSWR2dzdITGxwZkdtSmlRcStSUm42aHMvdnZIT2dmNVgxUE1QaG1PbGIv?=
 =?utf-8?B?L0RnSTFzOG83UHg2VFZBQzBpNkFJOFI5RU56bnNYY0JQc1dEMFBzNWprY1lo?=
 =?utf-8?B?NVpNQ3Vza3RTaThJOHVRNTAzRDlFblUyWm5sZUJzR3ZxN2xpd1F5eWhzSHUr?=
 =?utf-8?B?ZjNjRmV5RUhvZEkzV054ZU8zZk1jc3pOcGJTbFh4UFVneFZmSjRDWXJvSkdo?=
 =?utf-8?B?N3ZBQzRCSW1ldmpSV0lJTFlRQmNpN3ZOdGJtRFBoemhZRll0L0ZuWnVhemkw?=
 =?utf-8?B?NWM4eTBYaTdia3ZuWlZmQXZ4dlZpMHk5REc3RFNqa0dYM1dyK0ZjLzdUdHFS?=
 =?utf-8?B?ZUtxcm96MWxHU1pDNUZYSUZmbXNRV3ZwSG1WSE9RcXYxK2RJK2U4ZjZTbFUz?=
 =?utf-8?B?SUMzb3k1ZVpJNjN2aitoOENJRkdPUVA4cjJvQlhYTkVMSUMwTU9PWDFFVGRL?=
 =?utf-8?B?L1JtamJncUsvai9RZUE2ZHJHSHZCUzBNbVVIT2NuT2dUTnNGUmVWMXpSYkNO?=
 =?utf-8?B?TnkzY2NTQWlWRWo3MmhleGpGQXVDSjMwSDhQQXRJWGFIMzB1TytXQ2FGNmFr?=
 =?utf-8?B?ZVRRUjdpUGxTcXJLd0hFNkgwbTYzRXFkS1ZybjZSZzc5SXIyOVd0SmtiQTQy?=
 =?utf-8?B?SFF1c2NOeW5iejljY2pjV3RXQUlTRHFKZGJiaFpVaDR4QnNTWFNVdE9iZXIz?=
 =?utf-8?B?N0l4OWwvMGVua1RjdXowcTVPUVJuOVgvRFgvSEFTZldIYm5Kak1zUmRmNEJ5?=
 =?utf-8?B?L3lHYzVaZmd3L043R0dvTE0ybkpOVGhsK2NDQVNvNlppOUJhcHBuL0dMVHQ3?=
 =?utf-8?B?S1Q1RlorV1BkcWMzc0x0L2VYOGxvUWZUVmJpZTJiQU5uNUthSDZQM0xJUk9v?=
 =?utf-8?B?T1ZGZTZsTjVwRGEvd1oxUHU0bUNLTUE3TXlkTTZtNDJjdElyQ1dNMWFvZ2hS?=
 =?utf-8?B?MGJmN1JCam82TlkxNGl6N0RKYW9xYSs4MURlb2JTT1c1bmNCdE5LQUwwcFlu?=
 =?utf-8?B?WUsxRGNmbnZ5U245WDBsTmlWbUVYMGZJbUtrNTdBRGJudUNwa2wvUnJSSUY3?=
 =?utf-8?B?WTBnQUVWZzFEVDRmL1NCc0VsY0ZJQ0p5bVhXUkFmcUFpTjZhN2FoV2tkSE5z?=
 =?utf-8?B?all4QmE4ZVR2dG5lUmtTVVV1NXQvaERFakdVVXQvYWI2Tk01Z1FzaXlLeUgr?=
 =?utf-8?B?TGUyQVV1WE43ZDVLOHFrWFAvWFlLNVM3V01rNnhjK09zcVlyTXFCa3JRUVA2?=
 =?utf-8?B?Qi8wWmgwUWlLemIwTllQdzFUQlhDdHo1ZDg4VHNiUW15YWs1ZTRHY3ZwMy9q?=
 =?utf-8?B?OTJ1bDBzQmhDbkVpSWdlT1krcmx6eFpQd1ova3YycndjL2pZdGl0c0RQcEVt?=
 =?utf-8?Q?wIduvLs8YDlBpwfhvHWvbVQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9236f277-b2d6-4f4d-052d-08dad77e843e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:39:21.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuWQBHeyOp1FQb6pSnZLt2C5aa2Dn1tjE9m1g+RSpEj0Cue5wuXkP2/GeIfH16AvlnssMJx43Pt1Rrx7QmT1JuyLH3cFlMlsT6jENzIMcWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5469
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Dec 02, 2022 at 04:01:24PM +0000, Robin Cowley wrote:
> Hi there,

Hi thanks for another report :) again I think I have a fix for this, but
this fix is on top of the XDP multi-buffer support that I am working on.

I can share the set with you in the current state out of this list so we
would know if this is a way forward.

From our side I think that we didn't believe that there are any ZC XDP_TX
users so apologies that we didn't test this properly...

> 
> We have been testing an XDP program with Intel E810 / ICE driver. The program uses AF_XDP in Zero Copy mode. In some conditions, the program logic decides to return XDP_TX action rather than XDP_REDIRECT, so packets are transmitted back out the interface they arrived on. (In this condition we also swap the MAC addresses in Ethernet header within the BPF program).
> 
> We recently identified and submitted a bug report onto XDP-newbies, as we were seeing memory type errors. [1] The patch supplied by Maciej fixed our initial problem of an incorrect XDP memory type. However, upon further testing on Kernel 6.1-rc7 with Maciej’s patch applied we have noticed some further strange behaviour with larger packet rates and more channels.
> 
> It seems that when we use multiple channels with dedicated F/C queues, some of the channels stall and do not transmit any of the packets back out of the interface.
> 
> We have been running a slightly modified xdpsock based program as a test harness on the test_zero_copy_tx branch [2] as per the previous reports. (Again, we’ve tested with the version of the program that enables multiple F/C queues per XSK).
> 
> This XDP program now has some percpu stats added into it, so we can have visibility on what actions we are returning from the XDP prog. We observe that while the BPF program does receive every packet and return XDP_TX properly, some of the channels experience a TX failure, leading to packet loss.
> 
> This led us to do a little bit of digging and we noticed that at a certain point, when a channel stopped transmitting packets back out the NIC, the tx_busy counter is being incremented. We looked into the ICE driver code and we believe this is originating from ice_xmit_xdp_ring() at ice_txrx_lib.c:288.
> 
> We progressed to enable tracing on XDP events; we can see an xdp_exception trace for every failed transmit operation. We added two additional tracepoints in the XDP_TX code path within the ice_run_xdp_zc() function of ice_xsk.c file – one on successful TX, one on failed TX – with both highlighting xdp_ring->q_index and rx_ring->q_index values. Our rationale was to try and identify if there was a pattern to which channels were failing.
> 
> We were able to establish with reasonable degree of certainty:
> 
> A) Tracepoints following XDP_TX failure always had a TX/XDP ring q_index of 15 or less.
> B) Tracepoints following XDP_TX success always had a TX/XDP ring q_index of 16 or above.
> C) Both points above are true irrespective of the number of channels we had configured (1, 2, 4, 8)
> D) Tx/Rx ring sizes did not seem to alter behaviour – we tested with tx/rx rings of 1024, 2048, 4096.
> 
> We think this might be a bug within the ICE driver, but we’ve only picked it up following resolution of the previous issue [1].
> 
> Our test rig happens to be a 16 core (dual socket) so we think that might have some bearing on the above. Due to the test machine being NUMA we have avoided testing with channel quantities above 8, but we’d be happy to if it would add value.
> 
> We were testing this on the kernel version 6.1.0-rc7+ with the patch supplied previously by Maciej.
> 
> Everything above was seen using Intel E810’s with the parameters [3] below.
> 
> Any guidance would be appreciated.
> 
> Thanks
> Robin
> 
> [1] https://marc.info/?l=xdp-newbies&m=166973074709850&w=2
> 
> [2] https://github.com/OpenSource-THG/xdpsock-sample/tree/test_zero_copy_tx
> 
> [3] Ethtool Parameters:
> 
> 
> # ethtool -i ice0
> driver: ice
> version: 6.1.0-rc7+
> firmware-version: 2.50 0x800077a8 1.2960.0
> expansion-rom-version:
> bus-info: 0000:03:00.0
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
> 
> 
> # lspci -s 03:00.0
> 03:00.0 Ethernet controller: Intel Corporation Ethernet Controller E810-XXV for SFP (rev 02)
> 
> # ethtool -g ice0
> Ring parameters for ice0:
> Pre-set maximums:
> RX: 8160
> RX Mini: n/a
> RX Jumbo: n/a
> TX: 8160
> Current hardware settings:
> RX: 4096
> RX Mini: n/a
> RX Jumbo: n/a
> TX: 4096
> 
> # ethtool -l ice0
> Channel parameters for ice0:
> Pre-set maximums:
> RX: 16
> TX: 16
> Other: 1
> Combined: 16
> Current hardware settings:
> RX: 0
> TX: 0
> Other: 1
> Combined: 4
> Robin Cowley
> Software Engineer
> The Hut Group<http://www.thehutgroup.com/>
> 
> Tel:
> Email: Robin.Cowley@thehutgroup.com<mailto:Robin.Cowley@thehutgroup.com>
> 
> For the purposes of this email, the "company" means The Hut Group Limited, a company registered in England and Wales (company number 6539496) whose registered office is at Fifth Floor, Voyager House, Chicago Avenue, Manchester Airport, M90 3DQ and/or any of its respective subsidiaries.
> 
> Confidentiality Notice
> This e-mail is confidential and intended for the use of the named recipient only. If you are not the intended recipient please notify us by telephone immediately on +44(0)1606 811888 or return it to us by e-mail. Please then delete it from your system and note that any use, dissemination, forwarding, printing or copying is strictly prohibited. Any views or opinions are solely those of the author and do not necessarily represent those of the company.
> 
> Encryptions and Viruses
> Please note that this e-mail and any attachments have not been encrypted. They may therefore be liable to be compromised. Please also note that it is your responsibility to scan this e-mail and any attachments for viruses. We do not, to the extent permitted by law, accept any liability (whether in contract, negligence or otherwise) for any virus infection and/or external compromise of security and/or confidentiality in relation to transmissions sent by e-mail.
> 
> Monitoring
> Activity and use of the company's systems is monitored to secure its effective use and operation and for other lawful business purposes. Communications using these systems will also be monitored and may be recorded to secure effective use and operation and for other lawful business purposes.
> 
> hgvyjuv
