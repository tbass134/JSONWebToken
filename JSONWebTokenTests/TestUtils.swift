//
//  TestUtils.swift
//  JSONWebToken
//
//  Created by Antoine Palazzolo on 19/11/15.
//  Copyright © 2015 Antoine Palazzolo. All rights reserved.
//

import Foundation
import JSONWebToken

func ReadRawSampleWithName(name : String) -> String {
    let path = NSBundle(forClass: HMACTests.self).pathForResource(name, ofType: "jwt")!
    return try! String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
}
func ReadSampleWithName(name : String) -> JSONWebToken {
    return try! JSONWebToken(string : ReadRawSampleWithName(name))
}

var SamplePublicKey : RSAPKCS1Key = {
    return SampleIdentity.publicKey

}()

let SamplePrivateKey : RSAPKCS1Key = {
    return SampleIdentity.privateKey
}()

let SampleIdentity : (publicKey : RSAPKCS1Key,privateKey : RSAPKCS1Key) = {
    let path = NSBundle(forClass: HMACTests.self).pathForResource("identity", ofType: "p12")!
    let p12Data = NSData(contentsOfFile : path)!
    return try! RSAPKCS1Key.keysFromPkcs12Identity(p12Data, passphrase : "1234")
}()

let SamplePayload : JSONWebToken.Payload = {
    var payload = JSONWebToken.Payload()
    payload.issuer = "1234567890"
    payload["name"] = "John Doe"
    return payload
}()