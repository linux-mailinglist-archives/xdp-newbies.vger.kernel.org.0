Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7756DA70D
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 Apr 2023 03:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjDGBqa (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 6 Apr 2023 21:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjDGBq3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 6 Apr 2023 21:46:29 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2119.outbound.protection.outlook.com [40.107.243.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE76658B
        for <xdp-newbies@vger.kernel.org>; Thu,  6 Apr 2023 18:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ8vaaEjsxxYAmQIdP+YyvTzA8ok5P/pBeVAf5M5XHFUqjkFGyNULZoqDpzYuUUwly7+RWsnxIZe/6Fi8nNzTbYg+VFp5uY1NFSZt3RkDsKTQn5i9MfFC2+uCvLjZpx8WAKgime1ecNGQzJ5Ws2IbESJwUZHEROavI8FtfUlxcHiGb9dLI3uC08EWDQ+i0ssbLFEBaxPEzn6FGebiYNA6qSD4VlXlyTEYyykDjAxOuvLgJzfOGKAL9gUgsPhfrvzfemLwb+GmivkK8ITpas1GCkZHeiivbbhgu/C95kOMkVerGUa8rwh/fC9YtNPcWgelc3XSmdTWsWuYl6wQaZ5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NbUlklXXXTPxCscqG2xqLJypDA0YIIvse81SwSquv8=;
 b=Kq2lcd4yREB7mbsAqqBownLTkl9mG5j0kMjE9pWbyYXbwo2DiEqGjphH98tWKQZs/b5gCBdjhnI+LrntacjwUIU8dcM2fBKO1BY45P23vcqjedKxOEhmxgj+j8TYbWgAjoqEq4Z2+WkEGTOuhLYElP4z519iGmmfndOzyp6cWtDwAQ2YmB19AzkyOhFK/0BbjIQ6rZivmpC0/8Uw5/ZBCz/EGXrBSrO4Dit4hcdTNWkPLHSdw3EQpVdYw8Q0OzKalvkbwykw9tPMK3oQLGwvjg947keS+EXmuFYormpkggFhiijQ5XCbkfsIJV9NJuLpEwMhC4yj3OgQ0XQ7feMoOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs.rutgers.edu; dmarc=pass action=none
 header.from=cs.rutgers.edu; dkim=pass header.d=cs.rutgers.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.rutgers.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NbUlklXXXTPxCscqG2xqLJypDA0YIIvse81SwSquv8=;
 b=q+pudhKJi+HY6i3EUwfXr0dutKwxituU2lb+4AlRbimpKrJ47DNDLF86W6Nlblp4V86ZFQWF1/+zmWiC16j+/WfHX/qhx5nHPi4+xFQXlQ6xg158kUlCD91eujSTz8EU0oNUoevFT2IIUdNa/Mf25tAvYtgS9bar1lAhWKkQhlY=
Received: from CH2PR14MB3657.namprd14.prod.outlook.com (2603:10b6:610:6c::21)
 by SN7PR14MB6639.namprd14.prod.outlook.com (2603:10b6:806:358::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 01:46:24 +0000
Received: from CH2PR14MB3657.namprd14.prod.outlook.com
 ([fe80::2fe6:440c:3c5f:fa38]) by CH2PR14MB3657.namprd14.prod.outlook.com
 ([fe80::2fe6:440c:3c5f:fa38%5]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 01:46:24 +0000
From:   Qiongwen Xu <qx51@cs.rutgers.edu>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
CC:     Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>
Subject: Question about xdp: how to figure out the throughput is limited by
 pcie
Thread-Topic: Question about xdp: how to figure out the throughput is limited
 by pcie
Thread-Index: AQHZaO/Y4WxN41IpIEShYieCMn8sWg==
Date:   Fri, 7 Apr 2023 01:46:24 +0000
Message-ID: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs.rutgers.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR14MB3657:EE_|SN7PR14MB6639:EE_
x-ms-office365-filtering-correlation-id: 0c9111af-5497-44dc-a163-08db3709e563
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z4NVhMfYZzBT6xgIMuJ+gO0f3SABZa2oroHPbTX+zPLsaolBXrse7c9p2wsOzXZpxazwiUyGPz9ZOLZBjw56QgW1gLwwHap+1OBiXxPmwUwkkNMk90KDnqtIBiRMVHNvwwd+JElSXGFbe5RoAX07HfG4UyhA0FivS6DNVv1Ni+8xWPEMjZuRD5asK26b210ckJq94GYa6hMFaUH49srSrvVHHjEppjnFMfM1ZbFvo5JlRHqZQ9ZVKe5lXP5oHJlHkJQbmWpS/k/Dotb4jFXkId0BBVEEMS2RR5kRqktol4LntQ13LOyZr9e2jDzQlkl1V/0TqhYn7jELk7MgrxKy42YKXrvcmJzr9pMJWc+u0sU6wuvkf3PHxcTDz9ICrFMdQJEX4325A8JeMMuz81WE/ivX34J+/lmgXz0JT8nHpKYhVI7wImk3EyfOK9KIMe/66Dg48NC/k56HxfidnQMI9myrl/IBCj25wjqZDNBbhJ5bDWeGra8/lE4R+aFLQkZzgA6onFEgTUJ1fyd9pmWGWjECnennNukJSwpjK482jYXaJuWmzdivIGsOFsRah1RZ4VF0TJi3Zfi1v3fR25spBvxDPv6GGz9nnz7XJ0JHRW5xF84W2ME2yp/I+yjL3dd/HFm9LNe45b4pqrC2Ii/l7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR14MB3657.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199021)(122000001)(38070700005)(33656002)(41320700001)(75432002)(55016003)(38100700002)(71200400001)(86362001)(7696005)(52536014)(6506007)(9686003)(26005)(107886003)(2906002)(4326008)(66946007)(66446008)(6916009)(66556008)(41300700001)(8676002)(66476007)(786003)(64756008)(478600001)(5660300002)(4744005)(8936002)(91956017)(316002)(83380400001)(76116006)(186003)(88722005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MytRMmRxUVRtUkJ2YWJVSmFwVThiRGtFUTBVcWJVb3Y1ZFJycm0zYmIvM0sy?=
 =?utf-8?B?aEVBVUozNGpCTEUyY2xzckdIT29xd2EvK0JnNEZGQk1hWDRhK1JUQ0pSYThF?=
 =?utf-8?B?ajdsQm5IVDNiSkN5RGMzb1FTZGtxT3pYWXluVEY2QjBIVVFwOXFlVHZ3Ui9U?=
 =?utf-8?B?TkFxY3JucWJBZm5ITEx1ckVSR2Q3RXhyQ3Q3dklBblQ3RTErUWdMczlHQUE1?=
 =?utf-8?B?bVV6aGY0QlhYSU5pc3Z6NzRiTm5ZN3VyYU1sV2NBT3RBT3dpYWpJSHp4WnNS?=
 =?utf-8?B?Yy81SDRWNUk5Nk5OeXMvZDVHdTBIN09odGhIY3ZGM3JGcVJpMllFd1gzaDhh?=
 =?utf-8?B?NmZjSnQwWndpZ3BSL3J0RnpMRlUxZ0FDVmxjYjRodmtaUG9PVCtKU1haWWtm?=
 =?utf-8?B?NkxjeURJMVlXN0g0QnVxKy96eDBWeDRUTmFMOVBPWEIvZWtBVWRjWlFTUkVG?=
 =?utf-8?B?VVN0V2V2K2pYOTFHdTY5Y2F5ZTFZWVRKUjVuUktiWWxZazZnMC9yenBCQ3lr?=
 =?utf-8?B?eWFSc3hSMlJSamxYVm14NnRESi9UUXBXNUs2ZmJ0Ukp4ckRYc2N0b2wyV1Ur?=
 =?utf-8?B?cDJDeWFFd2V5dnhyT0ZsUE9jR3hwSGdQMWhReDFTL1l0MU8vckZpVW92aFl6?=
 =?utf-8?B?MnZBMlNPZllFMU1aWFYzRS80L29WZzIzM3hTK0VnVWFtaWZRcGk5WFY4bHp2?=
 =?utf-8?B?b0pXTjZWWmhSa28yYnpxNklSUzBIWldjZEVwRkNoLzJRaDREcXVCUlgzZmRk?=
 =?utf-8?B?SUlYaHFoQk1BOEJJbXc0Z2RzZllDOERVOU5LNzJjWGF2U1kwZThuaVRMZXdW?=
 =?utf-8?B?L2tFeEFNNE1EQUx3TitxODRzYmtYTEx3SWQ2NkZMd3BrTUZIY1B1dnM4S05G?=
 =?utf-8?B?MTVJalFaVkFSVys0eDZoaVlQN0s5Z211WEEwRGxLSlpickIzNzdhK3Z1WFRx?=
 =?utf-8?B?b2FNNVJTQnl2ZGNnN1RTVUFRU1pDT25KNXRxL3A2YmtZVG1wekFWWVpYVjNN?=
 =?utf-8?B?dzRoeTZEYWI4anhxdzViR1JuaWt0ZVBMTlhpNGJGVXpZTW4rRGN1dFUyc3Zx?=
 =?utf-8?B?WDRjY24xcDFMZVJSbHQ0dkRCcEFyWkJXd1JpVDJHTk5HWFJXRmRJZFNYY3VC?=
 =?utf-8?B?bFNqNjRIY3NpVlVzbVRpR1h2azdzNlBSWFROVWIvTEt2c0ZRZjRrb25EeFFR?=
 =?utf-8?B?T3ozcWVrTHhDd0sxWCt2VmIwZldjU0hWMm5OUkVMa1RiUkk3ZE5zdHpubllX?=
 =?utf-8?B?UXduWWFVZ042QUdDUG8waE5jQTV6TWcvMFNiaVlGWnBpY2RvTi9YMWoyT2NY?=
 =?utf-8?B?NDNlY3lFOUZqaUx4aHVJMUZvcXBIVkhGUEpWZmNkN1FHc1U0OFlDcExKN2Ri?=
 =?utf-8?B?cmV4UFhHRkxBUDN0OWorOGRMN3JsNGk2VHE2TUJjWXg0b3JIcmwvWHZ0RWtF?=
 =?utf-8?B?NTd4bmY2NW43UXhkcm1kZ1ZoSWl4VWgzbi9sdHJJL04vWllNUG41azQ3dnU3?=
 =?utf-8?B?VGM1SDliL3V0VHU4NC9Kc1QxbDJDaGVCNG44UklEWTBYWCtUcnp4L1NNbXpr?=
 =?utf-8?B?WmIrUE1zczh1UE02bklWdkZOUnhVR3IzNE0wbEhSUkdSeEpmcGhJMldjeHUx?=
 =?utf-8?B?TVh0Z1JhYTJWT2ZUaEV6ZGJjNjVVU2ZnNk42bVFFMTZOQ29EN2lMY0hxK0py?=
 =?utf-8?B?RUIySE54ZGt0N3d2aTlGQUJMdFEybTJ0WG53dzJIK09QWkJKSWVORTA1aU9p?=
 =?utf-8?B?VW1hRmJlWGV3d3ZIbEFTdkJYajEzclpmeXd2Qjc5b3ExYkZHclJnTHF4b3lF?=
 =?utf-8?B?N1hnWWVIaE9UL1l1ekR4aXppMEdlUCtyTy95RXNBMk5CY2VRblhwQk1zOXdr?=
 =?utf-8?B?K3dRb3lwOWxTdzBvTDBML0hGZmF0NFdKVmlzSENDM2pXdmVQVEVhaVk3RmdX?=
 =?utf-8?B?Tnp1bUFWdWsxMUVyNHlJdE5tMytPMyttTTE2anB4WVZJZUxIT0ZnYmcwdWVJ?=
 =?utf-8?B?d3lqM0Q2UkZUdlFVcmx2eUhNS0lDbWl2dXNCcThVdTFFVlc3cnIySXlyZ1Az?=
 =?utf-8?B?VDNyODRWb1R1SXNoczdIZW9RZUhJNHhXYld4dmF0ZC91UjVDdjc2d2xORmlq?=
 =?utf-8?Q?idzcKKBGD0ge00v38qEr3/aLJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13D9DFB9392C154E9B450A55D1FB3400@namprd14.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs.rutgers.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR14MB3657.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9111af-5497-44dc-a163-08db3709e563
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 01:46:24.5387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b92d2b23-4d35-4470-93ff-69aca6632ffe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZx9l4jtCZhS2W4YqysNP9fiq9DfBWbQdRTjtZ43ZGeYA7Nb15ManA6Xz7lzyQ8zNY4ENKP+we+mkvsoRwaX3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR14MB6639
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

RGVhciBYRFAgZXhwZXJ0cywNCg0KSG9wZSB0aGlzIGVtYWlsIGZpbmRzIHlvdSB3ZWxsIQ0KDQpJ
IGFtIGEgUGhEIHN0dWRlbnQgYXQgUnV0Z2Vycy4gUmVjZW50bHksIEkgaGF2ZSBiZWVuIHJlYWRp
bmcgdGhlIFhEUCBwYXBlciAiVGhlIGVYcHJlc3MgRGF0YSBQYXRoOiBGYXN0IFByb2dyYW1tYWJs
ZSBQYWNrZXQgUHJvY2Vzc2luZyBpbiB0aGUgT3BlcmF0aW5nIFN5c3RlbSBLZXJuZWwiLiBJbiBz
ZWN0aW9uIDQuMSBhbmQgNC4zLCB5b3UgbWVudGlvbiB0aGUgdGhyb3VnaHB1dHMgb2YgeGRwIHBy
b2dyYW1zIChwYWNrZXQgZHJvcCBhbmQgcGFja2V0IGZvcndhcmRpbmcpIGFyZSBsaW1pdGVkIGJ5
IHRoZSBQQ0llIChlLmcuLCAiQm90aCBzY2FsZSB0aGVpciBwZXJmb3JtYW5jZSBsaW5lYXJseSB1
bnRpbCB0aGV5IGFwcHJvYWNoIHRoZSBnbG9iYWwgcGVyZm9ybWFuY2UgbGltaXQgb2YgdGhlIFBD
SSBidXMiKS4gSSBhbSBjdXJpb3VzIGFib3V0IGhvdyB5b3UgZmlndXJlZCBvdXQgaXQgd2FzIHRo
ZSBQQ0llIGxpbWl0YXRpb24uIElzIHRoZXJlIGFueSB0b29sIG9yIG1ldGhvZCB0byBjaGVjayB0
aGlzPw0KDQpMb29raW5nIGZvcndhcmQgdG8geW91ciByZXBseSENCg0KVGhhbmtzLA0KUWlvbmd3
ZW4gWHUNCg0KDQo=
