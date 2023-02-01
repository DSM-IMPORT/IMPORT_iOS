import RxFlow

extension Step {
    var asIMPORTStep: IMPORTStep? {
        return self as? IMPORTStep
    }
}
