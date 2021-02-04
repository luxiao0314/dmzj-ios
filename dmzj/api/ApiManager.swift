//
//  ApiManager.swift
//  dmzj
//
//  Created by luxiao on 2020/12/3.
//

import Moya
import HandyJSON

///配置请求超时
let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<ApiManager>.RequestResultClosure) -> Void in
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let Api = MoyaProvider<ApiManager>(requestClosure: timeoutClosure)

enum ApiManager {
    case boutiqueListNew(sexType: Int)//推荐列表
    case recommendIndex//推荐列表
}

extension ApiManager:TargetType {
    
    var baseURL: URL { return URL(string: "https://nnv3api.dmzj1.com")! }
    
    //请求路径
    var path:String{
        
        switch self {
        case .boutiqueListNew: return "/comic/boutiqueListNew";
        case .recommendIndex: return "/recommend_index.json";
        }
    }
    
    /// 设置请求头header
    var headers: [String : String]? {
        //同task，具体选择看后台 有application/x-www-form-urlencoded 、application/json
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    ///请求方式
    var method: Moya.Method {
        switch self {
        case .boutiqueListNew(sexType: _):
            return .get
        case .recommendIndex:
            return .get
        }
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    //MARK:task type
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .boutiqueListNew(let sexType):
            parmeters["sexType"] = sexType
            
        case .recommendIndex: break
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func requests<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
        
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.get().mapModel(ResponseData<T>.self) else {
                completion(nil)
                return
            }
            print(returnData.data?.returnData as Any,"returnData")
            completion(returnData.data?.returnData)
        })
    }
    
    @discardableResult
        open func request<T: HandyJSON>(_ target: Target,
                                        model: T.Type,
                                        completion: ((_ returnData: String?) -> Void)?) -> Cancellable? {
            return request(target, completion: { (result) in
                guard let completion = completion else { return }
                guard let data = try? result.get().data else {
                    completion(nil)
                    return
                }
                completion(String(data: data, encoding: .utf8))
            })
        }
}

