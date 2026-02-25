Logical: BeModelDocument
Title: "BeDocument"
Description: "Generic logical model for a FHIR document structuring and containing caresets."
Characteristics: #can-be-target

* identifier 0..1 Identifier "Document identifier"
* type 1..1 CodeableConcept "Document type"
* dateTime 1..1 dateTime "Document date/time"
* title 0..1 string "Title" 
* status 0..1 code "Status"
* language 0..1 code "Language"

* subject 0..1 Reference "Subject"
* author 0..* Reference "Author(s)"
* custodian 0..1 Reference "Custodian"

* section 0..* BackboneElement "Document content sections"
  * ^id = "BeModelDocument.section"
  * code 0..1 CodeableConcept "Section classification"
  * title 0..1 string "Section title"
  * text 0..1 markdown "Section narrative"
  * entry 0..* string "Referenced resources" "FHIR references like CarePlan/1, Observation/2"

  * section 0..* BackboneElement "Child sections"
    * ^contentReference = "#BeModelDocument.section"

// ----------------------------
// Resource Reference (care set entry)
// ----------------------------

* entries 0..* BackboneElement "Entries (CareSets) in the document"
  * reference 1..1 Reference "FHIR reference (e.g., CarePlan/1, Observation/2)"

* presentedForm 0..* Attachment "A narrative easy-to-read representation of the full data set, e.g. PDF-version of a document"
