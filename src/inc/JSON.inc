ROUTINE JSON [Type=INC]

    // This macro deserializes the JSON string in customerInfo into a variable defined by %paramName
    // of type %className.
    //
    // This is better than using our dynamic objects because it will use the class's schema to validate
    // the fields in the json:
    // - Dates must be valid. 
    // - Strings must have the right length. 
    // - Numbers must be numbers.
    // - Required fields must have values
    // - Booleans must be also valid
    // - etc.
    //
    // If any of these validations fail, the macro will RETURN with a 400 Bad Request and information
    // about the problematic field
    #define JSONDeserialize(%paramName, %className, %deserObj) Set %deserObj=$classmethod(%className,"%New") Set status = %deserObj.%JSONImport(%paramName) If $$$ISERR(status) { Do ..%ReportRESTError(400, status) Return "" }