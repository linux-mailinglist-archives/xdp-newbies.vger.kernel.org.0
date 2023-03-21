Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7FE6C38E4
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Mar 2023 19:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjCUSFx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Mar 2023 14:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjCUSFu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Mar 2023 14:05:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D099E3527B
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679421925; x=1710957925;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rAPayF+r25Bl/ewVpOqBXBQhEke2FF1GhO/zfPcgsCc=;
  b=AIV/8o0Ojfqh+Sq9L3odNllGT7CN/QjVD0ebOJp5OZNHpfuPb6NEiK0k
   Jf/AroKetNNhb6ZKpZveJGLBmJ6PedAJ7GqIVJEHK1da6OyDrdVSTKk3c
   wbVEtXqKUfeI6vBmm1tomBhJblOFz5yuGveoDF3Fcn3vV/18TDf4NMeO/
   zHX6upWFPMLOYAn7HYy1UXrk9OKw0d+Q6eEkGER1ie32z/WkxAOsHzXcs
   GqCzqCQ5A64J6vUkXmmU8MGNbPTlP3rM0ILN73Aj90ITUJEO19msGazJj
   N5Bv1YLc62fuOiQYd7DJvj4ISstHXydECdJQU6RPDwrjo1xFb10iNdo3k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322865334"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="322865334"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="711914458"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="711914458"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 11:04:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 11:04:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 11:04:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 11:04:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 11:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OStzRS12MZrfwM/n9D55cKh/DjWLDgFTAzLF0HDL1XBeQUybxHwwt3oMELWEt69YukmvkqY8S608qHalwc+BbG+ahGTYCt2TuPkWw++ybQFouwG2wJ6Y9imFdL2UpdFGWA25e6EjkMPbWuPdfTHFTVjSOUmWCAmATZIv3HeC/mMkS6GJd1GkBCmxGyjX+2FvXCGLe6CvVusJKRBqus2J1GZbS78ExUXI/3ahaxyTdCh/AEu96PVihUG1eOqlClvfUhfy0jUJuvqgKVDGbMYIR7gwjTWlabVuobCI2JOL3B9WhsMnJn11ZZrrlzSbklyr4wPc5+eDY8vmexCbkIEdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAPayF+r25Bl/ewVpOqBXBQhEke2FF1GhO/zfPcgsCc=;
 b=aYB+6+g+fyecTBGvek87OSclmrMqUkX35VQtdtB2UbPhhh67FY4SyNH0YUZTqHVV9judfoz7clqOuaEClSzdrgLDeWZ2hgs4g3FkT4WJ06dEEK9LRJFSblFqQ4zMr3xoZW8WYrxUe6AqDo3Zzp2I6yQ5RmIxBKCsTlDJyPCoSfqlmX4ipTMPQQV0eQbCjTPEsUQyEknQX+tGmFgxUNC0neNc6Dam1TmsBn37P5ujq8gCHKy2e4085AO+Cayw5Wn+AlcFtkaGbOMBo/j17PecXqD9OCNkAOUPj9B9KSKxdEHc6RFMMHEHUDJnQQ7b5nS8RYwCGDo8hS+92WtjbmqFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB3565.namprd11.prod.outlook.com (2603:10b6:208:ea::31)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 18:04:48 +0000
Received: from MN2PR11MB3565.namprd11.prod.outlook.com
 ([fe80::1669:ab51:9797:441c]) by MN2PR11MB3565.namprd11.prod.outlook.com
 ([fe80::1669:ab51:9797:441c%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 18:04:48 +0000
From:   "Fingerhut, John Andy" <john.andy.fingerhut@intel.com>
To:     Vincent Li <vincent.mc.li@gmail.com>,
        =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
CC:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Brouer, Jesper" <brouer@redhat.com>
Subject: RE: How to get system localtime/wall time from eBPF?
Thread-Topic: How to get system localtime/wall time from eBPF?
Thread-Index: AQHZW0KaQl4Xgen6ckOzjKLHGzqxTq8D6JoAgABOuYCAAUbigIAABImAgAADUgCAAAHbQA==
Date:   Tue, 21 Mar 2023 18:04:48 +0000
Message-ID: <MN2PR11MB35659617789FE604A629C976A6819@MN2PR11MB3565.namprd11.prod.outlook.com>
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
 <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com>
 <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
 <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com>
 <875yau80g4.fsf@toke.dk>
 <CAK3+h2xt-rmizCv54cuJvii+6Ui-PuQSi2es6FS65fmZ0ise6Q@mail.gmail.com>
In-Reply-To: <CAK3+h2xt-rmizCv54cuJvii+6Ui-PuQSi2es6FS65fmZ0ise6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB3565:EE_|CO1PR11MB5201:EE_
x-ms-office365-filtering-correlation-id: aee6f039-1544-42cc-7415-08db2a36c266
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 96k1kn7kdAyuDCFel0hVrkH2zjIgQZgMHLdUy2xZ3edn/i5FND1ddJKcEtpN5NA/SaEZ4GyMAB8y9yExVU3jNISqBU0jm2SvlaslSnsSPIznHSCriRka3ZN3EFGTwKUridYucjunzgJ6Peos998yAxanJvNWpIMoD1sPYl7cQgHIbA7UeHooypg1eFGO+cxhE/8IeKZcC+4NTzIcBj3RacAXwPtSlUq6mFaW7za4JAy4A48/IiQNJyW4timaQGertsb/NuLTIA5F7PT81rOwBXLU8Um6yRtthjhoIMgeCuYNpdwUn6IvpdUHjygqQnpoBLMaqVW/u+5iOydNUEW/KJ71UEVxmXsoU4oL7nxR/95x7d7SzMI641R8zdMzIphOqJB7jJN/dWYMhi7HBPteBHpm65EWjGXyfXkl54ZANl2fgkEK7jhK1Rh8ezivq2PXLi6WTBPWE6Qb7XnMebFxc3114SqAlDT8tqr0V0wxd94S5bcGR24mEhr7Wm/hYSH1V49TEaE+FGAQFwhF+WD+9mtn880TnmcLP88rCxex9FyU4oNx/nZghaoEHAFHgVCG+ULHHCUWhEcEhrYqPdYD8GbTMBvgG2EteVR/3E+tS8wjb5S0X8HqJQojuIT6H10hrXWYgNBSAwcicEsO2cE1u4i+rHW1VSnvbH36kWByZmtfrjwgMugl+vnRi7xQQdl9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3565.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199018)(86362001)(33656002)(4326008)(38070700005)(54906003)(41300700001)(66556008)(66476007)(316002)(8936002)(8676002)(52536014)(64756008)(478600001)(66946007)(66446008)(110136005)(76116006)(5660300002)(2906002)(71200400001)(38100700002)(83380400001)(55016003)(186003)(26005)(66574015)(6506007)(966005)(53546011)(122000001)(82960400001)(9686003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnhRb0YxTkZFTnlkdDArdDdrY2ErYW93cmwxWkFnMjRzMFp3T09GLzNzZ0Fx?=
 =?utf-8?B?Z05LYW8zK0ZqSWM2OWkybWsyaFVLS3doMWU0RjJOKzNVS0s0RXc1bXNwYk9w?=
 =?utf-8?B?SVExR3Y0V3YyVVhWakwxbzBpWk0zUlJjeTVxMmxiYnk3UFZQeklIN1ZmMUV5?=
 =?utf-8?B?OFY2Y25pUzNXRXR0cG50L3hjalhKdWlnQkJzMDRtQVlTekNzTmJiS1F3UDVQ?=
 =?utf-8?B?dVdlREVpU244TUpjcE93enR6UVF1TjUzcVdzNnljZVVqTC94R1VRWXZuNVJG?=
 =?utf-8?B?WDFuT0MxaVpmZmRJenJQSllPV0xkZGx4NUR3eHV3Wi9xam1Yblo0VTcyRVRv?=
 =?utf-8?B?b3hYOEIyZDRTYi8xT1FyemxHWmR6bFZLdDJKdmNWSHlKWjlYOHo5UCs2WldH?=
 =?utf-8?B?L3N2NzM0cHU4UXFWWlgzTXlyd2xBajZ3SkhiTTRXTDJ3ODNmdC9sM1ltWWpD?=
 =?utf-8?B?SkZleE00YlVWcUl6Sy9pZ05mdXFpa0dieGFFREZYS2VqVnhTR0U1U1B4RzlS?=
 =?utf-8?B?MzIzVCt4NjhnVnJKVkdIT25PZkZjYXBJTTkrNTg1SjFidFFFSklpUE9yQm9B?=
 =?utf-8?B?TzNrR2JRZitYZjJ6c2JyQVA0T3RPemk5b3pIc09RMndRUU42MFpadjZKc0pR?=
 =?utf-8?B?aTFWbTZZK3RYWWgveW5sN3FteEJsUWlTOXo3dHNZM05QeW1Wd0E4UEhpWnBD?=
 =?utf-8?B?U1RPbTY5RDlKVWRGdnpVNjRoZG1FQlpiYzBQRzBDZk0yeGV0M2FDZlZkRC8x?=
 =?utf-8?B?MzYzRnRPYy9sQ21reldIVjhsTHJCdUU3cjE5djRJRG5IQjc2NWdXUktpM0lx?=
 =?utf-8?B?V2hSV0ZoVkd3RUREMXIzQjZNZ2JGRis1dEEwMXpzalZIUE11UnFuZFJsd2FK?=
 =?utf-8?B?TWk1YnpaVHVrVGhUeHNPeG5QVnlvMEc1OVpHK0hIS3pieEVvT1pzRWRzM3Rq?=
 =?utf-8?B?SDFzU0dyc0wrVmxvdnBnbXRjQ3FrQzhxYTNGN1o5c3NWaXZSM3hHeForc3VY?=
 =?utf-8?B?b0tvK1dxU1RTWkN0bkN5VVJCdkhTVGhET0J0NmhJb0lXVWpNSDJmN1gwZ1pq?=
 =?utf-8?B?S244RHJubjk1TVFlNVUyZUIycmlLa3NBR040M1F3WjJ6WEo1YzUzSlRLVXo4?=
 =?utf-8?B?Z1lXZ0NUeFRDOXJsems2eUREdE03UmVacy8xdGgxU2Q2QTEyaWNpOWNPWGRK?=
 =?utf-8?B?cmczMkI0Y0NyNUtKdjJCNExlNnVQb0syblZnU285dmI5RmtEa0g0eE81NSsr?=
 =?utf-8?B?d1dHb0RpRXFUUXk0Ty90R1NUd2ExT0dLWUVDbzVtQVBXVHo2Q0ZSWXUrcnpS?=
 =?utf-8?B?eW1hSkNLeVNYNHZERDVHald2djk4UUVPRWY0Sm5OSktIbENMM29Rd01pQ3Nz?=
 =?utf-8?B?WFh5TlFIeWFyeHN5Z3YvV2xadURSZVJES0VjRmNlN2NJMkVxWlVUMC9jSFJP?=
 =?utf-8?B?K24yQXpETmJ0LytrcHM1SFZQQ0dDWWZvSVZ6MStkS3Y3SGNmVFZVT3g4eVV6?=
 =?utf-8?B?Wk1sMEJaT3ZUaWVTYkcwM3NYWERNcnhOSWZPOU9tMTRwYzhqanI4aDZUQ0NN?=
 =?utf-8?B?NTVWSDdVOFRyZU51Zk5wTzZYZjRTb21hNU90QWlYci9MMEtsdFZPaGNER0tT?=
 =?utf-8?B?T1N0b1JsT1FUdElOSFVFTDgrTVNpQkhDY0tNMjhySjBiL2NNcmtCUjNYaTlE?=
 =?utf-8?B?eW9mMUZ4VlJxa2lxU1JkSHg2S2FZTk9NMjVXakF6a1A0SVYxMDAyTzNoejB0?=
 =?utf-8?B?M1RhSXRhaUdkd0RWNVdabVdYN0RpNFExeHQ5RlNTcFk4UGR2a2dLUkszdG5D?=
 =?utf-8?B?bVpRejhpM3lPcEtUWUlyVGE1ei8xWkVTb0FubjZ2NVV3YkpsM1Z3ZFZzcDQw?=
 =?utf-8?B?eEZEMUhUT2tEV3c4WjEzbjFsRUcwTUlXSVp0dVFWVXBSci9lNTFIWWJzZTRJ?=
 =?utf-8?B?RVRGV2FWWVBZUnEzMDRBY0YwSDAwc00xZWpRQ1UvWTZrbThwdmJieWxPeGZO?=
 =?utf-8?B?d2JLTU1JRSsrQ3dUM0V5UzBzc0JPWEFHblFGU1hXekY2THd5TEQ4dDJJbml0?=
 =?utf-8?B?UnEwRE01dXNobjQ2MDYwWXI1ZTdwM2RxZE9VQk8xeEQvcUpBMEFuVWdDYURB?=
 =?utf-8?B?dnA4aXpJbFhRRENvMHh3N1luNHVQNmpsRXVwazlwbXBOaFQ4WkFqWk9hQngw?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3565.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee6f039-1544-42cc-7415-08db2a36c266
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 18:04:48.0839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0PrrNQM+4w83BvPydL2zJX8Hv/c9Kv4LsIBZ5zq5D+7iglGC9izWRqFNpqcHNz2CtrLfkQohdA1r0JsJyqwvfSq+DjVuwAKOwG166wZdS6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SSBtYXkgaGF2ZSBtaXN1bmRlcnN0b29kIHRoZSBnb2FsIG9mIGdldHRpbmcgdGhlIHRpbWUgaW4g
dGhlIHF1ZXN0aW9uZXIncyBwYXJ0aWN1bGFyIHVzZSBjYXNlLCBidXQgaWYgaXQgaXMgYSB0aW1l
LWJhc2VkIGRlY2lzaW9uIG9mIGFsbG93aW5nL2RlbnlpbmcgdHJhZmZpYyBmb3IgZmFpcmx5IGxv
bmcgYmxvY2tzIG9mIHRpbWUsIHlvdSBjb3VsZCBoYXZlIGEgdXNlci1zcGFjZSBwcm9ncmFtIHBv
cHVsYXRpbmcgYW4gZWJwZiB0YWJsZSB3aXRoIHRoZSBjdXJyZW50ICJhbGxvdy9kZW55IiBzZXR0
aW5nIGZvciBub3csIGFuZCBoYXZlIHRoZSB1c2VyIHNwYWNlIHByb2dyYW0gdXBkYXRlIHRoYXQg
d2hlbiBpdCBjaGFuZ2VzLg0KDQpQb3B1bGF0aW5nIHRoZSBkZWx0YSBiZXR3ZWVuIHRoZSB0aW1l
IHRoYXQgaXMgY3VycmVudGx5IHJlYWRhYmxlIGZyb20gdGhlIGVicGYgY29kZSwgdnMuIG9uZSB0
aGF0IGNhbm5vdCwgZnJvbSBhIHVzZXItc3BhY2UgcHJvZ3JhbSwgYXMgc3VnZ2VzdGVkIGJ5IGFu
b3RoZXIgcGVyc29uLCBpcyBhbm90aGVyIHdvcmthYmxlIGFwcHJvYWNoIHdpdGggbm8ga2VybmVs
IGVuaGFuY2VtZW50cyByZXF1aXJlZC4gIFVwZGF0ZSB0aGF0IGRlbHRhIGFzIG9mdGVuIGFzIHlv
dSB0aGluayB5b3UgbmVlZCB0bywgZS5nLiBldmVuIGRvaW5nIGl0IG9uY2UgcGVyIG1pbnV0ZSBp
cyBsb3cgQ1BVIG92ZXJoZWFkLg0KDQpBbmR5DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBWaW5jZW50IExpIDx2aW5jZW50Lm1jLmxpQGdtYWlsLmNvbT4gDQpTZW50OiBUdWVz
ZGF5LCBNYXJjaCAyMSwgMjAyMyAxOjU1IFBNDQpUbzogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu
IDx0b2tlQHJlZGhhdC5jb20+DQpDYzogSmVzcGVyIERhbmdhYXJkIEJyb3VlciA8amJyb3VlckBy
ZWRoYXQuY29tPjsgeGRwLW5ld2JpZXNAdmdlci5rZXJuZWwub3JnOyBCcm91ZXIsIEplc3BlciA8
YnJvdWVyQHJlZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogSG93IHRvIGdldCBzeXN0ZW0gbG9jYWx0
aW1lL3dhbGwgdGltZSBmcm9tIGVCUEY/DQoNCk9uIFR1ZSwgTWFyIDIxLCAyMDIzIGF0IDEwOjQz
4oCvQU0gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyb3RlOg0K
Pg0KPiBWaW5jZW50IExpIDx2aW5jZW50Lm1jLmxpQGdtYWlsLmNvbT4gd3JpdGVzOg0KPg0KPiA+
IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDI6NTfigK9QTSBWaW5jZW50IExpIDx2aW5jZW50Lm1j
LmxpQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0
IDEwOjE14oCvQU0gSmVzcGVyIERhbmdhYXJkIEJyb3VlciANCj4gPj4gPGpicm91ZXJAcmVkaGF0
LmNvbT4gd3JvdGU6DQo+ID4+ID4NCj4gPj4gPg0KPiA+PiA+IE9uIDIwLzAzLzIwMjMgMTYuMzMs
IFZpbmNlbnQgTGkgd3JvdGU6DQo+ID4+ID4gPg0KPiA+PiA+ID4gaWYgSSBoYXZlIGEgWERQIGJh
c2VkIGZpcmV3YWxsIHRvIGJsb2NrIGlwICBhY2Nlc3MgYmFzZWQgb24gDQo+ID4+ID4gPiBzeXN0
ZW0gbG9jYWx0aW1lL3dhbGwgdGltZSwgaXMgaXQgc3RpbGwgaW1wb3NzaWJsZSBsaWtlIHdoYXQg
DQo+ID4+ID4gPiBtZW50aW9uZWQgaGVyZSBodHRwczovL2dpdGh1Yi5jb20veGRwLXByb2plY3Qv
eGRwLXR1dG9yaWFsL2lzc3Vlcy8yMDQjaXNzdWVjb21tZW50LTgxOTQxOTgwMD8NCj4gPj4gPiA+
IElmIHNvLCBpcyB0aGVyZSBhbnkgd2F5IHRvIHdvcmthcm91bmQgdGhpcz8NCj4gPj4gPg0KPiA+
PiA+IFlvdSBjb3VsZCB1c2UgdGhlIEJQRi1oZWxwZXIgbmFtZWQ6IGJwZl9rdGltZV9nZXRfdGFp
X25zKCkNCj4gPj4gPg0KPiA+PiA+IFNlZSBtYW4gY2xvY2tfZ2V0dGltZSgyKS4gSXQgaXMgdGhl
IHNhbWUgYXMgQ0xPQ0tfVEFJLCB3aGljaCBpcw0KPiA+PiA+IChjdXJyZW50bHkpIG9mZnNldCB3
aXRoIDM3IHNlYyB0byBDTE9DS19SRUFMVElNRSB3aGljaCBpcyB3YWxsLWNsb2NrLg0KPiA+PiA+
DQo+ID4NCj4gPiBzb3JyeSBhIGZvbGxvdy11cCBxdWVzdGlvbiwgdGhlIGJwZl9rdGltZV9nZXRf
dGFpX25zIHdpbGwgcmV0dXJuIA0KPiA+IHRpbWUgYXMgbmFubyBzZWNvbmRzLCByaWdodD8NCj4g
PiBJIGRvIG5vdCBuZWVkIHRoZSBuYW5vc2Vjb25kcyBwcmVjaXNpb24sIEkgb25seSBuZWVkIEhI
Ok1NIGxpa2UgDQo+ID4gaG91cnMgYW5kIG1pbnV0ZXMgb2YgdGhlIGRheSwgZm9yIGV4YW1wbGUg
MTA6MzAgPSAxMCAqIDYwICsgMzAgaXMgDQo+ID4gZ29vZCBlbm91Z2gsICBhbnkgdHJpY2sgZ2V0
IHRoYXQgZnJvbSBicGZfa3RpbWVfZ2V0X3RhaV9ucygpDQo+DQo+IFBvcHVsYXRlIHRoZSB0aW1l
IGF0IGxhdGVzdCBtaWRuaWdodCBmcm9tIHVzZXJzcGFjZSB3aGVuIGluc3RhbGxpbmcgDQo+IHRo
ZSBwcm9ncmFtIGFuZCBjYWxjdWxhdGUgb2Zmc2V0cyBmcm9tIHRoYXQ/DQo+DQoNClllcywgSSBw
b3B1bGF0ZWQgdGhlIG1hcCB3aXRoIDEwICogNjAgKyAzMCBmcm9tIHVzZXIgc3BhY2UsIHRoZSBy
ZW1haW5pbmcgcXVlc3Rpb24gaXMgaG93IHRvIGdldCBtaW51dGVzIG9mIHRoZSBkYXkgZnJvbSBi
cGZfa3RpbWVfZ2V0X3RhaV9ucygpLCBJIGd1ZXNzIHRoYXQgaXMgd2hhdCB5b3UgbWVhbiB0byBj
YWxjdWxhdGUgdGhlIG9mZnNldHMgZnJvbSBrZXJuZWwgYnBmIGNvZGU/DQo=
