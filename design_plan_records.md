
# design plan and decisions

## For v0.0.7 (20210715-)[NEXT]

- [PLAN]
    - investigate try/rethrows to see if we can have full control of our own tests exceptions without the need for throws/try in our tests calls to assertions (see notes)
    - now that we have a better understanding and good shape of our first checks, try to create a builder for checks (first for the core tests but also as an extention point in the framework)
    - start adding some comments to see the most useful format
    
    
- [NOTES]
    -  _"rethrows tells the compiler that the function only ever throws error thrown by one of its throwing input arguments. It never throws errors on its own". more on [link](https://stackoverflow.com/questions/43305051/what-are-the-differences-between-throws-and-rethrows-in-swift/43305215#43305215)_


## For v0.0.6

- [PLAN]
    - remove calls to XCTassert and only use custom errors and tests of the framework to remove dependency to the XCTest framework assertions
    - add documentation to all functions
    - refactor to files with better names
- [DONE]
    - all calls to XCTAssert were removed, but this comes with a price of adding `throws/try` to all test functions.
        - this is a constraint, but I think -at this stage- that there is a greater benefit of throwing richer error messages and having the full control of these messages
    - complementary tests were done to validate the test negation (to catch our library error messages and own behaviors)
    
    

## For v0.0.5

- [IDEA] the check should return a checkresult
    - which should be also a linkable check that should allow to continue with another check here : .willThrowAnError().with(message:"this should fail")
    - the with is contextual to the type
    - the with carry the initial sut too
- [FINAL] the check return a check result that could carry an error and ensure that the negative test is handled too:
    - we used a continuation `.and` to allow a more natural language
    - we call it `error(is:)` and not `message` as it should handle any kind of errors
    - we have explicit message when it doesn't do the expected behavior -> this introduces the necessity of customised messages and error handling
    - we needed to put `throws` and `try` everywhere which is not very convenient (and why XCTAssert doesn't need it ???)
- [NOTES]
    - `@discardableResult` indicates that we could not want to use the result of a function and remove the corresponding warning if we don't use it
    - when some code may throws, the caller need to be marqued as `throws` and the executed need to be prefixed with a `try`

