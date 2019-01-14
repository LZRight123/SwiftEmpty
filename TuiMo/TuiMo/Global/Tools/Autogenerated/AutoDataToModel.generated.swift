// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


extension TestAutoModel {
    static func serialization(_ dic: [String : Any]) -> TestAutoModel{
     	let object = TestAutoModel()
     	object.name = String.serialization(dic["name"])
     	object.age = Int.serialization(dic["age"])
     	object.tizhong = Double.serialization(dic["tizhong"])
     	return object
    }
}
