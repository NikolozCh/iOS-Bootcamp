import Foundation

public class University {
    public enum Faculty {
        case macs
        case business
        case civilEngineering
        case lawSchool
        case sport
    }
    public enum Subject {
        // Subject is associated with the university
        // So we declare it here
        case math
        case computerScience
        case programmingAbstractions
        case programmingParadigms
        case microEconomics
        case macroEconomics
        case history
    }
}
