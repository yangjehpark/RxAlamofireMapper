# RxAlamofireMapper
The combination of [RxSwift](https://github.com/ReactiveX/RxSwift), [Alamofire](https://github.com/Alamofire/Alamofire) and [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper) to create beautiful asynchronous API calls

### installation
for now just copy  the `RxAlamofireMapper.swift` class to your project. I'll provide a [CocoaPods](https://cocoapods.org/)  and  [Carthage](https://github.com/Carthage/Carthage) installation soon. 
### Usage 

 1. Prepare the request
```
  let request = Alamofire.request("http://myapi.com", method: .get , parameters: nil , encoding: URLEncoding.default, headers: nil )
``` 
 2. Send the Request and SPECIFY the object to be returned 
 ```
 request.rx_responseObject(type: User.self)
            .subscribe(onNext: { (user) in
                print(user)
            }, onError: { (error ) in
                print("Error")
            }, onCompleted: {
                print("Completed")
            }) {
                print("Disposed"      )
        }
 ```
 Here the user object is a class conforming to the `Mappable` protocol
 
 ```
class User : NSObject, Mappable{
    
    var city : String?
    var country : String?
    var countryIso : String?
    var dateOfBirth : String?
    var firstName : String?
    var id : Int?
    var image : String?
    var lastName : String?
    var title : String?
    
    required init?(map: Map){}
    private override init(){}
    
	func mapping(map: Map)  {
	        city <- map["city"]
	        country <- map["country"]
	        countryIso <- map["country_iso"]
	        dateOfBirth <- map["date_of_birth"]
	        firstName <- map["first_name"]
	        id <- map["id"]
	        image <- map["image"]
	        lastName <- map["last_name"]
	        title <- map["title"]
        
	    }
}
 ```
 On the `onNext` event. a user object will be the Event value. not the json representing the user object
 ## TODO:
- [x] Demo
- [x] Working with 1 generic parameter
- [ ] Working with 2 generics parameters. The second representing the error 
