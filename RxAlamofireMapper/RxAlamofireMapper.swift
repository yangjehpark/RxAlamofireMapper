//
//  RxAlamofireMapper.swift
//  RxAlamofireMapper
//
//  Created by Wassim Seifeddine on 2/20/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

public typealias JSON = [String : Any]

public enum ObjectMapError: Error{
    case MapError(JSON?)
    case APIResponseError(Any)
    
}

extension DataRequest{
    
    func processMap<N,T>(mapObject:@escaping (AnyObject)->N?, mapError: @escaping (AnyObject)->T?) -> Observable<N>{
        
        return Observable.create{ (observer) -> Disposable in
            self.responseJSON(completionHandler: { (response : DataResponse<Any>) in
                switch response.result {
                case .success :
                    guard let o = mapObject(response.result.value! as AnyObject) else{
                        observer.on(Event.error(ObjectMapError.MapError(response.result.value as? JSON)))
                        return
                    }
                    observer.on(Event.next(o))
                    
                case .failure :
                    _ =  mapError(response.result.value as AnyObject)
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    func rx_responseArray<T:Mappable, E : Mappable>(type:T.Type, type2 : E.Type) -> Observable<T>{
        return self.processMap(mapObject: { (json) in
            Mapper<T>().map(JSON: json as! JSON)
            
        }, mapError: { (error ) in
            Mapper<E>().map(JSON: error as! JSON )
            
        })
        
    }
    
    func rx_responseObject<T:Mappable, E : Mappable>(type:T.Type, type2 : E.Type) -> Observable<T>{
        return self.processMap(mapObject: { (json) in
            Mapper<T>().map(JSON: json as! [String : Any] )
            
        }, mapError: { (error ) in
            Mapper<E>().map(JSON: error as! [String : Any] )
            
        })
    }
}
