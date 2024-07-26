Instance: Example-DiagnosticReport-DICOMSRMeasurementReport
InstanceOf: DiagnosticReport
Usage: #example
Description: "An example of a DICOM SR measurement report."

* id = "dicom-sr-measurement-report"
* status = #final
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #126000 "Imaging Measurement Report"
* subject = Reference(Example-Patient)
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
  \"00080012\": { \"vr\": \"DA\", \"Value\": [ \"20190323\" ] },
  \"00080013\": { \"vr\": \"TM\", \"Value\": [ \"082428\" ] },
  \"00080014\": { \"vr\": \"UI\", \"Value\": [ \"1.2.276.0.7230010.3.0.3.6.3\" ] },
  \"00080016\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.88.22\" ] },
  \"00080018\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.1.1\" ] },
  \"00080020\": { \"vr\": \"DA\", \"Value\": [ \"20000101\" ] },
  \"00080021\": { \"vr\": \"DA\", \"Value\": [ \"20190323\" ] },
  \"00080023\": { \"vr\": \"DA\", \"Value\": [ \"20190323\" ] },
  \"00080031\": { \"vr\": \"TM\", \"Value\": [ \"082428\" ] },
  \"00080033\": { \"vr\": \"TM\", \"Value\": [ \"082428\" ] },
  \"00080060\": { \"vr\": \"CS\", \"Value\": [ \"SR\" ] },
  \"00081090\": { \"vr\": \"LO\", \"Value\": [ \"Example Imaging Measurement Device\" ] },
  \"00081111\": { \"vr\": \"SQ\" },
  \"00100010\": { \"vr\": \"PN\", \"Value\": [ { \"Alphabetic\": \"EXAMPLE^MEASUREMENT^PATIENT}\" } ]},
  \"00100020\": { \"vr\": \"LO\", \"Value\": [ \"PID-11235\" ] },
  \"00100024\": { \"vr\": \"SQ\",  \"Value\": [ {
    \"00400031\": { \"vr\": \"SH\", \"Value\": [ \"Test Hospital\" ] },
    \"00400032\": { \"vr\": \"SH\", \"Value\": [ \"testhospital.org\" ] },
    \"00400033\": { \"vr\": \"LO\", \"Value\": [ \"URI\" ] }
  } ] },
  \"0020000D\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995\" ] },
  \"0020000E\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.1\" ] },
  \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINER\" ] },
  \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
    \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"126000\" ] },
    \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
    \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Imaging Measurement Report\" ] }
  } ] },
  \"0040A050\": { \"vr\": \"CS\", \"Value\": [ \"SEPARATE\" ] },
  \"0040A491\": { \"vr\": \"CS\", \"Value\": [ \"COMPLETE\" ] },
  \"0040A493\": { \"vr\": \"CS\", \"Value\": [ \"VERIFIED\" ] },
  \"0040A504\": { \"vr\": \"SQ\", \"Value\": [ {
    \"00080105\": { \"vr\": \"CS\", \"Value\": [ \"DCMR\" ] },
    \"00080118\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.8.1.1\" ] },
    \"0040DB00\": { \"vr\": \"CS\", \"Value\": [ \"1500\" ] }
  } ] },
  \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
    \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
    \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
    \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121049\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Language of Content Item and Descendants\" ] }
    } ] },
    \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"eng\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"RFC5646\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"English\" ] }
    } ] }
  },
  {
    \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
    \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
    \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121005\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Observer Type\" ] }
    } ] },
    \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121006\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Person\" ] }
    } ] }
  },
  {
    \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
    \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"PNAME\" ] },
    \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121008\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Person Observer Name\" ] }
    } ] },
    \"0040A123\": { \"vr\": \"PN\", \"Value\": [ { \"Alphabetic\": \"RADIOLOGIST^EXAMPLE\" } ] }
  },
  {
    \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
    \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINER\" ] },
    \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"126010\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Imaging Measurements\" ] }
    } ] },
    \"0040A050\": { \"vr\": \"CS\", \"Value\": [ \"SEPARATE\" ] },
    \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
      \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
      \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINER\" ] },
      \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
        \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"125007\" ] },
        \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
        \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Measurement Group\" ] }
      } ] },
      \"0040A050\": { \"vr\": \"CS\", \"Value\": [ \"SEPARATE\" ] },
      \"0040A504\": { \"vr\": \"SQ\", \"Value\": [ {
        \"00080105\": { \"vr\": \"CS\", \"Value\": [ \"DCMR\" ] },
        \"00080118\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.8.1.1\" ] },
        \"0040DB00\": { \"vr\": \"CS\", \"Value\": [ \"1411\" ] }
      } ] },
      \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
        \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
        \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
        \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
          \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"C67447\" ] },
          \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"NCIt\" ] },
          \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Activity Session\" ] }
        } ] },
        \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"1\" ] }
      },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"112039\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Tracking Identifier\" ] }
          } ] },
          \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"Nodule 1\" ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"UIDREF\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"112040\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Tracking Unique Identifier\" ] }
          } ] },
          \"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.100\" ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"276214006\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SCT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding category\" ] }
          } ] },
          \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"241053004\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SCT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Radiographic measurement of lung volume\" ] }
          } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121071\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding\" ] }
          } ] },
          \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"M-03010\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Nodule\" ] }
          } ] }
        },
        {
          \"00081199\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00081150\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.66.4\" ] },
            \"00081155\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.2.1\" ] },
            \"0062000B\": { \"vr\": \"US\", \"Value\": [ 1 ] }
          } ] },
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"IMAGE\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121191\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Referenced Segment\" ] }
          } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"UIDREF\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121232\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Source series for segmentation\" ] }
          } ] },
          \"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.3.6.1.4.1.14519.5.2.1.6279.6001.273525289046256012743471155680.2\" ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"G-C0E3\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding Site\" ] }
          } ] },
          \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"T-28000\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Lung\" ] }
          } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"NUM\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"G-D705\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Volume\" ] }
          } ] },
          \"0040A300\": { \"vr\": \"SQ\", \"Value\": [ {
            \"004008EA\": { \"vr\": \"SQ\", \"Value\": [ {
              \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"mm3\" ] },
              \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"UCUM\" ] },
              \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"cubic millimeter\" ] }
            } ] },
            \"0040A30A\": { \"vr\": \"DS\", \"Value\": [ 3.111220E+04 ] }
          } ] },
          \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
            \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
            \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
            \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
              \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111001\" ] },
              \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
              \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Name\" ] }
            } ] },
            \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"pylidc\" ] }
          },
            {
              \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
              \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
              \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
                \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111003\" ] },
                \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
                \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Version\" ] }
              } ] },
              \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"0.2.0\" ] }
            } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"NUM\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"M-02550\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Diameter\" ] }
          } ] },
          \"0040A300\": { \"vr\": \"SQ\", \"Value\": [ {
            \"004008EA\": { \"vr\": \"SQ\", \"Value\": [ {
              \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"mm\" ] },
              \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"UCUM\" ] },
              \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"millimeter\" ] }
            } ] },
            \"0040A30A\": { \"vr\": \"DS\", \"Value\": [ 4.994462E+01 ] }
          } ] },
          \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
            \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
            \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
            \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
              \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111001\" ] },
              \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
              \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Name\" ] }
            } ] },
            \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"pylidc\" ] }
          },
            {
              \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
              \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
              \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
                \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111003\" ] },
                \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
                \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Version\" ] }
              } ] },
              \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"0.2.0\" ] }
            } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"NUM\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"C0JK\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"IBSI\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Surface area of mesh\" ] }
          } ] },
          \"0040A300\": { \"vr\": \"SQ\", \"Value\": [ {
            \"004008EA\": { \"vr\": \"SQ\", \"Value\": [ {
              \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"mm2\" ] },
              \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"UCUM\" ] },
              \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"square millimeter\" ] }
            } ] },
            \"0040A30A\": { \"vr\": \"DS\", \"Value\": [ 9.026567E+03 ] }
          } ] },
          \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
            \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
            \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
            \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
              \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111001\" ] },
              \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
              \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Name\" ] }
            } ] },
            \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"pylidc\" ] }
          },
            {
              \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
              \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
              \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
                \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"111003\" ] },
                \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
                \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Algorithm Version\" ] }
              } ] },
              \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"0.2.0\" ] }
            } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"C45992\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"NCIt\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Subtlety score\" ] }
          } ] },
          \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"105\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"99LIDCQIICR\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"5 out of 5 (Obvious)\" ] }
          } ] }
        },
        {
          \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
          \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
          \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"RID36042\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"RadLex\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Malignancy\" ] }
          } ] },
          \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
            \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"905\" ] },
            \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"99LIDCQIICR\" ] },
            \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"5 out of 5 (Highly Suspicious for Cancer)\" ] }
          } ] }
        } ] }
    } ] }
  } ] }
}
  </pre></div>"