// Define a rule set for commonly used rules for definition resources using other Sushi features
RuleSet: DICOMSRStructureDefinitionContent
* ^status = #draft      // draft until final published
* ^experimental = true  // true until ready for pilot, then false
* ^version = "0.1.0"    // Follow IG Versioning rules
* ^publisher = "HL7 International"
* ^contact[0].name = "HL7 Imaging Integration Workgroup"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "http://www.hl7.org/Special/committees/imagemgt/index.cfm"
* ^contact[1].name = "Chris Lindop"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "mailto:christopher.lindop@ge.com"
* ^contact[2].name = "Jonathan Whitby"
* ^contact[2].telecom.system = #email
* ^contact[2].telecom.value = "mailto:jonathan.whitby@mi.medical.canon"
* ^jurisdiction.coding =  http://unstats.un.org/unsd/methods/m49/m49.htm#001
