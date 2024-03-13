import Foundation

class JSONManager {
    
    struct DecodeReturn<T: Decodable> {
        var value: T
        var error: (any Error)?
    }
    
    static func encodeJSON<T: Encodable>(_ data: T) throws -> Data? {
        do {
            return try JSONEncoder().encode(data)
        } catch let e {
            throw e
        }
    }
    
    static func decodeJSON<T: Decodable>(_ jsonData: Data, defaultValue: @autoclosure () -> T) -> DecodeReturn<T> {
        do {
            return DecodeReturn(value: try JSONDecoder().decode(T.self, from: jsonData))
        } catch let e {
            return DecodeReturn(value: defaultValue(), error: e)
        }
    }
}

extension Encodable {
    func encodeToJSON() throws -> Data? {
        return try JSONManager.encodeJSON(self)
    }
}

extension Data {
    func decodeFromJSON<T: Decodable>(_ defaultValue: @autoclosure () -> T) ->JSONManager.DecodeReturn<T> {
        return JSONManager.decodeJSON(self, defaultValue: defaultValue())
    }
}
