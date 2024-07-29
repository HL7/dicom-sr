CodeSystem: DicomValueType
Id: dicom-value-type
Title: "Value Types -- DICOM SR Content Item Value Types"
Description: "DICOM SR Content Item Value Types"

* ^caseSensitive = true
* ^content = #complete
* ^hierarchyMeaning = #is-a
* ^experimental = false
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #ii
* #text "TEXT" "Text Value (0040,A160)"
* #num "NUM" "Measured Value Sequence (0040,A300)"
* #code "CODE" "Concept Code Sequence (0040,A168)"
* #date "DATE" "Date (0040,A121)"
* #time "TIME" "Time (0040,A122)"
* #datetime "DATETIME" "DateTime (0040,A120)"
* #uidref "UIDREF" "UID (0040,A124)"
* #pname "PNAME" "Person Name (0040,A123)"
* #composite "COMPOSITE" "Referenced SOP Sequence (0008,1199)"
* #image "IMAGE" "Image Reference Macro"
* #waveform "WAVEFORM" "Waveform Reference Macro"
* #scoord "SCOORD" "Spatial Coordinates Macro"
* #scoord3d "SCOORD3D" "Spatial Coordinates 3D Macro"
* #tcoord "TCOORD" "Temporal Coordinates Macro"
* #container "CONTAINER" "Container Macro"
* #table "TABLE" "Table Content Item Macro"