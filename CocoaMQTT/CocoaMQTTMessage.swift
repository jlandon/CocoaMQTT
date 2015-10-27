//
//  CocoaMQTTMessage.swift
//  CocoaMQTT
//
//  Created by Feng Lee<feng@eqmtt.io> on 14/8/3.
//  Copyright (c) 2015 emqtt.io. All rights reserved.
//

import Foundation

/**
 * MQTT Message
 */
public class CocoaMQTTMessage {

    public var topic: String

    public var payload: [UInt8]

    //utf8 bytes array to string
    public var string: String? {
        get {
            return NSString(bytes: payload, length: payload.count, encoding: NSUTF8StringEncoding) as? String
        }
    }

    public var qos: CocoaMQTTQOS = .QOS1

    public var retain: Bool = false

    public var dup: Bool = false

    public init(topic: String, string: String, qos: CocoaMQTTQOS = .QOS1) {
        self.topic = topic
        self.payload = [UInt8](string.utf8)
        self.qos = qos
    }

    public init(topic: String, payload: [UInt8], qos: CocoaMQTTQOS = .QOS1, retain: Bool = false, dup: Bool = false) {
        self.topic = topic
        self.payload = payload
        self.qos = qos
        self.retain = retain
        self.dup = dup
    }

}

/**
 * MQTT Will Message
 */
public class CocoaMQTTWill: CocoaMQTTMessage {

    public init(topic: String, message: String) {
        super.init(topic: topic, payload: message.bytesWithLength)
    }

}
