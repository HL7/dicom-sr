This chapter describes the complete mapping of a DICOM SR Measurement Report into FHIR resources following the method of this implementation guide.

### Example Measurement Report<a name="example_sr"></a>
TODO -- Add source of measurement report.

See 

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
        "00400032": { "vr": "SH", "Value": [ "testhospital.org" ] },
        "00400033": { "vr": "LO", "Value": [ "URI" ] }
      } ] }
}
</pre>
</td>
<td>
<pre>
"subject": {
  "type": "Patient",
  "reference": "Patient/11235"
}
</pre>
</td>
<td>
<pre>
"subject": {
  "type": "Patient",
  "identifier": { 
    "system": "testhospital.org",
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
        "00400032": { "vr": "SH", "Value": [ "testhospital.org" ] },
        "00400033": { "vr": "LO", "Value": [ "URI" ] }
      } ] }
}
</pre>
</td>
<td>
<pre>
"basedOn": [{
  "type": "ServiceRequest",
  "reference": "ServiceRequest/235813"
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
    "system": "testhospital.org",
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
  "reference": "ImagingStudy/11235"
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
  "reference": "Device/device-001"
}]
</pre>
</td>
</tr>
</table>