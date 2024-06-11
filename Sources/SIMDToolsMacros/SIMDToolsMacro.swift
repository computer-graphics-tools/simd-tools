import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

enum MacroExpansionError: Error, CustomStringConvertible {
    case invalidArguments

    var description: String {
        switch self {
        case .invalidArguments:
            return "Invalid arguments for the macro"
        }
    }
}

public struct GeneratePropeprtiesForSIMDMacro: DeclarationMacro {
    public static func expansion(
        of node: some SwiftSyntax.FreestandingMacroExpansionSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        let argumentList = node.arguments

        var decls: [DeclSyntax] = []

        guard let firstArgument = argumentList.first,
              let literalExpr = firstArgument.expression.as(IntegerLiteralExprSyntax.self),
              let simdTypeCount = Int(literalExpr.literal.text),
              Set<Int>([2, 3, 4]).contains(simdTypeCount)
        else { throw MacroExpansionError.invalidArguments }

        let components = ["x", "y", "z", "w"].prefix(simdTypeCount)

        func generateDecl(_ components: [String]) throws -> DeclSyntax {
            let type = "SIMD\(components.count)<Scalar>"
            let getType = "SIMD\(components.count)"
            var name = "\(components[0])\(components[1])"
            var getBody = "\(getType)(self.\(components[0]), self.\(components[1]))"
            var setBody = """
                    self.\(components[0]) = newValue.x
                    self.\(components[1]) = newValue.y
                    """

            if components.count > 2 {
                name.append(components[2])
                getBody = getBody.replacingOccurrences(of: ")", with: ", self.\(components[2]))")
                setBody.append("\nself.\(components[2]) = newValue.z")
            }
            if components.count > 3 {
                name.append(components[3])
                getBody = getBody.replacingOccurrences(of: ")", with: ", self.\(components[3]))")
                setBody.append("\nself.\(components[3]) = newValue.w")
            }

            return DeclSyntax(
                """
                var \(raw: name): \(raw: type) {
                    get { \(raw: getBody) }
                    set { \(raw: setBody) }
                }
                """
            )
        }

        for a in components {
            for b in components where a != b {
                try decls.append(generateDecl([a, b]))
            }
        }

        if simdTypeCount > 2 {
            for a in components {
                for b in components where a != b {
                    for c in components where a != c && b != c {
                        try decls.append(generateDecl([a, b, c]))
                    }
                }
            }
        }

        if simdTypeCount > 3 {
            for a in components {
                for b in components where a != b {
                    for c in components where a != c && b != c {
                        for d in components where a != d && b != d && c != d {
                            try decls.append(generateDecl([a, b, c, d]))
                        }
                    }
                }
            }
        }

        return decls
    }
}

@main
struct SIMDToolsPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        GeneratePropeprtiesForSIMDMacro.self
    ]
}

