@freestanding(declaration, names: arbitrary)
macro GeneratePropeprtiesForSIMD(_ simdTypeCount: Int) = #externalMacro(
    module: "SIMDToolsMacros",
    type: "GeneratePropeprtiesForSIMDMacro"
)
