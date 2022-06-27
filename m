Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D608555C9DD
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Jun 2022 14:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbiF0NXh (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Jun 2022 09:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbiF0NXg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jun 2022 09:23:36 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF0362F3
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jun 2022 06:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656336215; x=1687872215;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FXC3aZiWD7DtcVRmY4TYEXKIs8gxqWSJMGqk+HgdOFI=;
  b=f/kCMoq4U72oaxvqeNwUnsRG/ONFUlpDXTHbowwhmv+CcfzsO8lmAZJp
   zRvKiUgfPTpCXpJbieiCn7qPIiSvrGVAmEhfi2Vuv6a2fISGNTYz8I/nV
   rC7u9BMKFTsBR7CZ+Tc54NMPqzvlX23aekBAfwSz+YLTl9Rfx9PWmdOAj
   Fgv0JF3e8Nus6+NrWIFcGRM0NFhPVPlvpP/Oygm8wC++IdQ8XQ8rFTt2X
   Z8QsvwYRK+Mikyjf9BgXTiQ7BrU+4/Hy58qxk7o+TvGbGFTqHHuu+5y7H
   QaZR9L/8/FvxFMiA5aQtS9k/yglMgf1ytX81mSbWu2lNMLC74ZU97Fbyf
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="261253115"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="261253115"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 06:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="646426551"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2022 06:23:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 06:23:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 06:23:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 06:23:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK2PZrad+fyTmQc1RtAhVmW0mHtM75qITBTbayYycBYzzk51PsPQ0w59iygdgNEXu36GM0FssUnasvDxw1c4uo0ixg4lpJA6b+Q7ypce0sv0YgD7uhQHa6kgh+DwASb9BJzP+8lPNodA3th/estL0PLiIN7clo967ejrFrHBdrBzQZNnz5Mo3G/ZvPltsdrdpNZWTEMwDmQKHRgf3pkZocowIQbnxOTYl5s+OPXLinc1J5kmROuZnYfwLfbIrQhZIAwTlA+xj/bn9FTDrQP42kBY2NJzxMM+soe1pOte7Osmtyu4/WJO0r+VXqyUvUwCHer+s/aJjzbpQMDUnnS9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXC3aZiWD7DtcVRmY4TYEXKIs8gxqWSJMGqk+HgdOFI=;
 b=B++unWyqO0qIGN3qfYnkrD14gjakc7DeBOpYd4ZdjdNU3lo9s7xphj+rkJJON88Rp47BFZZhiWkmVm9hA+ty3C9T/IQsQcLEX4JZGITPHpEYWW5wx3nJQ0ckeo8XPSgC+recR6oghnOb6N1pdxY6D3WPJuXBwaqNvl0DvScnA86e3j2ni/ySGV+50jYVxKHUVU12sMR7Dt1NX7AR5j6WOqcv3g1oObFoqr+N4VmSOU3NqGyMuPuy9O6/t0/KEwAH0IauieafUvheMf3EOz2AwIv1diiBimtj0o5iM9CFQiqJTLJ1gqSATVCazf5FLGAY4f0eNprqbIIJr30xSjF+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by MN2PR11MB4175.namprd11.prod.outlook.com (2603:10b6:208:153::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 13:23:31 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::3ccd:c1dd:c9ca:6bf0]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::3ccd:c1dd:c9ca:6bf0%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:23:31 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Kal Cutter Conley <kal.conley@dectris.com>,
        "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
CC:     "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "eric@sage.org" <eric@sage.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: RE: XDP multi-buffer and AF_XDP
Thread-Topic: XDP multi-buffer and AF_XDP
Thread-Index: AQHYRb0fn/IWROZgkEG00H7CPEzuhKzbCRKAgAAAaQCAAApeAIAGHJeAgHqpgwCAB6WYAIAAGQgAgAArwPA=
Date:   Mon, 27 Jun 2022 13:23:31 +0000
Message-ID: <MW3PR11MB46027B4C9C79DFB6C0DE0564F7B99@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk> <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
 <YkcDgmldUGWoFWmQ@sage-macbook-pro.local> <Ykwj+ycjc+F70iko@boxer>
 <CAHApi-nTBXLUB+3jt27A2Qiewfam_YjfFXZs0mKu2qarPXAguQ@mail.gmail.com>
 <CY4PR1101MB2360C2F07AEC4EAB9043A64B90B99@CY4PR1101MB2360.namprd11.prod.outlook.com>
 <CAHApi-nafBSiNMLX6c_=+ago_CY2oKnz_k4dB4Tkzxu3HSuE_Q@mail.gmail.com>
In-Reply-To: <CAHApi-nafBSiNMLX6c_=+ago_CY2oKnz_k4dB4Tkzxu3HSuE_Q@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b20c285c-6ace-4e1d-0253-08da58403ab3
x-ms-traffictypediagnostic: MN2PR11MB4175:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mXoI3nv1kZ9tAeWcSgDnUMyHl3EIaDJhEXkUrdx0YiQpy5oILEAIgG9TSPWdWiew+JQB5CT+aZxuBdAH9VRWa2ajUYqEz9RUvq+x/WpoOUqTZpyh5PvtPXeT/epTpcMhtAEPwjfOM4FsoibA0clq5giahpwgy4jwkTocTzL9oRpB88dXOWF+WimKp57//AVtcHhsXZExWhMiBb/IUmZSxX675jimUnO7mYTYAyhZIZFZr6aCFGZcdjWmVQbXI62AKuXQ8tWWJRBaow7NrQvT98EYrDFMKik/3icdRaJggBzGByqIaLrDptgdk8wAxEpeKB8p6GdZTM8FJjLVeiEfifGUbr1WHzFhC/Uvi7KWsiNTWYta4bCTLzy/Nu5Ewihv5H/nAYu4fP09Wg8qV48aLaTUsZaHrVeLGjDoIY0GLPhQBfzp0h4ydsW/rNP9+0UoJyp58mVM7mKZQDEvzKLIU7mwasd5Fl5QylIGwxl4xP6Hixbs4qOKRjZ5SL0fnWMd3Xf4pn7zkk46auyClzUWKoAtS8oSSAexrMYgEJf018ln0Oq7CZC/K6KwhfyPtyfPXEw8Ge/61NgunjHP8YOYRYSBrSDQlm7t2gl1nhGeexgcajItrdFS2s9GkFPGBOgTJvY6+pkNV9lpzfQzmrX0GOdYBqWvAXofdtcj3tjQtH/M50tuQo63O0JO5iPmQITijMw81Xm+zSQ7NF/C8LqZjZ5tHlmNKuweBbYChhcTq53lWy65743A8frTTY6ELo+q1ifVz8YanInNjw7NtwF9ceAB+6U6FnWBbFwgfTMkmyrHVx2cZInr5D45J8vnnEm6ilnOYKjXhs6rWP0NbaqjfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(39860400002)(396003)(376002)(478600001)(966005)(52536014)(8936002)(122000001)(82960400001)(83380400001)(55016003)(2906002)(53546011)(6506007)(7696005)(33656002)(6636002)(110136005)(316002)(54906003)(5660300002)(71200400001)(66574015)(4326008)(66446008)(64756008)(38100700002)(41300700001)(66556008)(186003)(26005)(86362001)(38070700005)(9686003)(8676002)(66946007)(76116006)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWg2Z0hPL0IwY1AxR21VQlEzRXhQZUdhUFNTaENrZHFuMUdwV3h2WmlDYW1n?=
 =?utf-8?B?VkZxQ3BzdEpLU0dUS3pvMVNRRVFCUnd5dm1xWlhIOXNMQUkzY1pMUHo3R2V4?=
 =?utf-8?B?MEc1MkRGMTYzVk55Y3FYRjREZUFGZi96REY4SDU3bzIzS0dTVjRYZnBFbVFn?=
 =?utf-8?B?RW1WeUtkMVpweGo1UU5HTVYzb1dzVXVpa2kwSWtWY0NaVUpmSTZnbWNjdGZl?=
 =?utf-8?B?WlZUYTdSRjREWEJaankwV2w2Uk1ZSDVacTduMksvZktuUGIvREhmMFByc2I2?=
 =?utf-8?B?dmRJVDc3dkFjSzQ2NmNXVktzYVlkSDZ1T011UFp6ZTdjTS92eDA4ZThNSDFx?=
 =?utf-8?B?V2ppd05KWms0L0trVlV6aDhjOXhpUjRnWHZuWVM1RDJpdkJuUytTUXloeGpy?=
 =?utf-8?B?eEhNbUtIam9UYjlCdEVwb0Z3VngwM0JYZ1l4eXhaaGNOQnNud2wrL0tKU1Jr?=
 =?utf-8?B?K2dPa2ZmNDlHdFBtQnBrSkdjUVZLMDJ2cGhQaWFmUFJrK0ZrZWJDc0VPZVox?=
 =?utf-8?B?NzBUbzhtZDhLWUpQOTlGbWpiZWpSRjhJNmtNekY3TWNyd1hzRnZXNDBHWDFj?=
 =?utf-8?B?R0NQM3ZFN01haTNyWXVVQVRNaEdxRlVROERjNzNoa0ZHaWpRRklCdURRY05l?=
 =?utf-8?B?WCs2VTc3bXNRQ05wME9oWXZ6RFd4TzJGZkw1NGZGKzI4YzJqVWpQZDdvQnY4?=
 =?utf-8?B?N09mQ1VjbmZhNzEwZzY5ZHYzZWxxMFd6VFJsTW1INFo0TE9ubk9NWlRQYUkv?=
 =?utf-8?B?Rm9yblIyajZlUEgyb0RRd1RQbVdQUGY4ckxicEViQUJ3aEtUb2IyTFBOTkVZ?=
 =?utf-8?B?NlpUeW5PTVRoNmNtSlY1NVdDQjNLUE9KQVBFaDQzdkNWS0VGMmtlTzlPNTJt?=
 =?utf-8?B?dzFCS0VzbzRJZE9KVWVnajBDSVpsU3NCYXltcVB1bmp4MHhKRm51QjVGYXlC?=
 =?utf-8?B?blJJMTJXeVZJRnk2ejI5MFVTWVZPdE5lVTdKeW9Zc1pOQ2srTTkyTXE2bU90?=
 =?utf-8?B?VWJhZkpiREVrUG0wVENRRmxQYUluTE9KRDNlNjJGL2I1azIrWlVVdXVKVkRM?=
 =?utf-8?B?aEVmVlUwbU5jK2RVMWhHMXlKc1hBcUhqRW9sK29sTzMrUmVvZXRhZkliY2M3?=
 =?utf-8?B?a0lQSVYwcFFWZXFuNU85RmZpVXQ2UW9YZmI5ZUhPK1VSbjd5TXQ5M2NiekVH?=
 =?utf-8?B?UWJMQW5Xd25Mckt4OTdFUFdBMm5aUEZ0UkhGRDNBZ1k2NUdOU0s0c1FJM2RF?=
 =?utf-8?B?ZEliTlVhTSt3c1I4aTRsR2RuVXUwQzJTKytxVjJtd2I3TkZVNE13K2Y5MlZI?=
 =?utf-8?B?NXhYTFdQZ3ZFbU1Ham9oL0dnOVFFeUI2QUxtNmlrTEl0ZjNqUzQ0OFJwRjdt?=
 =?utf-8?B?VHloNUFHMCtuTUY3b1VwQ3B2S0VRR3pzZndrQ2R6dGg1K3VkRW1nUXpTbUNB?=
 =?utf-8?B?M2RVdkRWQmNaeXVPUld1MTlvckRKZ2lZNlc2b2w5UzVLZDlZZUM3R2lvMkVJ?=
 =?utf-8?B?d1NTVlJVVjJoMkZkdFJndm5rQmhkbjhFY0hCOVRDZHZyNWlUVGpUODU4VVBB?=
 =?utf-8?B?WnNjVUVwbzVGVldnYWw5TU5jcHNLOWVVNU9hUkR2VFk0Zm5KRGEvSlBXeVlH?=
 =?utf-8?B?dlNmd0VHK01DdzZGSUtzVkVYOGFoUUV4d3VITXhwRk10Z3RwMVh1YXBmcWox?=
 =?utf-8?B?QUtUd0piV090TWNTTHByeEF6c1lFdXlIUzlpUDdGUERqQkoxSGNDOEdBOVYx?=
 =?utf-8?B?aU5YZzBXL0JnSVdmbmorakc3cmlGS3lua0prVXN2MFZxbzVVNForbnY2TmU3?=
 =?utf-8?B?RGN5NXNBY0Z5Z1A3VUJSS1pkc1JPMEQwZ2IwSjUrZXFvZUI4dFM5NEErZEVw?=
 =?utf-8?B?YVB3aUNJWW5BckllRlNYWjMvV1NWczIxS3QwV0ZTRXpyUmxzUGpFZ3BBVzZO?=
 =?utf-8?B?K29mUVpwNmNSb2k5bk9pd1k0VFpLRjllNkxpVjhjeVVPZUo5bzZEcjRKMThu?=
 =?utf-8?B?UVFzVVdWcFNDaytINzl0L3doMmw4WXJOdWk0enJMYzVUN2MzM01yaWw4dXJJ?=
 =?utf-8?B?eFFsY0dRUk1uemt0Z1E4ZU5JZzR0cFVIU3ZMQm0rajRUQit5c0lnb2dzYVB0?=
 =?utf-8?Q?pbw9uXo2mfcOJpLLxwc+4PyFa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20c285c-6ace-4e1d-0253-08da58403ab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 13:23:31.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vu7Ry/j6lvVDW9pf1egL8BXn80bIqpJoKpFWgxw8stZv33EN++dX0L/0HlILjiXLg5ZZDrOxDZn3FWXgwvP5k0bA2WHe/tMJ6G7vxvrlmRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4175
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FsIEN1dHRlciBDb25s
ZXkgPGthbC5jb25sZXlAZGVjdHJpcy5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyNywgMjAy
MiAxMjozOCBQTQ0KPiBUbzogU2Fya2FyLCBUaXJ0aGVuZHUgPHRpcnRoZW5kdS5zYXJrYXJAaW50
ZWwuY29tPg0KPiBDYzogRmlqYWxrb3dza2ksIE1hY2llaiA8bWFjaWVqLmZpamFsa293c2tpQGlu
dGVsLmNvbT47IEthcmxzc29uLCBNYWdudXMNCj4gPG1hZ251cy5rYXJsc3NvbkBpbnRlbC5jb20+
OyBlcmljQHNhZ2Uub3JnOyBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyDQo+IDxqYnJvdWVyQHJlZGhh
dC5jb20+OyBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT47IFhkcA0K
PiA8eGRwLW5ld2JpZXNAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogWERQIG11bHRp
LWJ1ZmZlciBhbmQgQUZfWERQDQo+IA0KPiBIaSBUaXJ0aGEsDQo+IFdlIGFyZSBtYWlubHkgd29y
a2luZyB3aXRoIG1seDUgTklDcyAoYWx0aG91Z2ggSSBhbHNvIGhhdmUgYSBpNDBlIE5JQyB0byB0
ZXN0DQo+IHdpdGgpLiBEbyB5b3VyIEFGX1hEUCBwYXRjaGVzIHdvcmsgd2l0aCB6ZXJvLWNvcHk/
DQoNClRpcnRoYSdzIHBhdGNoZXMgd2VyZSBmb3IgdGhlIHJlZ3VsYXIgZHJpdmVyLCB0aG91Z2gg
SSBrbm93IHRoYXQgaGUgYXQgc29tZSBwb2ludCB0b29rIGEgc3RhYiBhdCB0aGUgemVyby1jb3B5
IGRyaXZlciwgYnV0IHRoYXQgaGFzIGxpa2VseSByb3R0ZWQgc2luY2UgaXQgd2FzIGEgbG9uZyB0
aW1lIGFnby4gRm9yIHVwc3RyZWFtaW5nLCBJIHN1Z2dlc3Qgd2Ugc3RhcnQgd2l0aCB0aGUgQUZf
WERQIGNvcmUgc3VwcG9ydCB0aGF0IFRpcnRoYSBoYXMuIE1heWJlIHdlIGNhbiB0cnkgaXQgb3V0
IHdpdGggdGhlIG12bmV0YSBzdXBwb3J0PyBBbmQgdGhlbiBhZnRlciB0aGF0IHBlb3BsZSBjb3Vs
ZCBhZGQgc3VwcG9ydCB0byB2YXJpb3VzIGRyaXZlcnMgZm9yIHRoaXMsIGJvdGggcmVndWxhciBh
bmQgemVyby1jb3B5IHZlcnNpb25zLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KV2Ugd291bGQgaW4g
dGhhdCBjYXNlIG5lZWQgc29tZXRoaW5nIGxpa2UgdGhpczoNCg0KKiBCYXNlIEFGX1hEUCBtYiBz
dXBwb3J0IGZyb20gVGlydGhhDQoqIFNlbGZ0ZXN0cyBmb3IgdGhpcw0KKiBBcyB0aGUgY3VycmVu
dCBzZWxmdGVzdHMgYXJlIGJhc2VkIG9uIHZldGgsIG1heWJlIHdlIHNob3VsZCBhZGQgbXVsdGkt
YnVmZmVyIHRvIHZldGguIE9yIHdlIGp1c3Qgd2FpdCBmb3IgTWFjaWVqJ3MgcGF0Y2hlcyBvbiB0
aGUgbGlzdCBbMV0gdG8gZ2V0IGFjY2VwdGVkLiBXaXRoIHRob3NlIHdlIGNhbiB0ZXN0IGFueSBk
cml2ZXIgd2l0aCBsb29wYmFjayBzdXBwb3J0LiBCdXQgZG9lcyBtdm5ldGEgc3VwcG9ydCBsb29w
YmFjaz8gSWYgbm90IGl0IGlzIHZldGgsIG9yIGFkZCBtdWx0aS1idWZmZXIgc3VwcG9ydCB0byBz
b21lIG90aGVyIE5JQyBkcml2ZXIuDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYv
MjAyMjA2MTYxODA2MDkuOTA1MDE1LTEtbWFjaWVqLmZpamFsa293c2tpQGludGVsLmNvbS8NCg0K
L01hZ251cw0KDQo+IEthbA0KPiANCj4gDQo+IE9uIE1vbiwgSnVuIDI3LCAyMDIyIGF0IDExOjEy
IEFNIFNhcmthciwgVGlydGhlbmR1DQo+IDx0aXJ0aGVuZHUuc2Fya2FyQGludGVsLmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiBIaSBLYWwsDQo+ID4NCj4gPiBJIGhhdmUgYmVlbiB3b3JraW5nIG9uIGlt
cGxlbWVudGluZyB0aGUgWERQIG11bHRpLWJ1ZmZlciBmb3IgaTQwZSBidXQgZ290DQo+IHN0dWNr
IHdpdGggcGVyZm9ybWFuY2UgaXNzdWVzLiBJIGFsc28gaGF2ZSB0aGUgQUZfWERQIHBhdGNoZXMg
YW5kIG1heSBiZQ0KPiB3ZSBjYW4gZm9jdXMgb24gdGhlbSBpbnN0ZWFkLiBXaGF0IE5JQyBhcmUg
eW91IHdvcmtpbmcgb24/DQo+ID4NCj4gPiArIE1hZ251cw0KPiA+DQo+ID4gUmVnYXJkcywNCj4g
PiBUaXJ0aGENCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZy
b206IEthbCBDdXR0ZXIgQ29ubGV5IDxrYWwuY29ubGV5QGRlY3RyaXMuY29tPg0KPiA+ID4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDIyLCAyMDIyIDU6NTIgUE0NCj4gPiA+IFRvOiBGaWphbGtvd3Nr
aSwgTWFjaWVqIDxtYWNpZWouZmlqYWxrb3dza2lAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IGVyaWNA
c2FnZS5vcmc7IEplc3BlciBEYW5nYWFyZCBCcm91ZXIgPGpicm91ZXJAcmVkaGF0LmNvbT47IFRv
a2UNCj4gPiA+IEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT47IFhkcCA8eGRw
LQ0KPiA+ID4gbmV3Ymllc0B2Z2VyLmtlcm5lbC5vcmc+OyBTYXJrYXIsIFRpcnRoZW5kdQ0KPiA+
ID4gPHRpcnRoZW5kdS5zYXJrYXJAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFhEUCBt
dWx0aS1idWZmZXIgYW5kIEFGX1hEUA0KPiA+ID4NCj4gPiA+IEhpIEFsbCwNCj4gPiA+IERvZXMg
YW55b25lIGtub3cgaWYgYW55IHByb2dyZXNzIGhhcyBiZWVuIG1hZGUgd2l0aCByZXNwZWN0IHRv
DQo+ID4gPiBtdWx0aS0gYnVmZmVyIHN1cHBvcnQgd2l0aCBBRl9YRFA/IEkgd291bGQgYWxzbyBs
aWtlIHRvIGhlbHAuDQo+ID4gPg0KPiA+ID4gS2FsDQo+ID4gPg0KPiA+ID4gT24gVHVlLCBBcHIg
NSwgMjAyMiBhdCAxOjEyIFBNIE1hY2llaiBGaWphbGtvd3NraQ0KPiA+ID4gPG1hY2llai5maWph
bGtvd3NraUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBGcmksIEFwciAw
MSwgMjAyMiBhdCAwOTo1MjowMkFNIC0wNDAwLCBlcmljQHNhZ2Uub3JnIHdyb3RlOg0KPiA+ID4g
PiA+IE9uIEZyaSwgQXByIDAxLCAyMDIyIGF0IDAxOjI2OjEyUE0gKzAwMDAsIEthcmxzc29uLCBN
YWdudXMgd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiA+ID4gRnJvbTogSmVzcGVyIERhbmdh
YXJkIEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPg0KPiA+ID4gPiA+ID4gPiBTZW50OiBGcmlk
YXksIEFwcmlsIDEsIDIwMjIgMzoxMyBQTQ0KPiA+ID4gPiA+ID4gPiBUbzogVG9rZSBIw7hpbGFu
ZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+OyBLYWwgQ3V0dGVyDQo+ID4gPiA+ID4gPiA+
IENvbmxleSA8a2FsLmNvbmxleUBkZWN0cmlzLmNvbT47IFhkcA0KPiA+ID4gPiA+ID4gPiA8eGRw
LW5ld2JpZXNAdmdlci5rZXJuZWwub3JnPg0KPiA+ID4gPiA+ID4gPiBDYzogQnJvdWVyLCBKZXNw
ZXIgPGJyb3VlckByZWRoYXQuY29tPjsgTG9yZW56byBCaWFuY29uaQ0KPiA+ID4gPiA+ID4gPiA8
bG9yZW56by5iaWFuY29uaUByZWRoYXQuY29tPjsgS2FybHNzb24sIE1hZ251cw0KPiA+ID4gPiA+
ID4gPiA8bWFnbnVzLmthcmxzc29uQGludGVsLmNvbT47IGVyaWMuZGF2aWQuc2FnZUBnbWFpbC5j
b20NCj4gPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFhEUCBtdWx0aS1idWZmZXIgYW5kIEFGX1hE
UA0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBPbiAwMS8wNC8y
MDIyIDEzLjM5LCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+
ID4gS2FsIEN1dHRlciBDb25sZXkgPGthbC5jb25sZXlAZGVjdHJpcy5jb20+IHdyaXRlczoNCj4g
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+Pj4NCj4gPiA+ID4gPiA+ID4gPj4+IEhpLA0K
PiA+ID4gPiA+ID4gPiA+Pj4gV2UgYXJlIHZlcnkgaW50ZXJlc3RlZCBpbiByZWNlaXZpbmcganVt
Ym8gZnJhbWVzICg+IDgwMDANCj4gPiA+ID4gPiA+ID4gPj4+IGJ5dGVzKSBvdmVyIEFGX1hEUC4g
RG9lcyBYRFAgbXVsdGktYnVmZmVyIHN1cHBvcnQNCj4gPiA+IFhEUF9SRURJUkVDVCB3aXRoIEFG
X1hEUD8NCj4gPiA+ID4gPiA+ID4gV2hhdA0KPiA+ID4gPiA+ID4gPiA+Pj4gYWJvdXQgaW4gemVy
by1jb3B5IG1vZGU/DQo+ID4gPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4gPiA+Pj4gQ2hlZXJz
LA0KPiA+ID4gPiA+ID4gPiA+Pj4gS2FsDQo+ID4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+
ID4+IExvb2tpbmcgaW50byB0aGlzIG1vcmUgSSBmb3VuZCB0aGlzIGNvbW1lbnQgaW4gdGhlIG1s
eDUgZHJpdmVyOg0KPiA+ID4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4gPiA+PiAvKiBEb24ndCBl
bmFibGUgbXVsdGkgYnVmZmVyIG9uIFhEUF9SRURJUkVDVCBTUSwgYXMgaXQncw0KPiA+ID4gPiA+
ID4gPiA+PiBub3QgeWV0DQo+ID4gPiA+ID4gPiA+ID4+ICogc3VwcG9ydGVkIGJ5IHVwc3RyZWFt
LCBhbmQgdGhlcmUgaXMgbm8gZGVmaW5lZCB0cmlnZ2VyDQo+ID4gPiA+ID4gPiA+ID4+IHRvIGFs
bG93DQo+ID4gPiA+ID4gPiA+ID4+ICogdHJhbnNtaXR0aW5nIHJlZGlyZWN0ZWQgbXVsdGktYnVm
ZmVyIGZyYW1lcy4NCj4gPiA+ID4gPiA+ID4gPj4gKi8NCj4gPiA+ID4gPiA+ID4gPj4NCj4gPiA+
ID4gPiA+ID4gPj4gU28gYXQgbGVhc3QgbWx4NSBkb2VzIG5vdCB5ZXQgc3VwcG9ydCBYRFAgbXVs
dGktYnVmZmVyDQo+ID4gPiA+ID4gPiA+ID4+IHdpdGggWERQX1JFRElSRUNULiBXaGF0ICJ1cHN0
cmVhbSIgc3VwcG9ydCBpcyByZXF1aXJlZCB0bw0KPiA+ID4gPiA+ID4gPiA+PiBnZXQNCj4gPiA+
ID4gPiA+ID4gWERQX1JFRElSRUNUDQo+ID4gPiA+ID4gPiA+ID4+IHRvIHdvcmsgd2l0aCBYU0tz
Pw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gV2VsbCwgdGhlIGluaXRpYWwgcGF0
Y2ggc2V0IGZvciBtdWx0aWJ1ZiBleHBsaWNpdGx5DQo+ID4gPiA+ID4gPiA+ID4gYmxvY2tlZCBY
RFBfUkVESVJFQ1QgYmV0d2VlbiBpbnRlcmZhY2VzLCB3aGljaCBpcyB3aGF0DQo+ID4gPiA+ID4g
PiA+ID4gdGhhdCBjb21tZW50IGlzIHJlZmVycmluZyB0byAodGhlIFRYIHNpZGUpLg0KPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gRm9yIEFGX1hEUCB3ZSdkIGFsc28gbmVlZCB0byBk
ZWZpbmUgdGhlIFVBUEksIGFuZCBtYXliZQ0KPiA+ID4gPiA+ID4gPiA+IGFkZCBhIHNvY2tldCBm
bGFnIHNvIHRoZSB1c2Vyc3BhY2UgcHJvZ3JhbSBjYW4gc2lnbmFsIHRvDQo+ID4gPiA+ID4gPiA+
ID4gdGhlIGtlcm5lbCB0aGF0IGl0IHVuZGVyc3RhbmRzIGl0PyBOb3Qgc3VyZSBhYm91dCB0aGUg
ZGV0YWlscy4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFlvdSdyZSBkZWZpbml0
ZWx5IG5vdCB0aGUgb25seSBwZXJzb24gd2hvIHdhbnRzIHRoaXMsDQo+ID4gPiA+ID4gPiA+ID4g
dGhvdWdoOyBhZGRpbmcgaW4gc29tZSBwZW9wbGUgd2hvIG1heSBoYXZlIGEgYmV0dGVyIGlkZWEN
Cj4gPiA+ID4gPiA+ID4gPiBvZiB0aGUgZXhhY3QNCj4gPiA+IHN0ZXBzIG5lZWRlZC4NCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQ2MuIEVyaWMgU2FnZSwgYXMgaGUgYWxzbyBleHByZXNz
ZWQgaW50ZXJlc3QgaW4gaW1wbGVtZW50aW5nIHRoaXMuLi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBBZGRpbmcgVGlydGhhIHRoYXQgaGFzIHBhdGNoZXMgZm9yIHRoZSBBRl9YRFAgc3VwcG9y
dCBvZiBtdWx0aS0NCj4gYnVmZmVyLg0KPiA+ID4gPiA+ID4gVGhvdWdoLCBoZSBpcyBjdXJyZW50
bHkgaW50ZWdyYXRpbmcgaGlzIGk0MGUgbXVsdGktYnVmZmVyDQo+ID4gPiA+ID4gPiBkcml2ZXIg
c3VwcG9ydCB3aXRoIExvcmVuem8ncyBUWC1wYXRjaGVzIHRoYXQgaGUgc2VudCBhcyBhbg0KPiA+
ID4gPiA+ID4gUkZDLiBMYXRlc3QgSSBoZWFyZCBpcyB0aGF0IFRpcnRoYSBpcyBwbGFubmluZyBv
biBzdWJtaXR0aW5nDQo+ID4gPiA+ID4gPiB0aGlzIGluIGEgY291cGxlIG9mIHdlZWtzIGFzIGEg
cHJvcGVyIHBhdGNoIHRvIHRoZSBtYWlsaW5nDQo+ID4gPiA+ID4gPiBsaXN0LiBBbmQgYWZ0ZXIg
dGhhdCwgdGhlIGZvY3VzIGlzIHRvIGJydXNoIHVwIHRoZSBBRl9YRFAgYW5kDQo+ID4gPiA+ID4g
PiBaQyBzdXBwb3J0IHBhdGNoZXMgYXMgd2Ugc3RvcHBlZCB0cnlpbmcgdG8gdHJhY2sgTG9yZW56
bydzDQo+ID4gPiA+ID4gPiBtdWx0aS1idWZmZXIgcGF0Y2hlcyBhdCB2ZXJzaW9uIDEzIG91dA0K
PiA+ID4gb2YgMjMgOy0pLg0KPiA+ID4gPiA+ID4gV2UganVzdCBjb3VsZCBub3Qga2VlcCB1cC4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFoLCBpZiB0aGVyZSBpcyBhbnl0aGluZyBJIGNhbiBkbyB0
byBoZWxwIHBsZWFzZSBsZXQgbWUga25vdy4gTXkNCj4gPiA+ID4gPiBjb21wYW55IG5lZWRzIHRo
aXMgZmVhdHVyZSBzbyBJIGNhbiB3b3JrIG9uIGl0IGZ1bGwgdGltZS4gSQ0KPiA+ID4gPiA+IHdv
dWxkIGxvdmUgdG8NCj4gPiA+IGhlbHAgb3V0IGhvd2V2ZXIgSSBjYW4uDQo+ID4gPiA+DQo+ID4g
PiA+IEhleSBFcmljISBXZSdsbCBrZWVwIHlvdSBpbiBsb29wIGluIHRlcm1zIG9mIHByb2dyZXNz
IGFyb3VuZCB0aGlzIHdvcmsuDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3Ms
DQo+ID4gPiA+ID4gRXJpYyBTYWdlDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtLUplc3Bl
cg0KPiA+ID4gPiA+ID4NCg==
