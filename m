Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86EA474096
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 11:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhLNKkK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 05:40:10 -0500
Received: from mga02.intel.com ([134.134.136.20]:6699 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231272AbhLNKkK (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 05:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639478409; x=1671014409;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ep4JOqrC8E164paC23L1rOSqtnBWqxwKiVDLlklB20I=;
  b=WJsRa+SxTUETGaBm1RbTnytHnABVoXQEPE6UldXEafAJt30baMuWYOy9
   Db8PfygUglRPe97Q+WHVKaOCkUNiAxiKp+XlJt+OeBGMrs0rXwKEjkis8
   EngE1fbJ+ay71Wo5XtS5gDQmQXtFpcsS91GizxgltuduKNfe3sIdT2wFn
   Dija/FVVrTXVPH4cfmyf3mr+uGVO8YwqfBgWUMJTv6GEkLiechhOhKv5S
   MAFcJIBR66fwmjFTT3KRBwteVu1bckRcYjWYL959j67pW6jmUdnNBpQa8
   PqhsIklRw4xu/MjcjUn74v7dEZW+PYUCUBSsI+Qb6fZpu+8TobpM1KirN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226229263"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="226229263"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 02:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="518181394"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2021 02:40:09 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 02:40:09 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 02:40:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 02:40:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 02:40:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG7tBfGxJ7puq4iGMZFhkCt+L3WAKBPrU3GcxI3SxCaAAPcm0bhTMxNidFiWmOFKBaz+ogsc8AHL36DiTFbpa5qxfy8/jWVnkB/+KwySqvHEZG01RtldkLdy36aOwZa0k3LDK7kvs5OctLh/VQ24piSxqJ6C0J11L9CXpA65lT5vey2hDeIDLCKvhr2ca7LCSEP/nnr7goPa7l84n2d36BOgPLBBoEAyxlH93jFHaUpsjsLNTuwhYs5ksNEWuWCgxqkfEKM3KEKUrZyAYbrNOGxFSAAUT+/9phG9QUcdPJPfyaEHOyg25c8OXGD47cTTRX7GqeEZOINAMIFb8++UwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep4JOqrC8E164paC23L1rOSqtnBWqxwKiVDLlklB20I=;
 b=fzj/Jqjfj3qsK7BoytnAcu9C7zDWdfXjvCrd0bHaFVRrZP+WdpB03lv8MnIX1mx+BrYGG/A1uFsr7HuIxymaTu0M1jKDIMdRVE9D9GJH44Ve8sm6fiZt8gJg+D/D3PvdILDHtCR7YYkmWSgEXRiMy7Y847yKfU+8YLh3ajl/1fDz7Sw0F+/qglzD7c+IfkeCpCnLO8HDzDFEg/P/v0lL6LD2cJ9DWTdZyRFh2I4XQwKeopn1xEk4hZSsLLKITEW/VjGl6BjourwesLq6X7slGUWm0fhsWGtf6vd1M+tMmSMlA3b4gUWelRyB8Rh9FVb2M2638cYawN/cc7E3sU3lNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep4JOqrC8E164paC23L1rOSqtnBWqxwKiVDLlklB20I=;
 b=ShZDgyjn17AGn5vZI7q9c+uqv9i+hU70Xx+XTRbdNUQsuHrkVysiFewgkJ5X1JJgB50TLfhs8UC/RffxviEWtJ8qPr/+CD/3RGzPJ6jz3NimFJMNlvNKAFQQe99dlUrSS1sxAhFomYxKRVdaj+NUOk+hnBYFmsVp9KXiiEj26nI=
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by MWHPR11MB1904.namprd11.prod.outlook.com (2603:10b6:300:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 10:40:05 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 10:40:05 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        "Desouza, Ederson" <ederson.desouza@intel.com>
CC:     "Brouer, Jesper" <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Subject: RE: AF_XDP not transmitting frames immediately
Thread-Topic: AF_XDP not transmitting frames immediately
Thread-Index: AQHX8GUHNSZY1C3+jUCqvu6qhHX+16wxn+nQgAArCQCAAABlIA==
Date:   Tue, 14 Dec 2021 10:40:05 +0000
Message-ID: <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
In-Reply-To: <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjI2NDYzOTYtMTQ1ZS00ZTk3LTk1NDAtNDc3NmVkN2FlNmExIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVnhWVkxDMmZuV3oxemVSdkJpU1BQbHBwRnhYTlFpdG1BdDJyUEpIOE1sUm1tbEhhbEVcL09ySktVTkd3dDRtYk8ifQ==
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-ctpclassification: CTP_NT
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe8d1aa9-718a-4771-5164-08d9beee1747
x-ms-traffictypediagnostic: MWHPR11MB1904:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB19047C45090446C60A16BCD3F7759@MWHPR11MB1904.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5J5DxikEcAZAh7Vv93wPN7gQhEbbdItVGZaqc8wlkgS+NxCwcRARvulhB7bEl2E1QMYERWN7YcbJKWyfTzRMmmBCtlM+rRec/NmDedzG+Sa9zKdwozvD28DtaMQ2JIKwt2AYNZFdtuXoINVwBIzJf496tSWUxI2yc/t2ILGRT/Ywj81kFx0i9/TkcSAOU04V5bq9tZCYfrnxi4qDsqtUElS/LyjNy2awKrnK8ATYdUw+SIRhexBm/ZSOzX+115k/dWdm0JjRt6j5inDEnWvguWuQUMasNIBynUKKXKK/jkoFUYYfJ9j2g4rv6lwkwWfzOgu31C2c7oG2EHABQumtJ8tuXLp8mAR3U+o+3WA3uLUaDDgE87SUm9vZo0Xsg1vvhcOGNYZ6PRJhblxKspnGyRHSrxdNPL2RMkbCG/zVx8NDr3PJVvMTz1MLA57elRcI2EnuJ6SpaZF7pZM8sPyOxAqmY7t9dosGDUBQmyZkx7IjH/Ww0Inu+UAvI6RyFmLxnHS0qtd/n4lzh0aBolssPdJ2qhweJB6eRmD6flJb5CRsFNE5Szw+dS8iamUppfnw8rWUfZQgcp8Na9FzgQO9cQTQA+ris7BSiKDFRSjB02L/k9zDzIVTh/9OONgQv0/A/rlVuk5wcA0OkSZkbPK/iViVJvYmarCDxUJj1ztEL4p+7GpWA3LlDo26DwfpvfzlvRGdxwVxC2mXZV85TnpclPwb54H2r2r9xNUZf+VfdHXhfbw3kXCUfI+Zw01Sw51VB3B44zq4PqLuEb5ktNVDkUR6R6oRpW0Xxyv1dW8c5R1nSuJmmk9iYy5Z1ZPcHxqs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(8936002)(8676002)(110136005)(54906003)(6636002)(86362001)(9686003)(66446008)(64756008)(76116006)(66946007)(66476007)(66556008)(6506007)(4326008)(316002)(7696005)(53546011)(66574015)(71200400001)(38070700005)(82960400001)(186003)(26005)(33656002)(83380400001)(107886003)(38100700002)(52536014)(122000001)(966005)(508600001)(2906002)(55016003)(14773001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTFGVnBYcmlhdWExMk5yampFVGtCSEZLRldRNGN6M0ZYcWN0N1B6eHdsSmNF?=
 =?utf-8?B?UmJRKzhPV09kbktzY295R2JzWWNoTDJrMTNjK0VDZFZoVkd6NzhKcGJiSmhv?=
 =?utf-8?B?VmdCdXZQVlp3VkpiTnRkT3V0bm9LVnp4ekNwWWRxQVByclZlN2UzQnVmd0s0?=
 =?utf-8?B?ckFmTTZiWmQxVXJ5NnRBc2NHN1hCN0ZsVlpFdUp6OVpoaGVOZUNYVTM1aVll?=
 =?utf-8?B?RWRmQWJHY09sWXhqUXdVbk9JcjFNcDhGM2wzV1BQWDNrWnBHTzRyRkVZRjZX?=
 =?utf-8?B?SXR3YTB3dlhnVUVnNk95WWpLMTdMTU9qbXRoOTc4d2svVzF1YnMyS1ViT0Vp?=
 =?utf-8?B?MVI2LzN3QkdVNlBrSXVWRnRnZEE5dndpZXNySkMwbTgzcnd5VmRDeWswTXdN?=
 =?utf-8?B?Ylc0NHNSTlFYUkpvOFNsTGZXUmFkalZNc0ViZEE0Vjd1dFpuQW9pNy9PSVVO?=
 =?utf-8?B?RUZLU0l3OHQ2NWdCbkMxT21ob01IdTAwWXJwWEFmZ1hTTldCN084OUxsdWox?=
 =?utf-8?B?MGJTS1Q5VlNWL294cndRTmhRZzkzRHYwS0hSdzJiMUpmSHB2UE91c0dnYnF1?=
 =?utf-8?B?VzY5TldXeXJpSFJ0K3hkT2JMVGE0RDBnUmhFdWZhcGJMYWliamZIV21SZEZX?=
 =?utf-8?B?R09vczJ6SDZ5N0hxL3RqMnprZWsxNlZLQjRONENnSW1sUGs3eHB1Mkp4Rkln?=
 =?utf-8?B?Z1JqQlZiMjV3OUZGb0tBeU1LQUJQdFVObGlaWUVFdUJhN0YxdXJZQWxyM2hC?=
 =?utf-8?B?SzROMW5LWmNsclNZMGszMjhUZ0dFdVlGL3ZLSnZoekpXT1p4U3RIamtzMk9J?=
 =?utf-8?B?YzFKZ1JQQUZrdndiMUM2S2dha0dJSlYwSGR3QURlVlh0czZ3aldBUWNqZ2VT?=
 =?utf-8?B?UGIrRXRDcm1Jd3JQVGl6UjBSM3NPMW5pTmN4QnJJQ0JRenYzUWRIZi90WFhX?=
 =?utf-8?B?WGk2cFNUN3hIZUZ0V3ZSU0hYS24zandiTDFuYWZiN1d1SnRlZFhjeUh5Uno1?=
 =?utf-8?B?T1dVNFZHbkpCNy9leUNOK0hNUnphV2ZrMGRJZG9HMHcrUGlUdDFZcW9BYTc1?=
 =?utf-8?B?czJOT25XemZhRzR6NUdobWI1M09Ka0ZzT0ZpOWtPR3ZsU0pLM2N3ZUVnOW9P?=
 =?utf-8?B?OUdobW1rbXZtb0h1b25lc3hraWFYejlqeGRFM1NFK3h1anFkM2xmTmNqRTlk?=
 =?utf-8?B?ZnBHQUJVSmxORUptMmZMSUNENlR6TWRGaEZqYTNXbTJhc1JXcUhsR2JnWkww?=
 =?utf-8?B?YktRZ1drUmJwcktHN0g5OEJKcGdzT21lb2djT3BiUGtCZytLdXBuVUF1Wnhj?=
 =?utf-8?B?eEhKNFhla2Qwa1RkaGh3Z1ZZbjUyeFhlbXFaV1dGNFVZZ3dMbnFuMS9OTzRB?=
 =?utf-8?B?Q2xZek1mNmhHbElVSTFydHA3SHcxK0pYQXJXcHJiUk1EdDk1bzRXTGJVbk91?=
 =?utf-8?B?aXh1MUlwV0U1VFRmOGxyMjFWOEtiQ2gweW82alQrYi93L0lBQ3pkQlNJcnho?=
 =?utf-8?B?QmUzaS8zOWlxS0w0MTBYam5RdG00M3ZMMzdMeldnT1RJeGFWRWV2STIzL2Q2?=
 =?utf-8?B?L2VndW5YOUxoS0hvSURkd0lWNlVMaEo3ZTZmanQ1UlNpOFpVOENDQXdDcHh4?=
 =?utf-8?B?c25vVXZJU0J3dFVPcGNBelJ0MW5Gc3ArWmdGNEZ6RXk1WStsQlB4MGRVYTRa?=
 =?utf-8?B?aGZxTUN6T1Z0SVFlTWowTGtkV2dETTdGSWNHeUY1Zk9teUFMaFpJOCtWYUdR?=
 =?utf-8?B?Ny9nTFA2K2t1RVUrUzlndUs4STdFYTVLeFhEWTZObDJmMkpzemtaeWpFL2wx?=
 =?utf-8?B?WkYrWmRESXB1WFJlVnVkMzlWWWgzV1F0b2dPekRMSEVuUzRoU24ydFl4ay9Z?=
 =?utf-8?B?SFBWRWdPWVBDanVEZnFSSlBZbmlyUFIvNVhWQWhtcThFaDU5OHNVc2hROXJH?=
 =?utf-8?B?MEpWRE16NWtCckt3ZFE3bnpKb1lqVjhoR0J6VjVtdnB2eFpIb0JVaFA4SW11?=
 =?utf-8?B?OEMrd0RzV2g1c3JOc3ZQa0lWVGtjYWtZOGY4M01UdnZYT3VIMFFVSXdqbHdF?=
 =?utf-8?B?UEZ3aUQ4U1ZudnNXeUFqRHhyTFdsOFZTeE92TmlwYU5pOU9UV0JXc3JrbUhC?=
 =?utf-8?B?MHd3TmRQTXZkdWpEa1owcmNxUTVma21SbjJGYUExaTQ5RWQza3p4WktsZGU0?=
 =?utf-8?B?WE1hWmFTVmNuU1pEazRFb2txbnc1aG5Dd3hwVVZtQWVCMWxCSXp1cVdOWUxN?=
 =?utf-8?B?Nk8zYkVNSE1ad28yWnQ3UDNURmlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8d1aa9-718a-4771-5164-08d9beee1747
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 10:40:05.0793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdbeRHIqEFZSJimaw5lfKltc3px7A1JTZidJ4P12C/oj1TsFH1w7nD3E8sDGGugdLaNUcCt5uTp0UnmM2AF3jzj/RfbUBJzbInnHWJe3t3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1904
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

QWRkaW5nIEVkZXJzb24gYW5kIE1hY2llai4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxqYnJvdWVyQHJlZGhhdC5jb20+DQo+
IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDE0LCAyMDIxIDExOjMyIEFNDQo+IFRvOiBLYXJsc3Nv
biwgTWFnbnVzIDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPjsgQmrDtnJuIFTDtnBlbA0KPiA8
Ympvcm5Aa2VybmVsLm9yZz4NCj4gQ2M6IEJyb3VlciwgSmVzcGVyIDxicm91ZXJAcmVkaGF0LmNv
bT47IFhkcCA8eGRwLQ0KPiBuZXdiaWVzQHZnZXIua2VybmVsLm9yZz47IE9uZywgQm9vbiBMZW9u
ZyA8Ym9vbi5sZW9uZy5vbmdAaW50ZWwuY29tPjsNCj4gSm9hbyBQZWRybyBCYXJyb3MgU2lsdmEg
PGpvcGJzQHZlc3Rhcy5jb20+OyBEaW9nbyBBbGV4YW5kcmUgRGEgU2lsdmEgTGltYQ0KPiA8ZGlv
bGlAdmVzdGFzLmNvbT4NCj4gU3ViamVjdDogUmU6IEFGX1hEUCBub3QgdHJhbnNtaXR0aW5nIGZy
YW1lcyBpbW1lZGlhdGVseQ0KPiANCj4gDQo+IA0KPiBPbiAxNC8xMi8yMDIxIDA5LjA3LCBLYXJs
c3NvbiwgTWFnbnVzIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0gRnJvbTogSmVzcGVyIERhbmdhYXJkIEJyb3Vlcg0KPiA+PiA8amJyb3VlckByZWRoYXQu
Y29tPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDEzLCAyMDIxIDEwOjA0IFBNIFRvOg0KPiA+PiBL
YXJsc3NvbiwgTWFnbnVzIDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPjsgQmrDtnJuIFTDtnBl
bA0KPiA+PiA8Ympvcm5Aa2VybmVsLm9yZz4gQ2M6IEJyb3VlciwgSmVzcGVyIDxicm91ZXJAcmVk
aGF0LmNvbT47IFhkcA0KPiA+PiA8eGRwLSBuZXdiaWVzQHZnZXIua2VybmVsLm9yZz47IE9uZywg
Qm9vbiBMZW9uZw0KPiA+PiA8Ym9vbi5sZW9uZy5vbmdAaW50ZWwuY29tPjsgSm9hbyBQZWRybyBC
YXJyb3MgU2lsdmENCj4gPj4gPGpvcGJzQHZlc3Rhcy5jb20+OyBEaW9nbyBBbGV4YW5kcmUgRGEg
U2lsdmEgTGltYSA8ZGlvbGlAdmVzdGFzLmNvbT4NCj4gPj4gU3ViamVjdDogQUZfWERQIG5vdCB0
cmFuc21pdHRpbmcgZnJhbWVzIGltbWVkaWF0ZWx5DQo+ID4+DQo+ID4+IEhpIE1hZ251cyBhbmQg
QmrDuHJuLA0KPiA+Pg0KPiA+PiBJJ20gY29kaW5nIG9uIGFuIEFGX1hEUCBwcm9ncmFtWzFdIHRo
YXQgbmVlZCB0byBzZW5kIChhIGJ1bGsgb2YNCj4gPj4gcGFja2V0cykgaW4gYSBzaG9ydCB0aW1l
LXdpbmRvdyAocmVsYXRlZCB0byBUaW1lLVRyaWdnZXJlZCBFdGhlcm5ldCkuDQo+ID4+DQo+ID4+
IE15IG9ic2VydmF0aW9ucyBhcmUgdGhhdCBBRl9YRFAgZG9lc24ndCBzZW5kIHRoZSBmcmFtZXMg
aW1tZWRpYXRlbHkuDQo+ID4+IEFuZCB5ZXMsIEkgZG8gY2FsbCBzZW5kdG8oKSB0byB0cmlnZ2Vy
IGEgVFgga2ljay4gSW4gemVyby1jb3B5IG1vZGUNCj4gPj4gdGhpcyBpcyBwYXJ0aWN1bGFyIGJh
ZC4gIE15IHByb2dyYW0gd2FudCB0byBzZW5kIDQgcGFja2V0cyBpbiBhDQo+ID4+IGJ1cnN0LCBi
dXQgSSdtIG9ic2VydmluZyA4IHBhY2tldHMgZ3JvdXBlZCB0b2dldGhlciBvbiB0aGUgcmVjZWl2
aW5nDQo+ID4+IGhvc3QuDQo+ID4+DQo+ID4+IElzIHRoZSBhIGtub3duIHByb3BlcnR5IG9mIEFG
X1hEUD8NCj4gPg0KPiA+IE5vcGUhIEl0IGlzIHN1cHBvc2VkIHRvIGJlIGFibGUgdG8gc2VuZCBv
bmUgcGFja2V0IGF0IGEgdGltZSwgdGhvdWdoIEkNCj4gPiBoYXZlIHNldmVyYWwgdGltZXMgc2Vl
biBidWdzIGluIHRoZSBkcml2ZXJzIHdoZXJlIHRoZSBiYXRjaGluZw0KPiA+IGJlaGF2aW9yIHNo
aW5lcyB0aHJvdWdoIGxpa2UgdGhpcywgYW5kIG9uY2UgYSBidWcgaW4gdGhlIGNvcmUgY29kZS4N
Cj4gPiBUaGVyZSBpcyBldmVuIGEgdGVzdCB0aGVzZSBkYXlzIGZvciBqdXN0IHNlbmRpbmcgYSBz
aW5nbGUgcGFja2V0LA0KPiANCj4gV2hlcmUgaXMgdGhhdCB0ZXN0IGluIHRoZSBrZXJuZWwgdHJl
ZT8NCg0KSW4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3hkcHhjZWl2ZXIuYy4gSXQgaXMg
dGhlIFJVTl9UT19DT01QTEVUSU9OX1NJTkdMRV9QS1QgdGVzdC4gQnV0IHRoZSBmcmFtZXdvcmsg
b25seSBvcGVyYXRlcyBvbiB2ZXRoIGN1cnJlbnRseS4NCg0KPiA+IHNpbmNlIHdlIGhhdmUgaGFk
IGlzc3VlcyB3aXRoIHRoaXMgaW4gdGhlIHBhc3QuIFRoYXQgdGVzdCBkb2VzIHBhc3MgaW4NCj4g
PiBicGYtbmV4dCwgYnV0IGl0IGlzIG9ubHkgcnVuIHdpdGggdGhlIHZldGggZHJpdmVyIHRoYXQg
ZG9lcyBub3QNCj4gPiBzdXBwb3J0IHplcm8tY29weSBzbyBjb3VsZCBzdGlsbCBiZSBhbiBpc3N1
ZS4gV2hhdCBkcml2ZXIgYXJlIHlvdQ0KPiA+IHVzaW5nIGluIHplcm8tY29weSBtb2RlIGFuZCB3
aGF0IGtlcm5lbCB2ZXJzaW9uIGFyZSB5b3Ugb24/DQo+IA0KPiBEcml2ZXI6IGlnYyB3aXRoIElu
dGVsIGNoaXAgaTIyNQ0KDQpIYXZlIG5ldmVyIHRyaWVkIHRoaXMgb25lIHBlcnNvbmFsbHkuIERv
IG5vdCBrbm93IGlmIEkgaGF2ZSBvbmUgaW4gdGhlIGxhYiBidXQgbGV0IG1lIGNoZWNrLg0KDQpF
ZGVyc29uLCBkbyB5b3UgaGF2ZSBhbnkgZXhwZXJpZW5jZSB3aXRoIHRoaXMgY2FyZCBhbmQgaWYg
c28sIGhhdmUgeW91IHNlZW4gc29tZXRoaW5nIHNpbWlsYXI/DQoNCj4gS2VybmVsIHZlcnNpb246
IDUuMTUuMC1uZXQtbmV4dCsgIzYxOCBTTVAgUFJFRU1QVA0KPiAgIC0gRGV2ZWwgYnJhbmNoIGF0
IGNvbW1pdCA2ZDNiMWIwNjk5NDYgKHY1LjE1LTEyODAyLWc2ZDNiMWIwNjk5NDYpDQo+IA0KPiA+
PiBIb3cgY2FuIEkgZ2V0IEFGX1hEUCB0byAiZmx1c2giIFRYIHBhY2tldHMgd2hlbiBjYWxsaW5n
IHNlbmR0bygpPw0KPiA+PiBTaG91bGQgd2UgYWRkIGFub3RoZXIgZmxhZyB0aGFuIHRoZSBjdXJy
ZW50IE1TR19ET05UV0FJVD8NCj4gPg0KPiA+IEluIHplcm8tY29weSBtb2RlIHdpdGggc29mdGly
cSBkcml2ZXIgcHJvY2Vzc2luZyAobm90IGJ1c3kgcG9sbCksIGENCj4gPiBzZW5kdG8gd2lsbCBq
dXN0IHRyaWdnZXIgdGhlIHhza193YWtldXAgbmRvIHRoYXQgc2NoZWR1bGVzIG5hcGkgdW5sZXNz
DQo+ID4gaXQgaXMgYWxyZWFkeSBleGVjdXRpbmcuIEl0IGlzIHVwIHRvIHRoZSBkcml2ZXIgdG8g
dGhlbiBnZXQgcGFja2V0cw0KPiA+IGZyb20gdGhlIFR4IHJpbmcgYW5kIHB1dCB0aGVtIG9uIHRo
ZSBIVyBhbmQgbWFrZSBzdXJlIHRoZXkgYXJlIHNlbnQuDQo+ID4gQmFycmluZyBhbnkgSFcgcXVp
cmtzLCBzZW5kaW5nIG9uZSBwYWNrZXRzIHNob3VsZCBiZSBwZXJmZWN0bHkgZmluZS4NCj4gDQo+
IEkgd2lsbCBpbnZlc3RpZ2F0ZSBkcml2ZXIgbGV2ZWwgaXNzdWVzLg0KPiANCj4gSSBoYXZlIG90
aGVyICgxMDBHKSBOSUNzIGluIG15IHRlc3RsYWIsIGJ1dCBJJ20gdXNpbmcgdGhlc2UgMUcgTklD
cyBiZWNhdXNlDQo+IHRoZXkgc3VwcG9ydCBoYXJkd2FyZSB0aW1lc3RhbXBpbmcsIHdoaWNoIGFs
bG93cyBtZSB0byBpbnZlc3RpZ2F0ZSB0aGVzZQ0KPiB0aW1pbmcgaXNzdWVzLg0KPiBJJ2xsIGZp
bmQgYSB3YXkgdG8gc2VlIG9mIG90aGVyIGRyaXZlcnMgYmVoYXZlIGRpZmZlcmVudGx5Lg0KDQpX
b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgY2hlY2sgaWYgdGhlIHByb2JsZW0gYWxzbyBleGlz
dHMgb24gZS5nLiBpY2UuIA0KDQo+ID4+IEhpbnQsIEknbSB1c2luZyB0Y3BkdW1wIGhhcmR3YXJl
IHRpbWVzdGFtcGluZyBvbiByZWNlaXZpbmcgaGlzdCB2aWENCj4gPj4gY21kbGluZToNCj4gPj4N
Cj4gPj4gdGNwZHVtcCAtdnYgLXMwIC1uaSBldGgxIC1qIGFkYXB0ZXJfdW5zeW5jZWQNCj4gPj4g
LS10aW1lLXN0YW1wLXByZWNpc2lvbj1uYW5vIC13IGFmX3hkcF90eF9jeWNsaWMuZHVtcDQyDQo+
ID4+DQo+ID4+IE5vdGljZVsxXSBvbiBzcGVjaWZpYyBicmFuY2g6IFsxXQ0KPiA+PiBodHRwczov
L2dpdGh1Yi5jb20veGRwLXByb2plY3QvYnBmLQ0KPiBleGFtcGxlcy90cmVlL3Zlc3RhczAzX0FG
X1hEUF9leGFtDQo+ID4+IHBsZS9BRl9YRFAtaW50ZXJhY3Rpb24NCj4gPg0KPiANCj4gVGhhbmtz
IGZvciB5b3VyIGZlZWRiYWNrLA0KPiAtLUplc3Blcg0KDQo=
