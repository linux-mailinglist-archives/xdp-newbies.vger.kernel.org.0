Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F4E63C18C
	for <lists+xdp-newbies@lfdr.de>; Tue, 29 Nov 2022 14:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiK2N4r (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 29 Nov 2022 08:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiK2N4p (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 29 Nov 2022 08:56:45 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E220C51C15
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669730204; x=1701266204;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FyC81rWKZY+nigHSi03PZVzDhU3cNTyQaZcA6hwbWCk=;
  b=MUthEKjUn0vzZo48j4MhUkPpKTCvT1cloZ23zzVMSCutlR6M+3RwcNm9
   pYKIUTRw48AevvYt2F7j3gsDXwRh7jGY6OxLDVsS73G6A7KfQLcRzkr3c
   MtIbETS0m4k3eNj6MZV6eZcCTGKhIMv9ifpLFobUSJEdD/pw837LpTR7i
   jKZbBslb/Dr3ass3Z9CNu+VWuODAgAFIgL4EMctj5U2Dy1Lof3LLPWyIy
   +Zb8s/XRTs9W26wtn/JDWoRISwyHqDVSoPpl7zra70MA7FhjEuVKZt5hu
   Br0V74RP2is+OAQXcujR7J67ZdCH28euoPCR32wSpYkfNR/Udyxep8Mbo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="342032636"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="342032636"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 05:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="768433336"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="768433336"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2022 05:56:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 05:56:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 05:56:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 05:56:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/k1kIf2OuDBdfdrDBtdm5tJ7ETktK3/MIVg5IxisiUD943cSqX1KCZw2U/aKJGrRyeaJvyY/hXBoeBYS5JmKiLzImfvYAl081bXB1XBj7fh3CNqyPWxSqSXUNjh+r+OSnjuK6QpvkdbXKgeyFMxGaj/ap3jntfxX7x71AdIxu0LzvS82JaR0xfT4H0bV0mahsWIemxR2dhj9a3g3qfUjPe6DMsTdO6M+CUXd3NTXG2Cqh/oGBBkT1ut8x8i/B544ByzydoGRV7BOa/A/Ti3fBbXyXX1xamMErMf+Yy6oExE/wFijxOkUdJZkz/MjEX7Xb8p1gUTSt6vC1ZRvmuu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/pjX3Qkb16c87yzsPjGjE7P3z9tepLmtlI9bvgsceA=;
 b=N/WO3wlMWilF+ZC6c2QcqBbKKJcGNAHZpATmUB4w12w0+wi0R90dpcNCvx+3+s4hXym5kC1kx57h7CsUEyJcv+e7WB+wnLasGSoxJM903HzGmB+jd1dh6bToB7I+MM2XrcqRGt556wPi1xylA0tWUeovjWvsqzAHcWCLQtfTQOHqA+H5SLVzjSsgPFjuI30deWlowgpaUZBhfWlHkTwOBSAXJL5NUidt2b2APZ3W9oN3iqZQKjzaVa/43CEB+yoLjHQTfkftdr0ezqaRFl8FwZZPS0UpD2iimRQnXOQY6R/WXEMCWnffErPZ1RLoceOVyyO/lXuFjZtJwcvRDk9Zag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 13:56:39 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 13:56:38 +0000
Date:   Tue, 29 Nov 2022 14:56:25 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     Robin Cowley <Robin.Cowley@thehutgroup.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: ICE driver bug using XDP_TX with multi FCQs
Message-ID: <Y4YPiZleA7GoNZea@boxer>
References: <LO4P265MB37586C972D240B09A515D6D7870F9@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
 <CAJ8uoz0OCtzKOcW0vm7YH9D4Vp3rzoi5S8nW5PtEfsmP0HcXdQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8uoz0OCtzKOcW0vm7YH9D4Vp3rzoi5S8nW5PtEfsmP0HcXdQ@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ffc7ee-60e2-487d-afbb-08dad2118949
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+d+Lr8zk7iMnNllazJScJngnT7vcfBFeGfCOu/POulCb4r8X5ba0OKd/9Y9MyGfq/7lOK2QzT4AVQlOhMc50B8POeuUs1aQN3tnROqY1eIqBhQ+5U4uoSbS5RLl/Cb7Uc8ha/JGQC8PQ7vq3+px86mKKRS5HBknajcSJfr5dx8TYc+z6qLJKs8jWbg13kdBJxQNabLpzAZyfJ8BSkCRjd9sKqgGWaI1hMchcHDnYLhOboyLXdHPzv0XzwW3Dib86B0utNVeoRgJ1jsj3rilqkqhy6VMPI1YdDpfsR0+AlAF7m/0adiJC93quBwFeMC5MEfRUPLwNvANWE1Yl7j3/8cKIBV3N/DqDLLu4cOkA2tsUMW8ykw2VE2UKhk5O9RaFwJba1XxEc2IKPvsGK7KKdXlgKXYjpxPAN6zGGbl+hgr3GBXML3OoCSCB6ejPPl5x6os1cpijxm0VN9B0Jz/XZVTAPgu8vYNhGtWT97nRdp275aFRNkPPHOIaV/F4VpF9eWzSCVS95FaIY8hB1a+nVrPtPJZA0T5UDGogcNIuIt/ipLME0t/nhXCMZExZfsG/bke8fvKLBf7e0VXPMbCSPfAeGY/gNqFKIGz6V6XqG3k4zsbLn3d/j2+AwkYFQBlPnIrWvOHOMDW+R+HuGClDECOELj0RckE9AlCMuNJPYOhsuR7JM28uUZzWZhaO73Mg2bUGQgrIYaH/5JU4U5l4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199015)(66899015)(186003)(66574015)(86362001)(6916009)(54906003)(45080400002)(316002)(966005)(6486002)(82960400001)(38100700002)(83380400001)(9686003)(6666004)(53546011)(6506007)(6512007)(26005)(33716001)(44832011)(8936002)(2906002)(478600001)(4326008)(41300700001)(5660300002)(66476007)(66556008)(66946007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDhzK1NNbGM0cHFZVDRZUXhWcWh6cnpiaXJaYmY2YSs0UTVRSCt1Mjg1cDg0?=
 =?utf-8?B?Q2VuUFZQTzVDZG45Wmx5Wk9adjVXQmFVdHhXTTJsa004S2FZYU1lK1FUaDU0?=
 =?utf-8?B?ZmhWTXN1WmFQdGlWcGFOKzFKM1VwdEJtMVpOd05RZTFnWTUrb3ppa0Vma0JK?=
 =?utf-8?B?eFRlQ3NTT0V5ejNwQ2tDOXI4dHI2ZTV2ZWZrNFQ4SnBOQ1pYTTFGUnIwdENN?=
 =?utf-8?B?NXV2NTJmQkVzL1Bob0dWS1hzTityS1hNRG4ra0ZOTWMxNUlwMXJVdjEra1dY?=
 =?utf-8?B?OGRiam03N2E1MjVpMUIvM3pTQUJPRlloeFU4dzFsVlR3NFBIWjhML0N5YWhE?=
 =?utf-8?B?Y3ExODF4anZjbi8rWHFWMldmc2JpTnd3aVFGWUp5QlZoRlNXWnd0SVVnUDFu?=
 =?utf-8?B?NWNUY2taV0tGZEJvQXN6M2pza0xEV0ZwS0NhdFRMWkQ1dVR1alFzc3ZBZS8r?=
 =?utf-8?B?MEkxb3pxVFBxTktZNngwalZ6Sy9Pc0hKYitCS3E5UTdnSE9VWlB6WDVTajJM?=
 =?utf-8?B?eThxWEZVa2RuTEc2UEZEVGF1bmtnZ3p4akU2dkEyeldMdEhDSFBNMkFBK3ZO?=
 =?utf-8?B?UzNJbk1GOWhFMTN5azJ0aDgwMUpVUTBlT2lDWkNrdjh5empRN3drRGFyckRT?=
 =?utf-8?B?dVliWEJsamhKdEFzd2RUakkwbEY4VThRN0JXUXFkdjR1Z000QTVOMit3VUtY?=
 =?utf-8?B?SVlQS2ZTTldEdTBZZEt2Rm1sUG51MUl0OEQyNUMzSjlITGNaQVJmRjhCY0k0?=
 =?utf-8?B?VndlWmY4aDlBK3BCU3BxdGw3S2h4Tmg0UThoeVE5Z1BVdmZ4Q3NvN2pLNDJh?=
 =?utf-8?B?WXU4VEVhTXpCTVUvUytOdUhXUXdQWXBrWit6R0VBQWRRNkNDcE5JcDNOZndi?=
 =?utf-8?B?YUgvMnpzV1BMSFgrV2JkN2k0UmNqbzI2SWFXTUJEbjRWVlFOUFNJeGZJTFhG?=
 =?utf-8?B?Y01RWWNBZjVGS0s0RUx0L1RJcE5VZUxYV09GUXJQYkI1Nmw3L1ZQSUJ3QXI2?=
 =?utf-8?B?cWFNQ0hFelhuSkp6b3FEZmJpQVFtYVZTejdIZmEvTWF1cVFkbGNtLzFNQVgw?=
 =?utf-8?B?RHc5WTYxdFpDV01STzk0VklyTU80WWRuT0lyeUlBaEZSZUxsUExjcnRYZllo?=
 =?utf-8?B?U0VFSWFPM0VpZkFISzM3RStpLzMrNDd0Rk90OHZxZjluaG1aQzRCK2swbktO?=
 =?utf-8?B?Wi9WU2JEZjNUaDNOS0dHUXVJbzBRQmNvUkNSWWExc3RNR1dIdEZ2dzNkK1VL?=
 =?utf-8?B?WE10ZFBDbEk4c1JmQXV3WEpFMTl6WmNPd0hMejNKZDFuMzQ5SmcwVFAvdVQv?=
 =?utf-8?B?NkhFOC9SNGNFclZyMXQ3N3RDS2ExZTJ1cFl3cThWS0pLS2k1a1B6elJzTVgv?=
 =?utf-8?B?M2FGZE5HRnZLR1oxVXBSNU1LMThDS1RUaEFIbHlRQWZQVVFXcm14MzBzQThr?=
 =?utf-8?B?NlRwOUxPbkpzbHQzU0hYMHFPQStLOXYrdDQvcmZRTjhBbzdxY2xpRUQ2Rmdq?=
 =?utf-8?B?NUVwVjJDZDJDS2VxaGpBVGNlRVVreXhOV1FWUE9OTTJ4N0lBYW9PZjVaUnZE?=
 =?utf-8?B?cm1JMXVJMVFFWklvVGJ5VnRXWWZaanJYQmN3eFhFcnNXbURVNkpoQjA2QXVw?=
 =?utf-8?B?cVE3TUsvcDNwTFVueW56elg3NzlYdFVTc3hNNlRVdFJBdE13R2NSQUptYU9C?=
 =?utf-8?B?RWlxbGpjT3hFa05iT2srZVV6cXNwNVJpcEdoY0FsTlNIaFhibU1tUUJMaENj?=
 =?utf-8?B?ejdHU1ZxMlkyM2k3RmxLdTdzaXMrV0U4ZVZ3UG5FZG82akxrSWlwdzNDQncw?=
 =?utf-8?B?TnRkV2pTY3JjcU5DM2RhWVBYbDdCY1ZPUHlnSXIxQjdLMEV0dFZGY2ROdXFm?=
 =?utf-8?B?QUs4RDNwNmk5bFpLT2lBdjBTNkl6Q09GcThvZTNaUFF2NkMxQjVjZGlVVjU4?=
 =?utf-8?B?OWh1cTFxOVM3Z202Y1Y4UGdYQVUxSGp2dWZZSnM0dEFmSWwrWmdINjIrS2dp?=
 =?utf-8?B?SmE1S1VjRGxWOHQwQVR3R1dDM3dkTDU2ZURrRExHbTRHWkI3K2ZkYStUYnd2?=
 =?utf-8?B?T1hDS1JMV2FDV3puTkNScmE4MkhZT1QvNllxT1YzT0EybUNsdHl5RUFuLzBv?=
 =?utf-8?B?T1V0S1h4MFNjdUE4Uko1MzhWRUlRU0hKWUdhNVFuUGNJdmQ5c3RrTExTU2Rn?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ffc7ee-60e2-487d-afbb-08dad2118949
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 13:56:38.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zgInKhWOw0+UvTUZQCFDiO/CdQrKqo4HLb8iwmKpC38LR2CucOV7LI53ZS2+XLa3FtiJD8+d9wi00YmOawiZkOEZuOxEB4qyBAzpLuXbwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Nov 25, 2022 at 09:16:17AM +0100, Magnus Karlsson wrote:
> On Thu, Nov 24, 2022 at 4:40 PM Robin Cowley
> <Robin.Cowley@thehutgroup.com> wrote:
> >
> > Hi there,
> >
> > We're looking at developing some software that uses XSK in zero copy mode, where we either redirect packets to userspace using AF_XDP, or transmit packets straight from the XDP kernel program using XDP_TX.
> >
> > Our program is the same one as described here:
> > https://lore.kernel.org/xdp-newbies/6205E10C-292E-4995-9D10-409649354226@outlook.com/
> >
> > Recently we've been testing some functionality that transmits packets directly from the data plane / XDP code using XDP_TX. This functionality works on a mellanox MT27710 ConnectX-4 Lx NIC using mlx5_core driver. However, using an Intel NIC with the ice driver, we have some problems. This was tested on the 5.15 kernel and on the newer 6.1 kernel and they both result in the same behaviour.
> >
> > Everything below was seen using the intel NIC with these configs:
> >
> > # ethtool -i ice0
> > driver: ice
> > version: 6.1.0-0.rc5.el8.elrepo.x86_64
> > firmware-version: 2.50 0x800077a8 1.2960.0
> > expansion-rom-version:
> > bus-info: 0000:03:00.0
> > supports-statistics: yes
> > supports-test: yes
> > supports-eeprom-access: yes
> > supports-register-dump: yes
> > supports-priv-flags: yes
> >
> > # lspci -s 03:00.0
> > 03:00.0 Ethernet controller: Intel Corporation Ethernet Controller E810-XXV for SFP (rev 02)
> >
> > # ethtool -g ice0
> > Ring parameters for ice0:
> > Pre-set maximums:
> > RX:         8160
> > RX Mini:    n/a
> > RX Jumbo:   n/a
> > TX:         8160
> > Current hardware settings:
> > RX:         4096
> > RX Mini:    n/a
> > RX Jumbo:   n/a
> > TX:         4096
> >
> > # ethtool -l ice0
> > Channel parameters for ice0:
> > Pre-set maximums:
> > RX:         16
> > TX:         16
> > Other:       1
> > Combined:   16
> > Current hardware settings:
> > RX:                0
> > TX:         0
> > Other:            1
> > Combined:   4
> >
> >
> > When redirecting traffic from the data plane into user-space via XSK, everything works as expected.
> >
> > When transmitting packets from the data plane directly out the NIC via XDP_TX, we can see our kernel logs getting hit through the systemd-journal process. It seems to be for every packet sent through XDP_TX, it's generating a kernel warning.
> >
> >
> > An example warning and call trace is:
> >
> > Incorrect XDP memory type (1785255936) usage
> > WARNING: CPU: 7 PID: 0 at net/core/xdp.c:403 __xdp_return+0x33/0x1f0
> >
> > ...
> >
> > Call Trace:
> > <IRQ>
> > ice_xmit_zc+0x251/0x310 [ice]
> > ice_napi_poll+0x54/0x640 [ice]
> > __napi_poll+0x2b/0x190
> > net_rx_action+0x2b2/0x310
> > __do_softirq+0xbe/0x2b6
> > irq_exit_rcu+0xad/0xd0
> > common_interrupt+0x82/0xa0
> > </IRQ>
> >
> >
> > The memory type value seen above changes each error, suggesting that the value is uninitialized or the pointer is corrupted.

Fix is a oneliner I believe, let's do it this way - I will send the patch
to this mailing list with a request to you to test it. If it fixes things
on your side, let us send it upstream with your reported by tag.

Sounds good?

> >
> > We have been able to recreate the issue using a program based on the xdpsock sample programs from the kernel tree to validate it’s not specific to our software.
> >
> >
> > We have been testing a simple BPF program that swaps the MAC addresses around and transmits the packet back out of the same NIC. This can be seen here: https://github.com/OpenSource-THG/xdpsock-sample/tree/test_zero_copy_tx on the test_zero_copy_tx branch, which has the very basic BPF program. The issue only occurs when testing the multi FCQ, it seems to work fine on a single FCQ. The issue also happens in copy mode and zero copy mode.
> >
> > The command used was:
> >
> > ./xdpsock_multi --extra-stats --l2fwd --zero-copy --interface ice0 --channels=2 --busy-poll
> >
> >
> > It is my belief that this is a supported scenario, but I’m seeking some guidance to validate my thoughts, and ultimately whether this is a legitimate bug.
> 
> Thank you so much for the detailed bug report Robin. We will try to
> reproduce it on our end, root cause it and get back to you.
> 
> > I hope this gives enough background and information for a reproducible issue. Any feedback is welcome and we look forward to hearing a response. :)
> > Robin Cowley
> > Software Engineer
> > The Hut Group<http://www.thehutgroup.com/>
> >
> > Tel:
> > Email: Robin.Cowley@thehutgroup.com<mailto:Robin.Cowley@thehutgroup.com>
> >
> > For the purposes of this email, the "company" means The Hut Group Limited, a company registered in England and Wales (company number 6539496) whose registered office is at Fifth Floor, Voyager House, Chicago Avenue, Manchester Airport, M90 3DQ and/or any of its respective subsidiaries.
> >
> > Confidentiality Notice
> > This e-mail is confidential and intended for the use of the named recipient only. If you are not the intended recipient please notify us by telephone immediately on +44(0)1606 811888 or return it to us by e-mail. Please then delete it from your system and note that any use, dissemination, forwarding, printing or copying is strictly prohibited. Any views or opinions are solely those of the author and do not necessarily represent those of the company.
> >
> > Encryptions and Viruses
> > Please note that this e-mail and any attachments have not been encrypted. They may therefore be liable to be compromised. Please also note that it is your responsibility to scan this e-mail and any attachments for viruses. We do not, to the extent permitted by law, accept any liability (whether in contract, negligence or otherwise) for any virus infection and/or external compromise of security and/or confidentiality in relation to transmissions sent by e-mail.
> >
> > Monitoring
> > Activity and use of the company's systems is monitored to secure its effective use and operation and for other lawful business purposes. Communications using these systems will also be monitored and may be recorded to secure effective use and operation and for other lawful business purposes.
> >
> > hgvyjuv
