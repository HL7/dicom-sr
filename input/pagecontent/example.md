This chapter describes the complete mapping of a DICOM SR Measurement Report into FHIR resources following the method of this implementation guide.

The source DICOM SR Measurement Report is in DICOM JSON format. See the [DICOM PS3.18 Section F](https://dicom.nema.org/medical/dicom/current/output/chtml/part18/chapter_F.html) for more information.

### Patient Mapping<a name="example_patient"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Resource Reference</th>
<th>FHIR Identifier Reference</th>
</tr>
<tr>
<td>
<pre>
{
  "00100010": { "vr": "PN", "Value": [ { "Alphabetic": "EXAMPLE^MEASUREMENT^PATIENT}" } ]},
  "00100020": { "vr": "LO", "Value": [ "PID-11235" ] },
  "00100024": { "vr": "SQ",  "Value": [ {
        "00400031": { "vr": "SH", "Value": [ "Test Hospital" ] },
        "00400032": { "vr": "SH", "Value": [ "http://testhospital.org/mr" ] },
        "00400033": { "vr": "LO", "Value": [ "URI" ] }
      } ] }
}
</pre>
</td>
<td>
<pre>
"subject": {
  "type": "Patient",
  "reference": "Patient/measurement-report-patient"
}
</pre>
</td>
<td>
<pre>
"subject": {
  "type": "Patient",
  "identifier": { 
    "system": "http://testhospital.org/mr",
    "value": "PID-11235",
    "assigner": { "display": "Test Hospital" } 
  }
}
</pre>
</td>
</tr>
</table>

1. Search for FHIR Patient with identifier `testhostpital.com|PID-11235`
    1. If a result is found, use the found `Patient` resource as the `subject` for all created resources
    2. If a result is _not_ found, use a logical reference to the Patient ID from DICOM as the `subject` for all created resources

See [Example Patient](Patient-measurement-report-patient.html).

#### FHIR Resources
- Referenced
  - Patient

### ServiceRequest Mapping<a name="example_service_request"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Resource Reference</th>
<th>FHIR Identifier Reference</th>
</tr>
<tr>
<td>
<pre>
{
  "00080050": { "vr": "SH" , "Value": "ACSN-235813" },
  "00080051": { "vr": "SQ",  "Value": [ {
        "00400031": { "vr": "SH", "Value": [ "Test Hospital" ] },
        "00400032": { "vr": "SH", "Value": [ "http://testhospital.org/acsn" ] },
        "00400033": { "vr": "LO", "Value": [ "URI" ] }
      } ] }
}
</pre>
</td>
<td>
<pre>
"basedOn": [{
  "type": "ServiceRequest",
  "reference": "ServiceRequest/measurement-report-service-request"
}]
</pre>
</td>
<td>
<pre>
"basedOn": [{
  "type": "ServiceRequest
  "identifier": {
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "ACSN" }]},
    "system": "http://testhospital.org/acsn",
    "value": "ACSN-235813",
    "assigner": { "display": "Test Hospital" } 
  }
}]
</pre>
</td>
</tr>
</table>

1. Search for FHIR ServiceRequest with identifier `radiology.testhostpital.com|ACSN-235813`
    1. If a result is found, use the found `ServiceRequest` resource as the `basedOn` value for all created `Observation` resources
    2. If a result is _not_ found, use a logical reference to the Accession Number from DICOM as the `basedOn` value for all created `Observation` resources

See [Example ServiceRequest](ServiceRequest-measurement-report-service-request.html).

#### FHIR Resources
- Referenced
   - Patient
   - ServiceRequest

### ImagingStudy Mapping<a name="example_imaging_study"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Resource Reference</th>
<th>FHIR Identifier Reference</th>
</tr>
<tr>
<td>
<pre>
{
  "0020000E": { "vr": "UI", "Value": [ "1.2.840.113747.20080222.8331141314456631405221767081790268995" ] }
}
</pre>
</td>
<td>
<pre>
"derivedFrom": [{
  "type": "ImagingStudy",
  "reference": "ImagingStudy/measurement-report-imaging-study"
}]
</pre>
</td>
<td>
<pre>
"derivedFrom": [{
  "type": "ImagingStudy",
  "identifier": { 
    "system": "urn:dicom:uid",
    "value": "urn:oid:1.2.840.113747.20080222.8331141314456631405221767081790268995" 
  }
}]
</pre>
</td>
</tr>
</table>

1. Search for FHIR ImagingStudy with identifier `urn:dicom:uid|urn:oid:1.2.840.113747.20080222.8331141314456631405221767081790268995`
    1. If a result is found, use the found `ImagingStudy` resource as the `derivedFrom` value for all created `Observation` and `ImagingSelection` resources\
    2. If a result is _not_ found, use a logical reference to the Study Instance UID ID from DICOM as the `subject` for all created `Observation` and `ImagingSelection` resources

See [Example ImagingStudy](ImagingStudy-measurement-report-imaging-study.html).

#### FHIR Resources
- Referenced
   - Patient
   - ServiceRequest
   - ImagingStudy

### Device Mapping<a name="example_device"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Resource</th>
<th>FHIR Reference</th>
</tr>
<tr>
<td>
<pre>
{
  "0020000E": { "vr": "UI", "Value": [ "1.2.840.113747.20080222.8331141314456631405221767081790268995" ] }
}
</pre>
</td>
<td>
<pre>
{
  "resourceType" : "Device",
  "id" : "device-001",
  "identifier": { 
    "type": {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "UDI" }]},
    "system": "urn:dicom:uid",
    "value": "1.2.840.113747.20080222.8331141314456631405221767081790268995.999",
  },
  "displayName": "Example Imaging Measurement Device"
}
</pre>
</td>
<td>
<pre>
"device": [{
  "type": "Device",
  "reference": "Device/example-general-equipment"
}]
</pre>
</td>
</tr>
</table>

See [Example Device](Device-measurement-report-general-equipment.html).

#### FHIR Resources
- Referenced
   - Patient
   - ServiceRequest
   - ImagingStudy
- Created
   - Device (General Equipment)

### Document Mapping<a name="example_document"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Observation Fields</th>
</tr>
<tr>
<td>
<pre>
{
  "00080023": { "vr": "DA", "Value": [ "20240724" ] },
  "00080033": { "vr": "TM", "Value": [ "082342" ] },
  "0040A496": { "vr": "CS", "Value": [ "FINAL" ] }
}
</pre>
</td>
<td>
<pre>
{
  "resource": {
    "resourceType": "Observation",
    "subject": {
      "reference": "Patient/measurement-report-patient"
    },
    "basedOn": [{
      "type": "ServiceRequest",
      "reference": "ServiceRequest/measurement-report-service-request"
    }],
    "derivedFrom": [{
      "type": "ImagingStudy",
      "reference": "ImagingStudy/measurement-report-imaging-study"
    }],
    "effectiveDateTime": "2024-07-24T08:23:42"
    "status": "final",
    ...
  }
}
</pre>
</td>
</tr>
</table>

1. Extract `ContentDate`, `ContentTime`, and `PreliminaryFlag` values
2. Use these values to populate the `effectiveDateTime` and `status` fields in the created FHIR Observation resources\
   `effectiveDateTime` may be overridden by more specific values in specific content items

### Imaging Measurement Container Mapping<a name="example_imaging_measurement_container"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Resources</th>
</tr>
<tr>
<td>
<pre>
{
  "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
  "0040A040": { "vr": "CS", "Value": [ "CONTAINER" ] },
  "0040A043": { "vr": "SQ", "Value": [ {
        "00080100": { "vr": "SH", "Value": [ "126010" ] },
        "00080102": { "vr": "SH", "Value": [ "DCM" ] },
        "00080104": { "vr": "LO", "Value": [ "Imaging Measurements" ] }
      } ] },
  "0040A050": { "vr": "CS", "Value": [ "SEPARATE" ] },
  "0040A730": { "vr": "SQ", "Value": [
     {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "CONTAINER" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
           "00080100": { "vr": "SH", "Value": [ "125007" ] },
           "00080102": { "vr": "SH", "Value": [ "DCM" ] },
           "00080104": { "vr": "LO", "Value": [ "Measurement Group" ] }
            } ] },
        ...
     }
  ]}
}
</pre>
</td>
<td>
<pre>
[
  {
    "resource": {
      "resourceType": "Observation",
      "id": "imaging-measurement-group-001"
       "subject": {
         "reference": "Patient/measurement-report-patient"
       },
       "basedOn": [{
         "type": "ServiceRequest",
         "reference": "ServiceRequest/measurement-report-service-request"
       }],
       "derivedFrom": [{
         "type": "ImagingStudy",
         "reference": "ImagingStudy/measurement-report-imaging-study"
       }],
      "effectiveDateTime": "2024-07-24T08:23:42"
      "status": "final",
      "category" : [{ "coding" : [{
        "system" : "http://dicom.nema.org/resources/ontology/DCM",
        "code" : "125007",
        "display" : "Measurement Group"
        }]
      }],
     "device": {
        "reference": "Device/example-general-equipment"
      },
      ...
    }
  } 
]
</pre>
</td>
</tr>
</table>

1. Find the `CONTAINER` content item with the Concept Name Code Sequence (0040,A043) value of `DCM#126010 "Imaging Measurements"`
2. Find the Content Sequence (0040,A730) for this container
3. Create a new `ImagingMeasurementGroup` Observation resource for each child content item with a Concept Name Code Sequence (0040,A043) value of `DCM#125007 "Measurement Group"`

See:
- 

#### FHIR Resources
- Referenced
   - Patient
   - ServiceRequest
   - ImagingStudy
- Created
   - Device (General Equipment)

### Imaging Measurement Group Mapping<a name="example_imaging_measurement_group"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Observation</th>
</tr>
<tr>
<td>
<pre>
{
  "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
  "0040A040": { "vr": "CS", "Value": [ "CONTAINER" ] },
  "0040A043": { "vr": "SQ", "Value": [ {
        "00080100": { "vr": "SH", "Value": [ "125007" ] },
        "00080102": { "vr": "SH", "Value": [ "DCM" ] },
        "00080104": { "vr": "LO", "Value": [ "Measurement Group" ] }
      } ] },
  "0040A050": { "vr": "CS", "Value": [ "SEPARATE" ] },
  "0040A504": { "vr": "SQ", "Value": [ {
        "00080105": { "vr": "CS", "Value": [ "DCMR" ] },
        "00080118": { "vr": "UI", "Value": [ "1.2.840.10008.8.1.1" ] },
        "0040DB00": { "vr": "CS", "Value": [ "1411" ] }
      } ] },
  "0040A730": { "vr": "SQ", "Value": [ {
        "0040A010": { "vr": "CS", "Value": [ "HAS OBS CONTEXT" ] },
        "0040A040": { "vr": "CS", "Value": [ "TEXT" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "112039" ] },
              "00080102": { "vr": "SH", "Value": [ "DCM" ] },
              "00080104": { "vr": "LO", "Value": [ "Tracking Identifier" ] }
            } ] },
        "0040A160": { "vr": "UT", "Value": [ "Nodule 1" ] }
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "HAS OBS CONTEXT" ] },
        "0040A040": { "vr": "CS", "Value": [ "UIDREF" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "112040" ] },
              "00080102": { "vr": "SH", "Value": [ "DCM" ] },
              "00080104": { "vr": "LO", "Value": [ "Tracking Unique Identifier" ] }
            } ] },
        "0040A124": { "vr": "UI", "Value": [ "1.2.840.113747.20080222.8331141314456631405221767081790268995.100" ] }
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "CODE" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "276214006" ] },
              "00080102": { "vr": "SH", "Value": [ "SCT" ] },
              "00080104": { "vr": "LO", "Value": [ "Finding category" ] }
            } ] },
        "0040A168": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "241053004" ] },
              "00080102": { "vr": "SH", "Value": [ "SCT" ] },
              "00080104": { "vr": "LO", "Value": [ "Radiographic measurement of lung volume" ] }
            } ] }
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "CODE" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "121071" ] },
              "00080102": { "vr": "SH", "Value": [ "DCM" ] },
              "00080104": { "vr": "LO", "Value": [ "Finding" ] }
            } ] },
        "0040A168": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "M-03010" ] },
              "00080102": { "vr": "SH", "Value": [ "SRT" ] },
              "00080104": { "vr": "LO", "Value": [ "Nodule" ] }
            } ] }
      },
      {
        "00081199": { "vr": "SQ", "Value": [ {
              "00081150": { "vr": "UI", "Value": [ "1.2.840.10008.5.1.4.1.1.66.4" ] },
              "00081155": { "vr": "UI", "Value": [ "1.2.276.0.7230010.3.1.4.0.57823.1553343864.578878" ] },
              "0062000B": { "vr": "US", "Value": [ 1 ] }
            } ] },
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "IMAGE" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "121191" ] },
              "00080102": { "vr": "SH", "Value": [ "DCM" ] },
              "00080104": { "vr": "LO", "Value": [ "Referenced Segment" ] }
            } ] }
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "UIDREF" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "121232" ] },
              "00080102": { "vr": "SH", "Value": [ "DCM" ] },
              "00080104": { "vr": "LO", "Value": [ "Source series for segmentation" ] }
            } ] },
        "0040A124": { "vr": "UI", "Value": [ "1.3.6.1.4.1.14519.5.2.1.6279.6001.273525289046256012743471155680" ] }
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "HAS CONCEPT MOD" ] },
        "0040A040": { "vr": "CS", "Value": [ "CODE" ] },
        "0040A043": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "G-C0E3" ] },
              "00080102": { "vr": "SH", "Value": [ "SRT" ] },
              "00080104": { "vr": "LO", "Value": [ "Finding Site" ] }
            } ] },
        "0040A168": { "vr": "SQ", "Value": [ {
              "00080100": { "vr": "SH", "Value": [ "T-28000" ] },
              "00080102": { "vr": "SH", "Value": [ "SRT" ] },
              "00080104": { "vr": "LO", "Value": [ "Lung" ] }
            } ] }
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "NUM" ] },
        ...
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "NUM" ] },
        ...
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "NUM" ] },
        ...
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "CODE" ] },
        ...
      },
      {
        "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
        "0040A040": { "vr": "CS", "Value": [ "CODE" ] },
        ...
      } ] }
}
</pre>
</td>
<td>
<pre>
[
  {
    "resource": {
      "resourceType": "BodyStructure",
      "id": "tracking-1",
      "identifier": [
        {
          "type": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type",
                "code": "tracking-identifier",
                "display": "Tracking Identifier"
              }
            ]
          },
          "value": "Nodule 1"
        },
        {
          "type": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type",
                "code": "tracking-uid",
                "display": "Tracking UID"
              }
            ]
          },
          "system": "urn:dicom:uid",
          "value": "urn:oid:1.2.840.113747.20080222.8331141314456631405221767081790268995.100"
        }
      ],
      "patient": {
        "reference": "Patient/measurement-report-patient"
      },
      "includedStructure": [
        "structure": {
          "text": "Nodule 1"
        }
      ]
    }
  },
  {
    "resource": {
      "resourceType": "BodyStructure",
      "id": "finding-site-1",
      "patient": {
        "reference": "Patient/measurement-report-patient"
      },
      "includedStructure": [
        "structure": {
          "coding": [{
            "system" : "http://terminology.hl7.org/CodeSystem/snm",
            "code" : "T-28000",
            "display" : "Lung"
          }]
        }
      ]
    }
  },
    {
    "resource": {
      "resourceType": "ImagingSelection",
      "id": "segment-1",
      "status": "registered",
      "subject": {
        "reference": "Patient/measurement-report-patient"
      },
      "code": {
        "coding": [
          {
            "system": "http://dicom.nema.org/resources/ontology/DCM",
            "code": "121191",
            "display": "Referenced Segment"
          }
        ]
      },
      "derivedFrom": [
        {
          "reference": "ImagingStudy/measurement-report-imaging-study"
        }
      ],
      "seriesUid": "1.2.840.113747.20080222.8331141314456631405221767081790268995.2"
      "instance": [
        {
          "uid": "11.2.840.113747.20080222.8331141314456631405221767081790268995.2.1",
          "sopClass": {
            "system": "urn:ietf:rfc:3986",
            "code": "urn:oid:1.2.840.10008.5.1.4.1.1.66.4"
          }
        }
      ]
    }
  },
  {
    "resource": {
      "resourceType": "Observation",
      "id": "imaging-measurement-group-001"
       "subject": {
         "reference": "Patient/measurement-report-patient"
       },
       "basedOn": [{
         "type": "ServiceRequest",
         "reference": "ServiceRequest/measurement-report-service-request"
       }],
       "derivedFrom": [{
         "type": "ImagingStudy",
         "reference": "ImagingStudy/measurement-report-imaging-study"
       }],
      "effectiveDateTime": "2024-07-24T08:23:42"
      "status": "final",
      "code" : { "coding" : [{
        "system" : "http://snomed.info/sct/MAIN/version/2024-07-01",
        "code" : "241053004",
        "display" : "Radiographic measurement of lung volume"
        }]
      },      
      "category" : [{ "coding" : [{
        "system" : "http://dicom.nema.org/resources/ontology/DCM",
        "code" : "125007",
        "display" : "Measurement Group"
        }]
      }],
      "focus": [
        {
          "reference": "ImagingSelection/segment-1"
        },
        {
          "reference": "BodyStructure/tracking-1"
        }
      ],
      "bodyStructure": {
        "reference": "BodyStructure/finding-site-1"
      },
     "device": {
        "reference": "Device/example-general-equipment"
      },
      "valueCodeableConcept": {
        "coding": [{
            "system": "http://terminology.hl7.org/CodeSystem/snm",
            "code": "M-03010",
            "display": "Nodule"
          }]
      },
      "hasMember": [
        {
          "reference": "Observation/imaging-measurement-1"
        },
        {
          "reference": "Observation/imaging-measurement-2"
        },
        {
          "reference": "Observation/imaging-measurement-3"
        },
        {
          "reference": "Observation/qualitative-evaluation-1"
        },
        {
          "reference": "Observation/qualitative-evaluation-2"
        }
      ]
    }
  }
]
</pre>
</td>
</tr>
</table>

1. Create BodyStructure resources for tracking and finding site (if not already existing)
2. Create ImagingSelection resource for segment (if not already existing)
3. Create Observation resource for ImagingMeasurementGroup
   1. Set `code` to value of Finding Category
   2. Set `focus` to reference ImagingSelection and tracking BodyStructure resources
   3. Set `bodyStructure` to reference finding site BodyStructure resource
   4. Set `hasMember` to reference Observation resources for imaging measurements and qualitative evaluations\
      *Note: Not yet created*
   5. Set `device` to reference general equipment Device resource\
      No Algorithm Identification is specified at the group level so the general equipment device is used
   6. Set `valueCodeableConcept` to value of Finding

#### FHIR Resources
- Referenced
   - Patient
   - ServiceRequest
   - ImagingStudy
- Created
   - Device (General Equipment)
   - Observation (ImagingMeasurementGroup)
   - BodyStructure (Tracking, FindingSite)
   - ImagingSelection (Segment)

### Imaging Measurement Mapping <a name="example_imaging_measurement"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Observation</th>
</tr>
<tr>
<td>
<pre>
{
    {
      "0040A010": { "vr": "CS", "Value": [ "CONTAINS" ] },
      "0040A040": { "vr": "CS", "Value": [ "NUM" ] },
      "0040A043": { "vr": "SQ", "Value": [ {
        "00080100": { "vr": "SH", "Value": [ "G-D705" ] },
        "00080102": { "vr": "SH", "Value": [ "SRT" ] },
        "00080104": { "vr": "LO", "Value": [ "Volume" ] }
      } ] },
      "0040A300": { "vr": "SQ", "Value": [ {
        "004008EA": { "vr": "SQ", "Value": [ {
          "00080100": { "vr": "SH", "Value": [ "mm3" ] },
          "00080102": { "vr": "SH", "Value": [ "UCUM" ] },
          "00080104": { "vr": "LO", "Value": [ "cubic millimeter" ] }
        } ] },
        "0040A30A": { "vr": "DS", "Value": [ 3.111220E+04 ] }
      } ] }
}
</pre>
</td>
<td>
<pre></pre>
</td>
</tr>
</table>


### Imaging Qualitative Evaluation Mapping <a name="example_imaging_qualitative_evaluation"></a>
<table>
<tr>
<th>DICOM</th>
<th>FHIR Observation</th>
</tr>
<tr>
<td>
<pre>
</pre>
</td>
<td>
<pre></pre>
</td>
</tr>
</table>

### Example Measurement Report<a name="example_sr"></a>
See [Example Measurement Report](DiagnosticReport-dicom-sr-measurement-report.html) for a complete example of a Measurement Report containing the above resources.