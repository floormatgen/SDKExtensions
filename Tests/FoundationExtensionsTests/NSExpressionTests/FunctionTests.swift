import Testing

import Foundation
@testable import FoundationExtensions


extension NSExpressionTests {
    
    @Suite
    struct FunctionTests {
        
        private func doubleSum(_ numbers: [NSNumber]) -> Double {
            return numbers.reduce(0.0, { $0 + $1.doubleValue })
        }
        
        @Test("average: works as expected", arguments: FunctionTests.testNumbers)
        func averageWorksAsExpected(_ arguments: [NSNumber]) throws {
            let function = NSExpression(forFunction: .average(NSExpression(forConstantValue: arguments)))
            try #require(function.function == "average:")
            guard !arguments.isEmpty else { return }
            let result = try #require(function.expressionValue(with: nil, context: nil) as? Double)
            #expect(result == doubleSum(arguments) / Double(arguments.count))
        }
        
        @Test("sum: works as expected", arguments: FunctionTests.testNumbers)
        func sumWorksAsExpected(_ arguments: [NSNumber]) throws {
            let function = NSExpression(forFunction: .sum(NSExpression(forConstantValue: arguments)))
            try #require(function.function == "sum:")
            let result = try #require(function.expressionValue(with: nil, context: nil) as? Double)
            #expect(result == doubleSum(arguments))
        }
        
        @Test("count: works as expected", arguments: FunctionTests.testNumbers)
        func countWorksAsExpected(_ arguments: [NSNumber]) throws {
            let function = NSExpression(forFunction: .count(NSExpression(forConstantValue: arguments)))
            try #require(function.function == "count:")
            let result = try #require(function.expressionValue(with: nil, context: nil) as? Int)
            #expect(result == arguments.count)
        }
        
        @Test("min: works as expected", arguments: FunctionTests.testNumbers)
        func minWorksAsExpected(_ arguments: [NSNumber]) throws {
            let function = NSExpression(forFunction: .min(NSExpression(forConstantValue: arguments)))
            try #require(function.function == "min:")
            guard !arguments.isEmpty else { return }
            let result = try #require(function.expressionValue(with: nil, context: nil) as? Double)
            #expect(result == arguments.min(by: { $0.doubleValue < $1.doubleValue })?.doubleValue)
        }
        
        @Test("max: works as expected", arguments: FunctionTests.testNumbers)
        func maxWorksAsExpected(_ arguments: [NSNumber]) throws {
            let function = NSExpression(forFunction: .max(NSExpression(forConstantValue: arguments)))
            try #require(function.function == "max:")
            guard !arguments.isEmpty else { return }
            let result = try #require(function.expressionValue(with: nil, context: nil) as? Double)
            #expect(result == arguments.max(by: { $0.doubleValue < $1.doubleValue })?.doubleValue)
        }
        
        static let testNumbers: [[NSNumber]] = [
            [ 1, 2, 3, 4, 5 ],
            [ 0, 0, 0, 0, 0 ],
            [ 81, 5, 67, 61, 69, 41 ],
            [ 42 ],
            [],
            [ -1, -2, -3, -4, -5 ],
            [ 1000000000000, 2000000000000 ],
            [ 0.1, 0.2 ],
        ]
        
    }
    
}
