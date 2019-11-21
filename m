Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9960105BDF
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 22:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfKUVYV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Nov 2019 16:24:21 -0500
Received: from mout.web.de ([212.227.15.4]:41847 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfKUVYU (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Nov 2019 16:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1574371459;
        bh=g3soauWN9iex3IUUw+P5XRlMxBWY6fGewW2H9ASJEc4=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=XpLrYZFIJ/5qU/nBE2UjoDneoyo2vPu/4pveJgnUIv1ww/leVoLcgkhuBVGplqBi+
         OWeYrrw5eIRvw8aMQy27HxfCY+j10X3lVfmwc/BQSIPBRAeRtVsD0E0UJnNndNOyLq
         a+ro202uS1Uywf1efCY/OXUH9zWAbED7yTGKHpt8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.5.0.3] ([37.201.193.25]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCqWJ-1ifugy0epf-009kYj for
 <xdp-newbies@vger.kernel.org>; Thu, 21 Nov 2019 22:24:19 +0100
To:     xdp-newbies@vger.kernel.org
From:   Christoph Kuhr <christoph.kuhr@web.de>
Subject: Access Hardware Timestamp in eBPF Program
Message-ID: <ce15150c-01e4-5621-0d13-ebe0f7cd2333@web.de>
Date:   Thu, 21 Nov 2019 22:24:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eaJlsBMANItqjUpMXGEvUNykm3fjymvnHMUnRcGL85LsJqxoAu4
 vjRlbt5mTi18D0lzENKkg0n0Ud4RAi80W26z1jrZgDryBlie2NNyMpLvInpyqWiSkCh1GVq
 gAtY/Voh4tYKEg8SbHdUe119spqvtcu9I4EyG7UjZsdA2kwxaIXB/T+7jG8MRrXkz/02izm
 JE6H+cs9RMwon39A1Jz/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j67S4ArT+GI=:73RggbwVOJkk4SbF7WwkLx
 DRqZES7k79LuKsy3aJz7gApvS/uLPNlywg02o85ziud7UWWNFy8P/zHZaAVz8JbjroSWel50Q
 wAhHcWeMoUNDGkVwy5RCkBkF/A2rnGm35o7lkD/Un1sZ/1NYLSnZ3dCN2eQEFBsjEyeYpxihY
 3Dmvg7kctRG/YvMbOJzCSGjY8+EweHnrqu0pMd3kSNux+J9wLWJFV+TzUb/r2Dts4iMYeT5sw
 qGPKOzKFZIfs0QiWwhpw0qknz52l+2Pf0+97qQJK8aL7Pd6mUCDHztXFlJnsVzkho0Nxm00Ri
 Kc+PircmfOWYna9mi3wl7bCoGpjSoIFR2fV+ihwojZi2J2PsEH2l9o41TgrgBiEdyEqBFbj/X
 YJrlYILp+h0NC/r0mArUNc5/yl2JTJgLjG1mSQ1UeekdOW9FTGewdaPEPEybYS6tO6b/g0Yyt
 iL/QcI3jhepHmMxIumpn2mJxjw1k6RJOYx3ai0FXf7UWX03WxF59O+d1eY9B6+s/Pc/yrDpey
 JghLhYvM+uPKeHW4eJNcVO5ESVBapOYCJE2xaJAvMRvUaRw33uPlTgy000RedvUsjfRGx7HIl
 9PCL4OBfeWkG/A2+WhSn6rQSNhh18HXXFWGZ1fR9Dexv+NXDen0glaUhU8m0eHmn/MyvakmB8
 OSNoEvvALZTNrnno9E6Q3fIrSQKUpkiDbGG6cNYGju1SbvuIk0xj9q+z65DH02JRhzEspQ7s/
 trvxXBB6wPR/DzaOoiTwwYTY1n+7V5f7T/ea0LQVh/LIYM37pHoRni1+RYl0Flu61e50vNStQ
 O8Y8GajsXRdQMYBknkuhWrp7V+/iL7CDzRbpbEhIdzF7Ybtmi0c5BmuVsUQb9mVzMeO3JqtTu
 1F73MFOScfCscE4LFgulNA7QFwFDn92XtYm7joK5BJ/p1Jpd72Mkv8HsU3z7q7cUFh+pTOloY
 Zzyyc6McUp7hI+nTs0HoUzak2GI8sGM/KI7mf4PnrYckD/w0fVDYjM2qbeLUT0tiZ2dEaRnDo
 /JRhSzmJiXo4b7KkJx5145zWj7VXng4xQAfXoyZwCgHc4v61Rik8NpF6Wbovqt2xjbmdvnXnO
 uHT2oEe0BCCS/K85K/wHGIwh6wyV9Q62cbunPiaPbpautjPh/6i+tWBhnc3tvLuMEC8y4SYKH
 rAQLQoV2A5ah3PfGFHLtOoVn6SeIN5wPEOnxji0jsTDxP6Ovb0aCvZfNSAXIT1+l+QFyvolho
 Pov+AYd3hnSRpEB+EDaX2oVycw4L6oI3ODCXSCZHvUtYIeShGFS0v3Hk7QQQ=
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi *,

in my program I use CMSGs to access hardware arrival timestamps of an
Intel I210 rx queue.

Is there a way to access such timestamps in a XDP eBPF program?

Best regards,
Christoph Kuhr
