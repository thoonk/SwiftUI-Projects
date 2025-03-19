//
//  MarketDataModel.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/12/25.
//

import Foundation


// JSON data:
/*
 
 URL: https://apli.coingecko.com/api/v3/global
 
 {
 "data": {
 "active_cryptocurrencies": 17179,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 1281,
 "total_market_cap": {
 "btc": 33589740.08619973,
 "eth": 1446243858.1013374,
 "ltc": 30726913483.907078,
 "bch": 8253924831.629301,
 "bnb": 4972566807.928827,
 "eos": 5694890617600.051,
 "xrp": 1258829093880.8494,
 "xlm": 10850017050967.422,
 "link": 210857393970.98477,
 "dot": 692106215957.4575,
 "yfi": 551797423.6415855,
 "usd": 2774239014164.7334,
 "aed": 10189127952858.736,
 "ars": 2956284925054100,
 "aud": 4411716946841.382,
 "bdt": 337018331180030,
 "bhd": 1045347131732.3424,
 "bmd": 2774239014164.7334,
 "brl": 16123738438374.725,
 "cad": 4010922636465.001,
 "chf": 2447516885466.5527,
 "clp": 2601514893142837,
 "cny": 20096032570806.496,
 "czk": 63577232713374.18,
 "dkk": 18978294446238.54,
 "eur": 2544493184445.6953,
 "gbp": 2146084719621.4978,
 "gel": 7698513264307.136,
 "hkd": 21552330501946.074,
 "huf": 1021841939483872.2,
 "idr": 45658839006799976,
 "ils": 10140143214585.63,
 "inr": 242046761120020.44,
 "jpy": 411799369765693.75,
 "krw": 4026886090470096,
 "kwd": 854820718956.551,
 "lkr": 819512487982971,
 "mmk": 5820353451717611,
 "mxn": 56164155352756.414,
 "myr": 12303750027820.592,
 "ngn": 4249884488189094.5,
 "nok": 29579729801382.438,
 "nzd": 4861584771139.319,
 "php": 159026332534892.03,
 "pkr": 776393880879554.6,
 "pln": 10686701591244.252,
 "rub": 239991377370728.06,
 "sar": 10404431094270.033,
 "sek": 27849986227572.7,
 "sgd": 3699497661690.926,
 "thb": 93877474000320.4,
 "try": 101581241673320.36,
 "twd": 91393137414657.86,
 "uah": 114982774724480.02,
 "vef": 277784552488.3148,
 "vnd": 70645269511919730,
 "zar": 50874882798237.4,
 "xdr": 2084335707644.2195,
 "xag": 84183922233.75697,
 "xau": 951064618.8359537,
 "bits": 33589740086199.73,
 "sats": 3358974008619973
 },
 "total_volume": {
 "btc": 1671402.5224910474,
 "eth": 71964106.49098425,
 "ltc": 1528950226.2765765,
 "bch": 410709661.60004944,
 "bnb": 247431527.74326226,
 "eos": 283373867113.6059,
 "xrp": 62638475841.07979,
 "xlm": 539889437117.3906,
 "link": 10492119893.29404,
 "dot": 34438732547.92739,
 "yfi": 27457062.88324398,
 "usd": 138044238340.89328,
 "aed": 507004047030.0908,
 "ars": 147102718516352.47,
 "aud": 219524021756.17545,
 "bdt": 16769801951860.09,
 "bhd": 52015759228.04028,
 "bmd": 138044238340.89328,
 "brl": 802306211025.3546,
 "cad": 199580770643.0665,
 "chf": 121786768391.48625,
 "clp": 129449604061789.23,
 "cny": 999964853693.7627,
 "czk": 3163559672014.012,
 "dkk": 944346968110.4551,
 "eur": 126612242786.93053,
 "gbp": 106787709718.79485,
 "gel": 383072761395.9788,
 "hkd": 1072429243991.4777,
 "huf": 50846156917486.21,
 "idr": 2271952640721137,
 "ils": 504566599913.7056,
 "inr": 12044081498058.441,
 "jpy": 20490855351077.38,
 "krw": 200375101210177.6,
 "kwd": 42535295071.502754,
 "lkr": 40778381616308.02,
 "mmk": 289616812039194.06,
 "mxn": 2794690006212.4507,
 "myr": 612226197041.8616,
 "ngn": 211471349156797.7,
 "nok": 1471867149842.7693,
 "nzd": 241909137401.2963,
 "php": 7913041680561.284,
 "pkr": 38632829179938.93,
 "pln": 531762971397.7217,
 "rub": 11941807006667.965,
 "sar": 517717384279.2508,
 "sek": 1385796291148.7458,
 "sgd": 184084476623.87125,
 "thb": 4671278981217.486,
 "try": 5054613198400.883,
 "twd": 4547660089694.74,
 "uah": 5721464328819.665,
 "vef": 13822369585.073643,
 "vnd": 3515260355134276.5,
 "zar": 2531499416851.569,
 "xdr": 103715121061.80325,
 "xag": 4188934466.7034206,
 "xau": 47324325.78802502,
 "bits": 1671402522491.0474,
 "sats": 167140252249104.75
 },
 "market_cap_percentage": {
 "btc": 59.05289814418499,
 "eth": 8.336612266027444,
 "usdt": 5.162931322583632,
 "xrp": 4.597842972787645,
 "bnb": 2.9334783813299845,
 "sol": 2.271329982378462,
 "usdc": 2.0916660224316774,
 "ada": 0.956339278487845,
 "doge": 0.8897398139560413,
 "trx": 0.7628523205405131
 },
 "market_cap_change_percentage_24h_usd": 0.4418173578298148,
 "updated_at": 1741767237
 }
 }{
 "data": {
 "active_cryptocurrencies": 17179,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 1281,
 "total_market_cap": {
 "btc": 33589740.08619973,
 "eth": 1446243858.1013374,
 "ltc": 30726913483.907078,
 "bch": 8253924831.629301,
 "bnb": 4972566807.928827,
 "eos": 5694890617600.051,
 "xrp": 1258829093880.8494,
 "xlm": 10850017050967.422,
 "link": 210857393970.98477,
 "dot": 692106215957.4575,
 "yfi": 551797423.6415855,
 "usd": 2774239014164.7334,
 "aed": 10189127952858.736,
 "ars": 2956284925054100,
 "aud": 4411716946841.382,
 "bdt": 337018331180030,
 "bhd": 1045347131732.3424,
 "bmd": 2774239014164.7334,
 "brl": 16123738438374.725,
 "cad": 4010922636465.001,
 "chf": 2447516885466.5527,
 "clp": 2601514893142837,
 "cny": 20096032570806.496,
 "czk": 63577232713374.18,
 "dkk": 18978294446238.54,
 "eur": 2544493184445.6953,
 "gbp": 2146084719621.4978,
 "gel": 7698513264307.136,
 "hkd": 21552330501946.074,
 "huf": 1021841939483872.2,
 "idr": 45658839006799976,
 "ils": 10140143214585.63,
 "inr": 242046761120020.44,
 "jpy": 411799369765693.75,
 "krw": 4026886090470096,
 "kwd": 854820718956.551,
 "lkr": 819512487982971,
 "mmk": 5820353451717611,
 "mxn": 56164155352756.414,
 "myr": 12303750027820.592,
 "ngn": 4249884488189094.5,
 "nok": 29579729801382.438,
 "nzd": 4861584771139.319,
 "php": 159026332534892.03,
 "pkr": 776393880879554.6,
 "pln": 10686701591244.252,
 "rub": 239991377370728.06,
 "sar": 10404431094270.033,
 "sek": 27849986227572.7,
 "sgd": 3699497661690.926,
 "thb": 93877474000320.4,
 "try": 101581241673320.36,
 "twd": 91393137414657.86,
 "uah": 114982774724480.02,
 "vef": 277784552488.3148,
 "vnd": 70645269511919730,
 "zar": 50874882798237.4,
 "xdr": 2084335707644.2195,
 "xag": 84183922233.75697,
 "xau": 951064618.8359537,
 "bits": 33589740086199.73,
 "sats": 3358974008619973
 },
 "total_volume": {
 "btc": 1671402.5224910474,
 "eth": 71964106.49098425,
 "ltc": 1528950226.2765765,
 "bch": 410709661.60004944,
 "bnb": 247431527.74326226,
 "eos": 283373867113.6059,
 "xrp": 62638475841.07979,
 "xlm": 539889437117.3906,
 "link": 10492119893.29404,
 "dot": 34438732547.92739,
 "yfi": 27457062.88324398,
 "usd": 138044238340.89328,
 "aed": 507004047030.0908,
 "ars": 147102718516352.47,
 "aud": 219524021756.17545,
 "bdt": 16769801951860.09,
 "bhd": 52015759228.04028,
 "bmd": 138044238340.89328,
 "brl": 802306211025.3546,
 "cad": 199580770643.0665,
 "chf": 121786768391.48625,
 "clp": 129449604061789.23,
 "cny": 999964853693.7627,
 "czk": 3163559672014.012,
 "dkk": 944346968110.4551,
 "eur": 126612242786.93053,
 "gbp": 106787709718.79485,
 "gel": 383072761395.9788,
 "hkd": 1072429243991.4777,
 "huf": 50846156917486.21,
 "idr": 2271952640721137,
 "ils": 504566599913.7056,
 "inr": 12044081498058.441,
 "jpy": 20490855351077.38,
 "krw": 200375101210177.6,
 "kwd": 42535295071.502754,
 "lkr": 40778381616308.02,
 "mmk": 289616812039194.06,
 "mxn": 2794690006212.4507,
 "myr": 612226197041.8616,
 "ngn": 211471349156797.7,
 "nok": 1471867149842.7693,
 "nzd": 241909137401.2963,
 "php": 7913041680561.284,
 "pkr": 38632829179938.93,
 "pln": 531762971397.7217,
 "rub": 11941807006667.965,
 "sar": 517717384279.2508,
 "sek": 1385796291148.7458,
 "sgd": 184084476623.87125,
 "thb": 4671278981217.486,
 "try": 5054613198400.883,
 "twd": 4547660089694.74,
 "uah": 5721464328819.665,
 "vef": 13822369585.073643,
 "vnd": 3515260355134276.5,
 "zar": 2531499416851.569,
 "xdr": 103715121061.80325,
 "xag": 4188934466.7034206,
 "xau": 47324325.78802502,
 "bits": 1671402522491.0474,
 "sats": 167140252249104.75
 },
 "market_cap_percentage": {
 "btc": 59.05289814418499,
 "eth": 8.336612266027444,
 "usdt": 5.162931322583632,
 "xrp": 4.597842972787645,
 "bnb": 2.9334783813299845,
 "sol": 2.271329982378462,
 "usdc": 2.0916660224316774,
 "ada": 0.956339278487845,
 "doge": 0.8897398139560413,
 "trx": 0.7628523205405131
 },
 "market_cap_change_percentage_24h_usd": 0.4418173578298148,
 "updated_at": 1741767237
 }
 }
 
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        
        return ""
    }
}

