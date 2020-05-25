//
//  StringTests.swift
//  JFGenericTests
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import XCTest
import JFGeneric

class StringTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSubstringAt() {
        let string = "Hello World!"
        let subStr = string.substring(at: 3, length: 5)
        XCTAssertEqual(subStr, "lo Wo")
    }

    func testSubstringFrom() {
        let string = "Hello World!"
        let subStr = string.substring(from: 3)
        XCTAssertEqual(subStr, "lo World!")
    }

    func testSubstringTo() {
        let string = "Hello World!"
        let subStr = string.substring(to: 8)
        XCTAssertEqual(subStr, "Hello Wo")
    }

    func testSubstringOutOfBounds() {
        let string = "Hello World!"
        let subStr = string.substring(at: 5, length: 10)
        XCTAssertEqual(subStr, " World!")
        
        let subStr1 = string.substring(from: 15)
        XCTAssertEqual(subStr1, "")

        let subStr2 = string.substring(to: -1)
        XCTAssertEqual(subStr2, "")
    }
    
    func testBase64() {
        let string = "_l8jjXujNe-fyfBQlf2GpAp9kS-Q5clnM9Z5b49kAu6spVavh8_QZn-MNld3rbhiFnxh-ORpmIN3qt5nBW2N0wPAQqeFPKJVmtYjh_FNAtGhx7yNez6MlTpi9SGp5Gjcvo1WzfC3F0VARlKXmxHNVxb8PnH2Mv3S-9KzRwjMKKspY9wiOHkll3syJDUqiQX_NaRicdSH5LJSeq3lz54rTXPj-caNwpsTQ57qCSO7FACM7BLQE1A8G5rlMjAXyvsYX146hxtDxTYgNkW4fUCpmVd7STC5A5JGOOUqfu-vV0zSNrILxFU-a1jPgNBVQJ7J_TfqZX4XPX78fIxlkyFNLFAO8-eWWiM64NI8uGeJ9nOKw0qBjsla5rmqmWSVLaNkQ3V9FqQQ_2b9995tQHH0OXzRsr49UJxl9Bs6S-HM1eFUcm6cMMPXTOVxcmaJ62m1CRdQ2LZjLFgzqQotrjycSPnHdNr_QuLlRZGIibiqnplHS1P9IUGZxJQclgwGCTOqEPEEWJKZDCkfwz9SWiqJ8wMRoKr7n80ilVe-mYR0uN0m4iL970wTGCQtd2gxGTmX6UR5nswA1rClO7abclR8-EljPcGyc0zlRyMcqBTOuLkY8D2WuG5KQLN_yLMBKH8j9ToaIXheH0HikM-QE-c9nH9i0mNDKmIXlsZAbYqGc34ilObkaYX8qRrTVwVDmnZNXcIC5iZS-MYHE4sejZbhazIKbXi46cC741k05ys96FPYnd9uC_7LsWOWDeVXuo548FMCX4nlZ_FWRBn1aQ7Qi_IEPtxKpo0QmTl35BD78YQTE-BmfdOUkYg8WDXkbzp_6ZUTBqrQ9DFdQRvCjhb1uI0ihF8h6WhM7sOWO7WqYkaWMbKsYF0Rtsl5qwvU_efv2p6i2SwuCGckMi281VT1I5GN7Y03Q8gE1mB2U35J7fSxiY4yyPjZeUROkSwQUUNYEhn3RgmC_0C6P06l257KAmDBsTbZ3UPAMwLJakUdUJy7-niNt__dlUf3coFtdqI2Xu42cvAqPBwpb1JRd6gXjxk9glfUnze-jF7ehW8u5TpeY0zKfA9YoWFJjcDZwknc4pZB-FpBxrS7Nfz4cYjBsLc0rg-pqD30IYlKGWzgHW_s0o3WhHMnKYkhcfT2deHdh5RgEFv4pPwc5cPUJXXQANcBkz58Zl1q7eD4Pr_pR-tvE7Qv-QZbY5R6ATYfAcDv6ysQuXEYg2PkQDFLZ-LBucwwtxT41pvwUWSMQDsfZJES0gxCbZ2YyyGkzhr0x7FwDZ9lakEhGyugIrnQuhfx87U3m6nJuES5wAJSNvKz0E0PdZvszBiDzjCpUktvEJUpcE5dxBr8oQc3Bd3_iHp9ou28KDiV39a7HkJl2YQLP02j-nQAVIvRMgWzGzMSY-CZYnm4lU0Zw-V-OY1tvrWvEMmA2RkeWVfYoC3wgAV6YeW83M8jb-bn0hdo4QzuncGvZMsoMeKWYc2btM9JXxxQbP5ExTo4rLSIfyePvpmFPpo_uH9aCePZjCwcvStYpcB65MYJDp16oVHSF1I0v6F7miuV_3SZs1o4dKMAAJ6JnSMMdjEqlc6Hr_gOcGZUh0xlHH_kdeCtIjwHMjYts6fCIX-ebKj_hWwqJ-RBmRN71iblZRkAB3rV0eGIm7UVcLNCGSrH1vWWnxa4Ry-wfBRnagzvx-6UI1JclIvdxhfI_-YFqkd0f1teKp2NlSGsJE7cFx5CwbMF7h-hJzpqquiKVD3ZhnX6GGERlHMzXMr0VIq07G4RSsb3IxqqIfkbt8ih5WUZAAd61dHhiJu1FXCzQkCxyKNJVwsU16IA0Cj6vQ4Yy9tNHo89kif0J22t72-CH2o8pjzU_gSb2nNPfQGHb8tGGreqwyK0mgDpucbhjNF7MRi99QKePSzTbp30TZ0aPKtoaibREwyARgH9WcMcl_NSyhqiDW1rzHA_5OfvHrvFfPbwydcg3r-IeP_nPsTXfYv6qudewy8BEpNnFBkS_rJXr3ArUEuFQmfu-zlMND2wh5LC-s9A4LOo792OkV47bIjFhVwNH3U7nkmFmJHdXRF3VexrjBTBDaKWZVHV2Q0uO2T-3PiY5Un07e32fX3S7qWO5bb-Ll-efGX3wjH1znUk2FYKdx_yI1kc9kOeRTGNDWW1MsmhHQP23_D1rclJdUdtzHWDMqFhz7I33m9HYELwbe8JGSrzmZmNGhYyA8Qd5o-WjhMO3kHnQw9--e14i5684t3jXdSRT21j7NFjUWP_ZO41BnNK0S5yRAvZHdIKq_vRMxfU7KhZAGFf0It3uaZbNqOZuapHcFuKp3hAUgpLHnBgHxc4nZ5egqAnOG3nhwGrv6LAZAiI6BlPWTy2_YLN48tIN6vCyTABgeIvP3fFa0k1mYhfB5kbvKk0M_TDAXLB0Ijv31dRxuGG0WCcEphwfe-XVMqVLH8FKWPpt40v1CwGikNqqx2D8ljQnXXRjUF2wBRSpI3drI7mivZkybJZ6Nw2QSkcpuAvopugKgCVmJrvlaEpuRdoe81GA8Wkj12J9zgiKmkgZmSfDVnTFi9MQf1iaJI3CabHxBJvIfycWmGNOl_w1hoQPAirkK6H0pDCjHII495FxmVtuTUAp4dYAyVzFbL1k6ToXi2dn1S3We0XDpXm6CUabgTo7BRND__0qJZ8Ys7KkTORbhWfPcCw_HGqduzEHa3s9dUB_iomlqfmDXnVEzNfS4vEfwirV4RbgPQzotr9CLWGirHKlSXXjcmRfFda260I3Z1bh49OFQX3UjoEH3dIZYmLgDBfgDoqsEVfZ2kEH-AKe4O2deMWMi7lZZXXzl3KamzFiTLuOAP8N-4Ld-_fiAEIVdBh4IXyA3Xfn1Y4xA0-5XwMiE6ZtxxpbPqkqXwRuyBNNtE7OJR6T_uNn_gJDNbSYrAb9Ldt1fz1o-o_Gjp_FX4pzRxRUamT1DXjX3EpPVGTgywVxRJ5-rg2YjjevGRlKXukRt8i0JsqsD66Bas8IDchWbyzt_zYuLNdQFcwI6gjxdfejMVcXfDyFotNL0kLtlemGr3Q_B9XyzCf0U2LCmMuY9DQAUHe9C_t1Yr36K74q8EUAjJqNe8LLq2LkugMpJ7tAwEMuxJCbi6UUHzhFtLxBqLompnsOT1CNgxS33eUnzw8ZsHv3X0GJD23rtCFUzk9RXn9xb4tgVbbBAZvYBtBBcKZJ9ozhFztJ8bZupWBsjr0E-SzW4jFu8W6bMEMxOKkorCqENDezItZs3kc6dH24ute3zjUzdbpPG5FDAu9RDpPnhitpm66yVbzyVCzGkvLeqYNvDM_BLxKn2nN8-87Xib5a5ukCgoGvbbgt6RfYbk5qdFwxCUaRlXuqnCafaoi8LFJn9zLd6WjLuyLBg16ZreFD_C9SulmUlGkAru7CFULcewLvn6NCm9U-EZcpw8bEZy_dw7UCxhfLrVk2eRieJqg8ikEbAwG9ACdkzUfcvECsaAZq2xM2R126Vo-52hiBVAq3BLGjuec6ALK8xfOXGnNQF9nZugSte_yB2kOX7ZHsdYjejCJmsu1_kqhElCi5kORuHrvwaCHmG4Xgbm0ZJM6hWY3rHTvFDzKe92b9LDQEoI_dPMmrNEtxaklw75B6nFv_xqtsA63Zjqx24Fo9L3NUCTD8dU-ii4OPBNx2fl67iGNW__zMLO8JCSzNSmlhE26IgixSDMzFxsYWrKYAd7uGzDlA_Jd3GwJGpZAlU-HLdgpQzPvUuEErIOSh8uE2cbd8sT36Irux0U1dQwZYgpR8zdx2qc2rnis2wj_uM8bH-_IThAw82pd_0-Mbh2RpFUSdrsNe14nXF-NS1MlzCEhqmmGC25hhTSyNVedA7laL1UQZpoDgyBsBlFBYgJESjngqrzH985zEDdGqwTFeOq1vWAvGnfFBm-ghL2Zy5YlGnweRE5KALAyy2G0JMa1hoBzlwhxnwfccmwm5Xgok5eN1vB7vmOBAcVjliceMyoqdShBi1sKYwg-rJyLSBua7MKuaNlMcB7Xq2KWVzG8It92vVviEOGrnWvp1yAXmargQOrjY4mcOZYW66SNCBj31C1jbmPvr4xqsR6v4_AtiCDGm_3Bk89c2jnlCJOgAuya0-sihIr96Ecs1X7eZaLWQqlnyOIdDRrm3e7RNzmMuiYpVuHnbtbmkGpcLe7yXBHZdElOAquEpnc1ksx5D4FvPhoQZv5sBAps8CVNvEJNfo1fy9EhrDaytGArhwL-6hbZtZ0IopD1-Mdj7HiKCmdqwHE10ZsYqw8pa53mRYXhK-BSP1UlusGuQ2RT0kkw4vNF_yLSj4qKtCs4zyXRTHr38syvKkIjoIaLdgLwuII2nk_ND89cIJiYhN78rpuoJxUBAf3PQM6ZyCukgdsXq_GcEktas2OqAdf8uNonsaLk8SHWbRfLIX88QzfPSQI8m7lbNlJELjvPcEqmuRwbz_4="
        
        let base64Data = Data(base64Encoded: string, options: .ignoreUnknownCharacters)
        if let data = base64Data {
            print(String(data: data, encoding: .utf8))
        } else {
            print("error")
        }
    }
}
